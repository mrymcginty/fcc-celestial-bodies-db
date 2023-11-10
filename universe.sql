--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    star integer,
    constellation character varying(40),
    year_discovered numeric(4,0)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    distance_from_earth integer,
    planet_id integer,
    description text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    distance_from_earth numeric(5,2),
    age_in_millions_of_years numeric(5,2),
    description text,
    has_life boolean,
    is_spherical boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: spaceships; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spaceships (
    spaceships_id integer NOT NULL,
    name character varying(30),
    num_passengers integer NOT NULL
);


ALTER TABLE public.spaceships OWNER TO freecodecamp;

--
-- Name: spaceships_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spaceships_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spaceships_id_seq OWNER TO freecodecamp;

--
-- Name: spaceships_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spaceships_id_seq OWNED BY public.spaceships.spaceships_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer,
    constellation character varying(30),
    description text,
    mass numeric(2,2)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: spaceships spaceships_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceships ALTER COLUMN spaceships_id SET DEFAULT nextval('public.spaceships_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('milky way', 1, 'The Milky Way is the galaxy that includes the solar system.', 3, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Andromeda Galaxy', 2, 'The closest big galaxy to the Milky Way', 2, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Antennae Galaxies', 3, 'Appearance is similar to an insect''s antennae.', 1, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Black Eye Galaxy', 4, 'It has a spectacular dark band of absorbing dust in front of the galaxy''s bright nucleus', 4, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Bode''s Galaxy', 5, 'Named for Johann Elert Bode who discovered this galaxy in 1774.', 5, NULL, NULL);
INSERT INTO public.galaxy VALUES ('Butterfly Galaxies', 6, 'Looks are similar to a butterfly.', 6, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('The Moon', 1, NULL, 11, NULL);
INSERT INTO public.moon VALUES ('Phobos', 2, NULL, 3, NULL);
INSERT INTO public.moon VALUES ('Deimos', 3, NULL, 3, NULL);
INSERT INTO public.moon VALUES ('Adrastea', 5, NULL, 4, NULL);
INSERT INTO public.moon VALUES ('Metis', 4, NULL, 4, NULL);
INSERT INTO public.moon VALUES ('Amalthea', 6, NULL, 4, NULL);
INSERT INTO public.moon VALUES ('Thebe', 7, NULL, 4, NULL);
INSERT INTO public.moon VALUES ('Io', 8, NULL, 4, NULL);
INSERT INTO public.moon VALUES ('Europa', 9, NULL, 4, NULL);
INSERT INTO public.moon VALUES ('Ganymede', 10, NULL, 4, NULL);
INSERT INTO public.moon VALUES ('Mimas', 11, NULL, 5, NULL);
INSERT INTO public.moon VALUES ('Enceladus', 12, NULL, 5, NULL);
INSERT INTO public.moon VALUES ('Tethys', 13, NULL, 5, NULL);
INSERT INTO public.moon VALUES ('Dione', 14, NULL, 5, NULL);
INSERT INTO public.moon VALUES ('Rhea', 15, NULL, 5, NULL);
INSERT INTO public.moon VALUES ('Titan', 16, NULL, 5, NULL);
INSERT INTO public.moon VALUES ('Iapetus', 17, NULL, 5, NULL);
INSERT INTO public.moon VALUES ('Cordelia', 18, NULL, 6, NULL);
INSERT INTO public.moon VALUES ('Ophelia', 19, NULL, 6, NULL);
INSERT INTO public.moon VALUES ('Bianca', 20, NULL, 6, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Venus', 1, 39.79, 4.50, 'venus lorem ipsum', false, true, 1);
INSERT INTO public.planet VALUES ('Mercury', 2, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Mars', 3, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Jupiter', 4, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Saturn', 5, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Uranus', 6, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Pluto', 7, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Neptune', 8, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Ceres', 9, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Orcus', 10, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Earth', 11, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Haumea', 12, NULL, NULL, NULL, NULL, NULL, 1);


--
-- Data for Name: spaceships; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spaceships VALUES (1, 'Imperial shuttle', 1000);
INSERT INTO public.spaceships VALUES (2, 'Milennium Falcon', 6);
INSERT INTO public.spaceships VALUES (3, 'Death Star', 1000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Lynx', 1, 1, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('Eridanus', 2, 2, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('Eridanus', 3, 3, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('Cassiopeia', 4, 4, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('Scorpius', 5, 5, NULL, NULL, NULL);
INSERT INTO public.star VALUES ('Crux', 6, 6, NULL, NULL, NULL);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: spaceships_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spaceships_id_seq', 3, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: spaceships spaceships_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceships
    ADD CONSTRAINT spaceships_name_key UNIQUE (name);


--
-- Name: spaceships spaceships_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceships
    ADD CONSTRAINT spaceships_pkey PRIMARY KEY (spaceships_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


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

