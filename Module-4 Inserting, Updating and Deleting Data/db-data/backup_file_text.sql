--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

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
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    parent_id integer,
    name character varying(50) NOT NULL,
    slug character varying(55) NOT NULL,
    is_active boolean DEFAULT false NOT NULL,
    level smallint DEFAULT 0 NOT NULL,
    CONSTRAINT check_category_slug_not_empty CHECK (((name)::text <> ''::text))
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.category_id_seq OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- Name: order_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_products (
    id integer NOT NULL,
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.order_products OWNER TO postgres;

--
-- Name: order_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_products_id_seq OWNER TO postgres;

--
-- Name: order_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_products_id_seq OWNED BY public.order_products.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
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
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: product_promotion_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_promotion_events (
    id integer NOT NULL,
    product_id integer NOT NULL,
    promotion_event_id integer NOT NULL
);


ALTER TABLE public.product_promotion_events OWNER TO postgres;

--
-- Name: product_promotion_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_promotion_events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_promotion_events_id_seq OWNER TO postgres;

--
-- Name: product_promotion_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_promotion_events_id_seq OWNED BY public.product_promotion_events.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    category_id integer,
    name character varying(50) NOT NULL,
    slug character varying(55) NOT NULL,
    description text,
    is_digital boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    price numeric(10,2) NOT NULL,
    CONSTRAINT check_category_name_not_empty CHECK (((name)::text <> ''::text)),
    CONSTRAINT check_category_slug_format CHECK (((slug)::text ~ '^[a-z0-9_-]+$'::text)),
    CONSTRAINT check_category_slug_not_empty CHECK (((slug)::text <> ''::text))
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: promotion_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promotion_events (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone NOT NULL,
    price_reduction integer NOT NULL
);


ALTER TABLE public.promotion_events OWNER TO postgres;

--
-- Name: promotion_events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.promotion_events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.promotion_events_id_seq OWNER TO postgres;

--
-- Name: promotion_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.promotion_events_id_seq OWNED BY public.promotion_events.id;


--
-- Name: stock_management; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stock_management (
    id integer NOT NULL,
    product_id integer,
    quantity integer DEFAULT 0 NOT NULL,
    last_checked_at timestamp with time zone NOT NULL
);


ALTER TABLE public.stock_management OWNER TO postgres;

--
-- Name: stock_management_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stock_management_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stock_management_id_seq OWNER TO postgres;

--
-- Name: stock_management_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stock_management_id_seq OWNED BY public.stock_management.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(60) NOT NULL
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
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- Name: order_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products ALTER COLUMN id SET DEFAULT nextval('public.order_products_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: product_promotion_events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_promotion_events ALTER COLUMN id SET DEFAULT nextval('public.product_promotion_events_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: promotion_events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_events ALTER COLUMN id SET DEFAULT nextval('public.promotion_events_id_seq'::regclass);


--
-- Name: stock_management id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_management ALTER COLUMN id SET DEFAULT nextval('public.stock_management_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, parent_id, name, slug, is_active, level) FROM stdin;
1	\N	Electronics	electronics	f	1
2	\N	Furniture	furniture	f	1
3	\N	Clothing	clothing	t	1
4	\N	Books	books	t	1
5	1	Smartphones	smartphones	t	2
6	1	Laptops	laptops	t	2
7	2	Sofas	sofas	t	2
8	2	Chairs	chairs	t	2
9	3	Men's Clothing	mens-clothing	t	2
10	3	Women's Clothing	womens-clothing	t	2
11	\N	Electronic Bikes	electronics-bikes	f	1
\.


--
-- Data for Name: order_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_products (id, order_id, product_id, quantity) FROM stdin;
1	1	1	2
2	1	2	2
3	2	7	100
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, created_at, updated_at) FROM stdin;
1	1	2025-02-14 00:00:00	2025-02-14 00:00:00
2	2	2025-02-14 00:00:00	2025-02-14 00:00:00
3	3	2025-02-14 00:00:00	2025-02-14 00:00:00
\.


--
-- Data for Name: product_promotion_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_promotion_events (id, product_id, promotion_event_id) FROM stdin;
1	1	1
2	2	1
3	4	1
4	5	2
5	6	2
6	7	2
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, category_id, name, slug, description, is_digital, is_active, created_at, updated_at, price) FROM stdin;
1	1	iPhone 13	iphone-13	Latest iPhone with amazing features	f	t	2025-02-14 00:00:01	2025-02-14 00:00:00	999.99
2	1	MacBook Pro 16-inch	macbook-pro-16-inch	High-performance laptop with powerful specs	f	t	2025-02-14 00:00:02	2025-02-14 00:00:00	2899.99
3	1	Samsung Galaxy S21	samsung-galaxy-s21	Samsung's flagship phone with cutting-edge technology	f	t	2025-02-14 00:00:03	2025-02-14 00:00:00	799.99
4	2	Leather Sofa	leather-sofa	Comfortable leather sofa for your living room	f	t	2025-02-14 00:00:04	2025-02-14 00:00:00	1299.99
5	2	Wooden Dining Table	wooden-dining-table	Stylish wooden dining table for a modern home	f	t	2025-02-14 00:00:05	2025-02-14 00:00:00	499.99
6	3	Men's T-Shirt	mens-t-shirt	Comfortable cotton t-shirt for everyday wear	f	t	2025-02-14 00:00:06	2025-02-14 00:00:00	19.99
7	3	Women's Blouse	womens-blouse	Stylish blouse for casual or formal wear	f	t	2025-02-14 00:00:07	2025-02-14 00:00:00	29.99
8	3	Men's Jacket	mens-jacket	Warm and stylish jacket for colder weather	f	t	2025-02-14 00:00:08	2025-02-14 00:00:00	99.99
9	4	Mystery Novel	mystery-novel	A thrilling mystery novel that will keep you guessing	f	t	2025-02-14 00:00:09	2025-02-14 00:00:00	14.99
10	4	Science Fiction Book	science-fiction-book	A captivating science fiction novel that explores the future	f	t	2025-02-14 00:00:10	2025-02-14 00:00:00	19.99
11	4	Science Fiction Book-2	science-fiction-book-2	A captivating science fiction novel that explores the future	f	t	2025-02-14 00:00:10	2025-02-14 00:00:00	19.99
12	\N	Science Fiction Book-3	science-fiction-book-3	A captivating science fiction novel that explores the future	f	t	2025-02-14 00:00:10	2025-02-14 00:00:00	19.99
\.


--
-- Data for Name: promotion_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promotion_events (id, name, start_date, end_date, price_reduction) FROM stdin;
1	Winter Sale	2025-02-01 00:00:00	2025-02-28 00:00:00	10
2	Spring Clearance	2025-03-01 00:00:00	2025-03-31 00:00:00	20
\.


--
-- Data for Name: stock_management; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stock_management (id, product_id, quantity, last_checked_at) FROM stdin;
1	1	50	2025-02-14 00:00:00+00
2	2	30	2025-02-14 00:00:00+00
3	3	70	2025-02-14 00:00:00+00
4	4	10	2025-02-14 00:00:00+00
5	5	20	2025-02-14 00:00:00+00
6	6	100	2025-02-14 00:00:00+00
7	7	80	2025-02-14 00:00:00+00
8	8	50	2025-02-14 00:00:00+00
9	9	200	2025-02-14 00:00:00+00
10	10	150	2025-02-14 00:00:00+00
11	\N	150	2025-02-14 00:00:00+00
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, email, password) FROM stdin;
1	johndoe	johndoe@example.com	$2b$12$DqfnZP0m9zFtDPfVt5yO5M9ruGZGFVQ9kqOVy8sBysWQMb2ji0GSO
2	janedoe	janedoe@example.com	$2b$12$DqfnZP0m9zFtDPfVt5yO5M9ruGZGFVQ9kqOVy8sBysWQMb2ji0GSO
3	marksmith	marksmith@example.com	$2b$12$QbJ3T8vbhwv0tUdF.M5f9sOPwj.T7VAdo8z43lbTKhrm1Y4Hz65kU
4	emilyjohnson	emilyjohnson@example.com	$2b$12$QwTQyYF1c1Hq93Gio2PslwYm8dWpdFNXQmU2zzE19xv9XcBEl73gG
5	davidbrown	davidbrown@example.com	$2b$12$T5UPIcHo94HZgr5jlbFcL9qUoSzVktgMBeuxlfxtIC6Uu52Z4QmXi
\.


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 1, false);


