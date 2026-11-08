--
-- PostgreSQL database dump
--

\restrict Wp35EEjhSAVAyBuFjZCfraRj29bfi4Q3gjeHqdGbMwekyNpH7vPK1DAcGSsJTDe

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.1 (Homebrew)

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
-- Name: order_pick_up_points; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_pick_up_points (
    point_id integer NOT NULL,
    "Адрес" character varying(255) NOT NULL
);


ALTER TABLE public.order_pick_up_points OWNER TO postgres;

--
-- Name: order_pick_up_points_point_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_pick_up_points_point_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_pick_up_points_point_id_seq OWNER TO postgres;

--
-- Name: order_pick_up_points_point_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_pick_up_points_point_id_seq OWNED BY public.order_pick_up_points.point_id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    "Номер заказа" integer NOT NULL,
    "Дата заказа" date NOT NULL,
    "Дата доставки" date NOT NULL,
    "Адрес пункта выдачи" integer,
    "ФИО авторизированного клиента" character varying(255) DEFAULT ''::character varying CONSTRAINT "orders_ФИО авторизированного кл_not_null" NOT NULL,
    "Код для получения" integer,
    "Статус заказа" character varying(15) NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_articles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_articles (
    "Номер заказа" integer,
    tovar_id integer,
    "Количество" integer NOT NULL
);


ALTER TABLE public.orders_articles OWNER TO postgres;

--
-- Name: orders_Номер заказа_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."orders_Номер заказа_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."orders_Номер заказа_seq" OWNER TO postgres;

--
-- Name: orders_Номер заказа_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."orders_Номер заказа_seq" OWNED BY public.orders."Номер заказа";


--
-- Name: tovar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tovar (
    "Артикул" character varying(6),
    "Наименование товара" character varying(255) CONSTRAINT "Tovar_Наименование товара_not_null" NOT NULL,
    "Единица измерения" character varying(7) DEFAULT 'шт'::character varying CONSTRAINT "Tovar_Единица измерения_not_null" NOT NULL,
    "Цена" numeric CONSTRAINT "Tovar_Цена_not_null" NOT NULL,
    "Поставщик" character varying(255) CONSTRAINT "Tovar_Поставщик_not_null" NOT NULL,
    "Производитель" character varying(255) CONSTRAINT "Tovar_Производитель_not_null" NOT NULL,
    "Категория товара" character varying(255),
    "Действующая скидка" integer CONSTRAINT "Tovar_Действующая скидка_not_null" NOT NULL,
    "Кол-во на складе" integer CONSTRAINT "Tovar_Кол-во на складе_not_null" NOT NULL,
    "Описание товара" text CONSTRAINT "Tovar_Описание товара_not_null" NOT NULL,
    "Фото" character varying(255),
    tovar_id integer NOT NULL,
    CONSTRAINT "Tovar_Действующая скидка_check" CHECK ((("Действующая скидка" > 0) AND ("Действующая скидка" <= 100))),
    CONSTRAINT "Tovar_Цена_check" CHECK ((("Цена")::double precision >= (0)::double precision))
);


ALTER TABLE public.tovar OWNER TO postgres;

--
-- Name: tovar_tovar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tovar_tovar_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tovar_tovar_id_seq OWNER TO postgres;

--
-- Name: tovar_tovar_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tovar_tovar_id_seq OWNED BY public.tovar.tovar_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    "Роль сотрудника" character varying(30) NOT NULL,
    "ФИО" character varying(255) NOT NULL,
    "Логин" character varying(255) NOT NULL,
    "Пароль" character varying(15) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: order_pick_up_points point_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_pick_up_points ALTER COLUMN point_id SET DEFAULT nextval('public.order_pick_up_points_point_id_seq'::regclass);


--
-- Name: orders Номер заказа; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN "Номер заказа" SET DEFAULT nextval('public."orders_Номер заказа_seq"'::regclass);


--
-- Name: tovar tovar_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tovar ALTER COLUMN tovar_id SET DEFAULT nextval('public.tovar_tovar_id_seq'::regclass);


