-- QUESTIONS

-- 1. What is the fresh food price breakdown for the vegetables?
SELECT Vegetable, RetailPrice AS Price 
FROM vegetable_prices_2022
WHERE State = "Fresh";

-- 2. What is the frozen food price breakdown for the vegetables?
SELECT Vegetable, RetailPrice AS Price 
FROM vegetable_prices_2022
WHERE State = "Frozen";

-- 3. What is the canned food price breakdown for the vegetables?
SELECT Vegetable, RetailPrice AS Price 
FROM vegetable_prices_2022
WHERE State = "Canned";

-- 4. Give the complete range of the prices of fresh foods in increasing order.
SELECT Vegetable, RetailPrice 
FROM vegetable_prices_2022 
WHERE State = "Fresh"
ORDER BY RetailPrice ASC;

-- 5. Give the complete range of the prices of frozen foods in increasing order.
SELECT Vegetable, RetailPrice 
FROM vegetable_prices_2022 
WHERE State = "Frozen"
ORDER BY RetailPrice ASC;

-- 6. Give the complete range of the prices of canned foods in increasing order.
SELECT Vegetable, RetailPrice 
FROM vegetable_prices_2022 
WHERE State = "Canned"
ORDER BY RetailPrice ASC;