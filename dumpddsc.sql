--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: topology; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


--
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: filter; Type: TABLE; Schema: public; Owner: ddsc; Tablespace: 
--

CREATE TABLE filter (
    filter_id integer NOT NULL,
    filtername text NOT NULL
);


ALTER TABLE public.filter OWNER TO ddsc;

--
-- Name: filter_filter_id_seq; Type: SEQUENCE; Schema: public; Owner: ddsc
--

CREATE SEQUENCE filter_filter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.filter_filter_id_seq OWNER TO ddsc;

--
-- Name: filter_filter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ddsc
--

ALTER SEQUENCE filter_filter_id_seq OWNED BY filter.filter_id;


--
-- Name: filter_filter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ddsc
--

SELECT pg_catalog.setval('filter_filter_id_seq', 9, true);


--
-- Name: filter_location; Type: TABLE; Schema: public; Owner: ddsc; Tablespace: 
--

CREATE TABLE filter_location (
    filter_id integer NOT NULL,
    location_id integer NOT NULL
);


ALTER TABLE public.filter_location OWNER TO ddsc;

--
-- Name: location; Type: TABLE; Schema: public; Owner: ddsc; Tablespace: 
--

CREATE TABLE location (
    location_id integer NOT NULL,
    name text NOT NULL,
    location geography(Point,4326),
    locationdate date DEFAULT (now())::date NOT NULL
);


ALTER TABLE public.location OWNER TO ddsc;

--
-- Name: location_location_id_seq; Type: SEQUENCE; Schema: public; Owner: ddsc
--

CREATE SEQUENCE location_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.location_location_id_seq OWNER TO ddsc;

--
-- Name: location_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ddsc
--

ALTER SEQUENCE location_location_id_seq OWNED BY location.location_id;


--
-- Name: location_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ddsc
--

SELECT pg_catalog.setval('location_location_id_seq', 20, true);


--
-- Name: location_parameter; Type: TABLE; Schema: public; Owner: ddsc; Tablespace: 
--

CREATE TABLE location_parameter (
    location_id integer NOT NULL,
    parameter_id integer NOT NULL
);


ALTER TABLE public.location_parameter OWNER TO ddsc;

--
-- Name: parameter; Type: TABLE; Schema: public; Owner: ddsc; Tablespace: 
--

CREATE TABLE parameter (
    parameter_id integer NOT NULL,
    parameter text NOT NULL,
    parametervalue text NOT NULL,
    parameterdate date DEFAULT (now())::date NOT NULL
);


ALTER TABLE public.parameter OWNER TO ddsc;

--
-- Name: parameter_parameter_id_seq; Type: SEQUENCE; Schema: public; Owner: ddsc
--

CREATE SEQUENCE parameter_parameter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.parameter_parameter_id_seq OWNER TO ddsc;

--
-- Name: parameter_parameter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ddsc
--

ALTER SEQUENCE parameter_parameter_id_seq OWNED BY parameter.parameter_id;


--
-- Name: parameter_parameter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ddsc
--

SELECT pg_catalog.setval('parameter_parameter_id_seq', 6, true);


--
-- Name: filter_id; Type: DEFAULT; Schema: public; Owner: ddsc
--

ALTER TABLE ONLY filter ALTER COLUMN filter_id SET DEFAULT nextval('filter_filter_id_seq'::regclass);


--
-- Name: location_id; Type: DEFAULT; Schema: public; Owner: ddsc
--

ALTER TABLE ONLY location ALTER COLUMN location_id SET DEFAULT nextval('location_location_id_seq'::regclass);


--
-- Name: parameter_id; Type: DEFAULT; Schema: public; Owner: ddsc
--

ALTER TABLE ONLY parameter ALTER COLUMN parameter_id SET DEFAULT nextval('parameter_parameter_id_seq'::regclass);


--
-- Data for Name: filter; Type: TABLE DATA; Schema: public; Owner: ddsc
--

COPY filter (filter_id, filtername) FROM stdin;
1	Waternet
2	HHNK
3	Project A
4	Project B
5	Project C
6	Project D
7	Project E
8	Project F
9	IJkdijk
\.


--
-- Data for Name: filter_location; Type: TABLE DATA; Schema: public; Owner: ddsc
--

COPY filter_location (filter_id, location_id) FROM stdin;
\.


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: ddsc
--

