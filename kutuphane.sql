--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.1

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
-- Name: cevirmenler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cevirmenler (
    cevirmen_id integer NOT NULL,
    cevirmen_ad character varying(50)
);



--
-- Name: cevirmenler_cevirmen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.cevirmenler ALTER COLUMN cevirmen_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.cevirmenler_cevirmen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: ilceler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ilceler (
    ilce_id integer NOT NULL,
    ilce_ad character varying(50) NOT NULL,
    il_id integer NOT NULL
);


ALTER TABLE public.ilceler OWNER TO postgres;

--
-- Name: ilceler_ilce_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.ilceler ALTER COLUMN ilce_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.ilceler_ilce_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: iller; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.iller (
    il_id integer NOT NULL,
    il_ad character varying(50) NOT NULL
);


ALTER TABLE public.iller OWNER TO postgres;

--
-- Name: iller_il_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.iller ALTER COLUMN il_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.iller_il_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: kategoriler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kategoriler (
    kategori_id integer NOT NULL,
    kategori_ad character varying(50) NOT NULL
);


ALTER TABLE public.kategoriler OWNER TO postgres;

--
-- Name: kategoriler_kategori_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.kategoriler ALTER COLUMN kategori_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.kategoriler_kategori_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: kisiler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kisiler (
    kisi_id integer NOT NULL,
    kisi_ad character varying(40) NOT NULL,
    telefon bigint NOT NULL
);


ALTER TABLE public.kisiler OWNER TO postgres;

--
-- Name: kisiler_kisi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kisiler_kisi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kisiler_kisi_id_seq OWNER TO postgres;

--
-- Name: kisiler_kisi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kisiler_kisi_id_seq OWNED BY public.kisiler.kisi_id;


--
-- Name: kitap_kategori; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kitap_kategori (
    kitap_id integer NOT NULL,
    kategori_id integer NOT NULL
);


ALTER TABLE public.kitap_kategori OWNER TO postgres;

--
-- Name: kitap_yazar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kitap_yazar (
    kitap_id integer NOT NULL,
    yazar_id integer NOT NULL
);


ALTER TABLE public.kitap_yazar OWNER TO postgres;

--
-- Name: kitaplar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kitaplar (
    kitap_id integer NOT NULL,
    kitap_ad character varying(50),
    sayfa_sayisi integer,
    adet integer,
    basim_yili integer,
    yayinevi_id integer NOT NULL,
    cevirmen_id integer NOT NULL
);


ALTER TABLE public.kitaplar OWNER TO postgres;

--
-- Name: kitaplar_kitap_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.kitaplar ALTER COLUMN kitap_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.kitaplar_kitap_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: kitaplar_kutuphane; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kitaplar_kutuphane (
    kitap_id integer NOT NULL,
    kutuphane_id integer NOT NULL,
    adet integer
);


ALTER TABLE public.kitaplar_kutuphane OWNER TO postgres;

--
-- Name: kutuphane; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kutuphane (
    kutuphane_id integer NOT NULL,
    kutuphane_ad character varying(50),
    ilce_id integer NOT NULL
);


ALTER TABLE public.kutuphane OWNER TO postgres;

--
-- Name: kutuphane_kutuphane_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.kutuphane ALTER COLUMN kutuphane_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.kutuphane_kutuphane_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: odunc_islem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.odunc_islem (
    islem_id integer NOT NULL,
    uye_id integer NOT NULL,
    kitap_id integer NOT NULL,
    alinan_tarih date,
    personel_id integer NOT NULL
);


ALTER TABLE public.odunc_islem OWNER TO postgres;

--
-- Name: odunc_islem_islem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.odunc_islem ALTER COLUMN islem_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.odunc_islem_islem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: personeller; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personeller (
    kisi_id integer NOT NULL,
    kullanici_adi character varying(50) NOT NULL,
    sifre character varying(50) NOT NULL
);


ALTER TABLE public.personeller OWNER TO postgres;

--
-- Name: uyeler; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.uyeler (
    kisi_id integer NOT NULL,
    ilce_id integer,
    tc bigint
);


ALTER TABLE public.uyeler OWNER TO postgres;

--
-- Name: yayinevleri; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yayinevleri (
    yayinevi_id integer NOT NULL,
    yayinevi_ad character varying(50),
    ilce_id integer
);


ALTER TABLE public.yayinevleri OWNER TO postgres;

--
-- Name: yayinevleri_yayinevi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.yayinevleri ALTER COLUMN yayinevi_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.yayinevleri_yayinevi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: yazarlar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.yazarlar (
    yazar_id integer NOT NULL,
    yazar_ad character varying(50)
);


