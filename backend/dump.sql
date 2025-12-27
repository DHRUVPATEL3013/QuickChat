--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: messagestatus; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.messagestatus AS ENUM (
    'sent',
    'delivered',
    'read'
);


ALTER TYPE public.messagestatus OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts (
    id integer NOT NULL,
    owner_id integer NOT NULL,
    contact_id integer,
    saved_name character varying NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.contacts OWNER TO postgres;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contacts_id_seq OWNER TO postgres;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    sender_id integer NOT NULL,
    recipient_id integer NOT NULL,
    content character varying NOT NULL,
    "timestamp" timestamp with time zone DEFAULT now(),
    status public.messagestatus,
    is_bot_response boolean
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.messages_id_seq OWNER TO postgres;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    fullname character varying NOT NULL,
    phone character varying NOT NULL,
    gender character varying NOT NULL,
    dob date NOT NULL,
    profile_pic character varying,
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts (id, owner_id, contact_id, saved_name, created_at) FROM stdin;
1	4	3	Dhruv	2025-12-04 08:15:29.972803
2	3	4	111	2025-12-04 08:16:33.981569
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.messages (id, sender_id, recipient_id, content, "timestamp", status, is_bot_response) FROM stdin;
32	3	4	hhi	2025-12-04 18:08:42.994214+05:30	read	f
33	3	4	hiii	2025-12-04 18:09:30.026349+05:30	read	f
34	4	3	heelo	2025-12-04 18:12:43.346506+05:30	read	f
35	4	3	hhh	2025-12-04 18:13:36.521474+05:30	read	f
36	3	4	ggggg	2025-12-04 18:21:19.782744+05:30	read	f
37	4	3	hello	2025-12-04 18:21:58.07366+05:30	read	f
38	3	4	njnnndc	2025-12-04 18:22:04.706802+05:30	read	f
39	4	3	jjjjf	2025-12-04 18:24:18.520275+05:30	sent	f
1	4	3	hello	2025-12-04 13:45:38.372391+05:30	read	f
4	4	3	hello	2025-12-04 16:29:32.545728+05:30	read	f
5	4	3	hello	2025-12-04 16:29:39.626821+05:30	read	f
8	4	3	hi i ma 93	2025-12-04 16:31:05.599258+05:30	read	f
12	4	3	hello	2025-12-04 16:33:27.796755+05:30	read	f
14	4	3	icxsnmkjnckj	2025-12-04 16:33:41.735844+05:30	read	f
15	4	3	hello man	2025-12-04 16:34:33.076335+05:30	read	f
3	4	3	jjjj	2025-12-04 13:46:57.299472+05:30	read	f
9	4	3	hello 111	2025-12-04 16:31:55.912277+05:30	read	f
10	4	3	jnjnc	2025-12-04 16:32:27.772624+05:30	read	f
11	4	3	hhbd	2025-12-04 16:32:37.975551+05:30	read	f
16	4	3	hlllll	2025-12-04 16:34:51.663619+05:30	read	f
17	4	3	hello	2025-12-04 16:46:37.654481+05:30	read	f
19	4	3	i am kjndnjvjndjkc	2025-12-04 16:47:26.869539+05:30	read	f
20	4	3	jjhvjjfd	2025-12-04 16:51:03.510309+05:30	read	f
21	4	3	hbc hvhbhv	2025-12-04 16:51:12.38934+05:30	read	f
22	4	3	nbvhjbhfv	2025-12-04 16:51:16.059397+05:30	read	f
24	4	3	nvjndjnvjndj	2025-12-04 16:51:37.119503+05:30	read	f
25	4	3	jnvjnjfnjv	2025-12-04 16:51:54.736043+05:30	read	f
26	4	3	i have sijksnckms	2025-12-04 16:52:00.258213+05:30	read	f
27	4	3	jchdhhjd	2025-12-04 16:52:52.969142+05:30	read	f
2	3	4	hhi	2025-12-04 13:46:42.100275+05:30	read	f
6	3	4	hii	2025-12-04 16:30:05.061909+05:30	read	f
7	3	4	hello	2025-12-04 16:30:51.329787+05:30	read	f
13	3	4	helll	2025-12-04 16:33:35.515142+05:30	read	f
18	3	4	hiiiii	2025-12-04 16:47:18.865764+05:30	read	f
23	3	4	my name kckd	2025-12-04 16:51:31.390683+05:30	read	f
28	3	4	hii	2025-12-04 17:16:21.639028+05:30	read	f
29	3	4	hhhhhd	2025-12-04 17:17:18.90841+05:30	read	f
30	3	4	hhhhh	2025-12-04 17:17:31.026743+05:30	read	f
31	3	4	nhhhhh	2025-12-04 17:18:19.306078+05:30	read	f
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, fullname, phone, gender, dob, profile_pic, created_at) FROM stdin;
3	Dhruv patel	9313152833	Male	2025-12-31	\N	2025-12-04 08:13:43.541689
4	Rolex patel	111	Male	2025-12-10	\N	2025-12-04 08:15:09.767384
\.


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_id_seq', 2, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.messages_id_seq', 39, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: ix_contacts_contact_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_contacts_contact_id ON public.contacts USING btree (contact_id);


--
-- Name: ix_contacts_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_contacts_id ON public.contacts USING btree (id);


--
-- Name: ix_contacts_owner_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_contacts_owner_id ON public.contacts USING btree (owner_id);


--
-- Name: ix_messages_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_messages_id ON public.messages USING btree (id);


--
-- Name: ix_messages_recipient_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_messages_recipient_id ON public.messages USING btree (recipient_id);


--
-- Name: ix_messages_sender_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_messages_sender_id ON public.messages USING btree (sender_id);


--
-- Name: ix_users_dob; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_users_dob ON public.users USING btree (dob);


--
-- Name: ix_users_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_users_id ON public.users USING btree (id);


--
-- Name: contacts contacts_contact_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_contact_id_fkey FOREIGN KEY (contact_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: contacts contacts_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: messages messages_recipient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_recipient_id_fkey FOREIGN KEY (recipient_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: messages messages_sender_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

