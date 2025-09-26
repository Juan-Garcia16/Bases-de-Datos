CREATE DATABASE modelo_educativo
    WITH TEMPLATE = template0
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = libc;

\connect modelo_educativo


--
-- PostgreSQL database dump
--

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.5

-- Started on 2025-09-26 11:09:06 -05

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
-- TOC entry 234 (class 1259 OID 17736)
-- Name: calificaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calificaciones (
    id_calificacion integer NOT NULL,
    puntaje numeric(5,2) NOT NULL,
    fk_id_estudiante integer NOT NULL,
    fk_id_evaluacion integer NOT NULL
);


ALTER TABLE public.calificaciones OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 17735)
-- Name: calificaciones_id_calificacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.calificaciones_id_calificacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.calificaciones_id_calificacion_seq OWNER TO postgres;

--
-- TOC entry 3850 (class 0 OID 0)
-- Dependencies: 233
-- Name: calificaciones_id_calificacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.calificaciones_id_calificacion_seq OWNED BY public.calificaciones.id_calificacion;


--
-- TOC entry 222 (class 1259 OID 17650)
-- Name: cursos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cursos (
    id_curso integer NOT NULL,
    fk_id_profesor integer NOT NULL,
    nombre_curso character varying(50) NOT NULL,
    creditos integer NOT NULL,
    descripcion text
);


ALTER TABLE public.cursos OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17649)
-- Name: cursos_id_curso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cursos_id_curso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cursos_id_curso_seq OWNER TO postgres;

--
-- TOC entry 3851 (class 0 OID 0)
-- Dependencies: 221
-- Name: cursos_id_curso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cursos_id_curso_seq OWNED BY public.cursos.id_curso;


--
-- TOC entry 218 (class 1259 OID 17636)
-- Name: estudiantes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estudiantes (
    id_estudiante integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    fecha_nacimiento date NOT NULL,
    direccion character varying(100) NOT NULL,
    email character varying(50) NOT NULL
);


ALTER TABLE public.estudiantes OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17635)
-- Name: estudiantes_id_estudiante_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estudiantes_id_estudiante_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estudiantes_id_estudiante_seq OWNER TO postgres;

--
-- TOC entry 3852 (class 0 OID 0)
-- Dependencies: 217
-- Name: estudiantes_id_estudiante_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estudiantes_id_estudiante_seq OWNED BY public.estudiantes.id_estudiante;


--
-- TOC entry 232 (class 1259 OID 17714)
-- Name: evaluaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evaluaciones (
    id_evaluacion integer NOT NULL,
    fk_id_profesor integer NOT NULL,
    fk_id_grupo integer NOT NULL,
    fecha_evaluacion date NOT NULL,
    fk_id_tipo_evaluacion integer NOT NULL
);


ALTER TABLE public.evaluaciones OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 17713)
-- Name: evaluaciones_id_evaluacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.evaluaciones_id_evaluacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.evaluaciones_id_evaluacion_seq OWNER TO postgres;

--
-- TOC entry 3853 (class 0 OID 0)
-- Dependencies: 231
-- Name: evaluaciones_id_evaluacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.evaluaciones_id_evaluacion_seq OWNED BY public.evaluaciones.id_evaluacion;


--
-- TOC entry 224 (class 1259 OID 17664)
-- Name: grupos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grupos (
    id_grupo integer NOT NULL,
    nombre_grupo character varying(50) NOT NULL,
    fk_id_curso integer NOT NULL
);


ALTER TABLE public.grupos OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17663)
-- Name: grupos_id_grupo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grupos_id_grupo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.grupos_id_grupo_seq OWNER TO postgres;

--
-- TOC entry 3854 (class 0 OID 0)
-- Dependencies: 223
-- Name: grupos_id_grupo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grupos_id_grupo_seq OWNED BY public.grupos.id_grupo;


--
-- TOC entry 226 (class 1259 OID 17676)
-- Name: horarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.horarios (
    id_horario integer NOT NULL,
    fk_id_grupo integer NOT NULL,
    dia_semana character varying(20) NOT NULL,
    hora_inicio time without time zone NOT NULL,
    hora_fin time without time zone NOT NULL
);


