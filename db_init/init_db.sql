--
-- PostgreSQL database dump
--

\restrict OIRkNTf4LuJT0OgyDc2ML88UefrgRWvtTgv7rmD90AMENbSWJyDuKwwsUYgNwep

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2026-05-06 17:24:51

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 228 (class 1259 OID 19490)
-- Name: cart_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart_items (
    id bigint NOT NULL,
    cart_id bigint NOT NULL,
    game_id bigint NOT NULL,
    quantity integer DEFAULT 1 NOT NULL,
    price numeric(10,2) NOT NULL
);


ALTER TABLE public.cart_items OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 19489)
-- Name: cart_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cart_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cart_items_id_seq OWNER TO postgres;

--
-- TOC entry 5027 (class 0 OID 0)
-- Dependencies: 227
-- Name: cart_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cart_items_id_seq OWNED BY public.cart_items.id;


--
-- TOC entry 226 (class 1259 OID 19474)
-- Name: carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carts (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    total_price numeric(10,2) DEFAULT 0.00,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.carts OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 19473)
-- Name: carts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.carts_id_seq OWNER TO postgres;

--
-- TOC entry 5028 (class 0 OID 0)
-- Dependencies: 225
-- Name: carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carts_id_seq OWNED BY public.carts.id;


--
-- TOC entry 224 (class 1259 OID 19463)
-- Name: game_genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.game_genres (
    game_id bigint NOT NULL,
    genres character varying(255) NOT NULL
);


ALTER TABLE public.game_genres OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 19453)
-- Name: games; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.games (
    id bigint NOT NULL,
    title character varying(200) NOT NULL,
    description text,
    developer character varying(100),
    publisher character varying(100),
    release_date date,
    platform character varying(50),
    price numeric(10,2),
    discount_price numeric(10,2),
    image_url character varying(255),
    active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.games OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 19452)
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.games_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.games_id_seq OWNER TO postgres;

--
-- TOC entry 5029 (class 0 OID 0)
-- Dependencies: 222
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.games_id_seq OWNED BY public.games.id;


--
-- TOC entry 232 (class 1259 OID 19525)
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    game_id bigint NOT NULL,
    quantity integer DEFAULT 1 NOT NULL,
    price_at_purchase numeric(38,2) NOT NULL
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 19524)
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_items_id_seq OWNER TO postgres;

--
-- TOC entry 5030 (class 0 OID 0)
-- Dependencies: 231
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- TOC entry 230 (class 1259 OID 19510)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(255) DEFAULT 'PENDING'::character varying,
    total_amount numeric(38,2) DEFAULT 0.00,
    payment_status character varying(20) DEFAULT 'PENDING'::character varying,
    transaction_id character varying(100)
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 19509)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 5031 (class 0 OID 0)
-- Dependencies: 229
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 234 (class 1259 OID 20080)
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    user_id bigint NOT NULL,
    transaction_id character varying(100) NOT NULL,
    amount numeric(10,2) NOT NULL,
    status character varying(20) DEFAULT 'PENDING'::character varying NOT NULL,
    payment_method character varying(50),
    card_last_four character varying(4),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 20079)
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payments_id_seq OWNER TO postgres;

--
-- TOC entry 5032 (class 0 OID 0)
-- Dependencies: 233
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- TOC entry 218 (class 1259 OID 19416)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(20) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 19415)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 5033 (class 0 OID 0)
-- Dependencies: 217
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- TOC entry 221 (class 1259 OID 19437)
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles (
    user_id bigint NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 19425)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(120) NOT NULL,
    active boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 19424)
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
-- TOC entry 5034 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4795 (class 2604 OID 19546)
-- Name: cart_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items ALTER COLUMN id SET DEFAULT nextval('public.cart_items_id_seq'::regclass);


--
-- TOC entry 4792 (class 2604 OID 19555)
-- Name: carts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts ALTER COLUMN id SET DEFAULT nextval('public.carts_id_seq'::regclass);


--
-- TOC entry 4789 (class 2604 OID 19570)
-- Name: games id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games ALTER COLUMN id SET DEFAULT nextval('public.games_id_seq'::regclass);


