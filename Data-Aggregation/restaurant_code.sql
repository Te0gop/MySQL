SELECT * FROM restaurant.employees;

SELECT department_id, SUM(salary) FROM employees GROUP BY department_id;
SELECT department_id, AVG(salary) FROM employees GROUP BY department_id;

SELECT department_id, COUNT(salary) AS `salary count` FROM employees AS e GROUP BY e.department_id;

SELECT department_id, job_title, AVG(salary), SUM(salary) / COUNT(salary) 
FROM employees GROUP BY job_title, department_id ORDER BY department_id, job_title;

SELECT department_id, SUM(salary) AS `salaries_sum` FROM employees GROUP BY department_id 
HAVING `salaries_sum` >= 100000;

SELECT department_id, COUNT(employee_id) AS `Number of employees` FROM employees 
GROUP BY department_id ORDER BY department_id, COUNT(employee_id);

SELECT department_id, ROUND(AVG(salary), 2) AS `Average Salary` FROM employees GROUP BY department_id;

SELECT department_id, MIN(salary) AS `Min Salary` FROM employees GROUP BY department_id
HAVING `Min Salary` > 800;

SELECT * FROM products;
SELECT COUNT(*) FROM products WHERE category_id = 2 AND price > 8;

SELECT category_id, ROUND(AVG(price), 2) AS `Average Price`, ROUND(MIN(price), 2) AS `Cheapest Product`,
ROUND(MAX(price), 2) AS `Most Expensive Product` FROM products GROUP BY category_id;
