USE sakila;

-- 1. Write a query to display for each store its store ID, city, and country.
SELECT * FROM store;
SELECT * FROM address;
SELECT * FROM city;
SELECT * FROM country;

SELECT ss.store_id, sa.address, sc.city, sco.country  FROM sakila.store AS ss
LEFT JOIN sakila.address AS sa
USING(address_id)
LEFT JOIN sakila.city sc
USING(city_id)
LEFT JOIN sakila.country sco
USING(country_id);

-- 2. Write a query to display how much business, in dollars, each store brought in.
SELECT * FROM store;
SELECT * FROM staff;
SELECT * FROM payment;

SELECT ss.store_id, sst.staff_id, CONCAT(sst.first_name,' ',sst.last_name) AS manager_name, SUM(sp.amount) AS profit
FROM sakila.store as ss
JOIN sakila.staff as sst
ON sakila.ss.manager_staff_id = sakila.sst.staff_id
JOIN sakila.payment as sp
USING(staff_id)
GROUP BY ss.store_id
ORDER BY profit DESC;

-- 3. Which film categories are longest?
SELECT * FROM category;
SELECT * FROM film_category;
SELECT * FROM film;

SELECT sq1.*, sq1.tot_length%60 AS minutes, CONCAT(sq1.hours,'h', ':', sq1.tot_length%60, 'm') AS Real_length
FROM (SELECT sc.category_id, sc.name, FLOOR(SUM(sf.length/60)) AS hours, SUM(sf.length) AS tot_length
FROM sakila.category AS sc
LEFT JOIN sakila.film_category AS sfc
USING(category_id)
JOIN sakila.film as sf
USING(film_id)
GROUP BY sc.category_id
ORDER BY hours DESC) AS sq1;

-- 4.Display the most frequently rented movies in descending order.
SELECT * FROM film; 
SELECT * FROM inventory;
SELECT * FROM rental;


SELECT COUNT(film_id) FROM film;
SELECT COUNT(DISTINCT inventory_id) FROM rental;

SELECT film_id, title, COUNT(inventory_id) as num_times_rented
FROM film as sf
JOIN sakila.inventory as si
USING(film_id)
JOIN sakila.rental as sr
USING(inventory_id)
GROUP BY film_id
ORDER BY num_times_rented DESC;

-- 5. List the top five genres in gross revenue in descending order.
SELECT * FROM category;
SELECT * FROM film_category;
-- SELECT DISTINCT category_id FROM film_category;
SELECT * FROM inventory;
SELECT * FROM rental;
SELECT * FROM payment;

SELECT scat.name AS genre, COUNT(scat.name) AS number_of_films, CONCAT('$',SUM(amount)) AS revenues
FROM sakila.category AS scat
RIGHT JOIN sakila.film_category AS sfcat
USING(category_id)
JOIN sakila.inventory AS sinventory
USING(film_id)
LEFT JOIN sakila.rental AS srental
USING(inventory_id)
JOIN sakila.payment AS spayment
USING(rental_id)
GROUP BY genre
ORDER BY revenues DESC;

-- 6. Is "Academy Dinosaur" available for rent from Store 1?
SELECT * FROM film;
SELECT * FROM inventory;
SELECT * FROM store;

SELECT DISTINCT film_id, title, store_id
FROM sakila.film AS s_film
LEFT JOIN sakila.inventory AS s_inventory
USING(film_id)
WHERE s_film.title = 'Academy Dinosaur';

-- 7. Get all pairs of actors that worked together.
SELECT * FROM actor;
SELECT * FROM film_actor;
SELECT * FROM film;

SELECT *
FROM sakila.actor AS s_actor
JOIN sakila.film_actor AS s_factor
USING(actor_id);

SELECT *
FROM film_actor AS fa1
JOIN film_actor AS fa2
ON (fa1.film_id = fa2.film_id) AND (fa1.actor_id <> fa2.actor_id)
JOIN actor AS a
ON a.actor_id = f1.actor_id
JOIN actor AS a2
ON a2.actor_id = fa2.actor_id;

SELECT actor_id, first_name, COUNT(film_id) 
FROM sakila.actor AS s_actor
JOIN sakila.film_actor AS s_factor
USING(actor_id)
GROUP BY actor_id;





