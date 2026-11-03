-- Ejercicio 03 - c
-- Variedades de café que no están sembradas en ningún lote (RIGHT JOIN)

SELECT
    T2.variety_name AS variety,
    T2.species AS species
FROM farm.plot_varieties AS T1
RIGHT JOIN farm.coffee_varieties AS T2
    ON T1.variety_id = T2.variety_id
WHERE T1.plot_variety_id IS NULL
ORDER BY T2.variety_name ASC;
/*
 variety | species
---------+---------
(0 filas)
*/