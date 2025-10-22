--
-- PostgreSQL database dump
--

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.5

-- Started on 2025-10-22 13:09:22 -05

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
-- TOC entry 3754 (class 1262 OID 17813)
-- Name: lista-UTP; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "lista-UTP" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';


ALTER DATABASE "lista-UTP" OWNER TO postgres;

\encoding SQL_ASCII
\connect -reuse-previous=on "dbname='lista-UTP'"

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
-- TOC entry 224 (class 1259 OID 17847)
-- Name: clases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clases (
    id_clase integer NOT NULL,
    codigo_profesor character varying(10) NOT NULL,
    codigo_materia character varying(10) NOT NULL,
    salon character varying(20) NOT NULL,
    horario character varying(50) NOT NULL,
    id_dia integer NOT NULL
);


ALTER TABLE public.clases OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17846)
-- Name: clases_id_clase_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clases_id_clase_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clases_id_clase_seq OWNER TO postgres;

--
-- TOC entry 3755 (class 0 OID 0)
-- Dependencies: 223
-- Name: clases_id_clase_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clases_id_clase_seq OWNED BY public.clases.id_clase;


--
-- TOC entry 222 (class 1259 OID 17840)
-- Name: dias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dias (
    id_dia integer NOT NULL,
    dia character varying(20) NOT NULL
);


ALTER TABLE public.dias OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17839)
-- Name: dias_id_dia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dias_id_dia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dias_id_dia_seq OWNER TO postgres;

--
-- TOC entry 3756 (class 0 OID 0)
-- Dependencies: 221
-- Name: dias_id_dia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dias_id_dia_seq OWNED BY public.dias.id_dia;


--
-- TOC entry 217 (class 1259 OID 17814)
-- Name: lista; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lista (
    matricula character varying(20) NOT NULL,
    nombre character varying(50) NOT NULL,
    ex1 numeric(5,2) NOT NULL,
    ex2 numeric(5,2) NOT NULL,
    ex3 numeric(5,2) NOT NULL
);


ALTER TABLE public.lista OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17834)
-- Name: materias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.materias (
    codigo character varying(10) NOT NULL,
    descripcion character varying(100) NOT NULL
);


ALTER TABLE public.materias OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17829)
-- Name: profesores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profesores (
    codigo character varying(10) NOT NULL,
    nombre character varying(50) NOT NULL,
    apellidos character varying(50) NOT NULL
);


ALTER TABLE public.profesores OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17819)
-- Name: promedio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promedio (
    matricula character varying(20) NOT NULL,
    promedio numeric(5,2) NOT NULL,
    estado character varying(20)
);


ALTER TABLE public.promedio OWNER TO postgres;

--
-- TOC entry 3579 (class 2604 OID 17850)
-- Name: clases id_clase; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases ALTER COLUMN id_clase SET DEFAULT nextval('public.clases_id_clase_seq'::regclass);


--
-- TOC entry 3578 (class 2604 OID 17843)
-- Name: dias id_dia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dias ALTER COLUMN id_dia SET DEFAULT nextval('public.dias_id_dia_seq'::regclass);


--
-- TOC entry 3748 (class 0 OID 17847)
-- Dependencies: 224
-- Data for Name: clases; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.clases VALUES (7, '2511', '693', 'Y323', '9-nov', 3);
INSERT INTO public.clases VALUES (8, '2511', '693', 'Y209', '9nov', 2);
INSERT INTO public.clases VALUES (9, '2511', '693', 'Y323', '9-nov', 1);


--
-- TOC entry 3746 (class 0 OID 17840)
-- Dependencies: 222
-- Data for Name: dias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dias VALUES (2, 'MIERCOLES');
INSERT INTO public.dias VALUES (1, 'LUNES');
INSERT INTO public.dias VALUES (3, 'VIERNES');
INSERT INTO public.dias VALUES (8, 'MARTES');
INSERT INTO public.dias VALUES (9, 'JUEVES');
INSERT INTO public.dias VALUES (10, 'SABADO');


