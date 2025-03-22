SELECT person.name,menu.pizza_name,menu.price,
CAST(menu.price - (menu.price * person_discounts.discount/100) AS INT) AS discount_price, piz.name AS pizzeria_name
FROM person_order INNER JOIN menu ON menu.id = person_order.menu_id
INNER JOIN person ON person.id = person_order.person_id
INNER JOIN pizzeria piz ON menu.pizzeria_id = piz.id
INNER JOIN person_discounts ON person.id = person_discounts.person_id and person_discounts.pizzeria_id = menu.pizzeria_id


ORDER BY 1,2
