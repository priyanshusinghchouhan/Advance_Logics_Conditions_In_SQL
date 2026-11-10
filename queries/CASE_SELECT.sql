/*
	Rodney is assigning bonuses for his staff on the following terms:
		- Salespeople who have made more than $100,000 in sales receive $10,000
		- Salespeople who have made more than $75,000 in sales receive $5,000
		- Every other staff member gets a bonus of $1,000
	
	Select from the sold_cars table, joined with staff where
		sold_cars(seller) = staff(id)
	Show all staff, even if they have made no sales
	
	Select:
		* staff(name)
		* staff(role)
		* staff(dealership_id)
		* the sum of the staff member's sales - alias as total_sales
	
	Use CASE to select the correct value, as defined above, aliased as bonus
	
	Use GROUP BY to format the output, and ORDER BY bonus then dealership_id
*/

SELECT name, role, dealership_id, SUM(sold_price) AS total_sales,
  CASE 
    WHEN SUM(sold_price) > 100000 THEN 'Bonus received $10,000'
    WHEN SUM(sold_price) > 75000 THEN 'Bonus received $5,000'
    ELSE 'Bonus received $1,000'
  END AS Bonus
 FROM staff 
  LEFT JOIN sold_cars ON sold_cars.seller = staff.id
GROUP BY (name, role, dealership_id)
ORDER BY Bonus, dealership_id;
