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
