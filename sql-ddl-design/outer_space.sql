-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
)

CREATE TABLE stars {
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  galaxy_id INT REFERENCES galaxies
}

CREATE TABLE planets {
  id SERIAL PRIMARY KEY,
  name TEXT,
  orbits_star_id INT REFERENCES stars,
  orbital_period_in_years FLOAT,
}

CREATE TABLE moons (
  id SERIAL PRIMARY KEY,
  name TEXT,
  orbits_planet_id INT REFERENCES planets
)