SELECT l.name,SUM(l.total_count) AS total_count
FROM
(
(SELECT pizzeria.name,
COUNT(pizzeria_id) AS total_count
FROM person_visits
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
GROUP BY 1
ORDER BY 2 DESC
)

UNION ALL

(SELECT pizzeria.name,
COUNT(pizzeria.name) AS total_count
FROM person_order
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY 1
ORDER BY 2 DESC)
) l
GROUP BY l.name
ORDER BY 2 DESC,1 ASC;


















































