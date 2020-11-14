--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: appointments; Type: TABLE; Schema: public; Owner: nickyvaldecanas
--

CREATE TABLE public.appointments (
    appointment_id integer NOT NULL,
    community_worker_id integer,
    facility_worker_id integer,
    date_time timestamp without time zone,
    appointment_type character varying(255)
);


ALTER TABLE public.appointments OWNER TO nickyvaldecanas;

--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE; Schema: public; Owner: nickyvaldecanas
--

CREATE SEQUENCE public.appointments_appointment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointments_appointment_id_seq OWNER TO nickyvaldecanas;

--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nickyvaldecanas
--

ALTER SEQUENCE public.appointments_appointment_id_seq OWNED BY public.appointments.appointment_id;


--
-- Name: community_workers; Type: TABLE; Schema: public; Owner: nickyvaldecanas
--

CREATE TABLE public.community_workers (
    community_worker_id integer NOT NULL,
    facility_worker_id integer
);


ALTER TABLE public.community_workers OWNER TO nickyvaldecanas;

--
-- Name: facilities; Type: TABLE; Schema: public; Owner: nickyvaldecanas
--

CREATE TABLE public.facilities (
    facility_id integer NOT NULL,
    facility_name character varying(255),
    mlf_code character varying(255),
    district character varying(255),
    region character varying(255)
);


ALTER TABLE public.facilities OWNER TO nickyvaldecanas;

--
-- Name: facilities_facility_id_seq; Type: SEQUENCE; Schema: public; Owner: nickyvaldecanas
--

CREATE SEQUENCE public.facilities_facility_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facilities_facility_id_seq OWNER TO nickyvaldecanas;

--
-- Name: facilities_facility_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nickyvaldecanas
--

ALTER SEQUENCE public.facilities_facility_id_seq OWNED BY public.facilities.facility_id;


--
-- Name: facility_workers; Type: TABLE; Schema: public; Owner: nickyvaldecanas
--

CREATE TABLE public.facility_workers (
    facility_worker_id integer NOT NULL,
    facility_id integer
);


ALTER TABLE public.facility_workers OWNER TO nickyvaldecanas;

--
-- Name: patients; Type: TABLE; Schema: public; Owner: nickyvaldecanas
--

CREATE TABLE public.patients (
    patient_id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    dob date,
    location character varying(255)
);


ALTER TABLE public.patients OWNER TO nickyvaldecanas;

--
-- Name: patients_patient_id_seq; Type: SEQUENCE; Schema: public; Owner: nickyvaldecanas
--

CREATE SEQUENCE public.patients_patient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patients_patient_id_seq OWNER TO nickyvaldecanas;

--
-- Name: patients_patient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nickyvaldecanas
--

ALTER SEQUENCE public.patients_patient_id_seq OWNED BY public.patients.patient_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: nickyvaldecanas
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(255),
    password character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    dob date,
    worker_type character(9),
    location character varying(255),
    CONSTRAINT users_type_check CHECK (((worker_type = 'community'::bpchar) OR (worker_type = 'facility'::bpchar)))
);


ALTER TABLE public.users OWNER TO nickyvaldecanas;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: nickyvaldecanas
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO nickyvaldecanas;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nickyvaldecanas
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: appointments appointment_id; Type: DEFAULT; Schema: public; Owner: nickyvaldecanas
--

ALTER TABLE ONLY public.appointments ALTER COLUMN appointment_id SET DEFAULT nextval('public.appointments_appointment_id_seq'::regclass);


--
-- Name: facilities facility_id; Type: DEFAULT; Schema: public; Owner: nickyvaldecanas
--

ALTER TABLE ONLY public.facilities ALTER COLUMN facility_id SET DEFAULT nextval('public.facilities_facility_id_seq'::regclass);


--
-- Name: patients patient_id; Type: DEFAULT; Schema: public; Owner: nickyvaldecanas
--

ALTER TABLE ONLY public.patients ALTER COLUMN patient_id SET DEFAULT nextval('public.patients_patient_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: nickyvaldecanas
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: nickyvaldecanas
--

COPY public.appointments (appointment_id, community_worker_id, facility_worker_id, date_time, appointment_type) FROM stdin;
\.


--
-- Data for Name: community_workers; Type: TABLE DATA; Schema: public; Owner: nickyvaldecanas
--

COPY public.community_workers (community_worker_id, facility_worker_id) FROM stdin;
\.


--
-- Data for Name: facilities; Type: TABLE DATA; Schema: public; Owner: nickyvaldecanas
--

COPY public.facilities (facility_id, facility_name, mlf_code, district, region) FROM stdin;
\.


--
-- Data for Name: facility_workers; Type: TABLE DATA; Schema: public; Owner: nickyvaldecanas
--

COPY public.facility_workers (facility_worker_id, facility_id) FROM stdin;
\.


--
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: nickyvaldecanas
--

COPY public.patients (patient_id, first_name, last_name, dob, location) FROM stdin;
1	Jane	Doe	1998-01-20	123 Street St, CA
2	Emily	Day	1990-10-25	456 Drive Dr, WA
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: nickyvaldecanas
--

COPY public.users (user_id, username, password, first_name, last_name, dob, worker_type, location) FROM stdin;
\.


--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nickyvaldecanas
--

SELECT pg_catalog.setval('public.appointments_appointment_id_seq', 1, false);


--
-- Name: facilities_facility_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nickyvaldecanas
--

SELECT pg_catalog.setval('public.facilities_facility_id_seq', 1, false);


--
-- Name: patients_patient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nickyvaldecanas
--

SELECT pg_catalog.setval('public.patients_patient_id_seq', 2, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nickyvaldecanas
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);


--
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: nickyvaldecanas
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (appointment_id);


--
-- Name: community_workers community_workers_pkey; Type: CONSTRAINT; Schema: public; Owner: nickyvaldecanas
--

ALTER TABLE ONLY public.community_workers
    ADD CONSTRAINT community_workers_pkey PRIMARY KEY (community_worker_id);


--
-- Name: facilities facilities_pkey; Type: CONSTRAINT; Schema: public; Owner: nickyvaldecanas
--

ALTER TABLE ONLY public.facilities
    ADD CONSTRAINT facilities_pkey PRIMARY KEY (facility_id);


--
-- Name: facility_workers facility_workers_pkey; Type: CONSTRAINT; Schema: public; Owner: nickyvaldecanas
--

ALTER TABLE ONLY public.facility_workers
    ADD CONSTRAINT facility_workers_pkey PRIMARY KEY (facility_worker_id);


--
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: nickyvaldecanas
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (patient_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: nickyvaldecanas
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

