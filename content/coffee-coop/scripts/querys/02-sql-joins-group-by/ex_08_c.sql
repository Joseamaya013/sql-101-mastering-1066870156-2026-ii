-- Ejercicio 08 - c
-- Entregas del 30 de septiembre de 2026 por punto de compra

SELECT
    T2.point_name AS collection_point,
    COUNT(*) AS deliveries_count,
    SUM(T1.gross_weight_kg) AS total_gross_kg,
    ROUND(AVG(T1.gross_weight_kg), 2) AS avg_gross_kg
FROM buy.deliveries AS T1
INNER JOIN buy.collection_points AS T2
    ON T1.collection_point_id = T2.collection_point_id
WHERE T1.delivery_id BETWEEN 'DLV-20260930-000000' AND 'DLV-20260930-999999'
GROUP BY T2.point_name
ORDER BY total_gross_kg DESC;

/*

               collection_point               | deliveries_count | total_gross_kg | avg_gross_kg
----------------------------------------------+------------------+----------------+--------------
 Punto de Compra Algeciras 1                  |                5 |        1093.81 |       218.76
 Punto de Compra Coromoro 1                   |                5 |        1079.24 |       215.85
 Punto de Compra San Andrés De Tumaco 1       |                6 |        1014.27 |       169.05
 Punto de Compra Timbiquí 1                   |                3 |         983.44 |       327.81
 Punto de Compra La Tebaida 1                 |                5 |         943.63 |       188.73
 Punto de Compra El Banco 1                   |                5 |         915.06 |       183.01
 Punto de Compra Bochalema 1                  |                4 |         849.99 |       212.50
 Punto de Compra Manzanares 1                 |                3 |         847.38 |       282.46
 Punto de Compra Paratebueno 1                |                4 |         839.51 |       209.88
 Punto de Compra El Bagre 1                   |                3 |         828.06 |       276.02
 Punto de Compra Rionegro 1                   |                5 |         750.49 |       150.10
 */
