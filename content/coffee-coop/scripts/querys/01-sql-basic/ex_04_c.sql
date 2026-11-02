-- Ejercicio 04 - c
-- Municipios del país cuyo nombre contiene "pamplona" (ILIKE)

SELECT
    T1.municipality_code AS municipality_code,
    T1.municipality_name AS municipality
FROM geo.municipalities AS T1
WHERE T1.municipality_name ILIKE '%pamplona%'
ORDER BY T1.municipality_name ASC;
/*
 municipality_code | municipality
-------------------+--------------
 54518             | Pamplona


*/