--
-- TOC entry 4802 (class 2604 OID 19604)
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- TOC entry 4797 (class 2604 OID 19611)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 4804 (class 2604 OID 20106)
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- TOC entry 4785 (class 2604 OID 19419)
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- TOC entry 4786 (class 2604 OID 19626)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 5015 (class 0 OID 19490)
-- Dependencies: 228
-- Data for Name: cart_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart_items (id, cart_id, game_id, quantity, price) FROM stdin;
110	3	86	1	20.00
111	3	88	1	29.99
\.


--
-- TOC entry 5013 (class 0 OID 19474)
-- Dependencies: 226
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carts (id, user_id, total_price, updated_at) FROM stdin;
2	2	0.00	2025-11-17 15:59:51.340775
1	1	0.00	2025-12-16 20:22:36.237831
33	5	0.00	2026-05-06 01:34:21.311117
34	34	0.00	2026-05-06 12:50:13.030959
35	35	0.00	2026-05-06 12:50:13.146036
36	36	0.00	2026-05-06 12:50:13.156061
37	37	0.00	2026-05-06 13:04:57.228481
38	38	0.00	2026-05-06 13:04:57.320215
39	39	0.00	2026-05-06 17:11:43.888255
40	40	0.00	2026-05-06 17:11:44.015313
41	41	0.00	2026-05-06 17:11:44.022991
42	42	0.00	2026-05-06 17:11:44.030598
43	43	0.00	2026-05-06 17:11:44.032613
44	44	0.00	2026-05-06 17:11:44.046509
45	45	0.00	2026-05-06 17:11:44.046509
46	46	0.00	2026-05-06 17:11:44.062492
47	47	0.00	2026-05-06 17:11:44.062492
48	48	0.00	2026-05-06 17:11:44.078342
49	49	0.00	2026-05-06 17:11:44.078342
50	50	0.00	2026-05-06 17:11:44.094347
51	51	0.00	2026-05-06 17:11:44.094347
52	52	0.00	2026-05-06 17:11:44.110232
4	4	0.00	2025-12-05 12:41:47.539694
3	3	49.99	2025-12-19 18:38:21.903236
\.


--
-- TOC entry 5011 (class 0 OID 19463)
-- Dependencies: 224
-- Data for Name: game_genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.game_genres (game_id, genres) FROM stdin;
87	ADVENTURE
89	SHOOTER
90	PUZZLE
86	SPORTS
86	ACTION
86	SHOOTER
91	PUZZLE
92	SHOOTER
93	PUZZLE
94	INDIE
88	ACTION
88	SHOOTER
88	FIGHTING
95	FIGHTING
96	PUZZLE
\.


--
-- TOC entry 5010 (class 0 OID 19453)
-- Dependencies: 223
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.games (id, title, description, developer, publisher, release_date, platform, price, discount_price, image_url, active, created_at) FROM stdin;
88	Elden Ring: Shadow of the Erdtree	Дополнение к награжденной GOTY игре	FromSoftware	Bandai Namco	2024-06-21	PC	39.99	29.99	https://gamestore.by//userfls/shop/big/16/154117_elden-ring-shadow-of-the-erdtree-ps5.webp	t	2025-12-08 07:55:10.056033
87	The Witcher 3: Wild Hunt	Эпическая RPG о ведьмаке Геральте из Ривии	CD Projekt Red	CD Projekt	2015-05-19	NINTENDO	39.99	9.99	https://gamestore.by//userfls/shop/big/16/153880_vedmak-3-dikaya-okhota-the-witch.webp	f	2025-12-08 07:55:10.056033
89	акака	аккак			2025-12-09	MOBILE	12.00	11.00		f	\N
90	12	12			2025-09-02	PLAYSTATION	11.00	11.00		f	\N
86	Cyberpunk 2077: Phantom Liberty	Дополнение к культовой игре в стиле киберпанк	CD Projekt Red	CD Projekt	2023-09-26	PLAYSTATION	29.99	20.00	https://gamestore.by//userfls/shop/big/16/153116_cyberpunk-2077-ultimate-edition-ps5.webp	t	2025-12-08 07:55:10.056033
91	112	11			0001-03-12	PC	11.00	10.00		f	\N
92	11	1			1111-11-11	PC	10.00	1.00		f	\N
93	1212	12\n			0111-11-11	PC	11.00	1.00		f	\N
94	11	11			1111-11-11	MOBILE	11.00	11.00		f	2025-12-17 00:20:16.499555
95	11	11			0111-01-11	PC	1.00	1.00		f	2025-12-19 09:32:36.869171
96	111	11			0001-01-11	PC	11.00	1.00		f	2025-12-19 10:19:23.473845
\.