ALTER TABLE public.horarios OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17675)
-- Name: horarios_id_horario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.horarios_id_horario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.horarios_id_horario_seq OWNER TO postgres;

--
-- TOC entry 3855 (class 0 OID 0)
-- Dependencies: 225
-- Name: horarios_id_horario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.horarios_id_horario_seq OWNED BY public.horarios.id_horario;


--
-- TOC entry 228 (class 1259 OID 17688)
-- Name: matriculas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.matriculas (
    id_matricula integer NOT NULL,
    fecha_matricula date NOT NULL,
    fk_id_estudiante integer NOT NULL,
    fk_id_curso integer NOT NULL
);


ALTER TABLE public.matriculas OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17687)
-- Name: matriculas_id_matricula_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.matriculas_id_matricula_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.matriculas_id_matricula_seq OWNER TO postgres;

--
-- TOC entry 3856 (class 0 OID 0)
-- Dependencies: 227
-- Name: matriculas_id_matricula_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.matriculas_id_matricula_seq OWNED BY public.matriculas.id_matricula;


--
-- TOC entry 240 (class 1259 OID 17776)
-- Name: modulos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modulos (
    id_modulo integer NOT NULL,
    nombre_modulo character varying(50) NOT NULL,
    descripcion text,
    fk_id_curso integer NOT NULL
);


ALTER TABLE public.modulos OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 17775)
-- Name: modulos_id_modulo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modulos_id_modulo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.modulos_id_modulo_seq OWNER TO postgres;

--
-- TOC entry 3857 (class 0 OID 0)
-- Dependencies: 239
-- Name: modulos_id_modulo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modulos_id_modulo_seq OWNED BY public.modulos.id_modulo;


--
-- TOC entry 242 (class 1259 OID 17790)
-- Name: modulos_recursos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modulos_recursos (
    id_modulo_recurso integer NOT NULL,
    fk_id_modulo integer NOT NULL,
    fk_id_recurso integer NOT NULL
);


ALTER TABLE public.modulos_recursos OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 17789)
-- Name: modulos_recursos_id_modulo_recurso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modulos_recursos_id_modulo_recurso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.modulos_recursos_id_modulo_recurso_seq OWNER TO postgres;

--
-- TOC entry 3858 (class 0 OID 0)
-- Dependencies: 241
-- Name: modulos_recursos_id_modulo_recurso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modulos_recursos_id_modulo_recurso_seq OWNED BY public.modulos_recursos.id_modulo_recurso;


--
-- TOC entry 220 (class 1259 OID 17643)
-- Name: profesores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profesores (
    id_profesor integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    especialidad character varying(50) NOT NULL
);


ALTER TABLE public.profesores OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17642)
-- Name: profesores_id_profesor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profesores_id_profesor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.profesores_id_profesor_seq OWNER TO postgres;

--
-- TOC entry 3859 (class 0 OID 0)
-- Dependencies: 219
-- Name: profesores_id_profesor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profesores_id_profesor_seq OWNED BY public.profesores.id_profesor;


--
-- TOC entry 238 (class 1259 OID 17762)
-- Name: recursos_educativos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recursos_educativos (
    id_recurso integer NOT NULL,
    nombre character varying(100) NOT NULL,
    descripcion text,
    fk_id_tipo_recurso integer NOT NULL
);


ALTER TABLE public.recursos_educativos OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 17761)
-- Name: recursos_educativos_id_recurso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recursos_educativos_id_recurso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.recursos_educativos_id_recurso_seq OWNER TO postgres;

--
-- TOC entry 3860 (class 0 OID 0)
-- Dependencies: 237
-- Name: recursos_educativos_id_recurso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recursos_educativos_id_recurso_seq OWNED BY public.recursos_educativos.id_recurso;


--
-- TOC entry 230 (class 1259 OID 17705)
-- Name: tipos_evaluacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipos_evaluacion (
    id_tipo_evaluacion integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.tipos_evaluacion OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 17704)
-- Name: tipos_evaluacion_id_tipo_evaluacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipos_evaluacion_id_tipo_evaluacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipos_evaluacion_id_tipo_evaluacion_seq OWNER TO postgres;

