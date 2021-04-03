USE sakila;

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT * FROM category;
SELECT * FROM film_category;

SELECT scat.name, COUNT(scat.name) AS category
FROM sakila.category as scat
JOIN sakila.film_category as sfcat
USING (category_id)
GROUP BY category_id;

-- 2. Display the total amount rung up by each staff member in August of 2005.
SELECT * FROM staff;
SELECT * FROM payment;

SELECT CONCAT(sstaff.first_name,' ',sstaff.last_name) AS name, SUM(spay.amount) AS mullah_august
FROM sakila.staff as sstaff
JOIN sakila.payment as spay
USING (staff_id)
WHERE spay.payment_date >= "2005-08-01" AND spay.payment_date <= "2005-08-31"
GROUP BY name;

-- 3. Which actor has appeared in the most films?
SELECT * FROM actor;
SELECT * FROM film_actor;
SELECT * FROM film;

SELECT CONCAT(sa.first_name,' ',sa.last_name) AS name, COUNT(title) as apariciones
FROM sakila.actor AS sa
JOIN sakila.film_actor AS sfa
USING(actor_id)
JOIN sakila.film
USING(film_id)
GROUP BY name
ORDER BY apariciones DESC;

-- 4. Most active customer (the customer that has rented the most number of films)
SELECT * FROM customer;
SELECT * FROM rental;

SELECT customer_id, COUNT(customer_id)
FROM rental
GROUP BY customer_id
ORDER BY COUNT(customer_id) ASC;

SELECT sc.customer_id, CONCAT(sc.first_name, ' ', sc.last_name) AS name, COUNT(rental_id) AS times_rented
FROM sakila.customer as sc
JOIN sakila.rental as sr
USING(customer_id)
GROUP BY sc.customer_id
ORDER BY times_rented DESC;

-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT * FROM staff;
SELECT * FROM address;

SELECT ss.address_id, CONCAT(ss.first_name, ' ', ss.last_name) AS name, sa.address
FROM sakila.staff as ss
JOIN sakila.address as sa
USING(address_id);

-- 6. List each film and the number of actors who are listed for that film.
SELECT * FROM film;
SELECT * FROM film_actor;

SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id;

SELECT film_id, title, COUNT(actor_id) as actors
FROM sakila.film as sf
JOIN sakila.film_actor as sa
USING(film_id)
GROUP BY sf.film_id
ORDER BY actors DESC;


-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. 
-- List the customers alphabetically by last name.
SELECT * FROM payment;
SELECT * FROM customer;

SELECT customer_id, CONCAT(sc.last_name,' ',sc.first_name) as name, SUM(amount) as total_paid
FROM sakila.payment as sp
JOIN sakila.customer as sc
USING(customer_id)
GROUP BY sp.customer_id
ORDER BY sc.last_name;

-- 8. List number of films per category
'''DONE ALREADY in #2'''
