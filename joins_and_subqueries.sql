SELECT *
FROM film_actor;

-- Join film to film_actor
SELECT *
FROM film_actor 
JOIN film
ON film.film_id = film_actor.film_id;


SELECT *
FROM film_actor 
JOIN actor 
ON film_actor.actor_id = actor.actor_id;

-- Multi Join
SELECT f.title, f.release_year, f.film_id, fa.film_id, fa.actor_id, a.actor_id, a.first_name, a.last_name
FROM film_actor fa
JOIN film f 
ON fa.film_id = f.film_id 
JOIN actor a 
ON fa.actor_id = a.actor_id;

-- without alias
SELECT film.title, film.release_year, film.film_id, film_actor.film_id, film_actor.actor_id, actor.actor_id, actor.first_name, actor.last_name
FROM film_actor
JOIN film
ON film_actor.film_id = film.film_id 
JOIN actor
ON film_actor.actor_id = actor.actor_id;


-- JOIN actor to category -- actor -> film_actor -> film -> film_category -> film 

SELECT a.first_name, a.last_name, c.name 
FROM actor a
JOIN film_actor fa 
ON a.actor_id = fa.actor_id 
JOIN film f 
ON f.film_id = fa.film_id 
JOIN film_category fc 
ON fc.film_id = f.film_id 
JOIN category c 
ON c.category_id = fc.category_id;


-- SUBQUERIES!!!!
-- Subqueries are queries that happen within another query


-- Ex. Which films have exactly 12 actors in them?


-- Step 1. Ge the ids of the movies that have 12 actors
SELECT film_id
FROM film_actor 
GROUP BY film_id 
HAVING COUNT(*) = 12;

--film_id|
---------+
--    529|
--    802|
--     34|
--    892|
--    414|
--    517|

-- Step 2. Get the rows from the film table that have films in the above list
SELECT *
FROM film 
WHERE film_id IN (
	529,
	802,
	34,
	892,
	414,
	517
);


-- Create a Subquery: Combine the two steps into one query. The query that you want executed FIRST
-- is the subquery.  ** Subquery must return only ONE column **   *unless used in a FROM clause

SELECT *
FROM film 
WHERE film_id IN (
	SELECT film_id
	FROM film_actor 
	GROUP BY film_id 
	HAVING COUNT(*) = 12
);


-- Which staff member had the highest cumulative sales
SELECT *
FROM staff 
WHERE staff_id = (
	SELECT staff_id
	FROM payment
	GROUP BY staff_id
	ORDER BY SUM(amount) DESC 
	LIMIT 1
);

-- Show the staff and how much they did in sales
SELECT first_name, last_name, SUM(amount)
FROM staff 
JOIN payment 
ON staff.staff_id = payment.staff_id 
GROUP BY first_name, last_name;


-- Use subqueries for calculations
-- List out all of the payments that are more than the average payment amount

SELECT *
FROM payment 
WHERE amount > (
	SELECT AVG(amount)
	FROM payment
);



-- Subqueries with the FROM clause
-- *Subquery in FROM must have an alias*


-- Find the average of number of rentals per customer 


-- Step 1. Get the count of customer rentals
SELECT customer_id, COUNT(*) AS num_rentals
FROM rental
GROUP BY customer_id;

-- Use the temp table from step 1 as a subquery
SELECT AVG(num_rentals)
FROM (
	SELECT customer_id, COUNT(*) AS num_rentals
	FROM rental
	GROUP BY customer_id
) AS customer_rental_totals;


-- For example setup, add loyalty_member boolean to customer table
ALTER TABLE customer 
ADD COLUMN loyalty_member BOOLEAN;

UPDATE customer 
SET loyalty_member = FALSE;


-- Use Subqueries in DML statements
-- Update all the customers who have made 25 or more rentals

-- Step 1. Find all of customer ids of the customers who have made more than 25 rentals
SELECT customer_id
FROM rental
GROUP BY customer_id
HAVING COUNT(*) >= 25;

-- Update the customer table to set loyalty_member = True if customer is in the list of IDs
UPDATE customer 
SET loyalty_member = TRUE 
WHERE customer_id IN (
	SELECT customer_id
	FROM rental
	GROUP BY customer_id
	HAVING COUNT(*) >= 25
);

-- Confirm updated loyalty
SELECT *
FROM customer 
WHERE loyalty_member = TRUE;





-- Multi Query

-- customers who have rented more than average
SELECT *
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM rental 
	GROUP BY customer_id 
	HAVING COUNT(*) > (
		SELECT AVG(num_rentals)
		FROM (
			SELECT customer_id, COUNT(*) AS num_rentals
			FROM rental
			GROUP BY customer_id
		) AS customer_rental_totals
	)
);


-- Join and Subqueries are friendly
SELECT r.customer_id, c.first_name, c.last_name, COUNT(*)
FROM rental r
JOIN customer c
ON c.customer_id = r.customer_id 
GROUP BY r.customer_id, c.first_name, c.last_name
HAVING COUNT(*) > (
	SELECT AVG(num_rentals)
	FROM (
		SELECT customer_id, COUNT(*) AS num_rentals
		FROM rental
		GROUP BY customer_id
	) AS customer_rental_totals
);

