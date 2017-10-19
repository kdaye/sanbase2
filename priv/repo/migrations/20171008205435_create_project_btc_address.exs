defmodule Sanbase.Repo.Migrations.CreateProjectBtcAddress do
  use Ecto.Migration

  def change do
    create table(:project_btc_address, primary_key: false) do
      add :address, :text, primary_key: true
      add :project_id, references(:project, type: :serial, on_delete: :nothing)
    end

    create index(:project_btc_address, [:project_id])
  end
end