--
-- Name: order_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_products_id_seq', 1, false);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: product_promotion_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_promotion_events_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- Name: promotion_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.promotion_events_id_seq', 1, false);


--
-- Name: stock_management_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stock_management_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: category category_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_name_key UNIQUE (name);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: category category_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_slug_key UNIQUE (slug);


--
-- Name: order_products order_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: product_promotion_events product_promotion_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_promotion_events
    ADD CONSTRAINT product_promotion_events_pkey PRIMARY KEY (id);


--
-- Name: products products_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_name_key UNIQUE (name);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: products products_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_slug_key UNIQUE (slug);


--
-- Name: promotion_events promotion_events_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_events
    ADD CONSTRAINT promotion_events_name_key UNIQUE (name);


--
-- Name: promotion_events promotion_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promotion_events
    ADD CONSTRAINT promotion_events_pkey PRIMARY KEY (id);


--
-- Name: stock_management stock_management_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_management
    ADD CONSTRAINT stock_management_pkey PRIMARY KEY (id);


--
-- Name: stock_management stock_management_product_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_management
    ADD CONSTRAINT stock_management_product_id_key UNIQUE (product_id);


--
-- Name: product_promotion_events unique_product_event; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_promotion_events
    ADD CONSTRAINT unique_product_event UNIQUE (product_id, promotion_event_id);


--
-- Name: order_products unique_product_order; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT unique_product_order UNIQUE (product_id, order_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: category category_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.category(id) ON DELETE RESTRICT;


--
-- Name: order_products order_products_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- Name: order_products order_products_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: product_promotion_events product_promotion_events_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_promotion_events
    ADD CONSTRAINT product_promotion_events_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: product_promotion_events product_promotion_events_promotion_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_promotion_events
    ADD CONSTRAINT product_promotion_events_promotion_event_id_fkey FOREIGN KEY (promotion_event_id) REFERENCES public.promotion_events(id) ON DELETE CASCADE;


--
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(id) ON DELETE CASCADE;


--
-- Name: stock_management stock_management_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stock_management
    ADD CONSTRAINT stock_management_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

