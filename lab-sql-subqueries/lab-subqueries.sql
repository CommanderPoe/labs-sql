USE sakila2;

-- 1. How many copies of the film Hunchback Impossible exist in the inventory system?
SELECT * FROM film;
SELECT * FROM inventory;

SELECT COUNT(*) FROM inventory
WHERE film_id IN (
	SELECT film_id FROM (
		SELECT title, film_id FROM film
		WHERE title LIKE 'Hunchback Impossible'
		) sub1
    );
    
    SELECT Amount_of_copies
FROM
(SELECT film_id, COUNT(inventory_id) AS Amount_of_copies
FROM inventory
GROUP BY film_id
HAVING film_id = (SELECT film_id
FROM film
WHERE title = 'Hunchback Impossible')) sub2;
    
    -- 2. List all films whose length is longer than the average of all the films.
    SELECT avg(length) FROM film;
    
SELECT film_id, title, length FROM sakila.film
WHERE length > (
SELECT avg(length)
FROM sakila.film
);

-- 3. Use subqueries to display all actors who appear in the film Alone Trip.
SELECT * FROM actor;
SELECT * FROM film_actor;

SELECT * FROM actor
WHERE actor_id IN (
SELECT actor_id FROM film_actor 
WHERE film_id = (
SELECT film_id FROM film
WHERE title = 'Alone Trip'));
    
-- 4. Sales have been lagging among young families,
-- and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
SELECT * FROM film;
SELECT * FROM film_category;
SELECT * FROM category;


SELECT title FROM film
WHERE film_id IN (
SELECT film_id FROM film_category 
WHERE category_id IN (
SELECT category_id FROM category
WHERE name = 'Family'));

-- 5. Get name and email from customers from Canada using subqueries. 
-- Do the same with joins. Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, that will help you get the relevant information.
SELECT * FROM customer;
SELECT * FROM country;
SELECT * FROM address;

SELECT first_name, email FROM customer
WHERE address_id = (
SELECT address_id FROM address
WHERE address_id = (
SELECT country_id FROM country
WHERE country = 'Canada'));

-- 6. Which are films starred by the most prolific actor? 
-- Most prolific actor is defined as the actor that has acted in the most number of films. 
-- First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
SELECT * FROM film;
SELECT * FROM film_actor;

SELECT actor_id, COUNT(actor_id) as num_films FROM film_actor
GROUP BY actor_id
ORDER BY num_films DESC;  
 
SELECT film_id, title FROM film 
WHERE film_id IN (
 SELECT film_id FROM film_actor
 WHERE actor_id = 107);
 
 -- 7. Films rented by most profitable customer.
 -- You can use the customer table and payment table to find the most profitable customer ie the customer that has made the largest sum of payments
 SELECT * FROM payment;
 SELECT * FROM customer;
 SELECT * FROM rental;
 
 SELECT COUNT(rental_id) FROM rental
 WHERE customer_id = (
 SELECT customer_id FROM (
 SELECT customer_id, monte FROM (
 SELECT customer_id, SUM(amount) AS monte FROM payment
 GROUP BY customer_id
 ORDER BY monte DESC) sub1
 HAVING monte > 220) sub2);

 -- 8. Customers who spent more than the average payments.
 
    