--
-- TOC entry 5019 (class 0 OID 19525)
-- Dependencies: 232
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (id, order_id, game_id, quantity, price_at_purchase) FROM stdin;
61	47	86	2	19.99
62	48	86	1	19.99
63	48	88	1	29.99
64	48	87	1	9.99
75	56	86	1	19.99
76	56	88	1	29.99
77	57	86	1	19.99
84	64	86	1	20.00
85	65	88	1	29.99
86	65	86	1	20.00
89	67	86	1	20.00
90	68	86	1	20.00
91	69	88	1	29.99
92	70	86	1	20.00
93	71	88	1	29.99
94	72	86	1	20.00
95	73	86	1	20.00
96	74	86	1	20.00
38	29	86	1	19.99
39	30	88	1	29.99
40	30	87	2	9.99
41	30	86	10	19.99
42	31	88	3	29.99
97	75	86	2	20.00
98	76	86	1	20.00
99	76	88	1	29.99
100	77	88	3	29.99
101	77	86	3	20.00
102	78	88	1	29.99
103	78	86	2	20.00
104	79	88	1	29.99
105	79	86	1	20.00
106	80	86	1	20.00
53	39	87	1	9.99
\.


--
-- TOC entry 5017 (class 0 OID 19510)
-- Dependencies: 230
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, order_date, status, total_amount, payment_status, transaction_id) FROM stdin;
67	3	2025-12-16 20:45:52.86034	PENDING	20.00	PENDING	\N
68	3	2025-12-16 22:24:31.24733	CANCELLED	20.00	PENDING	\N
69	3	2025-12-18 15:14:54.73684	PENDING	29.99	PENDING	\N
70	3	2025-12-18 15:16:57.472764	PENDING	20.00	PENDING	\N
71	3	2025-12-18 15:32:41.650953	PENDING	29.99	PENDING	\N
72	3	2025-12-18 15:33:00.420169	PENDING	20.00	PENDING	\N
75	3	2025-12-19 09:19:28.840224	CANCELLED	40.00	PENDING	\N
74	3	2025-12-19 09:18:27.966445	PROCESSING	20.00	PENDING	\N
73	3	2025-12-18 15:33:34.450853	CANCELLED	20.00	PENDING	\N
76	3	2025-12-19 09:19:40.617359	PENDING	49.99	PENDING	\N
78	3	2025-12-19 09:34:14.864653	PENDING	69.99	PENDING	\N
79	3	2025-12-19 10:18:39.492168	COMPLETED	49.99	PENDING	\N
77	3	2025-12-19 09:33:34.77994	COMPLETED	149.97	PENDING	\N
80	3	2025-12-19 18:24:01.301345	PENDING	20.00	PENDING	\N
3	3	2025-12-05 11:05:03.493918	PROCESSING	439.78	NOT_REQUIRED	\N
2	3	2025-12-05 11:04:40.880822	COMPLETED	19.99	NOT_REQUIRED	\N
1	3	2025-12-05 11:04:20.993761	CANCELLED	19.99	NOT_REQUIRED	\N
7	4	2025-12-05 12:41:47.478542	COMPLETED	119.99	NOT_REQUIRED	\N
39	3	2025-12-10 22:48:28.230677	COMPLETED	9.99	NOT_REQUIRED	\N
31	3	2025-12-10 22:22:23.192657	PROCESSING	89.97	NOT_REQUIRED	\N
47	3	2025-12-15 19:30:29.563368	COMPLETED	39.98	NOT_REQUIRED	\N
9	3	2025-12-05 16:36:41.60197	PENDING	19.99	PENDING	\N
56	3	2025-12-15 20:36:11.269562	PENDING	49.98	PENDING	\N
57	3	2025-12-15 21:06:48.39397	PENDING	19.99	PENDING	\N
29	3	2025-12-10 22:21:41.814864	PENDING	19.99	PENDING	\N
30	3	2025-12-10 22:22:10.953369	PENDING	249.87	PENDING	\N
64	3	2025-12-16 19:34:26.504734	PENDING	20.00	PENDING	\N
65	3	2025-12-16 19:59:04.109378	PENDING	49.99	PENDING	\N
48	3	2025-12-15 19:30:46.135956	PENDING	59.97	PENDING	\N
\.


