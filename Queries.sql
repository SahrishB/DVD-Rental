-- (1) Find customer id, first name and total spendings greater than $100 in descending order.

SELECT payment.customer_id, 
       first_name, 
       Sum(amount) AS spendings
FROM   payment 
       INNER JOIN customer 
               ON payment.customer_id = customer.customer_id 
GROUP  BY payment.customer_id, 
          first_name 
HAVING Sum(amount) > 100 
ORDER  BY first_name DESC; 


-- (2) Write a SQL query to fetch all the movies Tim Hackman

SELECT title, first_name, last_name 
FROM   actor 
       INNER JOIN film_actor 
               ON actor.actor_id = film_actor.actor_id 
       INNER JOIN film 
               ON film_actor.film_id = film.film_id 
WHERE  first_name = 'Tim' 
       AND last_name = 'Hackman';
       
       
-- (3) What customer has the highest customer ID number whose name starts with an 'E' and has an address ID lower than 500

SELECT first_name,
       last_name
FROM   customer
WHERE  first_name LIKE 'S%'
       AND address_id < 500
ORDER  BY customer_id DESC
LIMIT  1; 


-- (4) How many films begin with the letter J?
SELECT Count(*)
FROM   film
WHERE  title ILIKE 'j%';


-- (5) Return the customer IDs of customers who have spent at least $100 with the staff member who has an ID of 1

SELECT customer_id
FROM   payment
WHERE  staff_id = 1
GROUP  BY customer_id
HAVING Sum(amount) >= 100; 


-- (6) The company is celebrating its Coral anniversary (35 years) and will assign Cashback Loyalty Program for 
-- all the customers that have had 35 or more payments transaction 

SELECT customer_id,
       Count(*)
FROM   payment
GROUP  BY customer_id
HAVING Count(*) >= 35;  


-- (7) How many unique districts are the customers from?

SELECT Count(DISTINCT( district ))
FROM   address; 


-- (8) How many films have rating of PG-13 and replacement cost between 10 and 15?

SELECT Count(*)
FROM   film
WHERE  rating = 'PG-13'
       AND replacement_cost BETWEEN 10 AND 15;
       

-- (9) How many films have the word flight somewhere in the title?

SELECT Count(*)
FROM   film
WHERE  title ILIKE '%flight%';


-- (10) 
