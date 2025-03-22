SELECT menu_1.pizza_name,pizzeria_1.name AS pizzeria_name1,pizzeria_2.name AS pizzeria_name2,menu_1.price
FROM menu AS menu_1
INNER JOIN menu AS menu_2 ON menu_1.price = menu_2.price
INNER JOIN pizzeria AS pizzeria_1 ON menu_1.pizzeria_id = pizzeria_1.id
INNER JOIN pizzeria AS pizzeria_2 ON menu_2.pizzeria_id = pizzeria_2.id
WHERE menu_1.id > menu_2.id
AND menu_1.pizza_name = menu_2.pizza_name
ORDER BY menu_1.pizza_name;