ALTER TABLE public.yazarlar OWNER TO postgres;

--
-- Name: yazarlar_yazar_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.yazarlar ALTER COLUMN yazar_id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.yazarlar_yazar_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: kisiler kisi_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kisiler ALTER COLUMN kisi_id SET DEFAULT nextval('public.kisiler_kisi_id_seq'::regclass);


--
-- Data for Name: cevirmenler; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cevirmenler VALUES
	(1, 'Mina Ak'),
	(2, 'Tahsin Uygun'),
	(4, 'Ali Koç'),
	(5, 'Zehra Dinç'),
	(6, 'Mehmet Ay'),
	(7, 'Zeynep Kara');


--
-- Data for Name: ilceler; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.ilceler VALUES
	(1, 'Kadikoy', 1),
	(2, 'Besiktas', 1),
	(3, 'Bakirkoy', 1),
	(4, 'Pendik', 1),
	(5, 'Çankaya', 2);


--
-- Data for Name: iller; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.iller VALUES
	(1, 'Istanbul'),
	(2, 'Ankara'),
	(3, 'Izmir'),
	(4, 'Kocaeli');


--
-- Data for Name: kategoriler; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.kategoriler VALUES
	(1, 'Bilim Kurgu'),
	(2, 'Edebiyat'),
	(3, 'Gerilim'),
	(4, 'Psikoloji'),
	(5, 'Şiir');


--
-- Data for Name: kisiler; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.kisiler VALUES
	(3, 'Yasemin Ak', 5389654788),
	(4, 'Suheyla Tuncer', 5369885412),
	(5, 'Sinem Öz', 5389652214),
	(6, 'Ahmet Öztürk', 5368554412),
	(7, 'Ali Kilim', 5478526911),
	(8, 'Yaren Ulusoy', 5551452236),
	(10, 'Zehra Bol', 5053698557);


--
-- Data for Name: kitap_kategori; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.kitap_kategori VALUES
	(23, 4),
	(24, 4),
	(25, 2),
	(39, 2),
	(40, 4),
	(41, 3),
	(43, 2),
	(44, 3),
	(52, 3),
	(21, 3);


--
-- Data for Name: kitap_yazar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.kitap_yazar VALUES
	(2, 1),
	(3, 1),
	(5, 2),
	(6, 8),
	(7, 3),
	(20, 3),
	(23, 4),
	(24, 6),
	(25, 6),
	(27, 8),
	(28, 9),
	(37, 7),
	(39, 1),
	(40, 5),
	(43, 5),
	(44, 2),
	(41, 5),
	(52, 4),
	(21, 4);


--
-- Data for Name: kitaplar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.kitaplar VALUES
	(2, 'Suc ve Ceza', 500, 10, 1890, 2, 1),
	(3, 'Sefiller', 300, 4, 1888, 1, 2),
	(5, 'Martin Eden', 300, 3, 1900, 4, 2),
	(6, 'Kırmızı Saçlı Kadın', 500, 2, 2000, 3, 2),
	(7, 'Hayvan Çiftliği', 200, 2, 1999, 4, 2),
	(23, 'Korku', 200, 2, 2001, 5, 2),
	(24, 'Huzursuzluk', 200, 2, 2000, 3, 4),
	(52, 'Satranç', 200, 2, 2007, 5, 7),
	(21, 'Mürebbiye', 100, 6, 2005, 2, 5),
	(20, '1984', 11, 1, 2009, 3, 1),
	(25, 'Mutluluk', 33, 2, 2000, 4, 2),
	(27, 'Kar', 11, 2, 1995, 3, 2),
	(28, 'Eylül', 22, 3, 1990, 2, 4),
	(37, 'Vadideki Zambak', 22, 1, 1895, 2, 2),
	(39, 'Yeraltından Notlar', 3, 3, 1980, 4, 4),
	(40, 'Yabancı', 33, 1, 1975, 3, 2),
	(41, 'Veba', 22, 2, 1996, 3, 4),
	(43, 'Mutlu Ölüm', 2, 2, 2001, 1, 2),
	(44, 'Beyaz Diş', 222, 3, 1997, 3, 1);


--
-- Data for Name: kitaplar_kutuphane; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: kutuphane; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.kutuphane VALUES
	(1, 'Merkez Kütüphanesi', 1);


