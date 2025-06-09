# Average Global Vegetable Costs, Defined in the South African Rand (ZAR)

![](https://github.com/msizimkhize/Vegetable-Prices-2022-MySQL-PowerBI/blob/main/IMG/1140-colorfulrawveggies.jpg?raw=true)

***
## Abstract
This is a project reporting the average of the retail prices of vegetables internationally. The data was taken from a dataset presenting the multifacetedness of vegetable pricing. Within the scope of this report, the criterion for differentiating the vegetable retail prices were the following food retail states: canned, fresh and frozen.

The aims of the report are to identify the most costly foods, and extrapolate the long-term impact this may have globally, so far as the foods remain a necessity. The identification of the preservation states for the vegetables would further inform how severe the disparity of food provisions of nations which afford and nations cannot afford fresh foods.

The data on vegetable pricing was prepared:
- Zip folder containing dataset
- https://www.kaggle.com/code/devraai/fruit-vegetable-prices-2022-analysis/input?select=Vegetable+Prices+2022.csv

The projects was set about six subsidiary aims, which it sought to address, using the honed dataset. PowerBI was finally used to enable us to draw meaningful insights.
***

#### I) The loaded data is preprocessed and processed via MySQL using the prompts below

The table is renamed for use convenience.

```
USE project;

ALTER TABLE `project`.`vegetable prices 2022` 
RENAME TO  `project`.`vegetable_prices_2022`;


```
Further alterations and assignments are made, such that minimum and maximum vegetable retail prices can be housed.
```
SELECT * FROM vegetable_prices_2022;

ALTER TABLE vegetable_prices_2022
CHANGE COLUMN Form State text NULL;

SELECT min(RetailPrice) AS cheapest,
max(RetailPrice) AS most_expensive
FROM vegetable_prices_2022;


```
The unneeded columns are dropped, and the monetary currency is converted to the South African Rand (ZAR), as per the year 2025 weighting.
```
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

```
### II) Using MySQL, the six aims of the project are investigated. The results are captured as six datasets to be accepted by PowerBI.

The six major aims of the project are now addressed, by way of SQL prompts, which will yield tailored findings for the report.

 1. What is the fresh food price breakdown for the vegetables?
```
SELECT Vegetable, RetailPrice AS Price 
FROM vegetable_prices_2022
WHERE State = "Fresh";
```

2. What is the frozen food price breakdown for the vegetables?
```
SELECT Vegetable, RetailPrice AS Price 
FROM vegetable_prices_2022
WHERE State = "Frozen";
```

3. What is the canned food price breakdown for the vegetables?
```
SELECT Vegetable, RetailPrice AS Price 
FROM vegetable_prices_2022
WHERE State = "Canned";
```

4. Give the complete range of the prices of fresh foods in increasing order.
```
SELECT Vegetable, RetailPrice 
FROM vegetable_prices_2022 
WHERE State = "Fresh"
ORDER BY RetailPrice ASC;
```

5. Give the complete range of the prices of frozen foods in increasing order.
```
SELECT Vegetable, RetailPrice 
FROM vegetable_prices_2022 
WHERE State = "Frozen"
ORDER BY RetailPrice ASC;
```

6. Give the complete range of the prices of canned foods in increasing order.
```
SELECT Vegetable, RetailPrice 
FROM vegetable_prices_2022 
WHERE State = "Canned"
ORDER BY RetailPrice ASC;
```

***
### III) The six datasets which resulted from the focal questions were fed into PowerBI, and the following visualisations were acquired

#### Table on the range of retail prices of fresh vegetables listed in increasing order.
|Vegetable|Retail Price|
|---|---|
|Cabbage, green|0.797|
|Potatoes|0.8166|
|Carrots, cooked whole|0.9761|
|Carrots, raw whole|1.1062|
|Onions|1.1565|
|Sweet potatoes|1.1637|
|Celery, trimmed bunches|1.2136|
|Acorn squash|1.2453|
|Tomatoes, roma & plum|1.2473|
|Cucumbers without peel|1.2512|
|Cucumbers with peel|1.2473|
|Lettuce, iceberg|1.2512|
|Cabbage, red|1.2604|
|Butternut squash|1.2691|
|Carrots, baby|1.3507|
|Green pepper|1.4789|
|Zuchini|1.6359|
|Radish|1.8126|
|Red peppers|1.8742|
|Cauliflower heads|2.1841|
|Tomatoes, large round|2.1868|
|Corn|2.2281|
|Lettuce, romaine, heads|2.3074|
|Artichoke|2.4703|
|Celery sticks|2.4941|
|Green beans|2.6199|
|Avocados|2.6737|
|Brussels Sprouts|2.9139|
|Broccoli florets|2.9162|
|Turnip greens|2.925|
|Asparagus|2.9531|
|Broccoli heads|3.082|
|Collard greens|3.0881|
|Lettuce, romaine, hearts|3.2802|
|Kale|3.4338|
|Cauliflower florets|3.8022|
|Tomatoes, grape & cherry|3.8729|
|Mushrooms, whole|3.8929|
|Mushrooms, sliced|3.9224|
|Spinach, boiled|4.1214|
|Spinach, eaten raw|4.1214|
|Okra|5.1567|

#### Table on the range of retail prices of frozen vegetables listed in increasing order.
|Vegetable|Retail Price|
|---|---|
|Corn|1.6889|
|Carrots|1.7277|
|Mixed vegetables, carrots, peas, corn, green beans|1.7859|
|Mixed vegetables, peas and carrots|1.8433|
|Potatoes, french fries|1.9018|
|Green peas|1.996|
|Green beans|1.9983|
|Mixed vegetables, broccoli, cauliflower, carrots|2.1538|
|Okra|2.2528|
|Spinach|2.2796|
|Kale|2.2983|
|Broccoli|2.3458|
|Collard greens|2.3512|
|Cauliflower|2.3974|
|Mustard greens|2.4324|
|Lima beans|2.4401|
|Turnip greens|2.5169|
|Brussels sprouts|2.5949|
|Asparagus|6.8212|

#### Table on the range of retail prices of canned vegetables listed in increasing order.
|Vegetable|Retail Price|
|---|---|
|Potatoes|1.0266|
|Tamatoes|1.0715|
|Pinto beans|1.1189|
|Kidney beans|1.1208|
|Green beans|1.1291|
|Beets|1.1431|
|Corn|1.1543|
|Great northern beans|1.1583|
|Carrots|1.1979|
|Black beans|1.2387|
|Navy beans|1.2738|
|Green peas|1.3118|
|Turnip greens|1.3154|
|Blackeye peas|1.3164|
|Collard greens|1.3315|
|Mustard greens|1.3367|
|Mixed vegetables, peas & carrots|1.4754|
|Cabbage, sauerkraut|1.478|
|Lima beans|1.4785|
|Spinach|1.5676|
|Pumpkin|1.8642|
|Asparagus|3.4328|
|Artichoke|3.4498|
|Olives|53496|

![](https://github.com/msizimkhize/Vegetable-Prices-2022-MySQL-PowerBI/blob/main/IMG/Vegetable%20Prices%202022%20Report_page-0006.jpg?raw=true)

![](https://github.com/msizimkhize/Vegetable-Prices-2022-MySQL-PowerBI/blob/main/IMG/Vegetable%20Prices%202022%20Report_page-0005.jpg?raw=true)

![](https://github.com/msizimkhize/Vegetable-Prices-2022-MySQL-PowerBI/blob/main/IMG/Vegetable%20Prices%202022%20Report_page-0004.jpg?raw=true)

***
## Insights and Conclusion

After data cleaning and ETL, PowerBI gave a visualisation of the vegetable prices, by category. Within the fresh vegetable category, the data breakdown reveals that green cabbage is the most affordable of all the vegetables: a vegetable that does not appear within the frozen or canned vegetable categories. The next most inexpensive fresh vegetable is potatoes, which shows a positive correlation with potatoes in the canned vegetable category, where it is the most affordable vegetable. The potatoe too does not appear in the frozen vegetable category. The vegetable appearing on the lowest end of frozen vegetables is distinctly corn.

On the high end, the most expensive fresh vegetable is the Okra, which is one position off from being the median of the retail price of frozen vegetables. The most expensive canned vegetable is the olive, which is within a fifteen percent deviation from Asparagus. Asparagus lies within the high percentile of canned vegetables, closer to the median of fresh vegetables, and as the most costly frozen vegetable.

In the final analysis, frozen vegetables are more economical that canned food, with respect to innate state category per vegetable. The fresh foods are more in numbers than both canned and frozen foods, yet contain most of the high-end and most costly foods from the frozen and canned category within their middle to high percentile.

In the long-term, the clearest business insight indicates that fresh vegetables are best to sustain commerce, given their versatility. However, frozen vegetables would be superior when the provision of preserved food was required to be affordable. And lastly, canned foods cater for a substantially high number of rarer vegetable types, which are available in neither the frozen nor the fresh state.
***

![](https://github.com/msizimkhize/Vegetable-Prices-2022-MySQL-PowerBI/blob/main/IMG/F7379CRZGZ4Z.jpeg?raw=true)

#### Reach Out on LinkedIn

[![](https://raw.githubusercontent.com/msizimkhize/Vegetable-Prices-2022-MySQL-PowerBI/adc81f1d2ee7e3d74868bc8fdf859f13eba1fe5b/IMG/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f4c696e6b6564496e2d436f6e6e6563742d626c75653f7374796c653d666f722d7468652d6261646765266c6f676f3d6c696e6b6564696e.svg)](https://www.linkedin.com/in/msizimkhize/)