--
-- TOC entry 3861 (class 0 OID 0)
-- Dependencies: 229
-- Name: tipos_evaluacion_id_tipo_evaluacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipos_evaluacion_id_tipo_evaluacion_seq OWNED BY public.tipos_evaluacion.id_tipo_evaluacion;


--
-- TOC entry 236 (class 1259 OID 17753)
-- Name: tipos_recurso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipos_recurso (
    id_tipo_recurso integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.tipos_recurso OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 17752)
-- Name: tipos_recurso_id_tipo_recurso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipos_recurso_id_tipo_recurso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipos_recurso_id_tipo_recurso_seq OWNER TO postgres;

--
-- TOC entry 3862 (class 0 OID 0)
-- Dependencies: 235
-- Name: tipos_recurso_id_tipo_recurso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipos_recurso_id_tipo_recurso_seq OWNED BY public.tipos_recurso.id_tipo_recurso;


--
-- TOC entry 3625 (class 2604 OID 17739)
-- Name: calificaciones id_calificacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificaciones ALTER COLUMN id_calificacion SET DEFAULT nextval('public.calificaciones_id_calificacion_seq'::regclass);


--
-- TOC entry 3619 (class 2604 OID 17653)
-- Name: cursos id_curso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos ALTER COLUMN id_curso SET DEFAULT nextval('public.cursos_id_curso_seq'::regclass);


--
-- TOC entry 3617 (class 2604 OID 17639)
-- Name: estudiantes id_estudiante; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes ALTER COLUMN id_estudiante SET DEFAULT nextval('public.estudiantes_id_estudiante_seq'::regclass);


--
-- TOC entry 3624 (class 2604 OID 17717)
-- Name: evaluaciones id_evaluacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluaciones ALTER COLUMN id_evaluacion SET DEFAULT nextval('public.evaluaciones_id_evaluacion_seq'::regclass);


--
-- TOC entry 3620 (class 2604 OID 17667)
-- Name: grupos id_grupo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupos ALTER COLUMN id_grupo SET DEFAULT nextval('public.grupos_id_grupo_seq'::regclass);


--
-- TOC entry 3621 (class 2604 OID 17679)
-- Name: horarios id_horario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horarios ALTER COLUMN id_horario SET DEFAULT nextval('public.horarios_id_horario_seq'::regclass);


--
-- TOC entry 3622 (class 2604 OID 17691)
-- Name: matriculas id_matricula; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matriculas ALTER COLUMN id_matricula SET DEFAULT nextval('public.matriculas_id_matricula_seq'::regclass);


--
-- TOC entry 3628 (class 2604 OID 17779)
-- Name: modulos id_modulo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modulos ALTER COLUMN id_modulo SET DEFAULT nextval('public.modulos_id_modulo_seq'::regclass);


--
-- TOC entry 3629 (class 2604 OID 17793)
-- Name: modulos_recursos id_modulo_recurso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modulos_recursos ALTER COLUMN id_modulo_recurso SET DEFAULT nextval('public.modulos_recursos_id_modulo_recurso_seq'::regclass);


--
-- TOC entry 3618 (class 2604 OID 17646)
-- Name: profesores id_profesor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesores ALTER COLUMN id_profesor SET DEFAULT nextval('public.profesores_id_profesor_seq'::regclass);


--
-- TOC entry 3627 (class 2604 OID 17765)
-- Name: recursos_educativos id_recurso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recursos_educativos ALTER COLUMN id_recurso SET DEFAULT nextval('public.recursos_educativos_id_recurso_seq'::regclass);


--
-- TOC entry 3623 (class 2604 OID 17708)
-- Name: tipos_evaluacion id_tipo_evaluacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_evaluacion ALTER COLUMN id_tipo_evaluacion SET DEFAULT nextval('public.tipos_evaluacion_id_tipo_evaluacion_seq'::regclass);


--
-- TOC entry 3626 (class 2604 OID 17756)
-- Name: tipos_recurso id_tipo_recurso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_recurso ALTER COLUMN id_tipo_recurso SET DEFAULT nextval('public.tipos_recurso_id_tipo_recurso_seq'::regclass);


