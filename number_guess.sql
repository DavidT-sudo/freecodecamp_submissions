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
    username character varying(22),
    tries integer
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
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 'user_1701617022750', 186);
INSERT INTO public.games VALUES (2, 'user_1701617022750', 685);
INSERT INTO public.games VALUES (3, 'user_1701617022749', 576);
INSERT INTO public.games VALUES (4, 'user_1701617022749', 524);
INSERT INTO public.games VALUES (5, 'user_1701617022750', 321);
INSERT INTO public.games VALUES (6, 'user_1701617022750', 834);
INSERT INTO public.games VALUES (7, 'user_1701617022750', 83);
INSERT INTO public.games VALUES (8, 'user_1701617330160', 481);
INSERT INTO public.games VALUES (9, 'user_1701617330160', 258);
INSERT INTO public.games VALUES (10, 'user_1701617330159', 638);
INSERT INTO public.games VALUES (11, 'user_1701617330159', 590);
INSERT INTO public.games VALUES (12, 'user_1701617330160', 521);
INSERT INTO public.games VALUES (13, 'user_1701617330160', 364);
INSERT INTO public.games VALUES (14, 'user_1701617330160', 598);
INSERT INTO public.games VALUES (15, 'user_1701617378774', 765);
INSERT INTO public.games VALUES (16, 'user_1701617378774', 498);
INSERT INTO public.games VALUES (17, 'user_1701617378773', 260);
INSERT INTO public.games VALUES (18, 'user_1701617378773', 577);
INSERT INTO public.games VALUES (19, 'user_1701617378774', 503);
INSERT INTO public.games VALUES (20, 'user_1701617378774', 39);
INSERT INTO public.games VALUES (21, 'user_1701617378774', 903);
INSERT INTO public.games VALUES (22, 'user_1701617485894', 630);
INSERT INTO public.games VALUES (23, 'user_1701617485894', 195);
INSERT INTO public.games VALUES (24, 'user_1701617485893', 251);
INSERT INTO public.games VALUES (25, 'user_1701617485893', 966);
INSERT INTO public.games VALUES (26, 'user_1701617485894', 891);
INSERT INTO public.games VALUES (27, 'user_1701617485894', 736);
INSERT INTO public.games VALUES (28, 'user_1701617485894', 217);
INSERT INTO public.games VALUES (29, 'user_1701617519408', 837);
INSERT INTO public.games VALUES (30, 'user_1701617519408', 790);
INSERT INTO public.games VALUES (31, 'user_1701617519407', 335);
INSERT INTO public.games VALUES (32, 'user_1701617519407', 764);
INSERT INTO public.games VALUES (33, 'user_1701617519408', 346);
INSERT INTO public.games VALUES (34, 'user_1701617519408', 359);
INSERT INTO public.games VALUES (35, 'user_1701617519408', 934);
INSERT INTO public.games VALUES (36, 'Thuto', 1);
INSERT INTO public.games VALUES (37, 'Thuto', 14);
INSERT INTO public.games VALUES (38, 'Papi', 15);
INSERT INTO public.games VALUES (39, 'user_1701618361431', 268);
INSERT INTO public.games VALUES (40, 'user_1701618361431', 700);
INSERT INTO public.games VALUES (41, 'user_1701618361430', 493);
INSERT INTO public.games VALUES (42, 'user_1701618361430', 155);
INSERT INTO public.games VALUES (43, 'user_1701618361431', 476);
INSERT INTO public.games VALUES (44, 'user_1701618361431', 364);
INSERT INTO public.games VALUES (45, 'user_1701618361431', 442);
INSERT INTO public.games VALUES (46, 'user_1701618419175', 556);
INSERT INTO public.games VALUES (47, 'user_1701618419175', 32);
INSERT INTO public.games VALUES (48, 'user_1701618419174', 325);
INSERT INTO public.games VALUES (49, 'user_1701618419174', 525);
INSERT INTO public.games VALUES (50, 'user_1701618419175', 272);
INSERT INTO public.games VALUES (51, 'user_1701618419175', 326);
INSERT INTO public.games VALUES (52, 'user_1701618419175', 615);
INSERT INTO public.games VALUES (53, 'user_1701618496927', 757);
INSERT INTO public.games VALUES (54, 'user_1701618496927', 522);
INSERT INTO public.games VALUES (55, 'user_1701618496926', 340);
INSERT INTO public.games VALUES (56, 'user_1701618496926', 694);
INSERT INTO public.games VALUES (57, 'user_1701618496927', 607);
INSERT INTO public.games VALUES (58, 'user_1701618496927', 405);
INSERT INTO public.games VALUES (59, 'user_1701618496927', 221);
INSERT INTO public.games VALUES (60, 'user_1701618534269', 76);
INSERT INTO public.games VALUES (61, 'user_1701618534269', 138);
INSERT INTO public.games VALUES (62, 'user_1701618534268', 617);
INSERT INTO public.games VALUES (63, 'user_1701618534268', 184);
INSERT INTO public.games VALUES (64, 'user_1701618534269', 600);
INSERT INTO public.games VALUES (65, 'user_1701618534269', 503);
INSERT INTO public.games VALUES (66, 'user_1701618534269', 543);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 66, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- PostgreSQL database dump complete
--

