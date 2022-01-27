SELECT * FROM hospital.employees;

SELECT id, first_name, last_name, job_title FROM departments;

SELECT id, concat (`first_name`, ' ' , `last_name`) AS 'full name' FROM employees;

SELECT id, concat_ws(' ', `first_name` , `last_name`) 
AS 'full name', job_title AS 'job tittle', salary FROM employees WHERE salary > 1000;

SELECT  first_name, last_name, salary FROM employees;

SELECT `id`, concat_ws(' ', `first_name`, `last_name`) AS 'full name' FROM employees;

SELECT id, first_name, last_name, salary FROM employees 
WHERE salary > 1000 ORDER BY id;

SELECT first_name, last_name, department_id FROM employees WHERE department_id = 1;
SELECT id, first_name, last_name, salary FROM employees WHERE salary BETWEEN 1100 AND 2000;

SELECT id, first_name, last_name, job_title, department_id, salary FROM employees
 WHERE department_id = 4 AND salary >= 1600 ORDER BY id;
 
 CREATE VIEW result_set AS
 SELECT concat(first_name, ' ' , last_name) AS 'full name' , salary FROM employees WHERE salary > 1600;
 
 SELECT * FROM result_set;
 DROP VIEW result_set;
 
 CREATE VIEW v_top_paid_employee AS
 SELECT * FROM employees ORDER BY salary DESC LIMIT 1;
 
 SELECT * FROM v_top_paid_employee;
 
 ALTER VIEW v_top_paid_employee AS
 SELECT * FROM employees ORDER BY salary DESC LIMIT 3;
 
 INSERT INTO employees (first_name, last_name, job_title, department_id, salary)
 VALUES ('Martin', 'Garix', 'DJ', 3, 2000);
 
 SELECT * FROM employees;
 
 DELETE FROM employees WHERE department_id IN (1, 2);
 
 UPDATE employees SET salary = salary * 1.1,
					  job_title = CONCAT('Senior ', job_title) 
WHERE department_id = 3;

SELECT * FROM employees;

UPDATE employees SET salary = salary * 1.1 WHERE job_title = 'Therapist'; 
SELECT salary FROM employees ORDER BY salary;