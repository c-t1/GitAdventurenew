--
-- PostgreSQL database dump
--

\restrict jmciTfNjSDxTEn5qTfIf7C7qPdnGO9NjASib9Xtrnva0EWuiitEb40dkPdF5HvU

-- Dumped from database version 14.19 (Ubuntu 14.19-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.19 (Ubuntu 14.19-0ubuntu0.22.04.1)

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
-- Name: categories; Type: TABLE; Schema: public; Owner: carlos
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.categories OWNER TO carlos;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO carlos;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: game_referees; Type: TABLE; Schema: public; Owner: carlos
--

CREATE TABLE public.game_referees (
    game_id integer NOT NULL,
    referee_id integer NOT NULL,
    role text
);


ALTER TABLE public.game_referees OWNER TO carlos;

--
-- Name: games; Type: TABLE; Schema: public; Owner: carlos
--

CREATE TABLE public.games (
    id integer NOT NULL,
    season_id integer NOT NULL,
    home_team_id integer NOT NULL,
    away_team_id integer NOT NULL,
    played_on date NOT NULL,
    home_score integer DEFAULT 0 NOT NULL,
    away_score integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.games OWNER TO carlos;

--
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE public.games_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_id_seq OWNER TO carlos;

--
-- Name: games_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE public.games_id_seq OWNED BY public.games.id;


--
-- Name: goals; Type: TABLE; Schema: public; Owner: carlos
--

CREATE TABLE public.goals (
    id integer NOT NULL,
    game_id integer NOT NULL,
    player_id integer NOT NULL,
    minute integer
);


ALTER TABLE public.goals OWNER TO carlos;

--
-- Name: goals_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE public.goals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.goals_id_seq OWNER TO carlos;

--
-- Name: goals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE public.goals_id_seq OWNED BY public.goals.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: carlos
--

CREATE TABLE public.locations (
    id integer NOT NULL,
    name text NOT NULL,
    region_id integer NOT NULL
);


ALTER TABLE public.locations OWNER TO carlos;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE public.locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO carlos;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: carlos
--

CREATE TABLE public.players (
    id integer NOT NULL,
    name text NOT NULL,
    team_id integer NOT NULL
);


ALTER TABLE public.players OWNER TO carlos;

--
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE public.players_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_id_seq OWNER TO carlos;

--
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE public.players_id_seq OWNED BY public.players.id;


--
-- Name: post_categories; Type: TABLE; Schema: public; Owner: carlos
--

CREATE TABLE public.post_categories (
    post_id integer NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.post_categories OWNER TO carlos;

--
-- Name: posts; Type: TABLE; Schema: public; Owner: carlos
--

CREATE TABLE public.posts (
    id integer NOT NULL,
    title text NOT NULL,
    body text NOT NULL,
    user_id integer NOT NULL,
    location_id integer,
    region_id integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.posts OWNER TO carlos;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO carlos;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;


--
-- Name: referees; Type: TABLE; Schema: public; Owner: carlos
--

CREATE TABLE public.referees (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.referees OWNER TO carlos;

--
-- Name: referees_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE public.referees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.referees_id_seq OWNER TO carlos;

--
-- Name: referees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE public.referees_id_seq OWNED BY public.referees.id;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: carlos
--

CREATE TABLE public.regions (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.regions OWNER TO carlos;

--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE public.regions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.regions_id_seq OWNER TO carlos;

--
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE public.regions_id_seq OWNED BY public.regions.id;


--
-- Name: seasons; Type: TABLE; Schema: public; Owner: carlos
--

CREATE TABLE public.seasons (
    id integer NOT NULL,
    name text NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL
);


ALTER TABLE public.seasons OWNER TO carlos;

--
-- Name: seasons_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE public.seasons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seasons_id_seq OWNER TO carlos;

--
-- Name: seasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE public.seasons_id_seq OWNED BY public.seasons.id;


--
-- Name: team_season_stats; Type: TABLE; Schema: public; Owner: carlos
--

CREATE TABLE public.team_season_stats (
    season_id integer NOT NULL,
    team_id integer NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    wins integer DEFAULT 0 NOT NULL,
    draws integer DEFAULT 0 NOT NULL,
    losses integer DEFAULT 0 NOT NULL,
    goals_for integer DEFAULT 0 NOT NULL,
    goals_against integer DEFAULT 0 NOT NULL,
    points integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.team_season_stats OWNER TO carlos;

--
-- Name: teams; Type: TABLE; Schema: public; Owner: carlos
--

CREATE TABLE public.teams (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.teams OWNER TO carlos;

--
-- Name: teams_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE public.teams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_id_seq OWNER TO carlos;

--
-- Name: teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE public.teams_id_seq OWNED BY public.teams.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: carlos
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    email text NOT NULL,
    preferred_region_id integer
);


ALTER TABLE public.users OWNER TO carlos;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: carlos
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO carlos;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: carlos
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: games id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.games ALTER COLUMN id SET DEFAULT nextval('public.games_id_seq'::regclass);


--
-- Name: goals id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.goals ALTER COLUMN id SET DEFAULT nextval('public.goals_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: players id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.players ALTER COLUMN id SET DEFAULT nextval('public.players_id_seq'::regclass);


--
-- Name: posts id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);


--
-- Name: referees id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.referees ALTER COLUMN id SET DEFAULT nextval('public.referees_id_seq'::regclass);


--
-- Name: regions id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.regions ALTER COLUMN id SET DEFAULT nextval('public.regions_id_seq'::regclass);


--
-- Name: seasons id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.seasons ALTER COLUMN id SET DEFAULT nextval('public.seasons_id_seq'::regclass);


--
-- Name: teams id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.teams ALTER COLUMN id SET DEFAULT nextval('public.teams_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: categories categories_name_key; Type: CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: game_referees game_referees_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.game_referees
    ADD CONSTRAINT game_referees_pkey PRIMARY KEY (game_id, referee_id);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- Name: goals goals_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.goals
    ADD CONSTRAINT goals_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: post_categories post_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.post_categories
    ADD CONSTRAINT post_categories_pkey PRIMARY KEY (post_id, category_id);


--
-- Name: posts posts_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: referees referees_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.referees
    ADD CONSTRAINT referees_pkey PRIMARY KEY (id);


--
-- Name: regions regions_name_key; Type: CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_name_key UNIQUE (name);


--
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: seasons seasons_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.seasons
    ADD CONSTRAINT seasons_pkey PRIMARY KEY (id);


--
-- Name: team_season_stats team_season_stats_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.team_season_stats
    ADD CONSTRAINT team_season_stats_pkey PRIMARY KEY (season_id, team_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: game_referees game_referees_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.game_referees
    ADD CONSTRAINT game_referees_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.games(id) ON DELETE CASCADE;


--
-- Name: game_referees game_referees_referee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.game_referees
    ADD CONSTRAINT game_referees_referee_id_fkey FOREIGN KEY (referee_id) REFERENCES public.referees(id) ON DELETE CASCADE;


--
-- Name: games games_away_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_away_team_id_fkey FOREIGN KEY (away_team_id) REFERENCES public.teams(id);


--
-- Name: games games_home_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_home_team_id_fkey FOREIGN KEY (home_team_id) REFERENCES public.teams(id);


--
-- Name: games games_season_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_season_id_fkey FOREIGN KEY (season_id) REFERENCES public.seasons(id);


--
-- Name: goals goals_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.goals
    ADD CONSTRAINT goals_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.games(id) ON DELETE CASCADE;


--
-- Name: goals goals_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.goals
    ADD CONSTRAINT goals_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- Name: locations locations_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: players players_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id);


--
-- Name: post_categories post_categories_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.post_categories
    ADD CONSTRAINT post_categories_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON DELETE CASCADE;


--
-- Name: post_categories post_categories_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.post_categories
    ADD CONSTRAINT post_categories_post_id_fkey FOREIGN KEY (post_id) REFERENCES public.posts(id) ON DELETE CASCADE;


--
-- Name: posts posts_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(id);


--
-- Name: posts posts_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(id);


--
-- Name: posts posts_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: team_season_stats team_season_stats_season_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.team_season_stats
    ADD CONSTRAINT team_season_stats_season_id_fkey FOREIGN KEY (season_id) REFERENCES public.seasons(id);


--
-- Name: team_season_stats team_season_stats_team_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.team_season_stats
    ADD CONSTRAINT team_season_stats_team_id_fkey FOREIGN KEY (team_id) REFERENCES public.teams(id);


--
-- Name: users users_preferred_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: carlos
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_preferred_region_id_fkey FOREIGN KEY (preferred_region_id) REFERENCES public.regions(id);


--
-- PostgreSQL database dump complete
--

\unrestrict jmciTfNjSDxTEn5qTfIf7C7qPdnGO9NjASib9Xtrnva0EWuiitEb40dkPdF5HvU

