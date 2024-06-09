--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_cluster_id integer NOT NULL,
    age_in_billions_of_years numeric,
    is_spherical boolean,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_cluster (
    galaxy_cluster_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_billions_of_years numeric,
    description text,
    number_of_galaxies integer,
    distance_to_earth_mly integer
);


ALTER TABLE public.galaxy_cluster OWNER TO freecodecamp;

--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_cluster_galaxy_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_cluster_galaxy_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_cluster_galaxy_cluster_id_seq OWNED BY public.galaxy_cluster.galaxy_cluster_id;


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_billions_of_years numeric,
    is_spherical boolean,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_billions_of_years numeric,
    has_life boolean,
    is_spherical boolean,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_billions_of_years numeric,
    is_spherical boolean,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_cluster galaxy_cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster ALTER COLUMN galaxy_cluster_id SET DEFAULT nextval('public.galaxy_cluster_galaxy_cluster_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Vía Láctea', 1, 13.5, false, 'Espiral barrada');
INSERT INTO public.galaxy VALUES (2, 'Andrómeda', 1, 10.0, false, 'Espiral');
INSERT INTO public.galaxy VALUES (3, 'Triángulo', 1, 5.0, false, 'Espiral');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 2, 13.2, false, 'Espiral');
INSERT INTO public.galaxy VALUES (5, 'Remolino', 2, 8.0, false, 'Espiral');
INSERT INTO public.galaxy VALUES (6, 'Ojo Negro', 2, 12.0, false, 'Espiral');


--
-- Data for Name: galaxy_cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_cluster VALUES (1, 'Grupo Local', 13.2, 'Pequeño y cercano', 54, 0);
INSERT INTO public.galaxy_cluster VALUES (2, 'Cúmulo de Virgo', 15.9, 'Masivo y denso', 1300, 54);
INSERT INTO public.galaxy_cluster VALUES (3, 'Cúmulo de Coma', 17.0, 'Gran concentración', 1000, 321);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Io', 4.5, true, 'Volcánica activa');
INSERT INTO public.moon VALUES (2, 1, 'Europa', 4.5, true, 'Hielo superficie');
INSERT INTO public.moon VALUES (3, 1, 'Ganimedes', 4.5, true, 'Más grande');
INSERT INTO public.moon VALUES (4, 1, 'Calisto', 4.5, true, 'Cráteres antiguos');
INSERT INTO public.moon VALUES (5, 2, 'Titán', 4.5, true, 'Atmósfera densa');
INSERT INTO public.moon VALUES (6, 2, 'Encélado', 4.5, true, 'Geiseres activos');
INSERT INTO public.moon VALUES (7, 2, 'Mimas', 4.5, true, 'Gran cráter');
INSERT INTO public.moon VALUES (8, 2, 'Rea', 4.5, true, 'Helada superficie');
INSERT INTO public.moon VALUES (9, 3, 'Fobos', 4.5, true, 'Órbita rápida');
INSERT INTO public.moon VALUES (10, 3, 'Deimos', 4.5, true, 'Pequeña roca');
INSERT INTO public.moon VALUES (11, 4, 'Tritón', 4.5, true, 'Órbita retrógrada');
INSERT INTO public.moon VALUES (12, 5, 'Caronte', 4.5, true, 'Sistema binario');
INSERT INTO public.moon VALUES (13, 7, 'Luna1', 4.5, true, 'Hielo volcánico');
INSERT INTO public.moon VALUES (14, 7, 'Luna2', 4.5, true, 'Cráteres profundos');
INSERT INTO public.moon VALUES (15, 8, 'Luna3', 4.5, true, 'Órbita excéntrica');
INSERT INTO public.moon VALUES (16, 8, 'Luna4', 4.5, true, 'Geiseres activos');
INSERT INTO public.moon VALUES (17, 9, 'Luna5', 4.5, true, 'Oscura superficie');
INSERT INTO public.moon VALUES (18, 9, 'Luna6', 4.5, true, 'Volcánica activa');
INSERT INTO public.moon VALUES (19, 10, 'Luna7', 4.5, true, 'Hielo superficie');
INSERT INTO public.moon VALUES (20, 10, 'Luna8', 4.5, true, 'Cráteres grandes');
INSERT INTO public.moon VALUES (21, 11, 'Luna9', 4.5, true, 'Órbita retrógrada');
INSERT INTO public.moon VALUES (22, 11, 'Luna10', 4.5, true, 'Geografía diversa');
INSERT INTO public.moon VALUES (23, 12, 'Luna11', 4.5, true, 'Helada superficie');
INSERT INTO public.moon VALUES (24, 12, 'Luna12', 4.5, true, 'Gran cráter');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Júpiter', 4.5, true, true, 'Gigante gaseoso');
INSERT INTO public.planet VALUES (2, 1, 'Saturno', 4.5, true, true, 'Gigante gaseoso');
INSERT INTO public.planet VALUES (3, 1, 'Marte', 4.5, true, true, 'Planeta rocoso');
INSERT INTO public.planet VALUES (4, 1, 'Neptuno', 4.5, true, true, 'Gigante gaseoso');
INSERT INTO public.planet VALUES (5, 1, 'Plutón', 4.5, true, true, 'Planeta enano');
INSERT INTO public.planet VALUES (6, 2, 'AlphaCentauriB', 4.5, true, true, 'Planeta rocoso');
INSERT INTO public.planet VALUES (7, 4, 'ProcyonB', 1.0, true, true, 'Gigante helado');
INSERT INTO public.planet VALUES (8, 4, 'Planeta1', 4.5, true, true, 'Gigante helado');
INSERT INTO public.planet VALUES (9, 4, 'Planeta2', 4.5, true, true, 'Planeta rocoso');
INSERT INTO public.planet VALUES (10, 4, 'Planeta3', 4.5, true, true, 'Planeta enano');
INSERT INTO public.planet VALUES (11, 5, 'Planeta4', 4.5, true, true, 'Gigante helado');
INSERT INTO public.planet VALUES (12, 5, 'Planeta5', 4.5, true, true, 'Planeta rocoso');
INSERT INTO public.planet VALUES (13, 5, 'Planeta6', 4.5, true, true, 'Planeta enano');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sol', 4.6, true, 'Enana amarilla');
INSERT INTO public.star VALUES (2, 1, 'Sirius', 0.3, true, 'Enana blanca');
INSERT INTO public.star VALUES (3, 1, 'Procyon', 1.0, true, 'Enana blanca');
INSERT INTO public.star VALUES (4, 2, 'Helios', 5.0, true, 'Gigante roja');
INSERT INTO public.star VALUES (5, 3, 'Vega', 3.0, true, 'Enana blanca');
INSERT INTO public.star VALUES (6, 4, 'Altair', 1.2, true, 'Enana blanca');


--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_cluster_galaxy_cluster_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 24, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy_cluster galaxy_cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster
    ADD CONSTRAINT galaxy_cluster_name_key UNIQUE (name);


--
-- Name: galaxy_cluster galaxy_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster
    ADD CONSTRAINT galaxy_cluster_pkey PRIMARY KEY (galaxy_cluster_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_galaxy_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_cluster_id_fkey FOREIGN KEY (galaxy_cluster_id) REFERENCES public.galaxy_cluster(galaxy_cluster_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

