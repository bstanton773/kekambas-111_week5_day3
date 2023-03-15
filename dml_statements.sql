-- Data Manipulation Language (DML)

-- Add A row of data to the customer table
-- Syntax: INSERT INTO table_name(col_1, col_2, etc.) VALUES(val_1, val_2, etc.)

INSERT INTO customer(
	first_name,
	last_name,
	email_address,
	username
) VALUES (
	'Brian',
	'Stanton',
	'brians@codingtemple.com',
	'brians'
);

SELECT *
FROM customer;


INSERT INTO customer(
	email_address,
	first_name,
	username,
	address,
	last_name,
	loyalty_member
) VALUES (
	'pat@ireland.com',
	'Saint',
	'paddy',
	'3 Clover Rd',
	'Patrick',
	TRUE
);

SELECT *
FROM customer;

SELECT *
FROM seller;
-- Insert without column names
INSERT INTO seller VALUES (
	1, 
	'Cool Items Unltd.', 
	'Cool items forever and ever',
	'cool.items@unltd.gov',
	'1600 Pennsylvania Ave.'
);

SELECT *
FROM seller;

-- Because we put in the first seller manually with an ID of 1, the SERIAL did not call next val
-- so if we try to create another seller, it will initially throw an error
INSERT INTO seller( 
	seller_name,
	description,
	email,
	address
) VALUES (
	'Boring Items Inc.',
	'Most boring items that you just need to have',
	'boring@boring.com',
	'123 Awesome Ave'
);

SELECT *
FROM seller;


INSERT INTO seller(
	seller_name,
	description,
	email,
	address
) VALUES (
	'No Name',
	'A Nameless company',
	'noname@whoneedsanameanyways.com',
	'123 Names Ave'
);


-- Insert Multiple rows of data in one command
-- Syntax: INSERT INTO table(col_1, col_2, etc) VALUES (val_a_1, val_a_2, etc), (val_b_1, val_b_2, etc.)

INSERT INTO item(
	prod_name,
	description,
	price,
	quantity,
	seller_id
) VALUES (
	'Remote',
	'Change the channel without getting up',
	9.99,
	100,
	2
),(
	'Deck of Cards',
	'Playing cards for all types of games!',
	12.59,
	75,
	1
),(
	'Cup',
	'Hold your liquids like never before!',
	5.55,
	150,
	4
);

SELECT *
FROM item;

-- Try to add an item with a seller_id that does not exist
--INSERT INTO item(
--	prod_name,
--	description,
--	price,
--	quantity,
--	seller_id
--) VALUES (
--	'Lamp',
--	'Brighten Things Up!',
--	9.99,
--	100,
--	10 -- Seller with ID 10 DOES NOT EXIST!
--);

SELECT *
FROM seller;


-- UPDATES
SELECT *
FROM customer;

-- Syntax: UPDATE table_name SET col_name = value, etc. WHERE condition
UPDATE customer 
SET address = '555 Circle Drive'
WHERE customer_id = 1;

SELECT *
FROM customer;

-- Add more customers real quick...
INSERT INTO customer(
	first_name,
	last_name,
	email_address,
	address,
	username
) VALUES (
	'Michael',
	'Jordan',
	'mj@jumpman.com',
	'6 Championship Drive',
	'goat'
),(
	'Scottie',
	'Pippen',
	'scottie@jumpman.com',
	'6 Championship Drive Apt 2',
	'scottie'
),(
	'Dennis',
	'Rodman',
	'rodman@jumpman.com',
	'3 Championship Drive',
	'worm'
);

SELECT *
FROM customer;


-- An UPDATE/SET without a WHERE will update all rows
UPDATE customer
SET loyalty_member = TRUE;

SELECT *
FROM customer;


-- Set all people with a jumpman email to not be loyalty members
UPDATE customer 
SET loyalty_member = FALSE
WHERE email_address LIKE '%jumpman%';

SELECT *
FROM customer
WHERE email_address LIKE '%jumpman%';

-- Update multiple columns - SET col_1 = val_1, col_2 = val_2, etc

UPDATE item 
SET price = 13.49, quantity = 50
WHERE product_id = 2;

SELECT *
FROM item;

-- DELETE products based on a CONDITION 
-- Syntax: DELETE FROM table_name WHERE condition

DELETE FROM item 
WHERE price < 8;

SELECT *
FROM item;


-- A DELETE FROM without a WHERE will delete all rows
DELETE FROM item;

SELECT *
FROM item;



