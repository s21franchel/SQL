CREATE VIEW v_price_with_discount AS(
SELECT price,pizza_name,name,CAST(price - price * 0.1 AS INTEGER) AS discount_price
FROM person_order
JOIN menu ON person_order.menu_id = menu.id
JOIN person ON person_order.person_id = person.id
ORDER BY name,pizza_name
);

-- SELECT *
-- FROM v_price_with_discount