--
-- TOC entry 3836 (class 0 OID 17736)
-- Dependencies: 234
-- Data for Name: calificaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.calificaciones (id_calificacion, puntaje, fk_id_estudiante, fk_id_evaluacion) FROM stdin;
1	85.50	1	1
2	90.00	2	2
3	78.00	3	3
4	88.00	4	4
5	92.00	5	5
6	74.50	6	6
7	81.00	7	7
8	95.00	8	8
\.


--
-- TOC entry 3824 (class 0 OID 17650)
-- Dependencies: 222
-- Data for Name: cursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cursos (id_curso, fk_id_profesor, nombre_curso, creditos, descripcion) FROM stdin;
1	1	Álgebra	3	Curso de álgebra básica
2	2	Física I	4	Introducción a la física
3	3	Programación I	4	Fundamentos de programación en C
4	4	Bases de Datos	3	Modelo relacional y SQL
5	5	Electrónica I	4	Circuitos eléctricos básicos
6	6	Química General	3	Principios de química
7	7	Estadística I	3	Probabilidades y estadística descriptiva
8	8	Historia Universal	2	Historia moderna y contemporánea
\.


--
-- TOC entry 3820 (class 0 OID 17636)
-- Dependencies: 218
-- Data for Name: estudiantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estudiantes (id_estudiante, nombre, apellido, fecha_nacimiento, direccion, email) FROM stdin;
1	Juan	García	2000-05-12	Calle 1 #23	juan@gmail.com
2	Ana	López	1999-11-02	Carrera 10 #5	ana@hotmail.com
3	Carlos	Pérez	2001-03-22	Av 3 #45	carlos@gmail.com
4	María	Ramírez	2000-09-15	Calle 8 #11	maria@yahoo.com
5	Pedro	Suárez	1998-12-10	Calle 12 #9	pedro@gmail.com
6	Laura	Mendoza	2002-01-05	Carrera 4 #7	laura@gmail.com
7	Andrés	Martínez	2001-07-18	Av 6 #22	andres@gmail.com
8	Sofía	Rojas	2000-02-28	Calle 15 #30	sofia@gmail.com
\.


--
-- TOC entry 3834 (class 0 OID 17714)
-- Dependencies: 232
-- Data for Name: evaluaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.evaluaciones (id_evaluacion, fk_id_profesor, fk_id_grupo, fecha_evaluacion, fk_id_tipo_evaluacion) FROM stdin;
1	1	1	2025-03-01	1
2	2	2	2025-03-02	3
3	3	3	2025-03-03	1
4	4	4	2025-03-04	2
5	5	5	2025-03-05	5
6	6	6	2025-03-06	4
7	7	7	2025-03-07	6
8	8	8	2025-03-08	7
\.


--
-- TOC entry 3826 (class 0 OID 17664)
-- Dependencies: 224
-- Data for Name: grupos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grupos (id_grupo, nombre_grupo, fk_id_curso) FROM stdin;
1	Grupo A	1
2	Grupo B	2
3	Grupo C	3
4	Grupo D	4
5	Grupo E	5
6	Grupo F	6
7	Grupo G	7
8	Grupo H	8
\.


--
-- TOC entry 3828 (class 0 OID 17676)
-- Dependencies: 226
-- Data for Name: horarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.horarios (id_horario, fk_id_grupo, dia_semana, hora_inicio, hora_fin) FROM stdin;
1	1	Lunes	08:00:00	10:00:00
2	2	Martes	10:00:00	12:00:00
3	3	Miércoles	08:00:00	10:00:00
4	4	Jueves	14:00:00	16:00:00
5	5	Viernes	08:00:00	10:00:00
6	6	Lunes	14:00:00	16:00:00
7	7	Martes	16:00:00	18:00:00
8	8	Miércoles	10:00:00	12:00:00
\.


--
-- TOC entry 3830 (class 0 OID 17688)
-- Dependencies: 228
-- Data for Name: matriculas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.matriculas (id_matricula, fecha_matricula, fk_id_estudiante, fk_id_curso) FROM stdin;
1	2025-01-10	1	1
2	2025-01-11	2	2
3	2025-01-12	3	3
4	2025-01-13	4	4
5	2025-01-14	5	5
6	2025-01-15	6	6
7	2025-01-16	7	7
8	2025-01-17	8	8
\.


