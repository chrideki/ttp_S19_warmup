-- SEE HOW MANY YOU CAN GET THROUGH BY 10am :) 

-- What's the title and ID of the longest film?
SELECT film_id, title
FROM film
WHERE length = (SELECT max(length) 
                FROM film);

-- BONUS points if you use a subquery :) 

-- What is the title and ID of the film with the lowest replacement cost?
-- BONUS points if you use a subquery :) 
SELECT film_id, title
FROM film
WHERE replacement_cost = (SELECT min(replacement_cost) 
                FROM film);

-- What is the tile and ID of the film with the highest rental_rate?
SELECT film_id, title
FROM film
WHERE rental_rate = (SELECT max(rental_rate) 
                FROM film);

-- Show the payment_id's of all transactions after or on May 1st 2007
SELECT payment_id, rental_date
FROM rental
JOIN payment USING(rental_id)
WHERE rental_date >= '2007-05-01';

-- Show all payment ID's and payment date's with a transaction amount less than $3.
SELECT payment_id, payment_date
FROM payment
WHERE amount < 3;

-- Get the emails of all customers that shop at store 1 that are inactive (use 'active')
SELECT email
FROM customer
WHERE store_id = 1 AND active = 1;

--How much have these customers spent? (Use code from the previous query to
-- make a subquery or a CTE to solve this one.) 
WITH customer_active_in_store1 AS (
    SELECT email, customer_id
    FROM customer
    WHERE store_id = 1 AND active = 1
) SELECT
    email, SUM(amount)
    FROM customer_active_in_store1
    JOIN payment USING(customer_id)
    GROUP BY email;


