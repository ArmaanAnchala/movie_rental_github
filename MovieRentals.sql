-- SLIDE ONE QUERY:
							
SELECT city, SUM(amount) AS total_amount						
FROM						
(SELECT city.city, payment.amount					
		from city					
		JOIN address 
			ON city.city_id = address.city_id					
		JOIN customer 
			ON address.address_id = customer.address_id					
		JOIN rental 
			ON customer.customer_id = rental.customer_id					
		JOIN payment 
			ON rental.rental_id = payment.rental_id) inner_table					
GROUP BY  city						
ORDER BY 2 DESC						
LIMIT 10						



-- SLIDE TWO QUERY:
					
SELECT title, SUM(amount) AS total_amount				
FROM				
	(SELECT film.title, payment.amount			
		FROM film			
		JOIN inventory
			 ON film.film_id = inventory.film_id			
		JOIN rental 
			ON inventory.inventory_id = rental.inventory_id			
		JOIN  payment 
			ON rental.rental_id = payment.rental_id	) inner_table		
GROUP BY title				
ORDER BY 2 DESC				
LIMIT 10	

-- SLIDE THREE QUERY:

SELECT name, SUM(amount) AS total_amount	
FROM							
(SELECT category.name, payment.amount						
FROM category 						
JOIN film_category ON category.category_id = film_category.category_id						
JOIN film 
	ON film_category.film_id = film.film_id
JOIN inventory 
	ON film.film_id = inventory.inventory_id						
JOIN rental 
	ON inventory.inventory_id = rental.inventory_id						
JOIN payment 
	ON rental.rental_id = payment.rental_id) inner_table						
GROUP BY  name							
ORDER BY 2 DESC						
LIMIT 5		

-- SLIDE FOUR QUERY:

SELECT customer.first_name || ' ' || customer.last_name AS full_name, customer.customer_id, 
rental.rental_date,
RANK() OVER (PARTITION BY rental.customer_id ORDER BY rental.rental_date DESC) AS rank 
FROM customer						
JOIN rental 
	ON customer.customer_id = rental.customer_id 
WHERE customer.customer_id IN (1)



					




