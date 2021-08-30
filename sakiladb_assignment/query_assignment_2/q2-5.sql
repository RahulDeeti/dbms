SELECT count(*) as 'No. 0f R movies rented by susan wilson' FROM film_list,inventory,rental,customer_list WHERE
    film_list.FID = inventory.film_id AND inventory.inventory_id = rental.inventory_id AND rental.customer_id = customer_list.ID AND 
		customer_list.name = 'SUSAN WILSON' and film_list.rating = 'R';