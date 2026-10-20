-- ##################################################
-- #     COFFEE COOP - CONSTRAINT TESTS             #
-- ##################################################
-- RUN IN coffee_coop_db - cc_admin
-- Run each block separately (select it and press F5).

-- ==================================================
-- A. VALID DATA (these succeed)
-- ==================================================

INSERT INTO geo.departments (department_code, department_name)
VALUES ('54', 'Norte de Santander');

INSERT INTO geo.municipalities (municipality_code, municipality_name, department_code)
VALUES ('54172', 'Chinácota', '54');

INSERT INTO farm.farmers (document_number, first_name, last_name, birth_date, gender, phone_number, municipality_code)
VALUES ('1000000001', 'Ana', 'Perez', '1985-03-10', 'F', '3001234567', '54172');

INSERT INTO farm.farms (farmer_id, municipality_code, farm_name, rural_district, total_area_ha, altitude_masl)
SELECT farmer_id, '54172', 'La Esperanza', 'Vereda Centro', 5.50, 1600
FROM farm.farmers WHERE document_number = '1000000001';

-- ==================================================
-- B. INVALID DATA (each one fails)
-- ==================================================

-- B1. Invalid gender
-- Error: new row for relation "farmers" violates check constraint "chk_farmers_gender" (SQL state 23514)
-- Constraint: chk_farmers_gender
INSERT INTO farm.farmers (document_number, first_name, last_name, birth_date, gender, phone_number, municipality_code)
VALUES ('1000000002', 'Luis', 'Gomez', '1990-01-01', 'X', '3007654321', '54172');

-- B2. Repeated document number
-- Error: duplicate key value violates unique constraint "uq_farmers_document_number" (SQL state 23505)
-- Constraint: uq_farmers_document_number
INSERT INTO farm.farmers (document_number, first_name, last_name, birth_date, gender, phone_number, municipality_code)
VALUES ('1000000001', 'Pedro', 'Ruiz', '1992-05-05', 'M', '3009998888', '54172');

-- B3. Municipality that does not exist
-- Error: insert or update on table "farmers" violates foreign key constraint "fk_farmers_municipalities" (SQL state 23503)
-- Constraint: fk_farmers_municipalities
INSERT INTO farm.farmers (document_number, first_name, last_name, birth_date, gender, phone_number, municipality_code)
VALUES ('1000000003', 'Marta', 'Diaz', '1988-07-07', 'F', '3001112222', '99999');

-- B4. Missing required column (phone_number is NOT NULL)
-- Error: null value in column "phone_number" of relation "farmers" violates not-null constraint (SQL state 23502)
-- Constraint: NOT NULL on phone_number
INSERT INTO farm.farmers (document_number, first_name, last_name, birth_date, gender, municipality_code)
VALUES ('1000000004', 'Rosa', 'Mora', '1980-02-02', 'F', '54172');

-- B5. Two farms with the same name for the same farmer
-- Error: duplicate key value violates unique constraint "uq_farms_farmer_name" (SQL state 23505)
-- Constraint: uq_farms_farmer_name
INSERT INTO farm.farms (farmer_id, municipality_code, farm_name, rural_district, total_area_ha, altitude_masl)
SELECT farmer_id, '54172', 'La Esperanza', 'Vereda Norte', 3.00, 1700
FROM farm.farmers WHERE document_number = '1000000001';

-- B6. Farm with area equal to zero
-- Error: new row for relation "farms" violates check constraint "chk_farms_total_area" (SQL state 23514)
-- Constraint: chk_farms_total_area
INSERT INTO farm.farms (farmer_id, municipality_code, farm_name, rural_district, total_area_ha, altitude_masl)
SELECT farmer_id, '54172', 'El Mirador', 'Vereda Sur', 0, 1500
FROM farm.farmers WHERE document_number = '1000000001';

-- B7. Plot with an invalid shade type
-- Error: new row for relation "plots" violates check constraint "chk_plots_shade_type" (SQL state 23514)
-- Constraint: chk_plots_shade_type
INSERT INTO farm.plots (farm_id, plot_code, area_ha, planting_year, shade_type)
SELECT farm_id, 'L01', 1.00, 2020, 'moonlight'
FROM farm.farms WHERE farm_name = 'La Esperanza';

-- ==================================================
-- C. RULES THAT THE CURRENT SCRIPTS DO NOT ENFORCE
-- ==================================================

-- C1. Farmer who was under 18 when he joined (born 2015, joined today)
-- Result: INSERT 0 1 (accepted, no error)
-- Gap: no CHECK on birth_date / membership_date in 03-alter-tables.sql
INSERT INTO farm.farmers (document_number, first_name, last_name, birth_date, gender, phone_number, membership_date, municipality_code)
VALUES ('1000000005', 'Juan', 'Nino', '2015-01-01', 'M', '3004445555', CURRENT_DATE, '54172');

-- C2. Bank transfer without transaction_reference
-- Not tested: it needs a full chain (delivery, settlement). Also, transaction_reference
-- is nullable and chk_payments_method only validates the method name,
-- so this rule is not enforced either.