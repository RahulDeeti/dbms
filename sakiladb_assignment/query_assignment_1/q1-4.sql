select * from customer_list where country='Canada' and 
	ID in (Select rental.customer_id from rental,inventory,film_actor,actor where 
		rental.inventory_id=inventory.inventory_id and inventory.film_id=film_actor.film_id and
			film_actor.actor_id = actor.actor_id and actor.first_name='NICK' and actor.last_name='WAHLBERG');