/*
	Select brand, model, condition, year and price from cars
	Only select cars which have not been sold, and:
		* If the year is 1960 or earlier, the condition must be 4 or greater
		* If the year is 1970 or earlier, the condition must be 3 or greater
		* If the year is 1980 or earlier, the condition must be 2 or greater
		* If the year is 1990 or earlier, the condition must be 1 or greater
		* and any other cars (ELSE TRUE)
	Order by year then condition
*/

-- SELECT brand, model, condition, year, price
-- 	FROM cars
-- 	WHERE
-- 	sold IS FALSE
-- 	AND CASE
-- 		WHEN year <= 1960 THEN condition >= 4
-- 		WHEN year <= 1970 THEN condition >= 3
-- 		WHEN year <= 1980 THEN condition >= 2
-- 		WHEN year <= 1990 THEN condition >= 1
-- 		ELSE TRUE
-- 	END
-- ORDER BY year, condition;


/*
	Select the brand, model, condition and price from cars
	Only select cars if sold is false, and:
		* The condition is >= 4 then the price is below 100000
		* The condition is >= 3 then the price is below 50000
		* The condition is >= 1 then the price is below 20000
		* and any other cars (ELSE TRUE)
	Order by condition
*/

SELECT brand, model, condition, price FROM cars
  WHERE 
    sold IS FALSE
	AND CASE
	    WHEN condition >= 4 THEN price < 100000
		WHEN condition >= 3 THEN price < 50000
		WHEN condition >= 1 THEN price < 20000
		ELSE TRUE
	END
ORDER BY condition