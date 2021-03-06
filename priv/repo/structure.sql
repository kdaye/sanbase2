--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: currencies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE currencies (
    id bigint NOT NULL,
    code character varying(255) NOT NULL
);


--
-- Name: currencies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE currencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: currencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE currencies_id_seq OWNED BY currencies.id;


--
-- Name: ico_currencies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ico_currencies (
    id bigint NOT NULL,
    ico_id bigint NOT NULL,
    currency_id bigint NOT NULL
);


--
-- Name: ico_currencies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ico_currencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ico_currencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ico_currencies_id_seq OWNED BY ico_currencies.id;


--
-- Name: icos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE icos (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    start_date date,
    end_date date,
    tokens_issued_at_ico numeric,
    tokens_sold_at_ico numeric,
    funds_raised_btc numeric,
    usd_btc_icoend numeric,
    usd_eth_icoend numeric,
    minimal_cap_amount numeric,
    maximal_cap_amount numeric,
    cap_currency_id bigint,
    main_contract_address character varying(255),
    comments text
);


--
-- Name: icos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE icos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: icos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE icos_id_seq OWNED BY icos.id;


--
-- Name: infrastructures; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE infrastructures (
    id bigint NOT NULL,
    code character varying(255) NOT NULL
);


--
-- Name: infrastructures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE infrastructures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: infrastructures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE infrastructures_id_seq OWNED BY infrastructures.id;


--
-- Name: latest_btc_wallet_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE latest_btc_wallet_data (
    id bigint NOT NULL,
    address character varying(255) NOT NULL,
    satoshi_balance numeric NOT NULL,
    update_time timestamp without time zone NOT NULL
);


--
-- Name: latest_btc_wallet_data_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE latest_btc_wallet_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: latest_btc_wallet_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE latest_btc_wallet_data_id_seq OWNED BY latest_btc_wallet_data.id;


--
-- Name: latest_coinmarketcap_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE latest_coinmarketcap_data (
    id bigint NOT NULL,
    coinmarketcap_id character varying(255) NOT NULL,
    name character varying(255),
    symbol character varying(255),
    price_usd numeric,
    market_cap_usd numeric,
    update_time timestamp without time zone NOT NULL
);


--
-- Name: latest_coinmarketcap_data_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE latest_coinmarketcap_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: latest_coinmarketcap_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE latest_coinmarketcap_data_id_seq OWNED BY latest_coinmarketcap_data.id;


--
-- Name: latest_eth_wallet_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE latest_eth_wallet_data (
    id bigint NOT NULL,
    address character varying(255) NOT NULL,
    balance numeric NOT NULL,
    last_incoming timestamp without time zone,
    last_outgoing timestamp without time zone,
    tx_in numeric,
    tx_out numeric,
    update_time timestamp without time zone NOT NULL
);


--
-- Name: latest_eth_wallet_data_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE latest_eth_wallet_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: latest_eth_wallet_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE latest_eth_wallet_data_id_seq OWNED BY latest_eth_wallet_data.id;


--
-- Name: market_segments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE market_segments (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);


--
-- Name: market_segments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE market_segments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: market_segments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE market_segments_id_seq OWNED BY market_segments.id;


