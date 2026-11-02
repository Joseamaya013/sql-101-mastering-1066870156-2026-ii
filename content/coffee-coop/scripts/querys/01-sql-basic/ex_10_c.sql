-- Ejercicio 10 - c
-- Liquidaciones del día sin deducciones, con valor bruto recalculado

SELECT
    T1.settlement_id AS settlement,
    T1.net_weight_kg AS net_weight_kg,
    T1.price_per_kg_applied AS price_per_kg,
    T1.gross_amount AS gross_cop,
    T1.net_weight_kg * T1.price_per_kg_applied AS check_gross_cop
FROM pay.settlements AS T1
WHERE
    T1.settlement_id LIKE 'STL-20260930-%'
    AND T1.deductions_amount = 0;

/*
         settlement      | net_weight_kg | price_per_kg | gross_cop  | check_gross_cop
---------------------+---------------+--------------+------------+-----------------
 STL-20260930-000016 |        180.13 |     21779.00 | 3923051.27 |    3923051.2700
 STL-20260930-000005 |        158.94 |     21608.00 | 3434375.52 |    3434375.5200
 STL-20260930-000042 |        300.18 |     23455.00 | 7040721.90 |    7040721.9000
 STL-20260930-000006 |        145.01 |     22847.00 | 3313043.47 |    3313043.4700
 STL-20260930-000019 |        134.15 |     22808.00 | 3059693.20 |    3059693.2000
 STL-20260930-000008 |        152.95 |     22477.00 | 3437857.15 |    3437857.1500
 STL-20260930-000021 |        219.83 |     22347.00 | 4912541.01 |    4912541.0100
 STL-20260930-000056 |        169.43 |     21050.00 | 3566501.50 |    3566501.5000
 STL-20260930-000049 |        129.47 |     22074.00 | 2857920.78 |    2857920.7800
  STL-20260930-000065 |        118.14 |     22623.00 | 2672681.22 |    2672681.2200
  */