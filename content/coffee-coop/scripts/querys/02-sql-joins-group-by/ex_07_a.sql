-- Ejercicio 07 - a
-- Resumen de las entregas del 30 de septiembre de 2026

SELECT
    COUNT(*) AS total_deliveries,
    SUM(T1.gross_weight_kg) AS total_gross_kg,
    ROUND(AVG(T1.gross_weight_kg), 2) AS avg_gross_kg,
    COUNT(DISTINCT T1.farm_id) AS farms_delivering
FROM buy.deliveries AS T1
WHERE T1.delivery_id BETWEEN 'DLV-20260930-000000' AND 'DLV-20260930-999999';
/*
 total_deliveries | total_gross_kg | avg_gross_kg | farms_delivering
------------------+----------------+--------------+------------------
              300 |       52190.96 |       173.97 |              300
              
*/              