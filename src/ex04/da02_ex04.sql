SELECT pp.pizza_name, pizzeria.name AS pizzeria_name, pp.price
FROM
    (SELECT * FROM menu
        WHERE pizza_name='mushroom pizza' OR pizza_name='pepperoni pizza') AS pp
FULL JOIN pizzeria ON pp.pizzeria_id = pizzeria.id WHERE pp.pizza_name IS NOT NULL
ORDER BY pizza_name, pizzeria_name