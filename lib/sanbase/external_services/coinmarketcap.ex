defmodule Sanbase.ExternalServices.Coinmarketcap do
  # # Syncronize data from coinmarketcap.com
  #
  # A GenServer, which updates the data from coinmarketcap on a regular basis.
  # On regular intervals it will fetch the data from coinmarketcap and insert it
  # into a local DB
  use GenServer, restart: :permanent, shutdown: 5_000

  alias Sanbase.Model.Project
  alias Sanbase.Repo
  alias Sanbase.Prices.Store
  alias Sanbase.ExternalServices.Coinmarketmap.GraphData

  @default_update_interval 1000 * 60 * 5 # 5 minutes

  def start_link(_state) do
    GenServer.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    update_interval = Keyword.get(config(), :update_interval, @default_update_interval)

    if Keyword.get(config(), :sync_enabled, false) do
      GenServer.cast(self(), :sync)

      {:ok, %{update_interval: update_interval}}
    else
      :ignore
    end
  end

  def handle_cast(:sync, %{update_interval: update_interval} = state) do
    Project
    |> Repo.all
    |> Enum.each(&fetch_price_data/1)

    Process.send_after(self(), {:"$gen_cast", :sync}, update_interval)

    {:noreply, state}
  end

  def config do
    Application.get_env(:sanbase, __MODULE__)
  end

  defp fetch_price_data(%Project{coinmarketcap_id: nil}), do: :ok

  defp fetch_price_data(%Project{coinmarketcap_id: coinmarketcap_id}) do
    GraphData.fetch_prices(
      coinmarketcap_id,
      last_price_datetime(coinmarketcap_id),
      DateTime.utc_now
    )
    |> Store.import_price_points(table_name(coinmarketcap_id), source: "coinmarketcap")
  end

  defp last_price_datetime(coinmarketcap_id) do
    case Store.last_price_datetime(table_name(coinmarketcap_id)) do
      nil ->
        fetch_first_price_datetime(coinmarketcap_id)
      datetime ->
        datetime
    end
  end

  defp fetch_first_price_datetime(coinmarketcap_id) do
    GraphData.fetch_all_time_prices(coinmarketcap_id)
    |> Enum.take(1)
    |> hd
    |> Map.get(:datetime)
  end

  defp table_name(coinmarketcap_id) do
    coinmarketcap_id <> "_USD"
  end
end