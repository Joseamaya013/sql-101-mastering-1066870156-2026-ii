-- Ejercicio 09 - c
-- Fincas con al menos 3 análisis y puntaje en taza promedio >= 84

SELECT
    T3.farm_name AS farm,
    COUNT(*) AS analyses_count,
    ROUND(AVG(T1.cup_score), 2) AS avg_cup_score
FROM buy.quality_analyses AS T1
INNER JOIN buy.deliveries AS T2
    ON T1.delivery_id = T2.delivery_id
INNER JOIN farm.farms AS T3
    ON T2.farm_id = T3.farm_id
GROUP BY T3.farm_id, T3.farm_name
HAVING
    COUNT(*) >= 3
    AND AVG(T1.cup_score) >= 84
ORDER BY avg_cup_score DESC;

/*
   farm       | analyses_count | avg_cup_score
------------------+----------------+---------------
 El Caney         |              3 |         90.00
 Monteverde       |              4 |         90.00
 El Tesoro        |              3 |         90.00
 Los Pinos        |              5 |         90.00
 Las Delicias     |              5 |         90.00
 La Cristalina    |              3 |         90.00
 Santa Clara      |              3 |         90.00
 La Unión         |              3 |         90.00
 El Arrayán       |              3 |         90.00
 El Paraíso       |              3 |         90.00
 */