--
-- Data for Name: order_pick_up_points; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_pick_up_points (point_id, "Адрес") FROM stdin;
1	﻿420151, г. Лесной, ул. Вишневая, 32
2	125061, г. Лесной, ул. Подгорная, 8
3	630370, г. Лесной, ул. Шоссейная, 24
4	400562, г. Лесной, ул. Зеленая, 32
5	614510, г. Лесной, ул. Маяковского, 47
6	410542, г. Лесной, ул. Светлая, 46
7	620839, г. Лесной, ул. Цветочная, 8
8	443890, г. Лесной, ул. Коммунистическая, 1
9	603379, г. Лесной, ул. Спортивная, 46
10	603721, г. Лесной, ул. Гоголя, 41
11	410172, г. Лесной, ул. Северная, 13
12	614611, г. Лесной, ул. Молодежная, 50
13	454311, г.Лесной, ул. Новая, 19
14	660007, г.Лесной, ул. Октябрьская, 19
15	603036, г. Лесной, ул. Садовая, 4
16	394060, г.Лесной, ул. Фрунзе, 43
17	410661, г. Лесной, ул. Школьная, 50
18	625590, г. Лесной, ул. Коммунистическая, 20
20	450983, г.Лесной, ул. Комсомольская, 26
21	394782, г. Лесной, ул. Чехова, 3
22	603002, г. Лесной, ул. Дзержинского, 28
23	450558, г. Лесной, ул. Набережная, 30
24	344288, г. Лесной, ул. Чехова, 1
25	614164, г.Лесной,  ул. Степная, 30
26	394242, г. Лесной, ул. Коммунистическая, 43
27	660540, г. Лесной, ул. Солнечная, 25
28	125837, г. Лесной, ул. Шоссейная, 40
29	125703, г. Лесной, ул. Партизанская, 49
30	625283, г. Лесной, ул. Победы, 46
31	614753, г. Лесной, ул. Полевая, 35
32	426030, г. Лесной, ул. Маяковского, 44
33	450375, г. Лесной ул. Клубная, 44
34	625560, г. Лесной, ул. Некрасова, 12
35	630201, г. Лесной, ул. Комсомольская, 17
36	190949, г. Лесной, ул. Мичурина, 26
19	625683, г. Лесной, ул. 8 Марта, 8
44	450375, г. Лесной, ул. Клубная, 60
45	111670, г. Селяново, ул. Пушкина, 10
61	111893, г. Пушкино, ул. Пушкинская, 83
62	625683, г. Лесной, ул. 8 Марта, 9
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders ("Номер заказа", "Дата заказа", "Дата доставки", "Адрес пункта выдачи", "ФИО авторизированного клиента", "Код для получения", "Статус заказа") FROM stdin;
2	2022-09-28	2025-04-21	11	Никифорова Весения Николаевна	902	Завершен
3	2025-03-21	2025-04-22	2	Сазонов Руслан Германович	903	Завершен
4	2025-02-20	2025-04-23	11	Одинцов Серафим Артёмович	904	Завершен
5	2025-03-17	2025-04-24	2	Степанов Михаил Артёмович	905	Завершен
6	2025-03-01	2025-04-25	15	Никифорова Весения Николаевна	906	Завершен
7	2025-02-28	2025-04-26	3	Сазонов Руслан Германович	907	Завершен
8	2025-03-31	2025-04-27	19	Одинцов Серафим Артёмович	908	Новый 
9	2025-04-02	2025-04-28	5	Степанов Михаил Артёмович	909	Новый 
56	2025-01-01	2025-01-01	61		\N	Новый
57	2025-01-01	2025-01-01	61		\N	Новый
58	2025-01-01	2025-01-01	61		\N	Новый
10	2025-04-03	2025-04-29	62	Степанов Михаил Артёмович	910	Новый 
1	2024-03-27	2025-04-20	1	Степанов Михаил Артёмович	901	Завершен
\.


--
-- Data for Name: orders_articles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_articles ("Номер заказа", tovar_id, "Количество") FROM stdin;
1	21	2
1	22	2
2	23	1
2	24	1
3	25	10
3	26	10
4	27	5
4	28	4
5	21	2
5	22	2
6	23	1
6	24	1
7	25	10
7	26	10
8	27	5
8	28	4
9	29	5
9	30	1
10	1	5
10	2	5
58	1	2
58	2	5
\.


