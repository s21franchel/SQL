SELECT menu.pizza_name AS pizza_name,menu.price AS price,pizzeria.name AS pizzeria_name
FROM menu
LEFT JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE NOT EXISTS (
SELECT 1
FROM person_order
WHERE person_order.menu_id = menu.id
)
ORDER BY menu.pizza_name,menu.price,pizzeria.name;
