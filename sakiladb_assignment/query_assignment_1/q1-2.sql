SELECT title, COUNT(title) FROM film_list,inventory,rental WHERE
    film_list.category = 'Horror'  AND film_list.FID = inventory.film_id
        AND inventory.inventory_id = rental.inventory_id
GROUP BY title LIMIT 3;