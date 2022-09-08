DROP DATABASE IF EXISTS soccer_db;
CREATE DATABASE soccer_db;
\c soccer_db;

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team INTEGER REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE matches (
    id SERIAL PRIMARY KEY,
    team1 INTEGER REFERENCES teams,
    team2 INTEGER REFERENCES teams,
    season_id INTEGER REFERENCES season
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player INTEGER REFERENCES players,
    match INTEGER REFERENCES matchestea
);

CREATE TABLE season (
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

CREATE TABLE referees_matches (
    id SERIAL PRIMARY KEY,
    referee INTEGER REFERENCES referees,
    match INTEGER REFERENCES matches
);

INSERT INTO teams
(name)
VALUES
('Manchester Disunited'), ('Frankfuter'), ('Whales National'),
('Spleenpool'), ('Rottingham');

INSERT INTO players
(name, team)
VALUES
('Elise Patton', 4),
('Madge Howell', 5),
('Prunella Morrison', 2),
('Crispin Fox', 2),
('Vania Little', 1),
('Horace Burgess', 3),
('Emmett Skeldon', 4),
('Tina Pearson', 1);

INSERT INTO matches
(team1, team2)
VALUES
(1, 2), (1, 3), (1, 4), (2, 3), (3, 5), (2, 4), (4, 5);

INSERT INTO referees
(name)
VALUES
('Theodora George'), ('Freddie Motley'), ('Toby Mendez');

INSERT INTO referees_matches
(referee, match)
VALUES
(1, 1), (3, 1), (2, 5), (1, 6), (2, 3), (3, 4), (2, 2);

INSERT INTO goals
(player, match)
VALUES
(2, 1), (3, 4), (1, 5), (6, 1), (3, 6), (4, 2), (8, 2), (7, 1), (1, 3);

--SELECT p.name AS player_name, t.name AS team_name FROM players p JOIN teams t ON p.team = t.id;