--
-- Data for Name: tovar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tovar ("Артикул", "Наименование товара", "Единица измерения", "Цена", "Поставщик", "Производитель", "Категория товара", "Действующая скидка", "Кол-во на складе", "Описание товара", "Фото", tovar_id) FROM stdin;
K345R4	Полуботинки	шт.	2100	Обувь для вас	CROSBY	Мужская обувь	2	3	407700/01-02 Полуботинки мужские CROSBY	\N	4
O754F4	Туфли	шт.	5400	Обувь для вас	Rieker	Женская обувь	4	18	Туфли женские демисезонные Rieker артикул 55073-68/37	\N	5
G531F4	Ботинки	шт.	6600	Kari	Kari	Женская обувь	12	9	Ботинки женские зимние ROMER арт. 893167-01 Черный	\N	6
J542F5	Тапочки	шт.	500	Kari	Kari	Мужская обувь	13	0	Тапочки мужские Арт.70701-55-67син р.41	\N	7
B431R5	Ботинки	шт.	2700	Обувь для вас	Rieker	Мужская обувь	2	5	Мужские кожаные ботинки/мужские ботинки	\N	8
P764G4	Туфли	шт.	6800	Kari	CROSBY	Женская обувь	15	15	Туфли женские, ARGO, размер 38	\N	9
F427R5	Ботинки	шт.	11800	Обувь для вас	Rieker	Женская обувь	15	11	Ботинки на молнии с декоративной пряжкой FRAU	\N	11
N457T5	Полуботинки	шт.	4600	Kari	CROSBY	Женская обувь	3	13	Полуботинки Ботинки черные зимние, мех	\N	12
D364R4	Туфли	шт.	12400	Kari	Kari	Женская обувь	16	5	Туфли Luiza Belly женские Kate-lazo черные из натуральной замши	\N	13
S326R5	Тапочки	шт.	9900	Обувь для вас	CROSBY	Мужская обувь	17	15	Мужские кожаные тапочки Профиль С.Дали 	\N	14
L754R4	Полуботинки	шт.	1700	Kari	Kari	Женская обувь	2	7	Полуботинки kari женские WB2020SS-26, размер 38, цвет: черный	\N	15
M542T5	Кроссовки	шт.	2800	Обувь для вас	Rieker	Мужская обувь	18	3	Кроссовки мужские TOFA	\N	16
D268G5	Туфли	шт.	4399	Обувь для вас	Rieker	Женская обувь	3	12	Туфли Rieker женские демисезонные, размер 36, цвет коричневый	\N	17
T324F5	Сапоги	шт.	4699	Kari	CROSBY	Женская обувь	2	5	Сапоги замша Цвет: синий	\N	18
K358H6	Тапочки	шт.	599	Kari	Rieker	Мужская обувь	20	2	Тапочки мужские син р.41	\N	19
H535R5	Ботинки	шт.	2300	Обувь для вас	Rieker	Женская обувь	2	7	Женские Ботинки демисезонные	\N	20
А112Т4	Ботинки	шт.	4990	Kari	Kari	Женская обувь	3	6	Женские Ботинки демисезонные kari	1.jpg	21
F635R4	Ботинки	шт.	3244	Обувь для вас	Marco Tozzi	Женская обувь	2	13	Ботинки Marco Tozzi женские демисезонные, размер 39, цвет бежевый	2.jpg	22
H782T5	Туфли	шт.	4499	Kari	Kari	Мужская обувь	4	5	Туфли kari мужские классика MYZ21AW-450A, размер 43, цвет: черный	3.jpg	23
G783F5	Ботинки	шт.	5900	Kari	Рос	Мужская обувь	2	8	Мужские ботинки Рос-Обувь кожаные с натуральным мехом	4.jpg	24
J384T6	Ботинки	шт.	3800	Обувь для вас	Rieker	Мужская обувь	2	16	B3430/14 Полуботинки мужские Rieker	5.jpg	25
D572U8	Кроссовки	шт.	4100	Обувь для вас	Рос	Мужская обувь	3	6	129615-4 Кроссовки мужские	6.jpg	26
F572H7	Туфли	шт.	2700	Kari	Marco Tozzi	Женская обувь	2	14	Туфли Marco Tozzi женские летние, размер 39, цвет черный	7.jpg	27
B320R5	Туфли	шт.	4300	Kari	Rieker	Женская обувь	2	6	Туфли Rieker женские демисезонные, размер 41, цвет коричневый	9.jpg	29
S213E3	Полуботинки	шт.	2156.0	Обувь для вас	Marco Tozzi	Мужская обувь	3	6	407700/01-01 Полуботинки мужские CROSBY	\N	1
E482R4	Полуботинки	шт.	1800.0	Kari	Alessio Nesca	Женская обувь	2	14	Полуботинки kari женские MYZ20S-149, размер 41, цвет: черный	\N	2
D329H3	Полуботинки	шт.	1890.0	Обувь для вас	Alessio Nesca	Женская обувь	4	0	Полуботинки Alessio Nesca женские 3-30797-47, размер 37, цвет: бордовый	8.jpg	28
C436G5	Ботинки	шт.	10200.0	Kari	Alessio Nesca	Женская обувь	15	9	Ботинки женские, ARGO, размер 40	\N	10
G432E4	Туфли	шт.	2800	Kari	Kari	Женская обувь	3	15	Туфли kari женские TR-YR-413017, размер 37, цвет: черный	10.jpg	30
\N	Туфли Mary Janes	пара.	1647.0	Heels From China	Kari	Женская обувь	12	16	Идеальные туфельки для прогулок в парке и свиданий за мороженым. Нежный розовый цвет и изящный ремешок добавят лукавого шарма любому наряду.	pink_mary_janes.jpg	33
\N	Mary Janes	пара.	1674.0	Китай	Alessio Nesca	Женская обувь	10	13	Идеальные туфельки для прогулок в парке и свиданий за мороженым. Нежный розовый цвет и изящный ремешок добавят лукавого шарма любому наряду.	pink_mary_janes.jpg	34
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users ("Роль сотрудника", "ФИО", "Логин", "Пароль") FROM stdin;
Администратор	Никифорова Весения Николаевна	94d5ous@gmail.com	uzWC67
Администратор	Сазонов Руслан Германович	uth4iz@mail.com	2L6KZG
Администратор	Одинцов Серафим Артёмович	yzls62@outlook.com	JlFRCZ
Менеджер	Степанов Михаил Артёмович	1diph5e@tutanota.com	8ntwUp
Менеджер	Ворсин Петр Евгеньевич	tjde7c@yahoo.com	YOyhfR
Менеджер	Старикова Елена Павловна	wpmrc3do@tutanota.com	RSbvHv
Авторизированный клиент	Михайлюк Анна Вячеславовна	5d4zbu@tutanota.com	rwVDh9
Авторизированный клиент	Ситдикова Елена Анатольевна	ptec8ym@yahoo.com	LdNyos
Авторизированный клиент	Ворсин Петр Евгеньевич	1qz4kw@mail.com	gynQMT
Авторизированный клиент	Старикова Елена Павловна	4np6se@mail.com	AtnDjr
\.


