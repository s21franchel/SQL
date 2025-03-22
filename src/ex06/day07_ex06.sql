SELECT pizzeria.name,COUNT(*) AS "count_of_orders",round(AVG(price),2) AS average_price,
MAX(price) AS max_price,MIN(price) AS min_price
FROM menu
INNER JOIN person_order ON menu_id = menu.id
INNER JOIN pizzeria ON pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY 1;