-- ============================================================
-- Phase 5 (Beginner): SQL Analysis for Insurance Dataset
-- Goal: Reproduce the same core insights from Python in SQL.
-- ============================================================

-- -----------------------------
-- STEP 1) Database and table
-- -----------------------------
CREATE DATABASE IF NOT EXISTS healthcareinsurance;
USE healthcareinsurance;

DROP TABLE IF EXISTS insurance;

CREATE TABLE insurance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    age INT,
    sex VARCHAR(10),
    bmi DECIMAL(5,2),
    children INT,
    smoker VARCHAR(3),
    region VARCHAR(15),
    charges DECIMAL(12,2)
);

-- -----------------------------
-- STEP 2) Load CSV into MySQL
-- -----------------------------
-- IMPORTANT:
-- 1) Place insurance.csv in MySQL uploads folder
-- 2) Update the path below if your file name/path is different
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/insurance.csv'
INTO TABLE insurance
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(age, sex, bmi, children, smoker, region, charges);

-- -----------------------------
-- STEP 3) Data understanding
-- -----------------------------
DESCRIBE insurance;
SELECT * FROM insurance LIMIT 10;

SELECT COUNT(*) AS total_records FROM insurance;

-- -----------------------------
-- STEP 4) Data quality checks
-- -----------------------------
SELECT
    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS age_nulls,
    SUM(CASE WHEN sex IS NULL THEN 1 ELSE 0 END) AS sex_nulls,
    SUM(CASE WHEN bmi IS NULL THEN 1 ELSE 0 END) AS bmi_nulls,
    SUM(CASE WHEN children IS NULL THEN 1 ELSE 0 END) AS children_nulls,
    SUM(CASE WHEN smoker IS NULL THEN 1 ELSE 0 END) AS smoker_nulls,
    SUM(CASE WHEN region IS NULL THEN 1 ELSE 0 END) AS region_nulls,
    SUM(CASE WHEN charges IS NULL THEN 1 ELSE 0 END) AS charges_nulls
FROM insurance;

SELECT sex, COUNT(*) AS cnt FROM insurance GROUP BY sex;
SELECT smoker, COUNT(*) AS cnt FROM insurance GROUP BY smoker;
SELECT region, COUNT(*) AS cnt FROM insurance GROUP BY region;

-- -----------------------------
-- STEP 5) Baseline metrics
-- -----------------------------
SELECT
    ROUND(AVG(charges), 2) AS avg_charges,
    ROUND(MIN(charges), 2) AS min_charges,
    ROUND(MAX(charges), 2) AS max_charges
FROM insurance;

-- -----------------------------
-- STEP 6) Key business comparisons
-- -----------------------------
-- 6A) Smoker vs non-smoker
SELECT
    smoker,
    COUNT(*) AS total_people,
    ROUND(AVG(charges), 2) AS avg_charges,
    ROUND(MIN(charges), 2) AS min_charges,
    ROUND(MAX(charges), 2) AS max_charges
FROM insurance
GROUP BY smoker
ORDER BY avg_charges DESC;

-- 6B) Region comparison
SELECT
    region,
    COUNT(*) AS total_people,
    ROUND(AVG(charges), 2) AS avg_charges
FROM insurance
GROUP BY region
ORDER BY avg_charges DESC;

-- 6C) Age comparison (grouped by age)
SELECT
    age,
    COUNT(*) AS total_people,
    ROUND(AVG(charges), 2) AS avg_charges
FROM insurance
GROUP BY age
ORDER BY age;

-- 6D) BMI category comparison
SELECT
    CASE
        WHEN bmi < 18.5 THEN 'Underweight'
        WHEN bmi >= 18.5 AND bmi < 25 THEN 'Normal'
        WHEN bmi >= 25 AND bmi < 30 THEN 'Overweight'
        ELSE 'Obese'
    END AS bmi_category,
    COUNT(*) AS total_people,
    ROUND(AVG(charges), 2) AS avg_charges
FROM insurance
GROUP BY bmi_category
ORDER BY avg_charges DESC;

-- 6E) Children comparison
SELECT
    children,
    COUNT(*) AS total_people,
    ROUND(AVG(charges), 2) AS avg_charges
FROM insurance
GROUP BY children
ORDER BY children;

-- -----------------------------
-- STEP 7) High-cost and high-risk segments
-- -----------------------------
-- Top 10 highest charge records
SELECT age, sex, bmi, children, smoker, region, charges
FROM insurance
ORDER BY charges DESC
LIMIT 10;

-- Smoker + obese segment
SELECT
    COUNT(*) AS high_risk_people,
    ROUND(AVG(charges), 2) AS avg_high_risk_cost
FROM insurance
WHERE smoker = 'yes' AND bmi >= 30;

-- Combined segment table: smoker x bmi category
SELECT
    smoker,
    CASE
        WHEN bmi < 18.5 THEN 'Underweight'
        WHEN bmi >= 18.5 AND bmi < 25 THEN 'Normal'
        WHEN bmi >= 25 AND bmi < 30 THEN 'Overweight'
        ELSE 'Obese'
    END AS bmi_category,
    COUNT(*) AS total_people,
    ROUND(AVG(charges), 2) AS avg_charges
FROM insurance
GROUP BY smoker, bmi_category
ORDER BY avg_charges DESC;

-- -----------------------------
-- STEP 8) Final insight template
-- -----------------------------
-- Fill these from your query results:
-- 1) Total records = ______
-- 2) Average charges = ______
-- 3) Smoking effect (avg yes/no) = about ____x
-- 4) Highest-cost BMI category = ______
-- 5) Region differences are (small/moderate/large) compared to smoking effect
-- 6) Highest-cost segment is usually smoker + obese
