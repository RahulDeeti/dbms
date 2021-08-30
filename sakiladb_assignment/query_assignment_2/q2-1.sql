select count(*) from film where special_features like '%Deleted Scenes%' and
	film.film_id in (select FID from film_list where film_list.category='Documentary');