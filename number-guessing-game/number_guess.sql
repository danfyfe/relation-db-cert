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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    total_turns integer,
    user_id integer,
    number_to_guess integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(30),
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 5, 1, 792);
INSERT INTO public.games VALUES (2, 217, 4, 216);
INSERT INTO public.games VALUES (3, 213, 5, 212);
INSERT INTO public.games VALUES (4, 397, 4, 394);
INSERT INTO public.games VALUES (5, 326, 4, 324);
INSERT INTO public.games VALUES (6, 452, 4, 451);
INSERT INTO public.games VALUES (7, 799, 6, 798);
INSERT INTO public.games VALUES (8, 682, 7, 681);
INSERT INTO public.games VALUES (9, 553, 6, 550);
INSERT INTO public.games VALUES (10, 991, 6, 989);
INSERT INTO public.games VALUES (11, 482, 6, 481);
INSERT INTO public.games VALUES (12, 4, 1, 929);
INSERT INTO public.games VALUES (13, 2, 1, 297);
INSERT INTO public.games VALUES (14, 3, 1, 17);
INSERT INTO public.games VALUES (15, 876, 14, 875);
INSERT INTO public.games VALUES (16, 518, 15, 517);
INSERT INTO public.games VALUES (17, 783, 14, 780);
INSERT INTO public.games VALUES (18, 923, 14, 921);
INSERT INTO public.games VALUES (19, 136, 14, 135);
INSERT INTO public.games VALUES (20, 7, 19, 816);
INSERT INTO public.games VALUES (21, 656, 20, 655);
INSERT INTO public.games VALUES (22, 368, 20, 367);
INSERT INTO public.games VALUES (23, 85, 21, 84);
INSERT INTO public.games VALUES (24, 552, 21, 551);
INSERT INTO public.games VALUES (25, 118, 20, 115);
INSERT INTO public.games VALUES (26, 202, 20, 200);
INSERT INTO public.games VALUES (27, 637, 20, 636);
INSERT INTO public.games VALUES (28, 641, 22, 640);
INSERT INTO public.games VALUES (29, 78, 22, 77);
INSERT INTO public.games VALUES (30, 499, 23, 498);
INSERT INTO public.games VALUES (31, 384, 23, 383);
INSERT INTO public.games VALUES (32, 974, 22, 971);
INSERT INTO public.games VALUES (33, 892, 22, 890);
INSERT INTO public.games VALUES (34, 102, 22, 101);
INSERT INTO public.games VALUES (35, 364, 24, 363);
INSERT INTO public.games VALUES (36, 298, 24, 297);
INSERT INTO public.games VALUES (37, 764, 25, 763);
INSERT INTO public.games VALUES (38, 821, 25, 820);
INSERT INTO public.games VALUES (39, 345, 24, 342);
INSERT INTO public.games VALUES (40, 621, 24, 619);
INSERT INTO public.games VALUES (41, 13, 24, 12);
INSERT INTO public.games VALUES (42, 593, 26, 592);
INSERT INTO public.games VALUES (43, 464, 26, 463);
INSERT INTO public.games VALUES (44, 137, 27, 136);
INSERT INTO public.games VALUES (45, 406, 27, 405);
INSERT INTO public.games VALUES (46, 565, 26, 562);
INSERT INTO public.games VALUES (47, 421, 26, 419);
INSERT INTO public.games VALUES (48, 799, 26, 798);
INSERT INTO public.games VALUES (49, 775, 28, 774);
INSERT INTO public.games VALUES (50, 158, 28, 157);
INSERT INTO public.games VALUES (51, 700, 29, 699);
INSERT INTO public.games VALUES (52, 833, 29, 832);
INSERT INTO public.games VALUES (53, 675, 28, 672);
INSERT INTO public.games VALUES (54, 566, 28, 564);
INSERT INTO public.games VALUES (55, 372, 28, 371);
INSERT INTO public.games VALUES (56, 6, 1, 358);
INSERT INTO public.games VALUES (57, 5, 30, 112);
INSERT INTO public.games VALUES (58, 6, 30, 260);
INSERT INTO public.games VALUES (59, 95, 31, 94);
INSERT INTO public.games VALUES (60, 532, 31, 531);
INSERT INTO public.games VALUES (61, 504, 32, 503);
INSERT INTO public.games VALUES (62, 255, 32, 254);
INSERT INTO public.games VALUES (63, 370, 31, 367);
INSERT INTO public.games VALUES (64, 961, 31, 959);
INSERT INTO public.games VALUES (65, 772, 31, 771);
INSERT INTO public.games VALUES (66, 3, 30, 944);
INSERT INTO public.games VALUES (67, 9, 30, 610);
INSERT INTO public.games VALUES (68, 5, 33, 482);
INSERT INTO public.games VALUES (69, 177, 34, 176);
INSERT INTO public.games VALUES (70, 906, 34, 905);
INSERT INTO public.games VALUES (71, 507, 35, 506);
INSERT INTO public.games VALUES (72, 130, 35, 129);
INSERT INTO public.games VALUES (73, 571, 34, 568);
INSERT INTO public.games VALUES (74, 324, 34, 322);
INSERT INTO public.games VALUES (75, 795, 34, 794);
INSERT INTO public.games VALUES (76, 671, 36, 670);
INSERT INTO public.games VALUES (77, 563, 36, 562);
INSERT INTO public.games VALUES (78, 948, 37, 947);
INSERT INTO public.games VALUES (79, 447, 37, 446);
INSERT INTO public.games VALUES (80, 843, 36, 840);
INSERT INTO public.games VALUES (81, 37, 36, 35);
INSERT INTO public.games VALUES (82, 280, 36, 279);
INSERT INTO public.games VALUES (83, 179, 38, 178);
INSERT INTO public.games VALUES (84, 187, 38, 186);
INSERT INTO public.games VALUES (85, 567, 39, 566);
INSERT INTO public.games VALUES (86, 704, 39, 703);
INSERT INTO public.games VALUES (87, 505, 38, 502);
INSERT INTO public.games VALUES (88, 712, 38, 710);
INSERT INTO public.games VALUES (89, 170, 38, 169);
INSERT INTO public.games VALUES (90, 192, 40, 191);
INSERT INTO public.games VALUES (91, 675, 40, 674);
INSERT INTO public.games VALUES (92, 221, 41, 220);
INSERT INTO public.games VALUES (93, 513, 41, 512);
INSERT INTO public.games VALUES (94, 340, 40, 337);
INSERT INTO public.games VALUES (95, 916, 40, 914);
INSERT INTO public.games VALUES (96, 62, 40, 61);
INSERT INTO public.games VALUES (97, 15, 42, 14);
INSERT INTO public.games VALUES (98, 47, 42, 46);
INSERT INTO public.games VALUES (99, 296, 43, 295);
INSERT INTO public.games VALUES (100, 76, 43, 75);
INSERT INTO public.games VALUES (101, 29, 42, 26);
INSERT INTO public.games VALUES (102, 476, 42, 474);
INSERT INTO public.games VALUES (103, 380, 42, 379);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'Dan', 0, NULL);
INSERT INTO public.users VALUES (2, 'user_1710184648447', 0, NULL);
INSERT INTO public.users VALUES (3, 'user_1710184648446', 0, NULL);
INSERT INTO public.users VALUES (4, 'user_1710184710453', 0, NULL);
INSERT INTO public.users VALUES (5, 'user_1710184710452', 0, NULL);
INSERT INTO public.users VALUES (6, 'user_1710184725757', 0, NULL);
INSERT INTO public.users VALUES (7, 'user_1710184725756', 0, NULL);
INSERT INTO public.users VALUES (8, 'Jim', 0, NULL);
INSERT INTO public.users VALUES (9, 'Bob', 0, NULL);
INSERT INTO public.users VALUES (10, 'Apple', 0, NULL);
INSERT INTO public.users VALUES (11, 'user_1710184909083', 0, NULL);
INSERT INTO public.users VALUES (12, 'user_1710184909082', 0, NULL);
INSERT INTO public.users VALUES (13, 'Banana', 0, NULL);
INSERT INTO public.users VALUES (14, 'user_1710185016940', 0, NULL);
INSERT INTO public.users VALUES (15, 'user_1710185016939', 0, NULL);
INSERT INTO public.users VALUES (16, 'Danny', 0, NULL);
INSERT INTO public.users VALUES (17, 'new', 0, NULL);
INSERT INTO public.users VALUES (18, 'test', 0, NULL);
INSERT INTO public.users VALUES (19, 'test2', 0, NULL);
INSERT INTO public.users VALUES (20, 'user_1710185354652', 0, NULL);
INSERT INTO public.users VALUES (21, 'user_1710185354651', 0, NULL);
INSERT INTO public.users VALUES (22, 'user_1710185397405', 0, NULL);
INSERT INTO public.users VALUES (23, 'user_1710185397404', 0, NULL);
INSERT INTO public.users VALUES (24, 'user_1710185408312', 0, NULL);
INSERT INTO public.users VALUES (25, 'user_1710185408311', 0, NULL);
INSERT INTO public.users VALUES (26, 'user_1710185419181', 0, NULL);
INSERT INTO public.users VALUES (27, 'user_1710185419180', 0, NULL);
INSERT INTO public.users VALUES (28, 'user_1710185466221', 0, NULL);
INSERT INTO public.users VALUES (29, 'user_1710185466220', 0, NULL);
INSERT INTO public.users VALUES (30, 'QQ', 0, NULL);
INSERT INTO public.users VALUES (31, 'user_1710185846130', 0, NULL);
INSERT INTO public.users VALUES (32, 'user_1710185846129', 0, NULL);
INSERT INTO public.users VALUES (33, 'New Test', 0, NULL);
INSERT INTO public.users VALUES (34, 'user_1710185912317', 0, NULL);
INSERT INTO public.users VALUES (35, 'user_1710185912316', 0, NULL);
INSERT INTO public.users VALUES (36, 'user_1710185933844', 0, NULL);
INSERT INTO public.users VALUES (37, 'user_1710185933843', 0, NULL);
INSERT INTO public.users VALUES (38, 'user_1710185975116', 0, NULL);
INSERT INTO public.users VALUES (39, 'user_1710185975115', 0, NULL);
INSERT INTO public.users VALUES (40, 'user_1710185987269', 0, NULL);
INSERT INTO public.users VALUES (41, 'user_1710185987268', 0, NULL);
INSERT INTO public.users VALUES (42, 'user_1710186007919', 0, NULL);
INSERT INTO public.users VALUES (43, 'user_1710186007918', 0, NULL);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 103, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 43, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

