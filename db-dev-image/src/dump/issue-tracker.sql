--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.15
-- Dumped by pg_dump version 9.6.15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: issue_tracker; Type: SCHEMA; Schema: -; Owner: issue_tracker
--

CREATE SCHEMA issue_tracker;


ALTER SCHEMA issue_tracker OWNER TO issue_tracker;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: databasechangelog; Type: TABLE; Schema: issue_tracker; Owner: issue_tracker
--

CREATE TABLE issue_tracker.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE issue_tracker.databasechangelog OWNER TO issue_tracker;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: issue_tracker; Owner: issue_tracker
--

CREATE TABLE issue_tracker.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE issue_tracker.databasechangeloglock OWNER TO issue_tracker;

--
-- Name: role1; Type: TABLE; Schema: issue_tracker; Owner: issue_tracker
--

CREATE TABLE issue_tracker.role1 (
    role_id integer NOT NULL,
    role_name character varying(255) NOT NULL
);


ALTER TABLE issue_tracker.role1 OWNER TO issue_tracker;

--
-- Name: role1_role_id_seq; Type: SEQUENCE; Schema: issue_tracker; Owner: issue_tracker
--

CREATE SEQUENCE issue_tracker.role1_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE issue_tracker.role1_role_id_seq OWNER TO issue_tracker;

--
-- Name: role1_role_id_seq; Type: SEQUENCE OWNED BY; Schema: issue_tracker; Owner: issue_tracker
--

ALTER SEQUENCE issue_tracker.role1_role_id_seq OWNED BY issue_tracker.role1.role_id;


--
-- Name: role1 role_id; Type: DEFAULT; Schema: issue_tracker; Owner: issue_tracker
--

ALTER TABLE ONLY issue_tracker.role1 ALTER COLUMN role_id SET DEFAULT nextval('issue_tracker.role1_role_id_seq'::regclass);


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: issue_tracker; Owner: issue_tracker
--

COPY issue_tracker.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
raw	includeAll	changelog-0.0.1.sql	2020-01-08 18:19:17.041539	1	EXECUTED	7:8fc5e46d6ae3b8c808b026cde523d2fb	sql		\N	3.5.3	\N	\N	8496757015
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: issue_tracker; Owner: issue_tracker
--

COPY issue_tracker.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: role1; Type: TABLE DATA; Schema: issue_tracker; Owner: issue_tracker
--

COPY issue_tracker.role1 (role_id, role_name) FROM stdin;
\.


--
-- Name: role1_role_id_seq; Type: SEQUENCE SET; Schema: issue_tracker; Owner: issue_tracker
--

SELECT pg_catalog.setval('issue_tracker.role1_role_id_seq', 1, false);


--
-- Name: databasechangeloglock pk_databasechangeloglock; Type: CONSTRAINT; Schema: issue_tracker; Owner: issue_tracker
--

ALTER TABLE ONLY issue_tracker.databasechangeloglock
    ADD CONSTRAINT pk_databasechangeloglock PRIMARY KEY (id);


--
-- Name: role1 role1_pkey; Type: CONSTRAINT; Schema: issue_tracker; Owner: issue_tracker
--

ALTER TABLE ONLY issue_tracker.role1
    ADD CONSTRAINT role1_pkey PRIMARY KEY (role_id);


--
-- Name: role1 role1_role_name_key; Type: CONSTRAINT; Schema: issue_tracker; Owner: issue_tracker
--

ALTER TABLE ONLY issue_tracker.role1
    ADD CONSTRAINT role1_role_name_key UNIQUE (role_name);


--
-- PostgreSQL database dump complete
--

