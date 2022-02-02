SELECT * FROM geography.countries;
SELECT LOCATE('a', country_name) > 3 , country_name FROM countries;

SELECT country_name, iso_code FROM `countries`;

SELECT p.peak_name, r.river_name, 
LOWER(CONCAT(p.peak_name, SUBSTR(r.river_name, 2))) AS `mix` 
FROM peaks p, rivers r WHERE RIGHT(p.peak_name, 1) = LEFT(r.river_name, 1) ORDER BY `mix`;

