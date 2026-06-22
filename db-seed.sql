--
-- PostgreSQL database dump
--

\restrict brtl2ooDI23BRS6nUHCe8rGIw0RuM4nVWmcncCjnNWDQ4b5aavwakeYVjzUkYPq

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

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
-- Name: audits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audits (
    id bigint NOT NULL,
    user_type character varying(255),
    user_id bigint,
    event character varying(255) NOT NULL,
    auditable_type character varying(255) NOT NULL,
    auditable_id bigint NOT NULL,
    old_values text,
    new_values text,
    url text,
    ip_address inet,
    user_agent character varying(1023),
    tags character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.audits OWNER TO postgres;

--
-- Name: audits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.audits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.audits_id_seq OWNER TO postgres;

--
-- Name: audits_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.audits_id_seq OWNED BY public.audits.id;


--
-- Name: buku_eksemplars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.buku_eksemplars (
    id bigint NOT NULL,
    buku_id bigint NOT NULL,
    paket_id bigint,
    stok integer DEFAULT 0 NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.buku_eksemplars OWNER TO postgres;

--
-- Name: buku_eksemplars_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.buku_eksemplars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.buku_eksemplars_id_seq OWNER TO postgres;

--
-- Name: buku_eksemplars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.buku_eksemplars_id_seq OWNED BY public.buku_eksemplars.id;


--
-- Name: bukus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bukus (
    id bigint NOT NULL,
    judul character varying(255) NOT NULL,
    pengarang character varying(255) NOT NULL,
    penerbit character varying(255),
    isbn character varying(255),
    tahun_terbit integer,
    tempat_terbit character varying(255),
    resume text,
    cover character varying(255),
    kategori character varying(255),
    deskripsi text,
    is_visible boolean DEFAULT true NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    paket_id bigint
);


ALTER TABLE public.bukus OWNER TO postgres;

--
-- Name: bukus_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bukus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bukus_id_seq OWNER TO postgres;

--
-- Name: bukus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bukus_id_seq OWNED BY public.bukus.id;


--
-- Name: cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration bigint NOT NULL
);


ALTER TABLE public.cache OWNER TO postgres;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration bigint NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO postgres;

--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO postgres;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: kegiatan_paket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kegiatan_paket (
    kegiatan_id bigint NOT NULL,
    paket_id bigint NOT NULL,
    lokasi_asal_id bigint
);


ALTER TABLE public.kegiatan_paket OWNER TO postgres;

--
-- Name: kegiatans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kegiatans (
    id bigint NOT NULL,
    nama_kegiatan character varying(255) NOT NULL,
    deskripsi text,
    tanggal_mulai date NOT NULL,
    tanggal_selesai date,
    jam_pelaksanaan time(0) without time zone,
    jam_selesai time(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    lokasi_dipindah boolean DEFAULT false NOT NULL,
    status_restore boolean DEFAULT false NOT NULL,
    lokasi_id bigint
);


ALTER TABLE public.kegiatans OWNER TO postgres;

--
-- Name: kegiatans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kegiatans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.kegiatans_id_seq OWNER TO postgres;

--
-- Name: kegiatans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kegiatans_id_seq OWNED BY public.kegiatans.id;


--
-- Name: lokasis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lokasis (
    id bigint NOT NULL,
    nama_lokasi character varying(255) NOT NULL,
    alamat text,
    no_telp character varying(20),
    tampil_di_search boolean DEFAULT true NOT NULL,
    aktif boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.lokasis OWNER TO postgres;

--
-- Name: lokasis_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lokasis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lokasis_id_seq OWNER TO postgres;

--
-- Name: lokasis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lokasis_id_seq OWNED BY public.lokasis.id;


--
-- Name: members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.members (
    id bigint NOT NULL,
    nama character varying(255) NOT NULL,
    no_telp character varying(15) NOT NULL,
    alamat text,
    email character varying(255),
    user_id bigint NOT NULL,
    aktif boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.members OWNER TO postgres;

--
-- Name: members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.members_id_seq OWNER TO postgres;

--
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.members_id_seq OWNED BY public.members.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: paket_pemindahans; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paket_pemindahans (
    id bigint NOT NULL,
    paket_id bigint NOT NULL,
    lokasi_asal_id bigint,
    lokasi_tujuan_id bigint NOT NULL,
    user_id bigint,
    catatan text,
    dipindah_pada timestamp(0) without time zone NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.paket_pemindahans OWNER TO postgres;

--
-- Name: paket_pemindahans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.paket_pemindahans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.paket_pemindahans_id_seq OWNER TO postgres;

--
-- Name: paket_pemindahans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.paket_pemindahans_id_seq OWNED BY public.paket_pemindahans.id;


--
-- Name: pakets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pakets (
    id bigint NOT NULL,
    nama character varying(255) NOT NULL,
    is_aktif boolean DEFAULT false NOT NULL,
    lokasi_id bigint,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.pakets OWNER TO postgres;

--
-- Name: pakets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pakets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pakets_id_seq OWNER TO postgres;

--
-- Name: pakets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pakets_id_seq OWNED BY public.pakets.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: transaksis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transaksis (
    id bigint NOT NULL,
    member_id bigint NOT NULL,
    paket_id bigint NOT NULL,
    buku_masuk_id bigint NOT NULL,
    buku_keluar_id bigint NOT NULL,
    user_id bigint NOT NULL,
    catatan_petugas text,
    tanggal_tukar timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    lokasi_snapshot character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.transaksis OWNER TO postgres;

--
-- Name: transaksis_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transaksis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transaksis_id_seq OWNER TO postgres;

--
-- Name: transaksis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transaksis_id_seq OWNED BY public.transaksis.id;


--
-- Name: user_lokasi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_lokasi (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    lokasi_id bigint NOT NULL,
    assigned_by bigint NOT NULL,
    assigned_at timestamp(0) without time zone NOT NULL,
    unassigned_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.user_lokasi OWNER TO postgres;

--
-- Name: user_lokasi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_lokasi_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_lokasi_id_seq OWNER TO postgres;

--
-- Name: user_lokasi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_lokasi_id_seq OWNED BY public.user_lokasi.id;


--
-- Name: user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.user_permissions OWNER TO postgres;

--
-- Name: user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_permissions_id_seq OWNER TO postgres;

--
-- Name: user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_permissions_id_seq OWNED BY public.user_permissions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    nama character varying(255) NOT NULL,
    username character varying(255),
    email character varying(255),
    no_hp character varying(15),
    password character varying(255) NOT NULL,
    role character varying(255) DEFAULT 'admin'::character varying NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT users_role_check CHECK (((role)::text = ANY ((ARRAY['superadmin'::character varying, 'admin'::character varying])::text[])))
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
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
-- Name: audits id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audits ALTER COLUMN id SET DEFAULT nextval('public.audits_id_seq'::regclass);


--
-- Name: buku_eksemplars id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku_eksemplars ALTER COLUMN id SET DEFAULT nextval('public.buku_eksemplars_id_seq'::regclass);


--
-- Name: bukus id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bukus ALTER COLUMN id SET DEFAULT nextval('public.bukus_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: kegiatans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kegiatans ALTER COLUMN id SET DEFAULT nextval('public.kegiatans_id_seq'::regclass);


--
-- Name: lokasis id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lokasis ALTER COLUMN id SET DEFAULT nextval('public.lokasis_id_seq'::regclass);


--
-- Name: members id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members ALTER COLUMN id SET DEFAULT nextval('public.members_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: paket_pemindahans id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paket_pemindahans ALTER COLUMN id SET DEFAULT nextval('public.paket_pemindahans_id_seq'::regclass);


--
-- Name: pakets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pakets ALTER COLUMN id SET DEFAULT nextval('public.pakets_id_seq'::regclass);


--
-- Name: transaksis id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksis ALTER COLUMN id SET DEFAULT nextval('public.transaksis_id_seq'::regclass);


--
-- Name: user_lokasi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_lokasi ALTER COLUMN id SET DEFAULT nextval('public.user_lokasi_id_seq'::regclass);


--
-- Name: user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_permissions ALTER COLUMN id SET DEFAULT nextval('public.user_permissions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: audits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audits (id, user_type, user_id, event, auditable_type, auditable_id, old_values, new_values, url, ip_address, user_agent, tags, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: buku_eksemplars; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.buku_eksemplars (id, buku_id, paket_id, stok, created_at, updated_at) FROM stdin;
1	1	1	3	2026-06-20 00:29:36	2026-06-20 00:29:36
2	2	1	2	2026-06-20 00:29:36	2026-06-20 00:29:36
3	3	2	2	2026-06-20 00:29:36	2026-06-20 00:29:36
4	4	1	5	2026-06-20 00:29:36	2026-06-20 00:29:36
5	5	2	4	2026-06-20 00:29:36	2026-06-20 00:29:36
6	6	1	3	2026-06-20 00:29:36	2026-06-20 00:29:36
7	7	2	2	2026-06-20 00:29:36	2026-06-20 00:29:36
8	8	1	4	2026-06-20 00:29:36	2026-06-20 00:29:36
9	9	2	6	2026-06-20 00:29:36	2026-06-20 00:29:36
10	10	1	3	2026-06-20 00:29:36	2026-06-20 00:29:36
\.


--
-- Data for Name: bukus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bukus (id, judul, pengarang, penerbit, isbn, tahun_terbit, tempat_terbit, resume, cover, kategori, deskripsi, is_visible, user_id, created_at, updated_at, paket_id) FROM stdin;
1	Sapiens: Riwayat Singkat Umat Manusia	Yuval Noah Harari	KPG (Kepustakaan Populer Gramedia)	9786024243432	2017	Jakarta	Buku ini mengisahkan perjalanan panjang umat manusia dari zaman batu hingga era modern.	\N	Geografi & Sejarah	\N	t	1	2026-06-20 00:29:36	2026-06-20 00:29:36	\N
2	Atomic Habits	James Clear	Gramedia Pustaka Utama	9786020638775	2019	Jakarta	Panduan praktis untuk membangun kebiasaan baik dan menghilangkan kebiasaan buruk.	\N	Filsafat & Psikologi	\N	t	1	2026-06-20 00:29:36	2026-06-20 00:29:36	\N
3	Homo Deus: Masa Depan Umat Manusia	Yuval Noah Harari	KPG (Kepustakaan Populer Gramedia)	9786024244484	2018	Jakarta	Eksplorasi tentang masa depan umat manusia di era kecerdasan buatan dan bioteknologi.	\N	Sains & Matematika	\N	t	1	2026-06-20 00:29:36	2026-06-20 00:29:36	\N
4	Laskar Pelangi	Andrea Hirata	Bentang Pustaka	9789791227462	2005	Yogyakarta	Kisah inspiratif tentang sepuluh anak Belitung yang berjuang meraih mimpi di tengah keterbatasan.	\N	Literatur & Sastra	\N	t	2	2026-06-20 00:29:36	2026-06-20 00:29:36	\N
5	Bumi Manusia	Pramoedya Ananta Toer	Lentera Dipantara	9789799731999	2005	Jakarta	Novel sejarah tentang perjuangan Minke di era kolonial Hindia Belanda.	\N	Literatur & Sastra	\N	t	2	2026-06-20 00:29:36	2026-06-20 00:29:36	\N
6	Rich Dad Poor Dad	Robert T. Kiyosaki	Gramedia Pustaka Utama	9786020321448	2015	Jakarta	Pelajaran tentang keuangan dan investasi dari dua sudut pandang ayah yang berbeda.	\N	Ilmu Sosial	\N	t	1	2026-06-20 00:29:36	2026-06-20 00:29:36	\N
7	Sejarah Peradaban Islam	Badri Yatim	Rajawali Pers	9789797690458	2014	Jakarta	Telaah komprehensif tentang sejarah dan perkembangan peradaban Islam dari masa ke masa.	\N	Agama	\N	t	3	2026-06-20 00:29:36	2026-06-20 00:29:36	\N
8	Filosofi Teras	Henry Manampiring	Kompas	9786024125103	2018	Jakarta	Penerapan filsafat Stoa dalam kehidupan modern untuk menghadapi tekanan dan kecemasan.	\N	Filsafat & Psikologi	\N	t	2	2026-06-20 00:29:36	2026-06-20 00:29:36	\N
9	Pengantar Ilmu Komputer	Rinaldi Munir	Informatika	9789798455124	2016	Bandung	Pengenalan konsep dasar ilmu komputer untuk mahasiswa tingkat awal.	\N	Umum/Komputer	\N	t	3	2026-06-20 00:29:36	2026-06-20 00:29:36	\N
10	Negeri 5 Menara	Ahmad Fuadi	Gramedia Pustaka Utama	9789792278965	2009	Jakarta	Kisah enam santri dari pelosok nusantara yang bermimpi meraih cita-cita setinggi langit.	\N	Literatur & Sastra	\N	t	1	2026-06-20 00:29:36	2026-06-20 00:29:36	\N
\.


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: kegiatan_paket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kegiatan_paket (kegiatan_id, paket_id, lokasi_asal_id) FROM stdin;
\.


--
-- Data for Name: kegiatans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kegiatans (id, nama_kegiatan, deskripsi, tanggal_mulai, tanggal_selesai, jam_pelaksanaan, jam_selesai, created_at, updated_at, lokasi_dipindah, status_restore, lokasi_id) FROM stdin;
\.


--
-- Data for Name: lokasis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lokasis (id, nama_lokasi, alamat, no_telp, tampil_di_search, aktif, created_at, updated_at) FROM stdin;
1	Perpustakaan Kotabaru	Jl. Suroto No.9, Kotabaru, Kec. Gondokusuman, Kota Yogyakarta, DIY 55224	(0274) 511314	t	t	2026-06-20 00:29:35	2026-06-20 00:29:35
2	PEVITA	Jl. Mayjend Sutoyo No.32, Mantrijeron, Kota Yogyakarta, DIY 55143	081226839100	t	t	2026-06-20 00:29:35	2026-06-20 00:29:35
3	Bank Buku			f	t	2026-06-20 00:29:35	2026-06-20 00:29:35
\.


--
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.members (id, nama, no_telp, alamat, email, user_id, aktif, created_at, updated_at) FROM stdin;
1	Fajar Nugroho	081234567890	Jl. Malioboro No.12, Gedongtengen, Yogyakarta	fajar@email.com	1	t	2026-06-20 00:29:36	2026-06-20 00:29:36
2	Siti Rahayu	081398765432	Jl. Gejayan No.5, Depok, Sleman	siti@email.com	1	t	2026-06-20 00:29:36	2026-06-20 00:29:36
3	Eko Prasetyo	085711223344	Jl. Monjali No.8, Sleman, Yogyakarta	eko@email.com	2	t	2026-06-20 00:29:36	2026-06-20 00:29:36
4	Dewi Lestari	082155667788	Jl. Bantul No.22, Bantul, Yogyakarta	dewi@email.com	2	t	2026-06-20 00:29:36	2026-06-20 00:29:36
5	Rina Wulandari	081944332211	Jl. Imogiri No.15, Bantul, Yogyakarta	rina@email.com	3	t	2026-06-20 00:29:36	2026-06-20 00:29:36
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000001_create_cache_table	1
2	0001_01_01_000002_create_jobs_table	1
3	2026_05_05_021502_create_users_table	1
4	2026_05_05_021503_create_lokasis_table	1
5	2026_05_05_021504_create_user_lokasi_table	1
6	2026_05_05_021515_create_members_table	1
7	2026_05_05_021525_create_pakets_table	1
8	2026_05_05_021526_create_bukus_table	1
9	2026_05_05_021634_create_transaksis_table	1
10	2026_05_08_061436_create_kegiatans_table	1
11	2026_05_11_062045_create_user_permissions_table	1
12	2026_05_16_034118_create_audits_table	1
13	2026_06_02_053810_add_paket_id_to_bukus_table	1
14	2026_06_04_055334_create_paket_pemindahans_table	1
15	2026_06_18_081408_add_lokasi_and_restore_to_kegiatans_table	1
16	2026_06_18_111055_add_lokasi_id_to_kegiatans_table	1
\.


--
-- Data for Name: paket_pemindahans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paket_pemindahans (id, paket_id, lokasi_asal_id, lokasi_tujuan_id, user_id, catatan, dipindah_pada, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: pakets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pakets (id, nama, is_aktif, lokasi_id, created_at, updated_at) FROM stdin;
1	Paket A	t	1	2026-06-20 00:29:36	2026-06-20 00:29:36
2	Paket B	t	2	2026-06-20 00:29:36	2026-06-20 00:29:36
3	Paket C	t	3	2026-06-20 00:29:36	2026-06-20 00:29:36
4	Paket D	t	3	2026-06-20 00:29:36	2026-06-20 00:29:36
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
0I40HlomcNYK943tteNgpYwC5QSx0KABMZeldTus	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36	eyJfdG9rZW4iOiJsSGNVb0JyZ1dsZTlIWms1TXljUXZBek9nbzlRb1BLRExUaXlINGw4IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwIiwicm91dGUiOm51bGx9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19	1781890769
\.


--
-- Data for Name: transaksis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transaksis (id, member_id, paket_id, buku_masuk_id, buku_keluar_id, user_id, catatan_petugas, tanggal_tukar, lokasi_snapshot, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: user_lokasi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_lokasi (id, user_id, lokasi_id, assigned_by, assigned_at, unassigned_at, created_at, updated_at) FROM stdin;
1	2	1	1	2026-06-20 00:29:36	\N	2026-06-20 00:29:36	2026-06-20 00:29:36
2	3	1	1	2026-06-20 00:29:36	\N	2026-06-20 00:29:36	2026-06-20 00:29:36
3	3	2	1	2026-06-20 00:29:36	\N	2026-06-20 00:29:36	2026-06-20 00:29:36
\.


--
-- Data for Name: user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_permissions (id, user_id, permission, created_at, updated_at) FROM stdin;
1	2	buku.create	2026-06-20 00:29:35	2026-06-20 00:29:35
2	2	buku.edit	2026-06-20 00:29:35	2026-06-20 00:29:35
3	2	buku.delete	2026-06-20 00:29:35	2026-06-20 00:29:35
4	2	member.create	2026-06-20 00:29:35	2026-06-20 00:29:35
5	2	member.edit	2026-06-20 00:29:35	2026-06-20 00:29:35
6	2	member.delete	2026-06-20 00:29:35	2026-06-20 00:29:35
7	2	lokasi.create	2026-06-20 00:29:35	2026-06-20 00:29:35
8	2	lokasi.edit	2026-06-20 00:29:35	2026-06-20 00:29:35
9	2	lokasi.delete	2026-06-20 00:29:35	2026-06-20 00:29:35
10	2	kegiatan.create	2026-06-20 00:29:35	2026-06-20 00:29:35
11	2	kegiatan.edit	2026-06-20 00:29:35	2026-06-20 00:29:35
12	2	kegiatan.delete	2026-06-20 00:29:35	2026-06-20 00:29:35
13	2	transaksi.create	2026-06-20 00:29:35	2026-06-20 00:29:35
14	2	transaksi.edit	2026-06-20 00:29:35	2026-06-20 00:29:35
15	2	transaksi.delete	2026-06-20 00:29:35	2026-06-20 00:29:35
16	3	buku.create	2026-06-20 00:29:35	2026-06-20 00:29:35
17	3	buku.edit	2026-06-20 00:29:35	2026-06-20 00:29:35
18	3	buku.delete	2026-06-20 00:29:35	2026-06-20 00:29:35
19	3	member.create	2026-06-20 00:29:35	2026-06-20 00:29:35
20	3	member.edit	2026-06-20 00:29:35	2026-06-20 00:29:35
21	3	member.delete	2026-06-20 00:29:35	2026-06-20 00:29:35
22	3	lokasi.create	2026-06-20 00:29:35	2026-06-20 00:29:35
23	3	lokasi.edit	2026-06-20 00:29:35	2026-06-20 00:29:35
24	3	lokasi.delete	2026-06-20 00:29:35	2026-06-20 00:29:35
25	3	kegiatan.create	2026-06-20 00:29:35	2026-06-20 00:29:35
26	3	kegiatan.edit	2026-06-20 00:29:35	2026-06-20 00:29:35
27	3	kegiatan.delete	2026-06-20 00:29:35	2026-06-20 00:29:35
28	3	transaksi.create	2026-06-20 00:29:35	2026-06-20 00:29:35
29	3	transaksi.edit	2026-06-20 00:29:35	2026-06-20 00:29:35
30	3	transaksi.delete	2026-06-20 00:29:35	2026-06-20 00:29:35
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, nama, username, email, no_hp, password, role, is_active, remember_token, created_at, updated_at) FROM stdin;
1	Admin Perpustakaan	admin	admin@perpus.com	081234567890	$2y$12$xKJ/tcsGqxPW59VIsgjtjOZElHE6DacmwjEabRZkFAhtpLLs9HOXu	superadmin	t	\N	2026-06-20 00:29:35	2026-06-20 00:29:35
2	Petugas Satu	petugas1	petugas1@perpus.com	\N	$2y$12$DAAfbp8jYpsEHCGHqF984OC958Doy6TZkQgDDKqZe7CesWIa5OAkq	admin	t	\N	2026-06-20 00:29:35	2026-06-20 00:29:35
3	Petugas Dua	petugas2	petugas2@perpus.com	\N	$2y$12$y4FBGXeFQoGdOgat6A7trO6cFtiCDGRBuKyOOFFWn2VY/c.Z6Ywve	admin	t	\N	2026-06-20 00:29:35	2026-06-20 00:29:35
\.


--
-- Name: audits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.audits_id_seq', 1, false);


--
-- Name: buku_eksemplars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.buku_eksemplars_id_seq', 10, true);


--
-- Name: bukus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bukus_id_seq', 10, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: kegiatans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kegiatans_id_seq', 1, false);


--
-- Name: lokasis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lokasis_id_seq', 3, true);


--
-- Name: members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.members_id_seq', 5, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 16, true);


--
-- Name: paket_pemindahans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.paket_pemindahans_id_seq', 1, false);


--
-- Name: pakets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pakets_id_seq', 4, true);


--
-- Name: transaksis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transaksis_id_seq', 1, false);


--
-- Name: user_lokasi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_lokasi_id_seq', 3, true);


--
-- Name: user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_permissions_id_seq', 30, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: audits audits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audits
    ADD CONSTRAINT audits_pkey PRIMARY KEY (id);


--
-- Name: buku_eksemplars buku_eksemplars_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku_eksemplars
    ADD CONSTRAINT buku_eksemplars_pkey PRIMARY KEY (id);


--
-- Name: bukus bukus_isbn_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bukus
    ADD CONSTRAINT bukus_isbn_unique UNIQUE (isbn);


--
-- Name: bukus bukus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bukus
    ADD CONSTRAINT bukus_pkey PRIMARY KEY (id);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: kegiatan_paket kegiatan_paket_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kegiatan_paket
    ADD CONSTRAINT kegiatan_paket_pkey PRIMARY KEY (kegiatan_id, paket_id);


--
-- Name: kegiatans kegiatans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kegiatans
    ADD CONSTRAINT kegiatans_pkey PRIMARY KEY (id);


--
-- Name: lokasis lokasis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lokasis
    ADD CONSTRAINT lokasis_pkey PRIMARY KEY (id);


--
-- Name: members members_no_telp_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_no_telp_unique UNIQUE (no_telp);


--
-- Name: members members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: paket_pemindahans paket_pemindahans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paket_pemindahans
    ADD CONSTRAINT paket_pemindahans_pkey PRIMARY KEY (id);


--
-- Name: pakets pakets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pakets
    ADD CONSTRAINT pakets_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: transaksis transaksis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksis
    ADD CONSTRAINT transaksis_pkey PRIMARY KEY (id);


--
-- Name: user_lokasi user_lokasi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_lokasi
    ADD CONSTRAINT user_lokasi_pkey PRIMARY KEY (id);


--
-- Name: user_permissions user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_permissions
    ADD CONSTRAINT user_permissions_pkey PRIMARY KEY (id);


--
-- Name: user_permissions user_permissions_user_id_permission_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_permissions
    ADD CONSTRAINT user_permissions_user_id_permission_unique UNIQUE (user_id, permission);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_unique UNIQUE (username);


--
-- Name: audits_auditable_type_auditable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX audits_auditable_type_auditable_id_index ON public.audits USING btree (auditable_type, auditable_id);


--
-- Name: audits_user_id_user_type_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX audits_user_id_user_type_index ON public.audits USING btree (user_id, user_type);


--
-- Name: cache_expiration_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cache_expiration_index ON public.cache USING btree (expiration);


--
-- Name: cache_locks_expiration_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cache_locks_expiration_index ON public.cache_locks USING btree (expiration);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: unique_active_user_lokasi; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unique_active_user_lokasi ON public.user_lokasi USING btree (user_id, lokasi_id) WHERE (unassigned_at IS NULL);


--
-- Name: buku_eksemplars buku_eksemplars_buku_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku_eksemplars
    ADD CONSTRAINT buku_eksemplars_buku_id_foreign FOREIGN KEY (buku_id) REFERENCES public.bukus(id) ON DELETE CASCADE;


--
-- Name: buku_eksemplars buku_eksemplars_paket_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buku_eksemplars
    ADD CONSTRAINT buku_eksemplars_paket_id_foreign FOREIGN KEY (paket_id) REFERENCES public.pakets(id) ON DELETE SET NULL;


--
-- Name: bukus bukus_paket_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bukus
    ADD CONSTRAINT bukus_paket_id_foreign FOREIGN KEY (paket_id) REFERENCES public.pakets(id) ON DELETE SET NULL;


--
-- Name: bukus bukus_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bukus
    ADD CONSTRAINT bukus_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: kegiatan_paket kegiatan_paket_kegiatan_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kegiatan_paket
    ADD CONSTRAINT kegiatan_paket_kegiatan_id_foreign FOREIGN KEY (kegiatan_id) REFERENCES public.kegiatans(id) ON DELETE CASCADE;


--
-- Name: kegiatan_paket kegiatan_paket_lokasi_asal_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kegiatan_paket
    ADD CONSTRAINT kegiatan_paket_lokasi_asal_id_foreign FOREIGN KEY (lokasi_asal_id) REFERENCES public.lokasis(id) ON DELETE SET NULL;


--
-- Name: kegiatan_paket kegiatan_paket_paket_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kegiatan_paket
    ADD CONSTRAINT kegiatan_paket_paket_id_foreign FOREIGN KEY (paket_id) REFERENCES public.pakets(id) ON DELETE CASCADE;


--
-- Name: kegiatans kegiatans_lokasi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kegiatans
    ADD CONSTRAINT kegiatans_lokasi_id_foreign FOREIGN KEY (lokasi_id) REFERENCES public.lokasis(id) ON DELETE SET NULL;


--
-- Name: members members_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.members
    ADD CONSTRAINT members_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: paket_pemindahans paket_pemindahans_lokasi_asal_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paket_pemindahans
    ADD CONSTRAINT paket_pemindahans_lokasi_asal_id_foreign FOREIGN KEY (lokasi_asal_id) REFERENCES public.lokasis(id) ON DELETE SET NULL;


--
-- Name: paket_pemindahans paket_pemindahans_lokasi_tujuan_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paket_pemindahans
    ADD CONSTRAINT paket_pemindahans_lokasi_tujuan_id_foreign FOREIGN KEY (lokasi_tujuan_id) REFERENCES public.lokasis(id) ON DELETE RESTRICT;


--
-- Name: paket_pemindahans paket_pemindahans_paket_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paket_pemindahans
    ADD CONSTRAINT paket_pemindahans_paket_id_foreign FOREIGN KEY (paket_id) REFERENCES public.pakets(id) ON DELETE CASCADE;


--
-- Name: paket_pemindahans paket_pemindahans_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paket_pemindahans
    ADD CONSTRAINT paket_pemindahans_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: pakets pakets_lokasi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pakets
    ADD CONSTRAINT pakets_lokasi_id_foreign FOREIGN KEY (lokasi_id) REFERENCES public.lokasis(id) ON DELETE SET NULL;


--
-- Name: transaksis transaksis_buku_keluar_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksis
    ADD CONSTRAINT transaksis_buku_keluar_id_foreign FOREIGN KEY (buku_keluar_id) REFERENCES public.buku_eksemplars(id) ON DELETE CASCADE;


--
-- Name: transaksis transaksis_buku_masuk_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksis
    ADD CONSTRAINT transaksis_buku_masuk_id_foreign FOREIGN KEY (buku_masuk_id) REFERENCES public.buku_eksemplars(id) ON DELETE CASCADE;


--
-- Name: transaksis transaksis_member_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksis
    ADD CONSTRAINT transaksis_member_id_foreign FOREIGN KEY (member_id) REFERENCES public.members(id) ON DELETE CASCADE;


--
-- Name: transaksis transaksis_paket_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksis
    ADD CONSTRAINT transaksis_paket_id_foreign FOREIGN KEY (paket_id) REFERENCES public.pakets(id) ON DELETE CASCADE;


--
-- Name: transaksis transaksis_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transaksis
    ADD CONSTRAINT transaksis_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_lokasi user_lokasi_assigned_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_lokasi
    ADD CONSTRAINT user_lokasi_assigned_by_foreign FOREIGN KEY (assigned_by) REFERENCES public.users(id);


--
-- Name: user_lokasi user_lokasi_lokasi_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_lokasi
    ADD CONSTRAINT user_lokasi_lokasi_id_foreign FOREIGN KEY (lokasi_id) REFERENCES public.lokasis(id) ON DELETE CASCADE;


--
-- Name: user_lokasi user_lokasi_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_lokasi
    ADD CONSTRAINT user_lokasi_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_permissions user_permissions_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_permissions
    ADD CONSTRAINT user_permissions_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict brtl2ooDI23BRS6nUHCe8rGIw0RuM4nVWmcncCjnNWDQ4b5aavwakeYVjzUkYPq

