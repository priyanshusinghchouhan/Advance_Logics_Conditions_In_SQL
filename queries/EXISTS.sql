/*
	Select the city, state and date established of dealerships
		Where there are no existing cars in stock
		
	Format the date in 'YYYY-MM-DD' format using TO_CHAR()
		and alias it as 'est'
*/

-- SELECT city, state, TO_CHAR(established, 'YYYY-MM-DD') AS est
--  FROM dealerships
--   WHERE NOT EXISTS (
--     SELECT 1 FROM cars WHERE dealership_id = dealerships.id  
--   )


/*
  Find expensive cars with their location
*/

-- SELECT city, state FROM dealerships
--   WHERE EXISTS (
--     SELECT 1 FROM cars 
--     WHERE dealership_id = dealerships.id
--      AND price > 50000
--   );


/*
  Find the salespersons who have not 
  sold a car for more than $45000
*/

SELECT name, role FROM staff
  WHERE NOT EXISTS (
    SELECT 1 FROM sold_cars
     WHERE seller = staff.id
     AND sold_price > 45000
  ) AND role = 'Salesperson'