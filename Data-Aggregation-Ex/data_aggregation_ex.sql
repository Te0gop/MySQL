SELECT * FROM gringotts.wizzard_deposits;

SELECT COUNT(id) AS `count` FROM wizzard_deposits;

SELECT MAX(magic_wand_size) AS `longest_magic_wand` FROM wizzard_deposits;

SELECT deposit_group, MAX(magic_wand_size) AS `longest_magic_wand` FROM wizzard_deposits
GROUP BY deposit_group ORDER BY magic_wand_size DESC, deposit_group;

SELECT deposit_group FROM wizzard_deposits GROUP BY deposit_group ORDER BY AVG(magic_wand_size) ASC LIMIT 1;

SELECT deposit_group, SUM(deposit_amount) AS `total_sum` from wizzard_deposits 
GROUP BY deposit_group ORDER BY deposit_group ASC;

SELECT deposit_group, SUM(deposit_amount) AS `total_sum` from wizzard_deposits WHERE magic_wand_creator = 'Ollivander family'
GROUP BY deposit_group ORDER BY deposit_group ASC;

SELECT deposit_group, SUM(deposit_amount) AS `total_sum` from wizzard_deposits WHERE magic_wand_creator = 'Ollivander family'
GROUP BY deposit_group HAVING `total_sum` < 150000 ORDER BY `total_sum` DESC;

SELECT deposit_group, magic_wand_creator, MIN(deposit_charge) AS `min_deposit_charge` 
FROM wizzard_deposits GROUP BY deposit_group, magic_wand_creator ORDER BY magic_wand_creator, deposit_group ASC;


SELECT 
(CASE
WHEN age between 0 and 10 then '[0-10]'
WHEN age between 11 and 20 then '[11-20]'
WHEN age between 21 and 30 then '[21-30]'
WHEN age between 31 and 40 then '[31-40]'
WHEN age between 41 and 50 then '[41-50]'
WHEN age between 51 and 60 then '[51-60]'
ELSE '[61+]'
end) AS `age_group`, COUNT(age) AS `wizzard_count` FROM wizzard_deposits 
GROUP BY `age_group` ORDER BY `age_group` ASC;