--
-- Name: notification; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE notification (
    id bigint NOT NULL,
    project_id bigint NOT NULL,
    type_id bigint NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: notification_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE notification_id_seq OWNED BY notification.id;


--
-- Name: notification_type; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE notification_type (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    inserted_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: notification_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE notification_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notification_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE notification_type_id_seq OWNED BY notification_type.id;


--
-- Name: project; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE project (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    ticker character varying(255),
    logo_url character varying(255),
    coinmarketcap_id character varying(255),
    website_link character varying(255),
    btt_link character varying(255),
    facebook_link character varying(255),
    github_link character varying(255),
    reddit_link character varying(255),
    twitter_link character varying(255),
    whitepaper_link character varying(255),
    blog_link character varying(255),
    slack_link character varying(255),
    linkedin_link character varying(255),
    telegram_link character varying(255),
    project_transparency character varying(255),
    token_address character varying(255),
    team_token_wallet character varying(255),
    market_segment_id bigint,
    infrastructure_id bigint
);


--
-- Name: project_btc_address; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE project_btc_address (
    id bigint NOT NULL,
    address character varying(255) NOT NULL,
    project_id bigint
);


--
-- Name: project_btc_address_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE project_btc_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: project_btc_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE project_btc_address_id_seq OWNED BY project_btc_address.id;


--
-- Name: project_eth_address; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE project_eth_address (
    id bigint NOT NULL,
    address character varying(255) NOT NULL,
    project_id bigint
);


--
-- Name: project_eth_address_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE project_eth_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: project_eth_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE project_eth_address_id_seq OWNED BY project_eth_address.id;


--
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE project_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE project_id_seq OWNED BY project.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp without time zone
);


--
-- Name: tracked_btc; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tracked_btc (
    id bigint NOT NULL,
    address character varying(255) NOT NULL
);


--
-- Name: tracked_btc_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tracked_btc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tracked_btc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tracked_btc_id_seq OWNED BY tracked_btc.id;


--
-- Name: tracked_eth; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE tracked_eth (
    id bigint NOT NULL,
    address character varying(255) NOT NULL
);


--
-- Name: tracked_eth_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tracked_eth_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tracked_eth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tracked_eth_id_seq OWNED BY tracked_eth.id;


--
-- Name: currencies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY currencies ALTER COLUMN id SET DEFAULT nextval('currencies_id_seq'::regclass);


--
-- Name: ico_currencies id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY ico_currencies ALTER COLUMN id SET DEFAULT nextval('ico_currencies_id_seq'::regclass);


--
-- Name: icos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY icos ALTER COLUMN id SET DEFAULT nextval('icos_id_seq'::regclass);


--
-- Name: infrastructures id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY infrastructures ALTER COLUMN id SET DEFAULT nextval('infrastructures_id_seq'::regclass);


--
-- Name: latest_btc_wallet_data id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY latest_btc_wallet_data ALTER COLUMN id SET DEFAULT nextval('latest_btc_wallet_data_id_seq'::regclass);


--
-- Name: latest_coinmarketcap_data id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY latest_coinmarketcap_data ALTER COLUMN id SET DEFAULT nextval('latest_coinmarketcap_data_id_seq'::regclass);


--
-- Name: latest_eth_wallet_data id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY latest_eth_wallet_data ALTER COLUMN id SET DEFAULT nextval('latest_eth_wallet_data_id_seq'::regclass);


--
-- Name: market_segments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY market_segments ALTER COLUMN id SET DEFAULT nextval('market_segments_id_seq'::regclass);


--
-- Name: notification id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY notification ALTER COLUMN id SET DEFAULT nextval('notification_id_seq'::regclass);


--
-- Name: notification_type id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY notification_type ALTER COLUMN id SET DEFAULT nextval('notification_type_id_seq'::regclass);


--
-- Name: project id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY project ALTER COLUMN id SET DEFAULT nextval('project_id_seq'::regclass);


--
-- Name: project_btc_address id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY project_btc_address ALTER COLUMN id SET DEFAULT nextval('project_btc_address_id_seq'::regclass);


--
-- Name: project_eth_address id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY project_eth_address ALTER COLUMN id SET DEFAULT nextval('project_eth_address_id_seq'::regclass);


--
-- Name: tracked_btc id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tracked_btc ALTER COLUMN id SET DEFAULT nextval('tracked_btc_id_seq'::regclass);


--
-- Name: tracked_eth id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tracked_eth ALTER COLUMN id SET DEFAULT nextval('tracked_eth_id_seq'::regclass);


--
-- Name: currencies currencies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY currencies
    ADD CONSTRAINT currencies_pkey PRIMARY KEY (id);


--
-- Name: ico_currencies ico_currencies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ico_currencies
    ADD CONSTRAINT ico_currencies_pkey PRIMARY KEY (id);


--
-- Name: icos icos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icos
    ADD CONSTRAINT icos_pkey PRIMARY KEY (id);


--
-- Name: infrastructures infrastructures_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY infrastructures
    ADD CONSTRAINT infrastructures_pkey PRIMARY KEY (id);


--
-- Name: latest_btc_wallet_data latest_btc_wallet_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY latest_btc_wallet_data
    ADD CONSTRAINT latest_btc_wallet_data_pkey PRIMARY KEY (id);


--
-- Name: latest_coinmarketcap_data latest_coinmarketcap_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY latest_coinmarketcap_data
    ADD CONSTRAINT latest_coinmarketcap_data_pkey PRIMARY KEY (id);


--
-- Name: latest_eth_wallet_data latest_eth_wallet_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY latest_eth_wallet_data
    ADD CONSTRAINT latest_eth_wallet_data_pkey PRIMARY KEY (id);


--
-- Name: market_segments market_segments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY market_segments
    ADD CONSTRAINT market_segments_pkey PRIMARY KEY (id);


--
-- Name: notification notification_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notification
    ADD CONSTRAINT notification_pkey PRIMARY KEY (id);


--
-- Name: notification_type notification_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notification_type
    ADD CONSTRAINT notification_type_pkey PRIMARY KEY (id);


--
-- Name: project_btc_address project_btc_address_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY project_btc_address
    ADD CONSTRAINT project_btc_address_pkey PRIMARY KEY (id);


--
-- Name: project_eth_address project_eth_address_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY project_eth_address
    ADD CONSTRAINT project_eth_address_pkey PRIMARY KEY (id);


--
-- Name: project project_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tracked_btc tracked_btc_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tracked_btc
    ADD CONSTRAINT tracked_btc_pkey PRIMARY KEY (id);


--
-- Name: tracked_eth tracked_eth_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY tracked_eth
    ADD CONSTRAINT tracked_eth_pkey PRIMARY KEY (id);


--
-- Name: currencies_code_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX currencies_code_index ON currencies USING btree (code);


--
-- Name: ico_currencies_currency_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ico_currencies_currency_id_index ON ico_currencies USING btree (currency_id);


--
-- Name: ico_currencies_ico_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ico_currencies_ico_id_index ON ico_currencies USING btree (ico_id);


--
-- Name: icos_project_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX icos_project_id_index ON icos USING btree (project_id);


--
-- Name: infrastructures_code_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX infrastructures_code_index ON infrastructures USING btree (code);


--
-- Name: latest_btc_wallet_data_address_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX latest_btc_wallet_data_address_index ON latest_btc_wallet_data USING btree (address);


--
-- Name: latest_coinmarketcap_data_coinmarketcap_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX latest_coinmarketcap_data_coinmarketcap_id_index ON latest_coinmarketcap_data USING btree (coinmarketcap_id);


--
-- Name: latest_eth_wallet_data_address_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX latest_eth_wallet_data_address_index ON latest_eth_wallet_data USING btree (address);


--
-- Name: market_segments_name_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX market_segments_name_index ON market_segments USING btree (name);


--
-- Name: notification_project_id_type_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX notification_project_id_type_id_index ON notification USING btree (project_id, type_id);


--
-- Name: notification_type_name_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX notification_type_name_index ON notification_type USING btree (name);


--
-- Name: project_btc_address_address_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX project_btc_address_address_index ON project_btc_address USING btree (address);


--
-- Name: project_btc_address_project_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX project_btc_address_project_id_index ON project_btc_address USING btree (project_id);


--
-- Name: project_eth_address_address_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX project_eth_address_address_index ON project_eth_address USING btree (address);


--
-- Name: project_eth_address_project_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX project_eth_address_project_id_index ON project_eth_address USING btree (project_id);


--
-- Name: project_infrastructure_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX project_infrastructure_id_index ON project USING btree (infrastructure_id);


--
-- Name: project_market_segment_id_index; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX project_market_segment_id_index ON project USING btree (market_segment_id);


--
-- Name: project_name_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX project_name_index ON project USING btree (name);


--
-- Name: tracked_btc_address_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX tracked_btc_address_index ON tracked_btc USING btree (address);


--
-- Name: tracked_eth_address_index; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX tracked_eth_address_index ON tracked_eth USING btree (address);


--
-- Name: ico_currencies ico_currencies_currency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ico_currencies
    ADD CONSTRAINT ico_currencies_currency_id_fkey FOREIGN KEY (currency_id) REFERENCES currencies(id) ON DELETE CASCADE;


--
-- Name: ico_currencies ico_currencies_ico_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ico_currencies
    ADD CONSTRAINT ico_currencies_ico_id_fkey FOREIGN KEY (ico_id) REFERENCES icos(id) ON DELETE CASCADE;


--
-- Name: icos icos_cap_currency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icos
    ADD CONSTRAINT icos_cap_currency_id_fkey FOREIGN KEY (cap_currency_id) REFERENCES currencies(id);


--
-- Name: icos icos_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY icos
    ADD CONSTRAINT icos_project_id_fkey FOREIGN KEY (project_id) REFERENCES project(id) ON DELETE CASCADE;


--
-- Name: notification notification_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notification
    ADD CONSTRAINT notification_project_id_fkey FOREIGN KEY (project_id) REFERENCES project(id);


--
-- Name: notification notification_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY notification
    ADD CONSTRAINT notification_type_id_fkey FOREIGN KEY (type_id) REFERENCES notification_type(id);


--
-- Name: project_btc_address project_btc_address_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY project_btc_address
    ADD CONSTRAINT project_btc_address_project_id_fkey FOREIGN KEY (project_id) REFERENCES project(id) ON DELETE CASCADE;


--
-- Name: project_eth_address project_eth_address_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY project_eth_address
    ADD CONSTRAINT project_eth_address_project_id_fkey FOREIGN KEY (project_id) REFERENCES project(id) ON DELETE CASCADE;


--
-- Name: project project_infrastructure_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY project
    ADD CONSTRAINT project_infrastructure_id_fkey FOREIGN KEY (infrastructure_id) REFERENCES infrastructures(id);


--
-- Name: project project_market_segment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY project
    ADD CONSTRAINT project_market_segment_id_fkey FOREIGN KEY (market_segment_id) REFERENCES market_segments(id);


--
-- PostgreSQL database dump complete
--

INSERT INTO "schema_migrations" (version) VALUES (20171008200815), (20171008203355), (20171008204451), (20171008204756), (20171008205435), (20171008205503), (20171008205547), (20171008210439), (20171017104338), (20171017104607), (20171017104817), (20171017111725), (20171017125741), (20171017132729), (20171018120438), (20171025082707), (20171106052403), (20171114151430);