--
-- Data for Name: odunc_islem; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.odunc_islem VALUES
	(1, 3, 5, '2021-08-11', 3),
	(2, 4, 2, '2021-08-05', 3),
	(3, 5, 2, '2021-08-19', 3),
	(5, 6, 23, '2021-08-19', 40),
	(6, 7, 5, '2021-08-19', 40),
	(7, 7, 7, '2021-08-19', 3),
	(8, 5, 5, '2021-08-20', 40),
	(9, 3, 2, '2021-08-21', 3);


--
-- Data for Name: personeller; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.personeller VALUES
	(8, 'Yaren', '123'),
	(10, 'Zehra', '123');


--
-- Data for Name: uyeler; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.uyeler VALUES
	(3, 1, 36558884752),
	(4, 2, 35968884521),
	(5, 3, 41556663258),
	(6, 4, 417788889652),
	(7, 5, 14558887458);


--
-- Data for Name: yayinevleri; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.yayinevleri VALUES
	(1, 'Beta', 1),
	(2, 'Alfa', 1),
	(3, 'Dogan', 2),
	(4, 'Dost', 2),
	(5, 'Destek', 3),
	(6, 'Irmak', 3);


--
-- Data for Name: yazarlar; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.yazarlar VALUES
	(1, 'Dostoyevski'),
	(3, 'George Orwell'),
	(4, 'Stefan Zweig'),
	(2, 'Jack London'),
	(5, 'Albert Camus'),
	(6, 'Zülfü Livaneli'),
	(7, 'Balzac'),
	(8, 'Orhan Pamuk'),
	(9, 'Mehmet Rauf');


--
-- Name: cevirmenler_cevirmen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cevirmenler_cevirmen_id_seq', 7, true);


--
-- Name: ilceler_ilce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ilceler_ilce_id_seq', 5, true);


--
-- Name: iller_il_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.iller_il_id_seq', 4, true);


--
-- Name: kategoriler_kategori_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kategoriler_kategori_id_seq', 5, true);


--
-- Name: kisiler_kisi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kisiler_kisi_id_seq', 41, true);


--
-- Name: kitaplar_kitap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kitaplar_kitap_id_seq', 53, true);


--
-- Name: kutuphane_kutuphane_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kutuphane_kutuphane_id_seq', 1, true);


--
-- Name: odunc_islem_islem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.odunc_islem_islem_id_seq', 9, true);


--
-- Name: yayinevleri_yayinevi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.yayinevleri_yayinevi_id_seq', 6, true);


--
-- Name: yazarlar_yazar_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.yazarlar_yazar_id_seq', 9, true);


--
-- Name: cevirmenler cevirmenler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cevirmenler
    ADD CONSTRAINT cevirmenler_pkey PRIMARY KEY (cevirmen_id);


--
-- Name: ilceler ilceler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilceler
    ADD CONSTRAINT ilceler_pkey PRIMARY KEY (ilce_id);


--
-- Name: iller iller_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.iller
    ADD CONSTRAINT iller_pkey PRIMARY KEY (il_id);


--
-- Name: kategoriler kategoriler_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kategoriler
    ADD CONSTRAINT kategoriler_pkey PRIMARY KEY (kategori_id);


--
-- Name: kisiler kisi_id_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kisiler
    ADD CONSTRAINT "kisi_id_PK" PRIMARY KEY (kisi_id);


--
-- Name: kitap_kategori kitap_kategori_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitap_kategori
    ADD CONSTRAINT kitap_kategori_pkey PRIMARY KEY (kitap_id, kategori_id);


--
-- Name: kitap_yazar kitap_yazar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitap_yazar
    ADD CONSTRAINT kitap_yazar_pkey PRIMARY KEY (kitap_id, yazar_id);


--
-- Name: kitaplar_kutuphane kitaplar_kutuphane_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitaplar_kutuphane
    ADD CONSTRAINT kitaplar_kutuphane_pkey PRIMARY KEY (kitap_id, kutuphane_id);


--
-- Name: kitaplar kitaplar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitaplar
    ADD CONSTRAINT kitaplar_pkey PRIMARY KEY (kitap_id);


--
-- Name: kutuphane kutuphane_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kutuphane
    ADD CONSTRAINT kutuphane_pkey PRIMARY KEY (kutuphane_id);


--
-- Name: odunc_islem odunc_islem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.odunc_islem
    ADD CONSTRAINT odunc_islem_pkey PRIMARY KEY (islem_id);


--
-- Name: personeller personelPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personeller
    ADD CONSTRAINT "personelPK" PRIMARY KEY (kisi_id);


--
-- Name: uyeler uyelerPK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uyeler
    ADD CONSTRAINT "uyelerPK" PRIMARY KEY (kisi_id);


