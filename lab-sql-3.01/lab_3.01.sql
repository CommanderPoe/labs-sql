USE sakila2;

-- 1. Drop column picture from staff.
SELECT * FROM sakila2.staff;

ALTER TABLE staff
DROP COLUMN picture;

-- 2. A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
SELECT * FROM staff;
SELECT * FROM customer
WHERE first_name = 'TAMMY';

INSERT INTO staff(staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update) 
VALUES
(3,'Tammy', 'Sanders', 79, 'TAMMY.SANDERS@sakilacustomer.org', 2, 1, 'tammy', null, CURRENT_DATE());

UPDATE staff
SET first_name = 'Tammy', last_name= 'Sanders', email= 'tammy.sanders@sakilacustomer.org';

-- 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
-- You can use current date for the rental_date column in the rental table. 
-- Hint: Check the columns in the table rental and see what information you would need to add there. 
-- You can query those pieces of information. For eg., you would notice that you need customer_id information as well. 
-- To get that you can use the following query:
SELECT customer_id FROM sakila2.customer
WHERE first_name = 'CHARLOTTE' AND last_name = 'HUNTER';

INSERT INTO rental()
VALUES
(16050, '2021-04-05', 1, 130, NULL, 1, '2021-04-05');

SELECT*
FROM rental
WHERE (rental_id)='16050';






