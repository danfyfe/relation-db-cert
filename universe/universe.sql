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
    distance_from_earth numeric(4,3),
    population integer,
    has_life boolean,
    description text,
    name character varying(30),
    will_be_gone_in_a_billion_years boolean NOT NULL,
    is_sphere boolean NOT NULL,
    nickname character varying(10)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

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
    population integer,
    has_atmosphere boolean,
    has_life boolean,
    description text,
    name character varying(30),
    will_be_gone_in_a_billion_years boolean NOT NULL,
    is_sphere boolean NOT NULL,
    nickname character varying(10),
    planet_id integer
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
-- Name: other_table; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.other_table (
    will_be_gone_in_a_billion_years boolean NOT NULL,
    is_sphere boolean NOT NULL,
    nickname character varying(10),
    other_table_id integer NOT NULL,
    name character varying(20)
);


ALTER TABLE public.other_table OWNER TO freecodecamp;

--
-- Name: other_table_other_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.other_table_other_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.other_table_other_id_seq OWNER TO freecodecamp;

--
-- Name: other_table_other_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.other_table_other_id_seq OWNED BY public.other_table.other_table_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    population integer,
    has_atmosphere boolean,
    has_life boolean,
    description text,
    name character varying(30),
    will_be_gone_in_a_billion_years boolean NOT NULL,
    is_sphere boolean NOT NULL,
    nickname character varying(10),
    star_id integer
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
    population integer,
    has_life boolean,
    description text,
    name character varying(30),
    will_be_gone_in_a_billion_years boolean NOT NULL,
    is_sphere boolean NOT NULL,
    nickname character varying(10),
    galaxy_id integer
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: other_table other_table_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_table ALTER COLUMN other_table_id SET DEFAULT nextval('public.other_table_other_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, NULL, 0, false, 'Hot galaxy 1', 'galaxy 1', false, true, 'galaxy1');
INSERT INTO public.galaxy VALUES (2, NULL, 0, false, 'Hot galaxy 2', 'galaxy 2', false, true, 'galaxy2');
INSERT INTO public.galaxy VALUES (3, NULL, 0, false, 'Hot galaxy 3', 'galaxy 3', false, true, 'galaxy3');
INSERT INTO public.galaxy VALUES (4, NULL, 0, false, 'Hot galaxy 4', 'galaxy 4', false, true, 'galaxy4');
INSERT INTO public.galaxy VALUES (5, NULL, 0, false, 'Hot galaxy 5', 'galaxy 5', false, true, 'galaxy5');
INSERT INTO public.galaxy VALUES (6, NULL, 0, false, 'Hot galaxy 6', 'galaxy 6', false, true, 'galaxy6');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (4, 0, NULL, false, 'Hot moon 1', 'moon 1', false, true, 'moon1', 7);
INSERT INTO public.moon VALUES (5, 0, NULL, false, 'Hot moon 2', 'moon 2', false, true, 'moon2', 8);
INSERT INTO public.moon VALUES (6, 0, NULL, false, 'Hot moon 3', 'moon 3', false, true, 'moon3', 9);
INSERT INTO public.moon VALUES (7, 0, NULL, false, 'Hot moon 4', 'moon 4', false, true, 'moon4', 10);
INSERT INTO public.moon VALUES (8, 0, NULL, false, 'Hot moon 5', 'moon 5', false, true, 'moon5', 11);
INSERT INTO public.moon VALUES (9, 0, NULL, false, 'Hot moon 6', 'moon 6', false, true, 'moon6', 12);
INSERT INTO public.moon VALUES (10, 0, NULL, false, 'Hot moon 7', 'moon 7', false, true, 'moon7', 16);
INSERT INTO public.moon VALUES (11, 0, NULL, false, 'Hot moon 8', 'moon 8', false, true, 'moon8', 17);
INSERT INTO public.moon VALUES (12, 0, NULL, false, 'Hot moon 9', 'moon 9', false, true, 'moon9', 18);
INSERT INTO public.moon VALUES (13, 0, NULL, false, 'Hot moon 10', 'moon 10', false, true, 'moon10', 19);
INSERT INTO public.moon VALUES (14, 0, NULL, false, 'Hot moon 11', 'moon 11', false, true, 'moon11', 20);
INSERT INTO public.moon VALUES (15, 0, NULL, false, 'Hot moon 12', 'moon 12', false, true, 'moon12', 21);
INSERT INTO public.moon VALUES (16, 0, NULL, false, 'Hot moon 13', 'moon 13', false, true, 'moon13', 7);
INSERT INTO public.moon VALUES (17, 0, NULL, false, 'Hot moon 14', 'moon 14', false, true, 'moon14', 8);
INSERT INTO public.moon VALUES (18, 0, NULL, false, 'Hot moon 15', 'moon 15', false, true, 'moon15', 9);
INSERT INTO public.moon VALUES (19, 0, NULL, false, 'Hot moon 16', 'moon 16', false, true, 'moon16', 10);
INSERT INTO public.moon VALUES (20, 0, NULL, false, 'Hot moon 17', 'moon 17', false, true, 'moon17', 11);
INSERT INTO public.moon VALUES (21, 0, NULL, false, 'Hot moon 18', 'moon 18', false, true, 'moon18', 12);
INSERT INTO public.moon VALUES (22, 0, NULL, false, 'Hot moon 19', 'moon 19', false, true, 'moon19', 16);
INSERT INTO public.moon VALUES (23, 0, NULL, false, 'Hot moon 20', 'moon 20', false, true, 'moon20', 17);


--
-- Data for Name: other_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.other_table VALUES (false, true, 'OTher 1', 1, NULL);
INSERT INTO public.other_table VALUES (false, true, 'OTher 2', 2, NULL);
INSERT INTO public.other_table VALUES (false, true, 'OTher 3', 3, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (7, 0, NULL, false, 'Hot planet 4', 'planet 4', false, true, 'planet4', 4);
INSERT INTO public.planet VALUES (8, 0, NULL, false, 'Hot planet 5', 'planet 5', false, true, 'planet5', 5);
INSERT INTO public.planet VALUES (9, 0, NULL, false, 'Hot planet 6', 'planet 6', false, true, 'planet6', 6);
INSERT INTO public.planet VALUES (10, 0, NULL, false, 'Hot planet 1', 'planet 1', false, true, 'planet1', 4);
INSERT INTO public.planet VALUES (11, 0, NULL, false, 'Hot planet 2', 'planet 2', false, true, 'planet2', 5);
INSERT INTO public.planet VALUES (12, 0, NULL, false, 'Hot planet 3', 'planet 3', false, true, 'planet3', 6);
INSERT INTO public.planet VALUES (16, 0, NULL, false, 'Hot planet 7', 'planet 7', false, true, 'planet7', 4);
INSERT INTO public.planet VALUES (17, 0, NULL, false, 'Hot planet 8', 'planet 8', false, true, 'planet8', 5);
INSERT INTO public.planet VALUES (18, 0, NULL, false, 'Hot planet 9', 'planet 9', false, true, 'planet9', 6);
INSERT INTO public.planet VALUES (19, 0, NULL, false, 'Hot planet 10', 'planet 10', false, true, 'planet10', 7);
INSERT INTO public.planet VALUES (20, 0, NULL, false, 'Hot planet 11', 'planet 11', false, true, 'planet11', 8);
INSERT INTO public.planet VALUES (21, 0, NULL, false, 'Hot planet 12', 'planet 12', false, true, 'planet12', 9);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (4, 0, false, 'Hot star 1', 'star 1', false, true, 'star1', 1);
INSERT INTO public.star VALUES (5, 0, false, 'Hot star 2', 'star 2', false, true, 'star2', 2);
INSERT INTO public.star VALUES (6, 0, false, 'Hot star 3', 'star 3', false, true, 'star3', 3);
INSERT INTO public.star VALUES (7, 0, false, 'Hot star 5', 'star 5', false, true, 'star5', 5);
INSERT INTO public.star VALUES (8, 0, false, 'Hot star 6', 'star 6', false, true, 'star6', 6);
INSERT INTO public.star VALUES (9, 0, false, 'Hot star 4', 'star 4', false, true, 'star4', 4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: other_table_other_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.other_table_other_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 21, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: galaxy galaxy_nickname_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_nickname_key UNIQUE (nickname);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_nickname_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_nickname_key UNIQUE (nickname);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: other_table other_table_nickname_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_table
    ADD CONSTRAINT other_table_nickname_key UNIQUE (nickname);


--
-- Name: other_table other_table_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_table
    ADD CONSTRAINT other_table_pkey PRIMARY KEY (other_table_id);


--
-- Name: planet planet_nickname_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_nickname_key UNIQUE (nickname);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_nickname_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_nickname_key UNIQUE (nickname);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