--
-- Name: order_pick_up_points_point_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_pick_up_points_point_id_seq', 62, true);


--
-- Name: orders_Номер заказа_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."orders_Номер заказа_seq"', 58, true);


--
-- Name: tovar_tovar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tovar_tovar_id_seq', 34, true);


--
-- Name: order_pick_up_points order_pick_up_points_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_pick_up_points
    ADD CONSTRAINT order_pick_up_points_pkey PRIMARY KEY (point_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY ("Номер заказа");


--
-- Name: tovar tovar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tovar
    ADD CONSTRAINT tovar_pkey PRIMARY KEY (tovar_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY ("Логин");


--
-- Name: orders_articles orders_articles_tovar_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_articles
    ADD CONSTRAINT orders_articles_tovar_id_fkey FOREIGN KEY (tovar_id) REFERENCES public.tovar(tovar_id);


--
-- Name: orders_articles orders_articles_Номер заказа_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_articles
    ADD CONSTRAINT "orders_articles_Номер заказа_fkey" FOREIGN KEY ("Номер заказа") REFERENCES public.orders("Номер заказа");


--
-- Name: orders orders_Адрес пункта выдачи_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "orders_Адрес пункта выдачи_fkey" FOREIGN KEY ("Адрес пункта выдачи") REFERENCES public.order_pick_up_points(point_id);


--
-- PostgreSQL database dump complete
--

\unrestrict Wp35EEjhSAVAyBuFjZCfraRj29bfi4Q3gjeHqdGbMwekyNpH7vPK1DAcGSsJTDe

