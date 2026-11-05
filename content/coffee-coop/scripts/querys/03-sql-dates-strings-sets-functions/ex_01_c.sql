-- Ejercicio 01 - c
-- Resultado de NOW() y CURRENT_DATE en una sola fila, sin tabla

SELECT
    NOW() AS now_ts,
    CURRENT_DATE AS today;

/*
            now_ts             |   today
-------------------------------+------------
 2026-11-05 00:07:11.297802-05 | 2026-11-05
(1 fila)
*/