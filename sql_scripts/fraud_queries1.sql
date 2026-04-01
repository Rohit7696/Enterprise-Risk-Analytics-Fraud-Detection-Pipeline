-- Create the Environment
CREATE DATABASE IF NOT EXISTS FinanceRiskDB;
USE FinanceRiskDB;

-- Define the Table Structure
CREATE TABLE transactions (
    distance_from_home FLOAT,
    distance_from_last_transaction FLOAT,
    ratio_to_median_purchase_price FLOAT,
    repeat_retailer INT, -- 1 = Yes, 0 = No
    used_chip INT,
    used_pin_number INT,
    online_order INT,
    fraud INT -- Our Target Column
);

select * from card_transdata;

select count(*) from card_transdata;

-- Verify Data Integrity (The 'Senior' Check)
-- Ensuring we have a clean dataset before running business logic
SELECT 
    COUNT(*) AS total_records, 
    COUNT(CASE WHEN fraud IS NULL THEN 1 END) AS missing_target_values
FROM card_transdata;

-- Query 1: Identifying High-Risk Transactions (Ratio > 3x Median)

SELECT 
    distance_from_home, 
    ratio_to_median_purchase_price, 
    online_order
FROM card_transdata
WHERE ratio_to_median_purchase_price > 3.0
AND online_order = 1
ORDER BY ratio_to_median_purchase_price DESC;

-- Query 2: Fraud Rate by Retailer Type (Repeat Retailer vs New)
SELECT 
    repeat_retailer, 
    COUNT(*) as total_tx, 
    SUM(fraud) as fraud_cases,
    (SUM(fraud) * 100.0 / COUNT(*)) as fraud_percentage
FROM card_transdata
GROUP BY repeat_retailer;


-- Fraud Rate by Retailer Type (Repeat Retailer vs New)
SELECT 
    CASE WHEN repeat_retailer = 1 THEN 'Returning Merchant' ELSE 'New Merchant' END AS merchant_status, 
    COUNT(*) as total_transactions, 
    SUM(fraud) as confirmed_fraud_cases,
    ROUND((SUM(fraud) * 100.0 / COUNT(*)), 2) as fraud_percentage_rate
FROM card_transdata
GROUP BY repeat_retailer;


-- High-Risk Factor Overlap Analysis
SELECT 
    COUNT(*) as high_risk_count,
    SUM(fraud) as actual_fraud
FROM card_transdata
WHERE distance_from_home > 100
AND used_pin_number = 0       
AND online_order = 1;       

-- Insight: Identifying the 'Distance-Risk' Threshold
SELECT 
    CASE 
        WHEN distance_from_home < 10 THEN 'Local (<10km)'
        WHEN distance_from_home BETWEEN 10 AND 100 THEN 'Regional (10-100km)'
        ELSE 'International/Long-Distance (>100km)'
    END AS travel_category,
    COUNT(*) AS volume,
    SUM(fraud) AS fraud_count,
    ROUND(AVG(fraud) * 100, 2) AS fraud_rate_percentage
FROM card_transdata
GROUP BY 1
ORDER BY fraud_rate_percentage DESC;   

