DROP DATABASE IF EXISTS craigslist_db;
CREATE DATABASE craigslist_db;
\c craigslist_db;

CREATE TABLE region (
    id SERIAL PRIMARY KEY,
    name TEXT
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    cat TEXT NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    pref_region INTEGER REFERENCES region ON DELETE SET NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    post_text TEXT,
    category INTEGER REFERENCES categories ON DELETE SET NULL,
    user_id INTEGER REFERENCES users ON DELETE CASCADE,
    post_region INTEGER REFERENCES region ON DELETE CASCADE,
    post_location TEXT
);

INSERT INTO region
(name)
VALUES
('Lav Vegas'),
('New York'),
('Atlanta'),
('Pittsburgh'),
('San Diego'),
('Los Angeles'),
('Toronto');

INSERT INTO categories
(cat)
VALUES
('Home Appliances'),
('Jobs'),
('Rentals'),
('Missed Connections'),
('Vehicles');

INSERT INTO users
(username, pref_region)
VALUES
('PepeMilfHunter69', 1),
('LonelyOnly45', 4),
('GoGetter333', 2),
('FreeSpiritFreeLoader77', 5),
('EdgeLord420', 7);

INSERT INTO posts
(title, post_text, category, user_id, post_region, post_location)
VALUES
('Only my cat understands me',
'My cat will never leave me unlike stupid MEN!',
4, 2, 4, 'West Milflin'),
('LF job in finance',
'Lost my life savings in crypto.  LF job as investment advisor',
2, 1, 1, 'Summerlin'),
('1989 Corolla',
'1989 Corolla  345,547 miles rear window browken, mild puke smell.  $450 obo',
5, 5, 7, 'Moms basement'),
('Mature man at the club last Friday',
'UR so cute hitting on my friend for her 21st! But we had a connection.  I would luv 2 b ur sugar baby! xoxo',
4, 4, 5, 'Coronodo');

--SELECT username, title, post_text, category FROM posts p JOIN users u ON p.user_id = u.id;