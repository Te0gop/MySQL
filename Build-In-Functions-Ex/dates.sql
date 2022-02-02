SELECT * FROM diablo.games;

SELECT 
    name, DATE(start) AS `date`
FROM
    games
WHERE
    YEAR(start) >= 2011
        AND YEAR(start) <= 2012
ORDER BY start ASC , name ASC
LIMIT 50;