--
-- TOC entry 3842 (class 0 OID 17776)
-- Dependencies: 240
-- Data for Name: modulos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.modulos (id_modulo, nombre_modulo, descripcion, fk_id_curso) FROM stdin;
1	Álgebra Lineal	Matrices y determinantes	1
2	Cinemática	Movimiento rectilíneo	2
3	Estructuras	Condicionales y bucles	3
4	SQL Básico	DDL y DML	4
5	Resistencias	Circuitos en serie y paralelo	5
6	Tabla Periódica	Elementos y compuestos	6
7	Probabilidad	Reglas de probabilidad	7
8	Renacimiento	Historia europea	8
\.


--
-- TOC entry 3844 (class 0 OID 17790)
-- Dependencies: 242
-- Data for Name: modulos_recursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.modulos_recursos (id_modulo_recurso, fk_id_modulo, fk_id_recurso) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
6	6	6
7	7	7
8	8	8
\.


--
-- TOC entry 3822 (class 0 OID 17643)
-- Dependencies: 220
-- Data for Name: profesores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profesores (id_profesor, nombre, apellido, email, especialidad) FROM stdin;
1	Luis	Torres	luis@gmail.com	Matemáticas
2	Claudia	Moreno	claudia@hotmail.com	Física
3	Jorge	Hernández	jorge@gmail.com	Programación
4	Patricia	Gómez	patricia@yahoo.com	Bases de Datos
5	Ricardo	Luna	ricardo@gmail.com	Electrónica
6	Marta	Castaño	marta@gmail.com	Química
7	Hugo	Vargas	hugo@gmail.com	Estadística
8	Verónica	Díaz	veronica@gmail.com	Historia
\.


--
-- TOC entry 3840 (class 0 OID 17762)
-- Dependencies: 238
-- Data for Name: recursos_educativos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recursos_educativos (id_recurso, nombre, descripcion, fk_id_tipo_recurso) FROM stdin;
1	Libro Álgebra Baldor	Texto de álgebra clásica	1
2	Guía Física	Ejercicios de física básica	3
3	Manual C	Fundamentos de programación en C	4
4	SQL Tutorial	Manual de SQL	2
5	Circuitos Digitales	Introducción a circuitos	1
6	Química Fácil	Guía de química general	2
7	Estadística Básica	Probabilidades y estadística	1
8	Historia del Mundo	Historia moderna	1
\.


--
-- TOC entry 3832 (class 0 OID 17705)
-- Dependencies: 230
-- Data for Name: tipos_evaluacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipos_evaluacion (id_tipo_evaluacion, nombre) FROM stdin;
1	Parcial
2	Final
3	Quiz
4	Exposición
5	Proyecto
6	Ensayo
7	Laboratorio
8	Otro
\.


--
-- TOC entry 3838 (class 0 OID 17753)
-- Dependencies: 236
-- Data for Name: tipos_recurso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipos_recurso (id_tipo_recurso, nombre) FROM stdin;
1	Libro
2	PDF
3	Guía
4	Manual
5	Artículo
6	Video
7	Software
8	Otro
\.


--
-- TOC entry 3863 (class 0 OID 0)
-- Dependencies: 233
-- Name: calificaciones_id_calificacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.calificaciones_id_calificacion_seq', 8, true);


--
-- TOC entry 3864 (class 0 OID 0)
-- Dependencies: 221
-- Name: cursos_id_curso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursos_id_curso_seq', 8, true);


--
-- TOC entry 3865 (class 0 OID 0)
-- Dependencies: 217
-- Name: estudiantes_id_estudiante_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estudiantes_id_estudiante_seq', 8, true);


--
-- TOC entry 3866 (class 0 OID 0)
-- Dependencies: 231
-- Name: evaluaciones_id_evaluacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.evaluaciones_id_evaluacion_seq', 8, true);


--
-- TOC entry 3867 (class 0 OID 0)
-- Dependencies: 223
-- Name: grupos_id_grupo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grupos_id_grupo_seq', 8, true);


--
-- TOC entry 3868 (class 0 OID 0)
-- Dependencies: 225
-- Name: horarios_id_horario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.horarios_id_horario_seq', 8, true);


--
-- TOC entry 3869 (class 0 OID 0)
-- Dependencies: 227
-- Name: matriculas_id_matricula_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.matriculas_id_matricula_seq', 8, true);


