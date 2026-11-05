-- Ejercicio 10 - c
-- Municipios de Norte de Santander con al menos 5 fincas

SELECT
    T2.municipality_name AS municipality,
    COUNT(*) AS farms_count,
    SUM(T1.total_area_ha) AS total_area_ha,
    ROUND(AVG(T1.altitude_masl), 2) AS avg_altitude_masl
FROM farm.farms AS T1
INNER JOIN geo.municipalities AS T2
    ON T1.municipality_code = T2.municipality_code
WHERE T2.department_code = '54'
GROUP BY T2.municipality_code, T2.municipality_name
HAVING COUNT(*) >= 5
ORDER BY avg_altitude_masl DESC;

/*
offee_coop_db-> ORDER BY avg_altitude_masl DESC;
   municipality    | farms_count | total_area_ha | avg_altitude_masl
-------------------+-------------+---------------+-------------------
 Ragonvalia        |         377 |        990.30 |           1688.35
 Cucutilla         |         315 |        806.32 |           1674.67
 Cácota            |         345 |        950.47 |           1670.86
 Labateca          |         358 |       1103.31 |           1669.03
 Ábrego            |         330 |        900.02 |           1666.75
 Puerto Santander  |         323 |        803.82 |           1666.08
 Cúcuta            |         308 |        849.52 |           1657.92
 Santiago          |         356 |       1013.47 |           1654.08
 Pamplonita        |         326 |        901.48 |           1653.36
 Pamplona          |         368 |       1062.41 |           1652.74
 Bochalema         |         360 |        938.72 |           1651.86
 -- Más  --
 */