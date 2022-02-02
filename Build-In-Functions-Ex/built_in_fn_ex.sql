SELECT * FROM soft_uni.employees;

SELECT first_name, last_name FROM employees WHERE SUBSTRING(first_name, 1, 2) = 'Sa';

SELECT first_name, last_name FROM employees WHERE last_name LIKE '%ei%';

SELECT first_name FROM employees WHERE department_id IN(3, 10) AND 
hire_date BETWEEN '1995-01-01' AND '2006-01-01' ORDER BY employee_id ASC;

SELECT first_name, last_name FROM employees WHERE job_title NOT LIKE '%Engineer%' ORDER BY employee_id ASC;

SELECT name FROM `towns` WHERE char_length(name) >= 5 AND char_length(name) <= 6 ORDER BY name ASC;

SELECT town_id, name FROM `towns` WHERE LEFT(name, 1) REGEXP '[R|K|B|E]' ORDER BY name ASC;

SELECT town_id, name FROM `towns` WHERE LEFT(name, 1) NOT REGEXP '[RBD]' ORDER BY name ASC;

ALTER VIEW v_employees_hired_after_2000 AS
SELECT first_name, last_name, hire_date FROM `employees` WHERE YEAR(hire_date) >= 2001 ORDER BY hire_date ASC;
SELECT * FROM v_employees_hired_after_2000;

SELECT first_name, last_name FROM `employees` WHERE LENGTH(last_name) = 5;