--
-- TOC entry 3741 (class 0 OID 17814)
-- Dependencies: 217
-- Data for Name: lista; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.lista VALUES ('51712', 'RENDON GIRON VICTOR ALONSO', 72.00, 30.00, 56.00);
INSERT INTO public.lista VALUES ('52606', 'CORREA TAMAYO JULIAN ANDRES', 96.00, 31.00, 8.00);
INSERT INTO public.lista VALUES ('53159', 'LOAIZA BURITICA MARIANA', 71.00, 28.00, 35.00);
INSERT INTO public.lista VALUES ('54270', 'SUAREZ VASQUEZ SARY JOHANA', 81.00, 2.00, 0.00);
INSERT INTO public.lista VALUES ('56477', 'HERNANDEZ IBARRA ALEJANDRO', 93.00, 50.00, 49.00);
INSERT INTO public.lista VALUES ('57790', 'RODRIGUEZ GIRALDO ANDRES FELIPE', 45.00, 17.00, 59.00);
INSERT INTO public.lista VALUES ('57917', 'VARGAS GARCIA KATHERINE', 61.00, 86.00, 28.00);
INSERT INTO public.lista VALUES ('69366', 'LARGO HERNANDEZ DANIEL', 21.00, 100.00, 96.00);
INSERT INTO public.lista VALUES ('69404', 'PINEDA CABEZAS HERNAN ALBERTO', 56.00, 98.00, 100.00);
INSERT INTO public.lista VALUES ('70035', 'CARDONA GRISALES ANA MARIA', 5.00, 61.00, 9.00);
INSERT INTO public.lista VALUES ('71947', 'VASQUEZ LOPEZ JUAN PABLO', 23.00, 98.00, 72.00);
INSERT INTO public.lista VALUES ('72314', 'ROMERO ZAPATA LEIDY JOHANNA', 80.00, 12.00, 39.00);
INSERT INTO public.lista VALUES ('72961', 'ARBOLEDA MARIN MELISSA', 84.00, 66.00, 73.00);
INSERT INTO public.lista VALUES ('74248', 'TORRES GONZALEZ ELIZABETH', 69.00, 100.00, 91.00);
INSERT INTO public.lista VALUES ('74402', 'DUQUE GARCIA YULIETH ALEJANDRA', 94.00, 26.00, 25.00);
INSERT INTO public.lista VALUES ('75543', 'JARAMILLO GRISALES JEFFER DANIEL', 36.00, 69.00, 51.00);
INSERT INTO public.lista VALUES ('87667', 'URIBE HERRERA ANDRES FELIPE', 85.00, 14.00, 100.00);
INSERT INTO public.lista VALUES ('93281', 'ORTIZ BLANDON JHONIER', 16.00, 52.00, 43.00);
INSERT INTO public.lista VALUES ('96888', 'JIMENEZ BUITRAGO YERLY ANDRES', 16.00, 100.00, 51.00);
INSERT INTO public.lista VALUES ('165229', 'Adolfo Cámara E.', 93.00, 87.00, 0.00);
INSERT INTO public.lista VALUES ('178919', 'Héctor Coronado', 70.00, 87.00, 40.00);
INSERT INTO public.lista VALUES ('179050', 'David Elías Camacho M.', 70.00, 93.00, 55.00);
INSERT INTO public.lista VALUES ('179781', 'José Emmanuel Garza P.', 63.00, 93.00, 80.00);
INSERT INTO public.lista VALUES ('179788', 'Nidia Colmenero L.', 87.00, 98.00, 78.00);
INSERT INTO public.lista VALUES ('179931', 'Carlos Alexis Blé Caso', 58.00, 87.00, 88.00);
INSERT INTO public.lista VALUES ('189242', 'SERVELETS MULTIMEDIA', 70.00, 80.00, 80.00);
INSERT INTO public.lista VALUES ('263835', 'Ramiro Espinosa Z.', 63.00, 100.00, 75.00);
INSERT INTO public.lista VALUES ('338849', 'Dirk Antonio Rosquillas T.', 98.00, 74.00, 48.00);
INSERT INTO public.lista VALUES ('392212', 'Alina Lizu Larrondo M.', 51.00, 88.00, 40.00);
INSERT INTO public.lista VALUES ('527755', 'Lizeth G. Gastélum A.', 70.00, 51.00, 95.00);
INSERT INTO public.lista VALUES ('527892', 'Roberto Cota R.', 99.00, 98.00, 80.00);
INSERT INTO public.lista VALUES ('528000', 'Francisco X. Inukai B.', 88.00, 72.00, 98.00);
INSERT INTO public.lista VALUES ('540531', 'José Euclides Correa P.', 92.00, 82.00, 45.00);
INSERT INTO public.lista VALUES ('585749', 'Adriana María Flores Martínez', 88.00, 87.00, 83.00);
INSERT INTO public.lista VALUES ('585757', 'Javier Ernesto Dávila Castillón', 95.00, 94.00, 75.00);
INSERT INTO public.lista VALUES ('586217', 'Rogelio Mata Villarreal', 87.00, 63.00, 55.00);
INSERT INTO public.lista VALUES ('601705', 'Eduardo Domínguez M.', 75.00, 85.00, 25.00);
INSERT INTO public.lista VALUES ('603149', 'Marcela Fernández S.', 100.00, 99.00, 78.00);
INSERT INTO public.lista VALUES ('603277', 'Raúl Carlos Ramirez Garza', 86.00, 66.00, 38.00);
INSERT INTO public.lista VALUES ('712243', 'Daniel García M.', 87.00, 100.00, 70.00);
INSERT INTO public.lista VALUES ('750404', 'Claudia L. González N.', 79.00, 90.00, 60.00);
INSERT INTO public.lista VALUES ('763924', 'Raúl Alonzo B.', 94.00, 91.00, 83.00);
INSERT INTO public.lista VALUES ('764377', 'Roberto Isaac Flores Jiménez', 68.00, 82.00, 80.00);
INSERT INTO public.lista VALUES ('765022', 'Héctor Manuel Rodríguesz M.', 42.00, 79.00, 58.00);
INSERT INTO public.lista VALUES ('765088', 'Juan Pablo González González', 78.00, 93.00, 63.00);
INSERT INTO public.lista VALUES ('765264', 'Jan Reinoud Ortiz Dehaas', 86.00, 93.00, 68.00);
INSERT INTO public.lista VALUES ('765274', 'Saúl Armando Soto Véliz', 87.00, 88.00, 70.00);
INSERT INTO public.lista VALUES ('765764', 'Rigoberto Vázquez Bretón', 85.00, 91.00, 93.00);
INSERT INTO public.lista VALUES ('766142', 'León Felipe Villegas K.', 77.00, 93.00, 75.00);
INSERT INTO public.lista VALUES ('766725', 'Alejandro Luis B.', 98.00, 91.00, 83.00);
INSERT INTO public.lista VALUES ('766861', 'Jorge Eduardo Stone M.', 100.00, 90.00, 80.00);
INSERT INTO public.lista VALUES ('766933', 'Javier Arturo Ochoa S.', 95.00, 93.00, 88.00);
INSERT INTO public.lista VALUES ('767101', 'Pablo Gutiérrez T.', 61.00, 66.00, 53.00);
INSERT INTO public.lista VALUES ('767175', 'José Adrián Chapa R.', 80.00, 99.00, 83.00);
INSERT INTO public.lista VALUES ('767828', 'Jaime Uriel García N.', 98.00, 100.00, 88.00);
INSERT INTO public.lista VALUES ('5261120151', 'CARDONA ALZATE MAY JEFFERSON', 79.00, 97.00, 12.00);
INSERT INTO public.lista VALUES ('5931120009', 'OTALVARO AVENDAÑO YEISON ALEJANDRO', 70.00, 21.00, 53.00);
INSERT INTO public.lista VALUES ('5931120014', 'GARCIA LOPEZ MELISSA', 100.00, 54.00, 50.00);
INSERT INTO public.lista VALUES ('5931120015', 'VALENCIA CAÑON JENIFFER ELIANA', 84.00, 30.00, 0.00);
INSERT INTO public.lista VALUES ('5931120019', 'JARAMILLO ARENAS WILSON EUGENIO', 53.00, 72.00, 70.00);
INSERT INTO public.lista VALUES ('5931120020', 'TOBÓN RIOS MANUEL ALEJANDRO', 14.00, 35.00, 22.00);
INSERT INTO public.lista VALUES ('5931120028', 'RAMIREZ COLORADO LUZ MERY', 79.00, 46.00, 100.00);
INSERT INTO public.lista VALUES ('5931120029', 'AMAYA BUENO CRISTHIAN DAVID', 100.00, 40.00, 8.00);
INSERT INTO public.lista VALUES ('5931120030', 'HURTADO MONTOYA ANGELICA MARIA', 66.00, 10.00, 99.00);
INSERT INTO public.lista VALUES ('5931120052', 'ZULUAGA LONDOÑO KATHERINE', 11.00, 27.00, 99.00);
INSERT INTO public.lista VALUES ('5931120053', 'VALENCIA BERMÚDEZ LUIS FERNANDO', 12.00, 0.00, 57.00);
INSERT INTO public.lista VALUES ('5931120081', 'ECHEVERRY VELEZ CARLOS AUGUSTO', 5.00, 0.00, 15.00);
INSERT INTO public.lista VALUES ('5931120082', 'VICENTE NIETO MAURICIO', 85.00, 66.00, 8.00);
INSERT INTO public.lista VALUES ('5931120099', 'QUINTERO GARCIA HECTOR FABIO', 75.00, 54.00, 92.00);
INSERT INTO public.lista VALUES ('5931120100', 'PUERTA GRISALES MATEO', 0.00, 64.00, 100.00);
INSERT INTO public.lista VALUES ('5931120103', 'CARDONA BEDOYA ERIKA MARCELA', 48.00, 23.00, 75.00);
INSERT INTO public.lista VALUES ('5931120111', 'PERDOMO CASTRO ANDRES', 97.00, 69.00, 94.00);
INSERT INTO public.lista VALUES ('5931120112', 'RENDON OSORIO ANGELICA MARIA', 97.00, 67.00, 20.00);
INSERT INTO public.lista VALUES ('5931120115', 'MORALES CARMONA JOHANNY ANDRES', 75.00, 30.00, 84.00);
INSERT INTO public.lista VALUES ('5931120117', 'CASTRO SERNA JUAN CARLOS', 100.00, 95.00, 100.00);
INSERT INTO public.lista VALUES ('5931120139', 'RUIZ MARIN CRISTIAN FERNANDO', 0.00, 76.00, 100.00);
INSERT INTO public.lista VALUES ('5931120155', 'RAMIREZ TAPASCO EDUAR FERNANDO', 58.00, 33.00, 35.00);
INSERT INTO public.lista VALUES ('5931120156', 'LONDOÑO BRITO GENNY PATRICIA', 51.00, 100.00, 56.00);
INSERT INTO public.lista VALUES ('5931120157', 'OSPINA ARIAS JULIAN ESTEBAN', 58.00, 100.00, 72.00);
INSERT INTO public.lista VALUES ('5931120189', 'ARROYAVE ALVAREZ JULIAN EDUARDO', 96.00, 0.00, 88.00);
INSERT INTO public.lista VALUES ('5981120098', 'FORERO LONDOÑO SHIRLEY', 50.00, 56.00, 0.00);


