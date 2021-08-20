SELECT COUNT(title) FROM film
WHERE length >
(
SELECT AVG(length) FROM film
);
------------------------------------
SELECT COUNT(rental_rate) FROM film	
WHERE rental_rate =
(
SELECT MAX(rental_rate) FROM film	
);
------------------------------------
SELECT title FROM film
WHERE rental_rate=
(
SELECT MIN(rental_rate) FROM film
)
AND replacement_cost=
(
SELECT MIN(replacement_cost) FROM film
);
------------------------------------
SELECT payment.customer_id, customer.first_name, customer.last_name FROM payment
INNER JOIN customer ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id, payment.customer_id
HAVING COUNT(payment.amount)>0
ORDER BY COUNT (customer.customer_id) DESC;

