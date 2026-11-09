/*
	Select the brand, model and price from cars
		where the price is greater than the sold price
			of any car that was sold by Frankie Fender
		and the car has not been sold
*/

-- SELECT brand, model, price FROM cars
--   WHERE price > ANY (
--     SELECT SC.sold_price FROM sold_cars SC
--       JOIN staff S ON SC.seller = S.id
--       WHERE S.name = 'Frankie Fender'
--   ) AND sold IS FALSE;


/*
  Customer wants to buy a Volkswagen which is cheaper
  than any FORD
*/

-- SELECT brand, model, price FROM cars
--   WHERE price < ANY (
--     SELECT price FROM cars
--       WHERE brand = 'Ford'
--   ) AND brand = 'Volkswagen'

/*
  Has anyone sold a car worth more than another salesperson's
  total sales
*/

-- SELECT sold_price, name 
--  FROM sold_cars 
--   JOIN staff ON staff.id = sold_cars.seller
--   WHERE sold_price > ANY (
--     SELECT SUM(sold_price) AS total_sales FROM sold_cars
--     GROUP BY seller
--   ) 

/*
  Find any car worth more than a dealership's sale
*/

SELECT brand, model, price FROM cars
 WHERE price > ANY (
    SELECT SUM(sold_price) FROM sold_cars
     JOIN staff ON staff.id = sold_cars.seller
     GROUP BY staff.dealership_id
 )

