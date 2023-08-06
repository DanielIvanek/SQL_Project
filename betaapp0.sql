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

SELECT country 
FROM base_table

EXCEPT

SELECT DISTINCT CASE WHEN country = 'The Democratic Republic of Congo'
						THEN 'Congo (Kinshasa)'
					WHEN country = 'United States'
						THEN 'US'
					WHEN country = 'Congo'
						THEN 'Congo (Brazzaville)'
					WHEN country = 'Bahamas, The'
						THEN 'Bahamas'
					WHEN country = 'Brunei Darussalam'
						THEN 'Brunei'
					WHEN country = 'South Korea'
						THEN 'Korea, South'
					WHEN country = 'Micronesia, Fed. Sts.'
						THEN 'Micronesia'
					ELSE country
				END AS country
FROM economies e;


/*ALTER TABLE danza_je_pepa.economies MODIFY COLUMN country VARCHAR(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL NULL;*/



/*
SELECT country 
FROM base_table

EXCEPT

SELECT DISTINCT  country 
FROM economies e;
*/

