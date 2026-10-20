-- ##################################################
-- #     COFFEE COOP - ENVIRONMENT VALIDATION       #
-- ##################################################
-- RUN IN coffee_coop_db - cc_admin

-- 01. Tables per schema
-- Expected: buy 4 · farm 7 · geo 2 · pay 2
SELECT table_schema, COUNT(*) AS total_tables
FROM information_schema.tables
WHERE table_schema IN ('geo', 'farm', 'buy', 'pay')
GROUP BY table_schema
ORDER BY table_schema;

-- 02. Constraints per type
-- Expected: CHECK 35 · FOREIGN KEY 17 · PRIMARY KEY 15 · UNIQUE 16
-- NOTE: with the current scripts the result is CHECK 20 (the 03-alter-tables.sql
-- script defines 20 CHECK constraints). On PostgreSQL 18, NOT NULL constraints
-- also appear in pg_constraint, so they are listed separately below.
SELECT
    CASE c.contype
        WHEN 'p' THEN 'PRIMARY KEY'
        WHEN 'f' THEN 'FOREIGN KEY'
        WHEN 'u' THEN 'UNIQUE'
        WHEN 'c' THEN 'CHECK'
        WHEN 'n' THEN 'NOT NULL'
    END AS constraint_type,
    COUNT(*) AS total
FROM pg_constraint c
JOIN pg_namespace n ON n.oid = c.connamespace
WHERE n.nspname IN ('geo', 'farm', 'buy', 'pay')
GROUP BY c.contype
ORDER BY c.contype;