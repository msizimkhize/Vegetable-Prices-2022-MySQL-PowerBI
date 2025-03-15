-- DATA CLEANING

USE project;

ALTER TABLE `project`.`vegetable prices 2022` 
RENAME TO  `project`.`vegetable_prices_2022`;

SELECT * FROM vegetable_prices_2022;

ALTER TABLE vegetable_prices_2022
CHANGE COLUMN Form State text NULL;

SELECT min(RetailPrice) AS cheapest,
max(RetailPrice) AS most_expensive
FROM vegetable_prices_2022;

SET sql_safe_updates = 0;

ALTER TABLE vegetable_prices_2022 ADD RetailPriceZAR double;
UPDATE vegetable_prices_2022
SET RetailPriceZAR = (18.16)*RetailPrice;

DESCRIBE vegetable_prices_2022;

ALTER TABLE vegetable_prices_2022 DROP COLUMN RetailPrice;


ALTER TABLE vegetable_prices_2022 ADD CupEquivalentPriceZAR double;
UPDATE vegetable_prices_2022
SET CupEquivalentPriceZAR = (18.16)*CupEquivalentPrice;

DESCRIBE vegetable_prices_2022;

ALTER TABLE vegetable_prices_2022 DROP COLUMN CupEquivalentPrice;