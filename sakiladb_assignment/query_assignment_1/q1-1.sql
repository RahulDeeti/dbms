select title from film, film_category, category where rating='PG-13' and 
film.film_id=film_category.film_id and
film_category.category_id=category.category_id and name='Comedy';