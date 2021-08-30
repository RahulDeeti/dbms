SELECT  category, COUNT(*) FROM film_list WHERE
    FID IN (SELECT  film_id  FROM  customer_list,rental,inventory  WHERE
            customer_list.ID = rental.customer_id AND rental.inventory_id = inventory.inventory_id
				and customer_list.name = 'PATRICIA JOHNSON')
GROUP BY category ORDER BY COUNT(*) DESC LIMIT 3;