--
-- TOC entry 3744 (class 0 OID 17834)
-- Dependencies: 220
-- Data for Name: materias; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.materias VALUES ('693', 'BASES DE DATOS');


--
-- TOC entry 3743 (class 0 OID 17829)
-- Dependencies: 219
-- Data for Name: profesores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.profesores VALUES ('2511', 'CARLOS ALBERTO', 'OCAMPO SEPULVEDA');


--
-- TOC entry 3742 (class 0 OID 17819)
-- Dependencies: 218
-- Data for Name: promedio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.promedio VALUES ('51712', 52.67, 'Perdido');
INSERT INTO public.promedio VALUES ('52606', 45.00, 'Perdido');
INSERT INTO public.promedio VALUES ('53159', 44.67, 'Perdido');
INSERT INTO public.promedio VALUES ('54270', 27.67, 'Perdido');
INSERT INTO public.promedio VALUES ('56477', 64.00, 'Aceptable');
INSERT INTO public.promedio VALUES ('57790', 40.33, 'Perdido');
INSERT INTO public.promedio VALUES ('57917', 58.33, 'Perdido');
INSERT INTO public.promedio VALUES ('69366', 72.33, 'Aceptable');
INSERT INTO public.promedio VALUES ('69404', 84.67, 'Bueno');
INSERT INTO public.promedio VALUES ('70035', 25.00, 'Perdido');
INSERT INTO public.promedio VALUES ('71947', 64.33, 'Aceptable');
INSERT INTO public.promedio VALUES ('72314', 43.67, 'Perdido');
INSERT INTO public.promedio VALUES ('72961', 74.33, 'Aceptable');
INSERT INTO public.promedio VALUES ('74248', 86.67, 'Bueno');
INSERT INTO public.promedio VALUES ('74402', 48.33, 'Perdido');
INSERT INTO public.promedio VALUES ('75543', 52.00, 'Perdido');
INSERT INTO public.promedio VALUES ('87667', 66.33, 'Aceptable');
INSERT INTO public.promedio VALUES ('93281', 37.00, 'Perdido');
INSERT INTO public.promedio VALUES ('96888', 55.67, 'Perdido');
INSERT INTO public.promedio VALUES ('165229', 60.00, 'Aceptable');
INSERT INTO public.promedio VALUES ('178919', 65.67, 'Aceptable');
INSERT INTO public.promedio VALUES ('179050', 72.67, 'Aceptable');
INSERT INTO public.promedio VALUES ('179781', 78.67, 'Aceptable');
INSERT INTO public.promedio VALUES ('179788', 87.67, 'Bueno');
INSERT INTO public.promedio VALUES ('179931', 77.67, 'Aceptable');
INSERT INTO public.promedio VALUES ('189242', 76.67, 'Aceptable');
INSERT INTO public.promedio VALUES ('263835', 79.33, 'Excelente');
INSERT INTO public.promedio VALUES ('338849', 73.33, 'Aceptable');
INSERT INTO public.promedio VALUES ('392212', 59.67, 'Perdido');
INSERT INTO public.promedio VALUES ('527755', 72.00, 'Aceptable');
INSERT INTO public.promedio VALUES ('527892', 92.33, 'Excelente');
INSERT INTO public.promedio VALUES ('528000', 86.00, 'Bueno');
INSERT INTO public.promedio VALUES ('540531', 73.00, 'Aceptable');
INSERT INTO public.promedio VALUES ('585749', 86.00, 'Bueno');
INSERT INTO public.promedio VALUES ('585757', 88.00, 'Bueno');
INSERT INTO public.promedio VALUES ('586217', 68.33, 'Aceptable');
INSERT INTO public.promedio VALUES ('601705', 61.67, 'Aceptable');
INSERT INTO public.promedio VALUES ('603149', 92.33, 'Excelente');
INSERT INTO public.promedio VALUES ('603277', 63.33, 'Aceptable');
INSERT INTO public.promedio VALUES ('712243', 85.67, 'Bueno');
INSERT INTO public.promedio VALUES ('750404', 76.33, 'Aceptable');
INSERT INTO public.promedio VALUES ('763924', 89.33, 'Bueno');
INSERT INTO public.promedio VALUES ('764377', 76.67, 'Aceptable');
INSERT INTO public.promedio VALUES ('765022', 59.67, 'Perdido');
INSERT INTO public.promedio VALUES ('765088', 78.00, 'Aceptable');
INSERT INTO public.promedio VALUES ('765264', 82.33, 'Bueno');
INSERT INTO public.promedio VALUES ('765274', 81.67, 'Bueno');
INSERT INTO public.promedio VALUES ('765764', 89.67, 'Bueno');
INSERT INTO public.promedio VALUES ('766142', 81.67, 'Bueno');
INSERT INTO public.promedio VALUES ('766725', 90.67, 'Excelente');
INSERT INTO public.promedio VALUES ('766861', 90.00, 'Bueno');
INSERT INTO public.promedio VALUES ('766933', 92.00, 'Excelente');
INSERT INTO public.promedio VALUES ('767101', 60.00, 'Aceptable');
INSERT INTO public.promedio VALUES ('767175', 87.33, 'Bueno');
INSERT INTO public.promedio VALUES ('767828', 95.33, 'Excelente');
INSERT INTO public.promedio VALUES ('5261120151', 62.67, 'Aceptable');
INSERT INTO public.promedio VALUES ('5931120009', 48.00, 'Perdido');
INSERT INTO public.promedio VALUES ('5931120014', 68.00, 'Aceptable');
INSERT INTO public.promedio VALUES ('5931120015', 38.00, 'Perdido');
INSERT INTO public.promedio VALUES ('5931120019', 65.00, 'Aceptable');
INSERT INTO public.promedio VALUES ('5931120020', 23.67, 'Perdido');
INSERT INTO public.promedio VALUES ('5931120028', 75.00, 'Aceptable');
INSERT INTO public.promedio VALUES ('5931120029', 49.33, 'Perdido');
INSERT INTO public.promedio VALUES ('5931120030', 58.33, 'Perdido');
INSERT INTO public.promedio VALUES ('5931120052', 45.67, 'Perdido');
INSERT INTO public.promedio VALUES ('5931120053', 23.00, 'Perdido');
INSERT INTO public.promedio VALUES ('5931120081', 6.67, 'Perdido');
INSERT INTO public.promedio VALUES ('5931120082', 53.00, 'Perdido');
INSERT INTO public.promedio VALUES ('5931120099', 73.67, 'Aceptable');
INSERT INTO public.promedio VALUES ('5931120100', 54.67, 'Perdido');
INSERT INTO public.promedio VALUES ('5931120103', 48.67, 'Perdido');
INSERT INTO public.promedio VALUES ('5931120111', 86.67, 'Bueno');
INSERT INTO public.promedio VALUES ('5931120112', 61.33, 'Aceptable');
INSERT INTO public.promedio VALUES ('5931120115', 63.00, 'Aceptable');
INSERT INTO public.promedio VALUES ('5931120117', 98.33, 'Excelente');
INSERT INTO public.promedio VALUES ('5931120139', 58.67, 'Perdido');
INSERT INTO public.promedio VALUES ('5931120155', 42.00, 'Perdido');
INSERT INTO public.promedio VALUES ('5931120156', 69.00, 'Aceptable');
INSERT INTO public.promedio VALUES ('5931120157', 76.67, 'Aceptable');
INSERT INTO public.promedio VALUES ('5931120189', 61.33, 'Aceptable');
INSERT INTO public.promedio VALUES ('5981120098', 35.33, 'Perdido');


