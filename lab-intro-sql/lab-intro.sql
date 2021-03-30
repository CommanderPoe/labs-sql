-- Selecting database
USE sakila;

-- Reviewing the database
SELECT *
FROM actor;

SELECT * FROM sakila;

-- Selecting all elements of all columns
SELECT *
FROM address;

SELECT *
FROM category;

SELECT *
FROM city;

SELECT *
FROM country;

SELECT *
FROM customer;

SELECT *
FROM film;

SELECT *
FROM film_actor;

SELECT *
FROM film_category;

SELECT *
FROM film_text;

SELECT *
FROM inventory;

SELECT *
FROM lenguage;

SELECT *
FROM payment;

SELECT *
FROM rental;

SELECT *
FROM staff;

SELECT *
FROM store;

-- Select one column from a table. Get film titles.
SELECT title
FROM film;

-- Select one column from a table and alias it. 
-- Get unique list of film languages under the alias language. 
-- Note that we are not asking you to obtain the language per each film, 
-- but this is a good time to think about how you might get that information in the future.
SELECT sakila.language.name AS idioma
FROM language;

SELECT title, name
FROM film, language;

-- Using the select statements and reviewing how many records are returned, 
-- can you find out how many stores and staff does the company have? 
SELECT COUNT(*)
FROM store;

SELECT COUNT(*)
FROM staff;

-- Can you return a list of employee first names only?
SELECT first_name
FROM staff;

-- Bonus: How many unique days did customers rent movies in this dataset?
SELECT DISTINCT COUNT(rental_date)
FROM rental;
