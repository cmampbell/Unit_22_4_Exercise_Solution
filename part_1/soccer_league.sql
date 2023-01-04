DROP DATABASE soccer_league_db;
CREATE DATABASE soccer_league_db;
\c soccer_league_db;

CREATE TABLE "teams" (
  "id" SERIAL PRIMARY KEY,
  "name" text
);

CREATE TABLE "players" (
  "id" SERIAL PRIMARY KEY,
  "team_id" integer REFERENCES teams,
  "name" text
);

CREATE TABLE "referees" (
  "id" SERIAL PRIMARY KEY,
  "name" text
);

CREATE TABLE "league_schedule" (
  "id" SERIAL PRIMARY KEY,
  "start_date" date,
  "end_date" date
);

CREATE TABLE "games" (
  "id" SERIAL PRIMARY KEY,
  "team1_id" integer REFERENCES teams,
  "team2_id" integer REFERENCES teams,
  "season_id" integer REFERENCES league_schedule,
  "game_date" date
);

CREATE TABLE "referees_by_game" (
  "id" SERIAL PRIMARY KEY,
  "game_id" integer REFERENCES games,
  "ref_id" integer REFERENCES referees
);

CREATE TABLE "goals" (
  "id" SERIAL PRIMARY KEY,
  "game_id" integer REFERENCES games,
  "player_id" integer REFERENCES players,
  "goal_time" timestamp
);

CREATE TABLE "game_wins" (
  "id" SERIAL PRIMARY KEY,
  "game_id" integer REFERENCES games,
  "winning_team_id" int REFERENCES teams
);

INSERT INTO teams (name) VALUES ('Totty Lads'), ('Manchester'), ('Grade 8 Footballers');

INSERT INTO players (name) VALUES ('Harry Kane'), ('Bruce Springsteen'), ('Young Gerald');

INSERT INTO referees (name) VALUES ('Bozo'), ('Clown'), ('Idiot');

INSERT INTO league_schedule (start_date, end_date) VALUES ('2020-11-12', '2021-09-06'), ('2020-11-12', '2021-09-06');

INSERT INTO games (team1_id, team2_id, season_id, game_date)VALUES
(1, 2, 1, '2020-11-15'), (1, 3, 1, '2020-11-19'), (2, 3, 1, '2020-11-14');

INSERT INTO referees_by_game (game_id, ref_id) VALUES (1, 1), (2, 2), (3, 3);

INSERT INTO goals (game_id, player_id, goal_time) VALUES
(1, 1, '2020-11-15 18:43:32'), (1, 2, '2020-11-15 18:45:10'), (1, 2, '2020-11-15 18:45:10'),
(2, 3, '2020-11-19 15:22:10'), (2, 3, '2020-11-19 15:23:10'), 
(2, 3, '2020-11-19 15:23:10');

INSERT INTO game_wins (game_id, winning_team_id) VALUES
(1, 2), (2, 3), (3, NULL);