--
-- Name: yayinevleri yayinevleri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yayinevleri
    ADD CONSTRAINT yayinevleri_pkey PRIMARY KEY (yayinevi_id);


--
-- Name: yazarlar yazarlar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yazarlar
    ADD CONSTRAINT yazarlar_pkey PRIMARY KEY (yazar_id);


--
-- Name: fki_cevirmen_id_foreign; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_cevirmen_id_foreign ON public.kitaplar USING btree (cevirmen_id);


--
-- Name: fki_il_id_foreign; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_il_id_foreign ON public.ilceler USING btree (il_id);


--
-- Name: fki_katgeori_id_foreign; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_katgeori_id_foreign ON public.kitap_kategori USING btree (kategori_id);


--
-- Name: fki_kitap_id_foreign; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_kitap_id_foreign ON public.kitap_kategori USING btree (kitap_id);


--
-- Name: fki_kutuphane_id_foreign; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_kutuphane_id_foreign ON public.kitaplar_kutuphane USING btree (kutuphane_id);


--
-- Name: fki_personel_id_foreign; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_personel_id_foreign ON public.odunc_islem USING btree (personel_id);


--
-- Name: fki_uye_id_foreign; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_uye_id_foreign ON public.odunc_islem USING btree (uye_id);


--
-- Name: fki_yayinevi_id_foreign; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_yayinevi_id_foreign ON public.kitaplar USING btree (yayinevi_id);


--
-- Name: fki_yazar_id_foreign; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_yazar_id_foreign ON public.kitap_yazar USING btree (yazar_id);


--
-- Name: kitaplar cevirmen_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitaplar
    ADD CONSTRAINT cevirmen_id_foreign FOREIGN KEY (cevirmen_id) REFERENCES public.cevirmenler(cevirmen_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: ilceler il_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ilceler
    ADD CONSTRAINT il_id_foreign FOREIGN KEY (il_id) REFERENCES public.iller(il_id) NOT VALID;


--
-- Name: kutuphane ilce_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kutuphane
    ADD CONSTRAINT ilce_id_foreign FOREIGN KEY (kutuphane_id) REFERENCES public.ilceler(ilce_id) NOT VALID;


--
-- Name: yayinevleri ilce_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.yayinevleri
    ADD CONSTRAINT ilce_id_foreign FOREIGN KEY (ilce_id) REFERENCES public.ilceler(ilce_id) NOT VALID;


--
-- Name: kitap_kategori kategori_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitap_kategori
    ADD CONSTRAINT kategori_id_foreign FOREIGN KEY (kategori_id) REFERENCES public.kategoriler(kategori_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: kitaplar_kutuphane kitap_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitaplar_kutuphane
    ADD CONSTRAINT kitap_id_foreign FOREIGN KEY (kitap_id) REFERENCES public.kitaplar(kitap_id) NOT VALID;


--
-- Name: odunc_islem kitap_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.odunc_islem
    ADD CONSTRAINT kitap_id_foreign FOREIGN KEY (kitap_id) REFERENCES public.kitaplar(kitap_id) NOT VALID;


--
-- Name: kitap_kategori kitap_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitap_kategori
    ADD CONSTRAINT kitap_id_foreign FOREIGN KEY (kitap_id) REFERENCES public.kitaplar(kitap_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: kitap_yazar kitap_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitap_yazar
    ADD CONSTRAINT kitap_id_foreign FOREIGN KEY (kitap_id) REFERENCES public.kitaplar(kitap_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: kitaplar_kutuphane kutuphane_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitaplar_kutuphane
    ADD CONSTRAINT kutuphane_id_foreign FOREIGN KEY (kutuphane_id) REFERENCES public.kutuphane(kutuphane_id) NOT VALID;


--
-- Name: personeller personelkisiler; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personeller
    ADD CONSTRAINT personelkisiler FOREIGN KEY (kisi_id) REFERENCES public.kisiler(kisi_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: uyeler uyekisiler; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uyeler
    ADD CONSTRAINT uyekisiler FOREIGN KEY (kisi_id) REFERENCES public.kisiler(kisi_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: kitaplar yayinevi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitaplar
    ADD CONSTRAINT yayinevi_id_foreign FOREIGN KEY (yayinevi_id) REFERENCES public.yayinevleri(yayinevi_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- Name: kitap_yazar yazar_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kitap_yazar
    ADD CONSTRAINT yazar_id_foreign FOREIGN KEY (yazar_id) REFERENCES public.yazarlar(yazar_id) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- PostgreSQL database dump complete
--

