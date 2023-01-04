DROP DATABASE craigslist_db;
CREATE DATABASE craigslist_db;
\c craigslist_db;

CREATE TABLE "region" (
  "id" SERIAL PRIMARY KEY,
  "name" text
);

CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "username" text,
  "pref_region" integer REFERENCES region
);

CREATE TABLE "categories" (
  "id" SERIAL PRIMARY KEY,
  "cat_name" text
);

CREATE TABLE "posts" (
  "id" SERIAL PRIMARY KEY,
  "region_id" integer REFERENCES region,
  "user_id" integer REFERENCES users,
  "cat_id" integer REFERENCES categories,
  "title" text,
  "post_text" text,
  "location_name" text
);

INSERT INTO region (name)
VALUES
('New York City'), ('Seattle'), ('Houston'), ('Omaha');

INSERT INTO users (username, pref_region)
VALUES
('Slurps', 1), ('Corn', 2), ('Loose', 1), ('TruckMan', 4);

INSERT INTO categories (cat_name)
VALUES ('sales'), ('rentals'), ('truck_stuff');

INSERT INTO posts (region_id, user_id, cat_id, title, post_text)
VALUES
(1, 1, 2, 'Apartment for Rent', 'Renting out 1 bedroom, $3000 a month'),
(4, 4, 3, 'Trucks rock', 'I love drivin my big truck');