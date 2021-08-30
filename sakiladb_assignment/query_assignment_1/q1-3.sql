select * from customer_list where country='India' and 
	ID in (select rental.customer_id from rental,inventory,film_list where 
		rental.inventory_id=inventory.inventory_id and inventory.film_id=film_list.FID and film_list.category ='Sports') ;