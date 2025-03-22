SET enable_seqscan = off;
EXPLAIN ANALYZE
SELECT pizzeria.name AS pizzeria_name,menu.pizza_name AS pizza_name
FROM menu 
INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id





