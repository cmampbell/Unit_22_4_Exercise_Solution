-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists {
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
}

CREATE TABLE producers {
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
}

CREATE TABLE albums {
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  artist_id INT REFERENCES artists,
  num_songs INT NOT NULL,
  total_runtime INT NOT NULL,
  release_date DATE
}

CREATE TABLE songs {
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INT NOT NULL,
  album_id INT REFERENCES albums
}

CREATE TABLE song_artists {
  id SERIAL PRIMARY KEY,
  song_id INT REFERENCES songs,
  artist_id INT REFERENCES artists
}

CREATE TABLE song_producers {
  id SERIAL PRIMARY KEY,
  song_id INT REFERENCES songs,
  producer_id INT REFERENCES producers
}