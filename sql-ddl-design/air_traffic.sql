-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  airline_id INT REFERENCES airlines,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  from_city TEXT NOT NULL,
  from_country TEXT NOT NULL,
  to_city TEXT NOT NULL,
  to_country TEXT NOT NULL
);

CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE seats (
  id SERIAL PRIMARY KEY,
  flight_id INT REFERENCES flights,
  seat_name TEXT NOT NULL,
  taken BOOLEAN
);

CREATE TABLE ticket (
  id SERIAL PRIMARY KEY,
  flights INT REFERENCES flights,
  passenger_id INT REFERENCES passengers,
  seat_id INT REFERENCES seats
);