COPY location (location_id, name, location, locationdate) FROM stdin;
1	Dijk 1	\N	2013-01-16
2	Dijk 2	\N	2013-01-16
3	Gemaal 2.3.4	\N	2013-01-16
4	Dijk 3	\N	2013-01-18
5	Dijk 4	\N	2013-01-18
6	Dijk 5	\N	2013-01-18
7	Dijk 6	\N	2013-01-18
8	Dijk 7	\N	2013-01-18
9	Dijk 8	\N	2013-01-18
10	Dijk 9	\N	2013-01-18
11	Dijk 10	\N	2013-01-18
12	Dijk 11	\N	2013-01-18
13	Dijk 12	\N	2013-01-18
14	Dijk 13	\N	2013-01-18
15	Dijk 1	\N	2013-01-18
16	Dijk 15	\N	2013-01-18
17	Dijk 16	\N	2013-01-18
18	Dijk 17	\N	2013-01-18
19	Dijk 18	\N	2013-01-18
20	Dijk 19	\N	2013-01-18
\.


--
-- Data for Name: location_parameter; Type: TABLE DATA; Schema: public; Owner: ddsc
--

COPY location_parameter (location_id, parameter_id) FROM stdin;
1	1
\.


--
-- Data for Name: parameter; Type: TABLE DATA; Schema: public; Owner: ddsc
--

COPY parameter (parameter_id, parameter, parametervalue, parameterdate) FROM stdin;
1	Temperatuur	13	2013-01-16
2	Temperatuur	12	2013-01-16
4	Temperatuur	12.4	2013-01-16
5	Druk	500	2013-01-18
6	Druk	400	2013-01-18
3	Temperatuur	12	2013-01-16
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: ddsc
--

COPY spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


SET search_path = topology, pg_catalog;

--
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.


--
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: postgres
--

COPY topology (id, name, srid, "precision", hasz) FROM stdin;
\.


SET search_path = public, pg_catalog;

--
-- Name: filter_location_pkey; Type: CONSTRAINT; Schema: public; Owner: ddsc; Tablespace: 
--

ALTER TABLE ONLY filter_location
    ADD CONSTRAINT filter_location_pkey PRIMARY KEY (filter_id, location_id);


--
-- Name: filter_pkey; Type: CONSTRAINT; Schema: public; Owner: ddsc; Tablespace: 
--

ALTER TABLE ONLY filter
    ADD CONSTRAINT filter_pkey PRIMARY KEY (filter_id);


--
-- Name: location_parameter_pkey; Type: CONSTRAINT; Schema: public; Owner: ddsc; Tablespace: 
--

ALTER TABLE ONLY location_parameter
    ADD CONSTRAINT location_parameter_pkey PRIMARY KEY (location_id, parameter_id);


--
-- Name: location_pkey; Type: CONSTRAINT; Schema: public; Owner: ddsc; Tablespace: 
--

ALTER TABLE ONLY location
    ADD CONSTRAINT location_pkey PRIMARY KEY (location_id);


--
-- Name: parameter_pkey; Type: CONSTRAINT; Schema: public; Owner: ddsc; Tablespace: 
--

ALTER TABLE ONLY parameter
    ADD CONSTRAINT parameter_pkey PRIMARY KEY (parameter_id);


--
-- Name: geometry_columns_delete; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE geometry_columns_delete AS ON DELETE TO geometry_columns DO INSTEAD NOTHING;


--
-- Name: geometry_columns_insert; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE geometry_columns_insert AS ON INSERT TO geometry_columns DO INSTEAD NOTHING;


--
-- Name: geometry_columns_update; Type: RULE; Schema: public; Owner: postgres
--

CREATE RULE geometry_columns_update AS ON UPDATE TO geometry_columns DO INSTEAD NOTHING;


--
-- Name: filter_location_filter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ddsc
--

ALTER TABLE ONLY filter_location
    ADD CONSTRAINT filter_location_filter_id_fkey FOREIGN KEY (filter_id) REFERENCES filter(filter_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: filter_location_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ddsc
--

ALTER TABLE ONLY filter_location
    ADD CONSTRAINT filter_location_location_id_fkey FOREIGN KEY (location_id) REFERENCES location(location_id) ON UPDATE CASCADE;


--
-- Name: location_parameter_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ddsc
--

ALTER TABLE ONLY location_parameter
    ADD CONSTRAINT location_parameter_location_id_fkey FOREIGN KEY (location_id) REFERENCES location(location_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: location_parameter_parameter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: ddsc
--

ALTER TABLE ONLY location_parameter
    ADD CONSTRAINT location_parameter_parameter_id_fkey FOREIGN KEY (parameter_id) REFERENCES parameter(parameter_id) ON UPDATE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

