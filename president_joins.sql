-- Create a customer Table
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	email VARCHAR(50),
	address VARCHAR(50),
	city VARCHAR(50),
	state VARCHAR(2),
	zipcode VARCHAR(5)
);

SELECT *
FROM customer;

-- Create an Order Table
CREATE TABLE "order"(
	order_id SERIAL PRIMARY KEY,
	order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	amount NUMERIC(5,2), -- Max 5 total digits, 2 TO the RIGHT OF the decimal (XXX.XX)
	customer_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

SELECT *
FROM "order";

-- DML - Inserting data into the customer table
INSERT INTO customer(first_name, last_name, email, address, city, state, zipcode)
VALUES('George', 'Washington', 'firstpres@usa.gov', '3200 Mt. Vernon Way', 'Mt. Vernon', 'VA', '87522'),
('John', 'Adams', 'jadams@whitehouse.org', '1234 W Presidential Place', 'Quincy', 'MA', '43592'),
('Thomas', 'Jefferson', 'iwrotethedeclaration@freeamerica.org', '555 Independence Drive', 'Charleston', 'VA', '34532'),
('James', 'Madison', 'fatherofconstitution@prez.io', '8345 E Eastern Ave', 'Richmond', 'VA', '43538'),
('James', 'Monroe', 'jmonroe@usa.gov', '3682 N Monroe Parkway', 'Chicago', 'IL', '60623');


SELECT *
FROM customer;

-- Add Data to the "order" table
INSERT INTO "order"(amount, customer_id)
VALUES (54.45, 1);

INSERT INTO "order"(amount, customer_id)
VALUES (63.41, 2);

INSERT INTO "order"(amount, customer_id)
VALUES (145.92, 1);

INSERT INTO "order"(amount, customer_id)
VALUES (233.47, 3);

INSERT INTO "order"(amount, customer_id)
VALUES (34.97, null);

INSERT INTO "order"(amount, customer_id)
VALUES (63.71, null);

SELECT *
FROM "order";

SELECT *
FROM customer;

SELECT *
FROM customer 
WHERE last_name = 'Washington';

SELECT *
FROM "order"
WHERE customer_id = 1;

-- USING JOINS we can combine these tables together on a common field
-- SELECT column1, column2, etc. (can be from either table)
-- FROM table_name_1 (will be considered the LEFT table)
-- JOIN table_name_2 (will be considered the RIGHT table)
-- ON table_name_1.col_name = table_name_2.col_name (where col_name is a foreign key to other col_name)

-- Inner Join - Most Common Join - default JOIN i.e. do not have to specify INNER
SELECT first_name, last_name, email, amount, order_date, "order".customer_id AS ord_cust_id, customer.customer_id AS cust_cust_id
FROM customer 
INNER JOIN "order"
ON customer.customer_id = "order".customer_id;


-- Each Join

-- INNER JOIN
SELECT *
FROM customer 
JOIN "order"
ON "order".customer_id = customer.customer_id;


-- FULL JOIN
SELECT *
FROM customer 
FULL JOIN "order"
ON "order".customer_id = customer.customer_id;


-- LEFT JOIN
SELECT *
FROM customer -- LEFT Table
LEFT JOIN "order" -- RIGHT Table
ON "order".customer_id = customer.customer_id;

-- RIGHT JOIN
SELECT *
FROM customer -- LEFT Table
RIGHT JOIN "order" -- RIGHT Table
ON "order".customer_id = customer.customer_id;


-- Get the number of orders per state
SELECT state, COUNT(*)
FROM "order"
JOIN customer
ON "order".customer_id = customer.customer_id
GROUP BY state
ORDER BY COUNT(*) DESC;

-- -- JOIN ON comes after the SELECT FROM and before the WHERE

--SELECT
--FROM
--JOIN
--ON 
--WHERE 
--GROUP BY 
--HAVING 
--ORDER BY 
--LIMIT 
--OFFSET


-- Alias Table Names
SELECT c.customer_id, c.first_name, c.last_name, o.customer_id, o.amount
FROM customer c
JOIN "order" o
ON o.customer_id = c.customer_id; 