--
-- TOC entry 3757 (class 0 OID 0)
-- Dependencies: 223
-- Name: clases_id_clase_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clases_id_clase_seq', 9, true);


--
-- TOC entry 3758 (class 0 OID 0)
-- Dependencies: 221
-- Name: dias_id_dia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dias_id_dia_seq', 10, true);


--
-- TOC entry 3591 (class 2606 OID 17852)
-- Name: clases clases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases
    ADD CONSTRAINT clases_pkey PRIMARY KEY (id_clase);


--
-- TOC entry 3589 (class 2606 OID 17845)
-- Name: dias dias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dias
    ADD CONSTRAINT dias_pkey PRIMARY KEY (id_dia);


--
-- TOC entry 3581 (class 2606 OID 17818)
-- Name: lista lista_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lista
    ADD CONSTRAINT lista_pkey PRIMARY KEY (matricula);


--
-- TOC entry 3587 (class 2606 OID 17838)
-- Name: materias materias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.materias
    ADD CONSTRAINT materias_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3585 (class 2606 OID 17833)
-- Name: profesores profesores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesores
    ADD CONSTRAINT profesores_pkey PRIMARY KEY (codigo);


--
-- TOC entry 3583 (class 2606 OID 17823)
-- Name: promedio promedio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promedio
    ADD CONSTRAINT promedio_pkey PRIMARY KEY (matricula);


--
-- TOC entry 3593 (class 2606 OID 17858)
-- Name: clases clases_codigo_materia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases
    ADD CONSTRAINT clases_codigo_materia_fkey FOREIGN KEY (codigo_materia) REFERENCES public.materias(codigo);


--
-- TOC entry 3594 (class 2606 OID 17853)
-- Name: clases clases_codigo_profesor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases
    ADD CONSTRAINT clases_codigo_profesor_fkey FOREIGN KEY (codigo_profesor) REFERENCES public.profesores(codigo);


--
-- TOC entry 3595 (class 2606 OID 17863)
-- Name: clases clases_id_dia_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clases
    ADD CONSTRAINT clases_id_dia_fkey FOREIGN KEY (id_dia) REFERENCES public.dias(id_dia);


--
-- TOC entry 3592 (class 2606 OID 17824)
-- Name: promedio fk_promedio_lista; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promedio
    ADD CONSTRAINT fk_promedio_lista FOREIGN KEY (matricula) REFERENCES public.lista(matricula) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2025-10-22 13:09:22 -05

--
-- PostgreSQL database dump complete
--