--
-- TOC entry 5021 (class 0 OID 20080)
-- Dependencies: 234
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, order_id, user_id, transaction_id, amount, status, payment_method, card_last_four, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 5005 (class 0 OID 19416)
-- Dependencies: 218
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name) FROM stdin;
1	ROLE_USER
2	ROLE_ADMIN
\.


--
-- TOC entry 5008 (class 0 OID 19437)
-- Dependencies: 221
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_roles (user_id, role_id) FROM stdin;
1	2
1	1
2	1
3	1
4	1
5	1
34	1
35	1
36	1
37	1
38	1
39	1
40	1
41	1
42	1
43	1
44	1
45	1
46	1
47	1
48	1
49	1
50	1
51	1
52	1
53	1
54	1
\.


--
-- TOC entry 5007 (class 0 OID 19425)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, email, password, active, created_at) FROM stdin;
1	admin	admin@example.com	$2a$10$ORjRiA.cYqxFcXnquRl3Y.VSufjc/eZs7hvZey51I3Fo1dKAKHa2q	t	2025-11-17 15:59:51.340775
2	user	user@example.com	$2a$10$ORjRiA.cYqxFcXnquRl3Y.VSufjc/eZs7hvZey51I3Fo1dKAKHa2q	t	2025-11-17 15:59:51.340775
3	dexxrat	dexxrat@gmail.com	$2a$10$nY15wC0yl3A5NGnccsv9BeU.esatOSyS2GsCbE2b1vkLWBbJ0zERC	t	2025-12-05 11:04:07.183556
4	VanyaKuprash	ivan2007@gmail.com	$2a$10$bKZPg0z6NNPqbdEbohlRguLcEBT7D4vNfp7.KgiJ5YmgSJDKK7dNG	t	2025-12-05 12:40:39.405095
5	dexxrat1	dexxra1t@gmail.com	$2a$10$VQkOGvvlplK1aG7W/7ux8eyDErkNyjEnXrIBD9R4Edb4ELnBctxbi	t	2025-12-05 19:02:08.793114
34	user_00791edb-9945-4814-8373-b56c5861b525	user_00791edb-9945-4814-8373-b56c5861b525@test.com	$2a$10$TWTSdwYwxbhqIz0hNJDh/eeHRQ8dP0CxCtArwgWhsk52ArHEVl1iq	t	2026-05-06 12:29:05.537213
35	test_f15b09e4	test_f15b09e4@gmail.com	$2a$10$eLDoogt9hoWPTGFXgHSrYely5ujt4Y7Ado0rhSZnc4dGyiRaI1KGG	t	2026-05-06 12:30:50.128873
36	test_d7e93355	test_d7e93355@gmail.com	$2a$10$il8sniDX8xU/zeyh.dG8TuCAnqpvvf0Jwlnwt0o3bzAaRLDT8Epae	t	2026-05-06 12:33:01.763016
37	user_bea3ee37-2283-470c-bf32-320b1380ff99	user_bea3ee37-2283-470c-bf32-320b1380ff99@test.com	$2a$10$5uWA2Uz8KYEoy8Ch5biKD.gpMUqOboehEzUXK5MQj2CbQWB.0ji9i	t	2026-05-06 12:50:38.268746
38	test_5318ee51	test_5318ee51@gmail.com	$2a$10$6bZaJH1ndsrxrnieTNbKhOQ2N143epSjbhNjm.SOpIT9Gon4qAfUi	t	2026-05-06 12:50:51.327834
39	Bogdan_AQA	itzenevich@gmail.com	$2a$10$o0Z2l8OJKRJw4s3/o3h1QOB8IEkZhs.VdfP.GBU8/f9vdl9qO5VI2	t	2026-05-06 14:49:32.822678
40	neville.lind	neville.lind@example.com	$2a$10$SPw0.74n00AvVpleuD5VFukhEqK.uwy.MNvU.ZbKSzlrWXZBK10FW	t	2026-05-06 14:52:00.221658
41	testuser	test@mail.com	$2a$10$PwRcVZdDDdnrv3s4AYec..DHVTzVJnsvBX/0MI.pOPM0fEPIPHwqG	t	2026-05-06 14:52:00.731473
42	asa.tillman	asa.tillman@example.com	$2a$10$uJ2TnbSWIzml04uq..UA.u3jJEvlYEQqq77YyH0YDzO6iID3TFMzS	t	2026-05-06 14:53:56.604299
43	user_da8ff	test_da8ff@example.com	$2a$10$Y8WiHUEDdEfQbsrOkvxjHOQVGXWEKVt7IYnUlLhRM2E5vLcv.CzAS	t	2026-05-06 14:53:57.157777
44	earle.paucek	adela.rutherford@hotmail.com	$2a$10$x.AfQVcY/2QipCQvfCi0J..u0F8hZNmcIvQ5f7wrY/8UHeO8vuYxK	t	2026-05-06 14:57:28.548633
45	sarai.price	sarai.price@example.com	$2a$10$2uh1iEk65iOXPe260OVrl.YYXh88uJ0dAzkc///K/aUc/VRmIXQqG	t	2026-05-06 14:57:30.532739
46	user_524ed	test_524ed@example.com	$2a$10$lM0DvGcqrh6QV8MpNdgLN.E30ZtXRUrkEiGGdmFOrwtDuhK3yDqdC	t	2026-05-06 14:57:30.910566
47	tester_1778069040769	tester_1778069040769@example.com	$2a$10$Fk7mqRO4e8NiPeSGEVjJ9e.S5jT1jXlcQ9Jj6K8BdIYOQ/xr8Tvba	t	2026-05-06 15:04:03.571107
48	garry.marks	freeman.weimann@hotmail.com	$2a$10$GHgsFpbw/cgJc10L18aGru469pkEXHN/uGQA9BeliqgKQgr3atKIC	t	2026-05-06 15:04:05.483185
49	mason.ritchie	mason.ritchie@example.com	$2a$10$9UXvnfVLpBlFCf1jVdNJUOqpw/n6Jge1dT7WnCe8iPT1LkPgX6n3.	t	2026-05-06 15:04:06.461162
50	user_00bea	test_00bea@example.com	$2a$10$21y9gULHvkHF4QKqxMZci.iKAt/kvgd9frVE7FWWQ8ZiWa9uK9YzC	t	2026-05-06 15:04:06.840787
51	valentina.mcdermott	valentina.mcdermott@example.com	$2a$10$tnzVbHBvnMY7M6m6vH6Gh.OCboNoboxkvqkeE7YPow1A27l3pN4Ge	t	2026-05-06 15:05:28.647814
52	user_67fc1	test_67fc1@example.com	$2a$10$eRMoypVK6rNaKqZq9LCnpuoo1WC9MsfddUrpyMUftrdU5ULB8yH0a	t	2026-05-06 15:05:29.196548
53	erich.kuhn	erich.kuhn@example.com	$2a$10$W7nbyxJPLV8fd.SLxTYfUurYH0sorYy8JVpun.iNb6FVa5jYL4DOq	t	2026-05-06 17:12:53.279471
54	user_40404	test_40404@example.com	$2a$10$Q6VMtBuihAuSnLPpVC0SoeyGu5.v401W/W0UufNH876aCOWTqM8hi	t	2026-05-06 17:12:54.150934
\.