--
-- TOC entry 3870 (class 0 OID 0)
-- Dependencies: 239
-- Name: modulos_id_modulo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modulos_id_modulo_seq', 8, true);


--
-- TOC entry 3871 (class 0 OID 0)
-- Dependencies: 241
-- Name: modulos_recursos_id_modulo_recurso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modulos_recursos_id_modulo_recurso_seq', 8, true);


--
-- TOC entry 3872 (class 0 OID 0)
-- Dependencies: 219
-- Name: profesores_id_profesor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profesores_id_profesor_seq', 8, true);


--
-- TOC entry 3873 (class 0 OID 0)
-- Dependencies: 237
-- Name: recursos_educativos_id_recurso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recursos_educativos_id_recurso_seq', 8, true);


--
-- TOC entry 3874 (class 0 OID 0)
-- Dependencies: 229
-- Name: tipos_evaluacion_id_tipo_evaluacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipos_evaluacion_id_tipo_evaluacion_seq', 8, true);


--
-- TOC entry 3875 (class 0 OID 0)
-- Dependencies: 235
-- Name: tipos_recurso_id_tipo_recurso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipos_recurso_id_tipo_recurso_seq', 8, true);


--
-- TOC entry 3649 (class 2606 OID 17741)
-- Name: calificaciones calificaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT calificaciones_pkey PRIMARY KEY (id_calificacion);


--
-- TOC entry 3635 (class 2606 OID 17657)
-- Name: cursos cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_pkey PRIMARY KEY (id_curso);


--
-- TOC entry 3631 (class 2606 OID 17641)
-- Name: estudiantes estudiantes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_pkey PRIMARY KEY (id_estudiante);


--
-- TOC entry 3647 (class 2606 OID 17719)
-- Name: evaluaciones evaluaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluaciones
    ADD CONSTRAINT evaluaciones_pkey PRIMARY KEY (id_evaluacion);


--
-- TOC entry 3637 (class 2606 OID 17669)
-- Name: grupos grupos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT grupos_pkey PRIMARY KEY (id_grupo);


--
-- TOC entry 3639 (class 2606 OID 17681)
-- Name: horarios horarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horarios
    ADD CONSTRAINT horarios_pkey PRIMARY KEY (id_horario);


--
-- TOC entry 3641 (class 2606 OID 17693)
-- Name: matriculas matriculas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matriculas
    ADD CONSTRAINT matriculas_pkey PRIMARY KEY (id_matricula);


--
-- TOC entry 3657 (class 2606 OID 17783)
-- Name: modulos modulos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modulos
    ADD CONSTRAINT modulos_pkey PRIMARY KEY (id_modulo);


--
-- TOC entry 3659 (class 2606 OID 17795)
-- Name: modulos_recursos modulos_recursos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modulos_recursos
    ADD CONSTRAINT modulos_recursos_pkey PRIMARY KEY (id_modulo_recurso);


--
-- TOC entry 3633 (class 2606 OID 17648)
-- Name: profesores profesores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesores
    ADD CONSTRAINT profesores_pkey PRIMARY KEY (id_profesor);


--
-- TOC entry 3655 (class 2606 OID 17769)
-- Name: recursos_educativos recursos_educativos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recursos_educativos
    ADD CONSTRAINT recursos_educativos_pkey PRIMARY KEY (id_recurso);


--
-- TOC entry 3643 (class 2606 OID 17712)
-- Name: tipos_evaluacion tipos_evaluacion_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_evaluacion
    ADD CONSTRAINT tipos_evaluacion_nombre_key UNIQUE (nombre);


--
-- TOC entry 3645 (class 2606 OID 17710)
-- Name: tipos_evaluacion tipos_evaluacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_evaluacion
    ADD CONSTRAINT tipos_evaluacion_pkey PRIMARY KEY (id_tipo_evaluacion);


--
-- TOC entry 3651 (class 2606 OID 17760)
-- Name: tipos_recurso tipos_recurso_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_recurso
    ADD CONSTRAINT tipos_recurso_nombre_key UNIQUE (nombre);


--
-- TOC entry 3653 (class 2606 OID 17758)
-- Name: tipos_recurso tipos_recurso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_recurso
    ADD CONSTRAINT tipos_recurso_pkey PRIMARY KEY (id_tipo_recurso);


