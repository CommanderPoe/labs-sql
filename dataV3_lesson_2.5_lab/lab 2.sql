USE sakila;

-- Select all the actors with the first name ‘Scarlett’.
SELECT * FROM sakila.actor 
WHERE (first_name= 'Scarlett');

-- How many films (movies) are available for rent and how many films have been rented?
SELECT COUNT(inventory_id) FROM rental;

SELECT COUNT(rental_id) FROM rental;

SELECT DISTINCT(inventory_id) FROM rental;

SELECT MAX(inventory_id) FROM rental;

SELECT (COUNT(DISTINCT inventory_id) - (COUNT(rental_date)-COUNT(return_date)))  AS 'Available' FROM rental;

-- What's the average movie duration expressed in format (hours, minutes)?
SELECT length AS duration_m, round(((length/60) + (length % 60) / 100),2) AS duration_H
FROM film;

SELECT FLOOR(AVG(length)/ 60) AS hour, (AVG(length) % 60) AS minutes
FROM film;

SELECT FLOOR((length)/ 60) AS hour, ((length) % 60) AS minutes
FROM film;

SELECT *, CONVERT(date, datetime) FROM bank.account;

-- How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name)
from actor;

-- Since how many days has the company been operating (check DATEDIFF() function)?
-- DATEDIFF(minute, FirstDate,LastDate) as 'Duration (Minutes)
-- if you put non cap it will get just numbers
SELECT DATEDIFF('2006/02/14', '2005/05/24') AS datediff;

-- Show rental info with additional columns month and weekday. Get 20 results.
SELECT * FROM sakila.rental;

SELECT *, date_format(rental_date, '%M') AS 'month', DAYNAME(rental_date) as 'weekday' FROM sakila.rental;

-- Add an additional column day_type with values 'weekend' and 'workday' 
-- depending on the rental day of the week.
SELECT *,
CASE
WHEN weekday(rental_date) < 6 then 'Weekday'
ELSE 'Weekend'
END AS 'day_type'
FROM rental;

-- Get release years.
SELECT title, release_year FROM sakila.film;

-- Get all films with ARMAGEDDON in the title.
SELECT * FROM sakila.film;

SELECT * FROM sakila.film
WHERE title LIKE '%armageddon%';

-- Get all films which title ends with APOLLO.
SELECT * FROM sakila.film
WHERE title LIKE '%apollo';

-- Get 10 the longest films
SELECT * FROM sakila.film
ORDER BY length desc 
LIMIT 10;

-- How many films include Behind the Scenes content?
SELECT COUNT(special_features) FROM sakila.film
WHERE special_features LIKE '%Behind the Scenes%';

