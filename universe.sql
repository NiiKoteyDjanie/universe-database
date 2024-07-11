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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(255) NOT NULL,
    composition character varying(100),
    orbit_period integer NOT NULL,
    is_potentially_hazardous boolean NOT NULL,
    discovered_by character varying(100) NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    distance_from_earth integer NOT NULL
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
    name character varying(255) NOT NULL,
    radius integer NOT NULL,
    planet_id integer,
    has_atmosphere boolean NOT NULL,
    composition character varying(100) NOT NULL
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
    name character varying(255) NOT NULL,
    has_life boolean NOT NULL,
    type character varying(100),
    distance_from_star integer NOT NULL,
    star_id integer,
    orbital_period integer NOT NULL
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
    name character varying(255) NOT NULL,
    type character varying(100),
    is_spherical boolean NOT NULL,
    mass numeric NOT NULL,
    galaxy_id integer,
    luminosity numeric NOT NULL
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'Rocky', 1680, false, 'Giuseppe Piazzi');
INSERT INTO public.asteroid VALUES (2, 'Pallas', 'Rocky', 1680, false, 'Heinrich Wilhelm Olbers');
INSERT INTO public.asteroid VALUES (3, 'Vesta', 'Rocky', 1325, false, 'Heinrich Wilhelm Olbers');
INSERT INTO public.asteroid VALUES (4, 'Eros', 'Rocky', 643, true, 'Carl Gustav Witt');
INSERT INTO public.asteroid VALUES (5, 'Itokawa', 'Rocky', 556, true, 'LINEAR');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our galaxy', true, 13600, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest galaxy', false, 10100, 2537000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third largest in local group', false, 12000, 3000000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Interacting with nearby galaxy', false, 420, 23000000);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 'Spiral galaxy', false, 14000, 21000000);
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 'Lenticular galaxy', false, 500, 500000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737, 1, false, 'Rocky');
INSERT INTO public.moon VALUES (2, 'Phobos', 11, 2, false, 'Rocky');
INSERT INTO public.moon VALUES (3, 'Deimos', 6, 2, false, 'Rocky');
INSERT INTO public.moon VALUES (4, 'Io', 1821, 3, true, 'Sulfuric');
INSERT INTO public.moon VALUES (5, 'Europa', 1560, 3, true, 'Icy');
INSERT INTO public.moon VALUES (6, 'Ganymede', 2634, 3, true, 'Icy');
INSERT INTO public.moon VALUES (7, 'Callisto', 2410, 3, true, 'Icy');
INSERT INTO public.moon VALUES (8, 'Titan', 2576, 4, true, 'Nitrogen-rich');
INSERT INTO public.moon VALUES (9, 'Rhea', 763, 4, true, 'Icy');
INSERT INTO public.moon VALUES (10, 'Iapetus', 735, 4, true, 'Icy');
INSERT INTO public.moon VALUES (11, 'Dione', 561, 4, true, 'Icy');
INSERT INTO public.moon VALUES (12, 'Triton', 1353, 5, true, 'Icy');
INSERT INTO public.moon VALUES (13, 'Nereid', 170, 5, false, 'Icy');
INSERT INTO public.moon VALUES (14, 'Proxima Centauri b I', 100, 6, false, 'Rocky');
INSERT INTO public.moon VALUES (15, 'Proxima Centauri c I', 50, 7, false, 'Rocky');
INSERT INTO public.moon VALUES (16, 'Sirius B I', 200, 8, false, 'Rocky');
INSERT INTO public.moon VALUES (17, 'Sirius A I', 300, 9, false, 'Rocky');
INSERT INTO public.moon VALUES (18, 'Betelgeuse B I', 400, 10, false, 'Rocky');
INSERT INTO public.moon VALUES (19, 'Vega B I', 500, 11, false, 'Rocky');
INSERT INTO public.moon VALUES (20, 'Rigel B I', 600, 12, false, 'Rocky');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 'Terrestrial', 1, 1, 365);
INSERT INTO public.planet VALUES (2, 'Mars', false, 'Terrestrial', 2, 1, 687);
INSERT INTO public.planet VALUES (3, 'Jupiter', false, 'Gas giant', 5, 1, 4333);
INSERT INTO public.planet VALUES (4, 'Saturn', false, 'Gas giant', 10, 1, 10759);
INSERT INTO public.planet VALUES (5, 'Neptune', false, 'Ice giant', 30, 1, 60190);
INSERT INTO public.planet VALUES (6, 'Proxima Centauri b', false, 'Terrestrial', 0, 2, 11);
INSERT INTO public.planet VALUES (7, 'Proxima Centauri c', false, 'Gas giant', 2, 2, 1920);
INSERT INTO public.planet VALUES (8, 'Sirius B', false, 'White dwarf', 20, 3, 50);
INSERT INTO public.planet VALUES (9, 'Sirius A', false, 'Main sequence', 1, 3, 365);
INSERT INTO public.planet VALUES (10, 'Betelgeuse B', false, 'Neutron star', 30, 4, 10000);
INSERT INTO public.planet VALUES (11, 'Vega B', false, 'Brown dwarf', 15, 6, 3650);
INSERT INTO public.planet VALUES (12, 'Rigel B', false, 'Main sequence', 0, 5, 10);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type main-sequence', true, 1.0, 1, 1.0);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Red dwarf', true, 0.123, 2, 0.0017);
INSERT INTO public.star VALUES (3, 'Sirius', 'Main sequence', true, 2.063, 1, 25.4);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red supergiant', true, 11.6, 1, 126000);
INSERT INTO public.star VALUES (5, 'Rigel', 'Blue supergiant', true, 18, 1, 120000);
INSERT INTO public.star VALUES (6, 'Vega', 'Main sequence', true, 2.135, 1, 40.12);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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