--
-- TOC entry 5035 (class 0 OID 0)
-- Dependencies: 227
-- Name: cart_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_items_id_seq', 147, true);


--
-- TOC entry 5036 (class 0 OID 0)
-- Dependencies: 225
-- Name: carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carts_id_seq', 52, true);


--
-- TOC entry 5037 (class 0 OID 0)
-- Dependencies: 222
-- Name: games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.games_id_seq', 140, true);


--
-- TOC entry 5038 (class 0 OID 0)
-- Dependencies: 231
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_id_seq', 106, true);


--
-- TOC entry 5039 (class 0 OID 0)
-- Dependencies: 229
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 80, true);


--
-- TOC entry 5040 (class 0 OID 0)
-- Dependencies: 233
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_id_seq', 1, false);


--
-- TOC entry 5041 (class 0 OID 0)
-- Dependencies: 217
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 2, true);


--
-- TOC entry 5042 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 54, true);


--
-- TOC entry 4831 (class 2606 OID 19498)
-- Name: cart_items cart_items_cart_id_game_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_cart_id_game_id_key UNIQUE (cart_id, game_id);


--
-- TOC entry 4833 (class 2606 OID 19548)
-- Name: cart_items cart_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_pkey PRIMARY KEY (id);


--
-- TOC entry 4827 (class 2606 OID 19557)
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- TOC entry 4829 (class 2606 OID 19483)
-- Name: carts carts_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_user_id_key UNIQUE (user_id);


