-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT * FROM category;
SELECT * FROM film_category;

SELECT scat.name, COUNT(scat.name) AS count
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








USE sakila;
-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT * 
FROM sakila.film_category;
SELECT c.category_id AS Category, COUNT(f.film_id) AS Nb_of_Films
FROM sakila.film_category c   
JOIN sakila.film f 
USING (film_id)
GROUP BY c.category_id;
-- Display the total amount rung up by each staff member in August of 2005.
USE sakila;
SELECT CONCAT(s.first_name,' ',s.last_name) AS Staff, SUM(p.amount) as Amount_in_August_2005
FROM sakila.payment p
JOIN sakila.staff as s
ON (p.staff_id = s.staff_id)
WHERE payment_date >= "2005-08-01" AND payment_date <= "2005-08-31"
GROUP BY p.staff_id;
-- Which actor has appeared in the most films?
SELECT CONCAT(a.first_name,' ',a.last_name) AS Actor_Actress, COUNT(f.film_id) as Nb_of_Films
FROM sakila.film f
JOIN sakila.film_actor fa
USING (film_id)
RIGHT JOIN sakila.actor a
USING (actor_id)
GROUP BY a.actor_id;
-- Most active customer (the customer that has rented the most number of films)
SELECT CONCAT(a.first_name,' ',a.last_name) AS Actor_Actress, COUNT(f.film_id) as Nb_of_Films
FROM sakila.film f
JOIN sakila.film_actor fa
USING (film_id)
RIGHT JOIN sakila.actor a
USING (actor_id)
GROUP BY a.actor_id;
-- Most active customer (the customer that has rented the most number of films)
SELECT CONCAT(c.first_name,' ',c.last_name) as Customer, COUNT(r.rental_id) as Video_Rented
FROM sakila.customer c
JOIN sakila.rental r
USING (customer_id)
GROUP BY customer_id
ORDER BY Video_Rented DESC
LIMIT 1;
-- Display the first and last names, as well as the address, of each staff member.
SELECT CONCAT(s.first_name,' ',s.last_name) as Staff_Name, a.address as Address
FROM sakila.staff s
JOIN sakila.address a
USING (address_id)
GROUP BY Address;
-- List each film and the number of actors who are listed for that film.
SELECT title as Title, COUNT(fa.actor_id) as Nb_of_Actors_per_each_Films
FROM sakila.film_actor fa
JOIN sakila.film f
USING (film_id)
RIGHT JOIN sakila.actor a
USING (actor_id)
GROUP BY Title;
-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT CONCAT(c.first_name,' ',c.last_name) AS Customer, SUM(p.amount) AS Paid_by_Customer
FROM sakila.payment p
JOIN sakila.customer c
USING (customer_id)
GROUP BY Customer;
-- List number of films per category.
SELECT c.category_id AS Category, COUNT(f.film_id) AS Nb_of_Films
FROM sakila.film_category c   
JOIN sakila.film f 
USING (film_id)
GROUP BY c.category_id;
