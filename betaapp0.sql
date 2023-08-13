
#binarni promenna pro vikend/prac. den rocni obdobi 
/*SELECT
    *,
    CASE 
        WHEN DAYOFWEEK(date) = 1 OR DAYOFWEEK(date) = 7 THEN 1
        ELSE 0
    END AS vikend_flag,
    CASE 
        WHEN MONTH(date) IN (3, 4, 5) THEN 0 -- Jaro
        WHEN MONTH(date) IN (6, 7, 8) THEN 1 -- Léto
        WHEN MONTH(date) IN (9, 10, 11) THEN 2 -- Podzim
        WHEN MONTH(date) IN (12, 1, 2) THEN 3 -- Zima
    END AS rocni_obdobi
FROM
    covid19_basic_differences cbd ;*/
/*
CREATE TABLE base_table (

SELECT
	cbd.date,
	cbd.country,
	cbd.confirmed,
	ct.tests_performed,
	c.population,
	c.population_density,
	c.median_age_2018,
	 CASE 
        WHEN DAYOFWEEK(cbd.date) = 1 OR DAYOFWEEK(cbd.date) = 7 THEN 1
        ELSE 0
    END AS vikend_flag,
    CASE 
        WHEN MONTH(cbd.date) IN (3, 4, 5) THEN 0 -- Jaro
        WHEN MONTH(cbd.date) IN (6, 7, 8) THEN 1 -- Léto
        WHEN MONTH(cbd.date) IN (9, 10, 11) THEN 2 -- Podzim
        WHEN MONTH(cbd.date) IN (12, 1, 2) THEN 3 -- Zima
    END AS rocni_obdobi
FROM
	(
	SELECT
		CASE
			WHEN country = 'Czechia'
		THEN 'Czech Republic'
			WHEN country = 'Russia'
		THEN 'Russian Federation'
			WHEN country = 'Democratic Republic of Congo'
		THEN 'Congo (Kinshasa)'
			WHEN country = 'South Korea'
		THEN 'Korea, South'
			WHEN country = 'Taiwan'
		THEN 'Taiwan*'
			WHEN country = 'United States'
		THEN 'US'
			WHEN country = 'Libyan Arab Jamahiriya'
 		THEN 'Libya'
			ELSE country
		END AS country,
		date,
		confirmed
	FROM
		covid19_basic_differences cbd  
) AS cbd
LEFT JOIN covid19_tests ct 
ON
	cbd.country = ct.country
	AND cbd.date = ct.date
LEFT JOIN countries c 
ON cbd.country  = c.country
);

*/
/*select *
from  covid19_tests ct 


except

select distinct country
from  covid19_basic_differences cbd
*/
/*
SELECT date, country 
FROM base_table

EXCEPT

SELECT date, country 
FROM covid19_basic_differences

*/


CREATE TABLE base_table_hdp
(
SELECT  
		bt.`date`,
		bt.confirmed,
		bt.tests_performed,
		bt.population,
		bt.population_density,
		bt.median_age_2018,
		bt.vikend_flag,
		bt.rocni_obdobi,
		e.gini,
		e.mortaliy_under5,
		ROUND(e.GDP/ bt.population, 5) AS HDP_na_obyvatele,	
CASE WHEN e.country = 'The Democratic Republic of Congo'
						THEN 'Congo (Kinshasa)'
					WHEN e.country = 'United States'
						THEN 'US'
					WHEN e.country = 'Congo'
						THEN 'Congo (Brazzaville)'
					WHEN e.country = 'Bahamas, The'
						THEN 'Bahamas'
					WHEN e.country = 'Brunei Darussalam'
						THEN 'Brunei'
					WHEN e.country = 'South Korea'
						THEN 'Korea, South'
					WHEN e.country = 'Micronesia, Fed. Sts.'
						THEN 'Micronesia'
					ELSE e.country
				END AS country 
FROM economies e 
LEFT JOIN base_table bt 
ON e.country = bt.country AND YEAR(bt.`date`) = e.`year` + 1
);



SELECT
	bth.population,
	bth.country,
	r.country,
	r.religion,
	r.population,
	(SELECT round(r.population/bth.population * 100 , 2), r.religion, bth.country  
		FROM base_table_hdp bth 
		LEFT JOIN religions r 
		ON bth.country = r.country
		WHERE r.religion like 'Christianity' AND r.`year` = '2020'
		GROUP BY r.`year`) AS smth
FROM
	base_table_hdp bth
LEFT JOIN religions r 
ON
	bth.country = r.country
WHERE
	r.YEAR = '2020';



CREATE VIEW rel_pr1 AS (
SELECT 
	bth.population AS bth_pop,
	r.religion,
	r.population AS rel_pop,
	CASE WHEN r.country = 'Taiwan'
		    THEN 'Taiwan*'
		 WHEN r.country = 'US'
		 	THEN 'United States'
		 WHEN r.country = 'Federated States of Micronesia'
		 	THEN 'Micronesia'
		 WHEN r.country = 'South Korea'
		 	THEN 'Korea, South'
		 WHEN r.country = 'Congo'
		 	THEN 'Congo (Brazzaville)'
		 WHEN r.country = 'The Democratic Republic of Congo'
		 	THEN 'Congo (Kinshasa)'
		 WHEN r.country = 'Cape Verde'
		 	THEN 'Cabo Verde'
		 WHEN r.country = 'St. Vincent'
		 	THEN 'Saint Vincent'
		WHEN r.country = 'St. Kitts and Nevis'
		   THEN 'Saint Kitts and Nevis'
		WHEN r.country = 'St. Lucia'
			THEN 'Saint Lucia'
		WHEN r.country = 'St. Vincent and the Grenadines'
			THEN 'Saint Vincent and the Grenadines'
		ELSE r.country
				END AS country,
	bth.country AS bth_country,
	bth.`date`
FROM 
	base_table_hdp bth 
	LEFT JOIN religions r 
	ON bth.country = r.country
WHERE bth.date IN ('2020-01-29') AND r.`year` = '2020');