--
-- TOC entry 4825 (class 2606 OID 19569)
-- Name: game_genres game_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_genres
    ADD CONSTRAINT game_genres_pkey PRIMARY KEY (game_id, genres);


--
-- TOC entry 4821 (class 2606 OID 19572)
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- TOC entry 4839 (class 2606 OID 19606)
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- TOC entry 4837 (class 2606 OID 19613)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 4845 (class 2606 OID 20108)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- TOC entry 4847 (class 2606 OID 20090)
-- Name: payments payments_transaction_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_transaction_id_key UNIQUE (transaction_id);


--
-- TOC entry 4809 (class 2606 OID 19423)
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- TOC entry 4811 (class 2606 OID 19421)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 4819 (class 2606 OID 19441)
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- TOC entry 4813 (class 2606 OID 19436)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4815 (class 2606 OID 19628)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4817 (class 2606 OID 19434)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4834 (class 1259 OID 19545)
-- Name: idx_cart_items_cart_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cart_items_cart_id ON public.cart_items USING btree (cart_id);


--
-- TOC entry 4822 (class 1259 OID 19542)
-- Name: idx_games_active; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_games_active ON public.games USING btree (active);


--
-- TOC entry 4823 (class 1259 OID 19543)
-- Name: idx_games_title; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_games_title ON public.games USING btree (title);


--
-- TOC entry 4835 (class 1259 OID 19544)
-- Name: idx_orders_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_user_id ON public.orders USING btree (user_id);


--
-- TOC entry 4840 (class 1259 OID 20101)
-- Name: idx_payments_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_payments_order_id ON public.payments USING btree (order_id);


--
-- TOC entry 4841 (class 1259 OID 20104)
-- Name: idx_payments_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_payments_status ON public.payments USING btree (status);


--
-- TOC entry 4842 (class 1259 OID 20103)
-- Name: idx_payments_transaction_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_payments_transaction_id ON public.payments USING btree (transaction_id);


--
-- TOC entry 4843 (class 1259 OID 20102)
-- Name: idx_payments_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_payments_user_id ON public.payments USING btree (user_id);


--
-- TOC entry 4852 (class 2606 OID 19558)
-- Name: cart_items cart_items_cart_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_cart_id_fkey FOREIGN KEY (cart_id) REFERENCES public.carts(id) ON DELETE CASCADE;


--
-- TOC entry 4853 (class 2606 OID 19578)
-- Name: cart_items cart_items_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart_items
    ADD CONSTRAINT cart_items_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.games(id) ON DELETE CASCADE;


--
-- TOC entry 4851 (class 2606 OID 19634)
-- Name: carts carts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4850 (class 2606 OID 19573)
-- Name: game_genres game_genres_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_genres
    ADD CONSTRAINT game_genres_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.games(id) ON DELETE CASCADE;


--
-- TOC entry 4855 (class 2606 OID 19583)
-- Name: order_items order_items_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.games(id) ON DELETE CASCADE;


--
-- TOC entry 4856 (class 2606 OID 19614)
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- TOC entry 4854 (class 2606 OID 19639)
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4857 (class 2606 OID 20091)
-- Name: payments payments_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- TOC entry 4858 (class 2606 OID 20096)
-- Name: payments payments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- TOC entry 4848 (class 2606 OID 19447)
-- Name: user_roles user_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- TOC entry 4849 (class 2606 OID 19629)
-- Name: user_roles user_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


-- Completed on 2026-05-06 17:24:51

--
-- PostgreSQL database dump complete
--

\unrestrict OIRkNTf4LuJT0OgyDc2ML88UefrgRWvtTgv7rmD90AMENbSWJyDuKwwsUYgNwep