--
-- TOC entry 3668 (class 2606 OID 17742)
-- Name: calificaciones fk_calificacion_estudiante; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT fk_calificacion_estudiante FOREIGN KEY (fk_id_estudiante) REFERENCES public.estudiantes(id_estudiante);


--
-- TOC entry 3669 (class 2606 OID 17747)
-- Name: calificaciones fk_calificacion_evaluacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calificaciones
    ADD CONSTRAINT fk_calificacion_evaluacion FOREIGN KEY (fk_id_evaluacion) REFERENCES public.evaluaciones(id_evaluacion);


--
-- TOC entry 3661 (class 2606 OID 17670)
-- Name: grupos fk_curso_grupo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grupos
    ADD CONSTRAINT fk_curso_grupo FOREIGN KEY (fk_id_curso) REFERENCES public.cursos(id_curso);


--
-- TOC entry 3663 (class 2606 OID 17699)
-- Name: matriculas fk_curso_matricula; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matriculas
    ADD CONSTRAINT fk_curso_matricula FOREIGN KEY (fk_id_curso) REFERENCES public.cursos(id_curso);


--
-- TOC entry 3664 (class 2606 OID 17694)
-- Name: matriculas fk_estudiante_matricula; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matriculas
    ADD CONSTRAINT fk_estudiante_matricula FOREIGN KEY (fk_id_estudiante) REFERENCES public.estudiantes(id_estudiante);


--
-- TOC entry 3665 (class 2606 OID 17725)
-- Name: evaluaciones fk_grupo_evaluacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluaciones
    ADD CONSTRAINT fk_grupo_evaluacion FOREIGN KEY (fk_id_grupo) REFERENCES public.grupos(id_grupo);


--
-- TOC entry 3662 (class 2606 OID 17682)
-- Name: horarios fk_grupo_horario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.horarios
    ADD CONSTRAINT fk_grupo_horario FOREIGN KEY (fk_id_grupo) REFERENCES public.grupos(id_grupo);


--
-- TOC entry 3671 (class 2606 OID 17784)
-- Name: modulos fk_modulo_curso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modulos
    ADD CONSTRAINT fk_modulo_curso FOREIGN KEY (fk_id_curso) REFERENCES public.cursos(id_curso);


--
-- TOC entry 3672 (class 2606 OID 17796)
-- Name: modulos_recursos fk_modulo_recurso_modulo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modulos_recursos
    ADD CONSTRAINT fk_modulo_recurso_modulo FOREIGN KEY (fk_id_modulo) REFERENCES public.modulos(id_modulo);


--
-- TOC entry 3673 (class 2606 OID 17801)
-- Name: modulos_recursos fk_modulo_recurso_recurso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modulos_recursos
    ADD CONSTRAINT fk_modulo_recurso_recurso FOREIGN KEY (fk_id_recurso) REFERENCES public.recursos_educativos(id_recurso);


--
-- TOC entry 3660 (class 2606 OID 17658)
-- Name: cursos fk_profesor_curso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT fk_profesor_curso FOREIGN KEY (fk_id_profesor) REFERENCES public.profesores(id_profesor);


--
-- TOC entry 3666 (class 2606 OID 17720)
-- Name: evaluaciones fk_profesor_evaluacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluaciones
    ADD CONSTRAINT fk_profesor_evaluacion FOREIGN KEY (fk_id_profesor) REFERENCES public.profesores(id_profesor);


--
-- TOC entry 3670 (class 2606 OID 17770)
-- Name: recursos_educativos fk_recurso_tipo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recursos_educativos
    ADD CONSTRAINT fk_recurso_tipo FOREIGN KEY (fk_id_tipo_recurso) REFERENCES public.tipos_recurso(id_tipo_recurso);


--
-- TOC entry 3667 (class 2606 OID 17730)
-- Name: evaluaciones fk_tipo_evaluacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluaciones
    ADD CONSTRAINT fk_tipo_evaluacion FOREIGN KEY (fk_id_tipo_evaluacion) REFERENCES public.tipos_evaluacion(id_tipo_evaluacion);


-- Completed on 2025-09-26 11:09:07 -05

--
-- PostgreSQL database dump complete
--

