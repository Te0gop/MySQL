SELECT * FROM employees;

SELECT 
    e.employee_id, e.job_title, e.address_id, a.address_text
FROM employees e
	INNER JOIN addresses a ON e.address_id = a.address_id
ORDER BY e.address_id
LIMIT 5;

SELECT e.first_name, e.last_name, t.name AS 'town', a.address_text FROM employees e
JOIN addresses a ON e.address_id = a.address_id
JOIN towns t ON a.town_id = t.town_id 
ORDER BY e.first_name ASC, e.last_name ASC LIMIT 5;

SELECT e.employee_id, e.first_name, e.last_name, d.name AS 'department_name' FROM employees e
JOIN departments d ON e.department_id = d.department_id WHERE d.name = 'Sales' ORDER BY e.employee_id DESC;

SELECT e.employee_id, e.first_name, e.salary AS salary, d.name AS 'department_name' FROM employees e
JOIN departments d ON e.department_id = d.department_id  WHERE salary > 15000
ORDER BY d.department_id DESC LIMIT 5;

SELECT e.employee_id, e.first_name FROM employees e
LEFT JOIN employees_projects ep ON e.employee_id = ep.employee_id ORDER BY e.employee_id DESC LIMIT 3;

SELECT first_name, last_name, hire_date, d.name AS 'dept_name' FROM employees e
JOIN departments d ON e.department_id = d.department_id WHERE d.name IN('Sales', 'Finance') 
AND hire_date > 1999-1-1 ORDER BY hire_date ASC;

SELECT e.employee_id, e.first_name, p.name AS 'project_name' FROM employees e 
JOIN employees_projects ep ON ep.employee_id = e.employee_id
JOIN projects p ON p.project_id = ep.project_id
WHERE p.start_date > '2002-08-13' AND p.end_date IS NULL ORDER BY first_name, 'project_name' ASC LIMIT 5; 

SELECT e.employee_id, e.first_name,
(CASE WHEN p.start_date > '2004-12-31' THEN NULL ELSE p.name END) AS `project_name` FROM employees e
JOIN employees_projects ep ON e.employee_id = ep.employee_id
JOIN projects p ON ep.project_id = p.project_id 
WHERE e.employee_id = 24 
ORDER BY project_name;

SELECT e.employee_id, e.first_name, e.manager_id, s.first_name AS `manager_name` FROM employees e
INNER JOIN employees s ON s.employee_id = e.manager_id
WHERE e.manager_id IN(3, 7) 
ORDER BY e.first_name;

SELECT e.employee_id, CONCAT(e.first_name, ' ', e.last_name) AS `employee_name`, 
CONCAT(s.first_name, ' ', s.last_name) AS `manager_name`, d.name AS `department_name` FROM employees e
INNER JOIN employees s ON s.employee_id = e.manager_id
INNER JOIN departments d ON e.department_id = d.department_id
ORDER BY e.employee_id LIMIT 5;