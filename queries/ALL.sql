/*
  Find cars which are older than Ford.
*/

SELECT brand, model, year FROM cars
  WHERE year < ALL (
    SELECT year FROM cars
    WHERE brand = 'Ford'
  )

/*
  Find the cars which is more expensive than the cars sold.
*/

SELECT brand, model, price, city FROM cars
  JOIN dealerships ON dealerships.id = cars.dealership_id
  WHERE price > ALL (
    SELECT sold_price FROM sold_cars
  )