SELECT *
FROM rel_pr1;




/*ALTER TABLE danza_je_pepa.economies MODIFY COLUMN country VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL NULL;*/



/*
SELECT country 
FROM base_table

EXCEPT

SELECT DISTINCT  country 
FROM economies e;
*/




create VIEW  nwmuz as (
SELECT country,
	IF(religion = 'Christianity', round(rel_pop/bth_pop * 100 , 2),0) AS Christianity,
	IF(religion = 'Islam', round(rel_pop/bth_pop * 100 , 2),0) AS Islam,
	IF(religion = 'Judaism', round(rel_pop/bth_pop * 100 , 2),0) AS Judaism,
	IF(religion = 'Unaffiliated Religions', round(rel_pop/bth_pop * 100 , 2),0) AS Unaffiliated_Religions,
	IF(religion = 'Hinduism', round(rel_pop/bth_pop * 100 , 2),0) AS Hinduism,
	IF(religion = 'Buddhism', round(rel_pop/bth_pop * 100 , 2),0) AS Buddhism,
	IF(religion = 'Folk Religions', round(rel_pop/bth_pop * 100 , 2),0) AS Folk_religions,
	IF(religion = 'Other Religions', round(rel_pop/bth_pop * 100 , 2),0) AS Other_religions
FROM rel_pr1
);



SELECT bth.country,
       MAX(nwmuz.Christianity) AS Christianity,
       MAX(nwmuz.Islam) AS Islam,
       MAX(nwmuz.Judaism) AS Judaism,
       MAX(nwmuz.Unaffiliated_Religions) AS Unaffiliated_Religions,
       MAX(nwmuz.Hinduism) AS Hinduism,
       MAX(nwmuz.Buddhism) AS Buddhism,
       MAX(nwmuz.Folk_religions) AS Folk_religions,
       MAX(nwmuz.Other_religions) AS Other_religions
FROM base_table_hdp bth
LEFT JOIN nwmuz
ON bth.country = nwmuz.country
WHERE bth.`date` = '2020-01-29'
GROUP BY bth.country;




SELECT country
FROM base_table_hdp bth 

EXCEPT 

SELECT DISTINCT country 
FROM life_expectancy le


SELECT	CASE WHEN country = 'US'
		 	THEN 'United States'
		 WHEN country = 'Federated States of Micronesia'
		 	THEN 'Micronesia'
		 WHEN country = 'South Korea'
		 	THEN 'Korea, South'
		 WHEN country = 'Congo'
		 	THEN 'Congo (Brazzaville)'
		 WHEN country = 'The Democratic Republic of Congo'
		 	THEN 'Congo (Kinshasa)'
		 WHEN country = 'Cape Verde'
		 	THEN 'Cabo Verde'
		 WHEN country = 'St. Vincent'
		 	THEN 'Saint Vincent'
		WHEN country = 'St. Kitts and Nevis'
		   THEN 'Saint Kitts and Nevis'
		WHEN country = 'St. Lucia'
			THEN 'Saint Lucia'
		WHEN country = 'St. Vincent and the Grenadines'
			THEN 'Saint Vincent and the Grenadines'
		ELSE country
				END AS acountry,
       MAX(CASE WHEN `year` = '2015' THEN life_expectancy END) -
       MAX(CASE WHEN `year` = '1965' THEN life_expectancy END) AS life_expectancy_difference
FROM life_expectancy
WHERE `year` IN ('1965', '2015')
GROUP BY country ;






SELECT
	AVG(temp) AS prum_den_tep,
	city,
	date
FROM
	weather
WHERE
	time IN ('06:00', '09:00', '12:00', '15:00', '18:00', '20:00') AND city IS NOT NULL 
GROUP BY date, city;




#počet hodin v daném dni, kdy byly srážky nenulové
   SELECT
	DATE_FORMAT(date, '%Y-%m-%d') AS formatted_date,
	time,
	city,
	MAX(CAST(SUBSTRING_INDEX(gust, ' ', 1) AS UNSIGNED)) AS max_wind_gust
FROM weather w
GROUP BY date,city;



SELECT
	DATE_FORMAT(date, '%Y-%m-%d') AS formatted_date,
	time,
	city,
	sum(pocet_hodin_se_srazky)
FROM
	(
	SELECT
		CASE
			WHEN rain = 0 THEN 0
			ELSE 3
		END AS pocet_hodin_se_srazky,
		date,
		time,
		city
	FROM
		weather) w
WHERE
	city IS NOT NULL
GROUP BY
	date,
	city;





SELECT 
	AVG(temp) AS prum_den_tep,
	city,
	date
FROM
	weather
WHERE
	time IN ('06:00', '09:00', '12:00', '15:00', '18:00', '20:00') AND city IS NOT NULL 
GROUP BY date, city;





























