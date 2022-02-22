DELIMITER $$
CREATE PROCEDURE usp_get_employees_salary_above_35000()
BEGIN
SELECT first_name, last_name FROM employees WHERE salary > 35000 
ORDER BY first_name, last_name ASC, employee_id ASC;
END $$

CALL usp_get_employees_salary_above_35000();

DELIMITER $$
CREATE PROCEDURE usp_get_employees_salary_above(s INT)
BEGIN
	SELECT first_name, last_name FROM employees WHERE salary >= s 
	ORDER BY first_name, last_name ASC, employee_id ASC;
END $$

CALL usp_get_employees_salary_above(48100);

DELIMITER $$
CREATE PROCEDURE ups_get_town_starting_with(input_str VARCHAR(50))
BEGIN
	DECLARE town_wildcard VARCHAR(50);
    SET town_wildcard := concat(input_str, '%');
    SELECT t.name FROM towns t WHERE lower(t.name) LIKE lower(town_wildcard) ORDER BY t.name;
END $$

CALL ups_get_town_starting_with('b');

DELIMITER $$
CREATE PROCEDURE usp_get_employees_from_town(str VARCHAR(20))
BEGIN
	DECLARE str_town_name VARCHAR(20);
    SET str_town_name := str;
	SELECT first_name, last_name FROM employees e
    JOIN addresses a ON e.address_id = a.address_id
    JOIN towns t ON a.town_id = t.town_id
    WHERE t.name = str_town_name ORDER BY e.first_name, e.last_name, e.employee_id ASC;
END $$

CALL usp_get_employees_from_town('Sofia');

DELIMITER $$
CREATE FUNCTION ufn_get_salary_level(input_salary DOUBLE)
RETURNS VARCHAR(20)
BEGIN
		DECLARE returned_salary VARCHAR(20);
		SET returned_salary := ((CASE 
		WHEN input_salary BETWEEN 0 AND 30000 THEN 'Low' 
		WHEN input_salary BETWEEN 30000 AND 50000 THEN 'Average'
		WHEN input_salary > 50000 THEN 'High'
        END));
        RETURN returned_salary;
END $$

SET GLOBAL log_bin_trust_function_creators = 1;

SELECT ufn_get_salary_level(43300.00) ;

DELIMITER $$
CREATE PROCEDURE usp_get_employees_by_salary_level (salary_level VARCHAR(10))
BEGIN
	SELECT first_name, last_name, salary from employees e WHERE
		(CASE 
		WHEN salary_level = 'Low' THEN e.salary BETWEEN 0 AND 30000
		WHEN salary_level = 'Average' THEN e.salary BETWEEN 30000 AND 50000
		WHEN salary_level = 'High' THEN e.salary > 50000
		END) ORDER BY first_name DESC, last_name DESC;
END $$

CALL usp_get_employees_by_salary_level('High');

DELIMITER $$
CREATE FUNCTION ufn_is_word_comprised(set_of_letters varchar(50), word varchar(50))
RETURNS BOOLEAN
BEGIN
	DECLARE result BOOLEAN;
    DECLARE word_length INT;
    DECLARE curr_index INT;
    
    SET result := TRUE;
    SET word_length := char_length(word);
    SET curr_index := 1;
    
    WHILE (curr_index <= word_length) DO 
		IF(set_of_letters NOT LIKE (concat('%', substr(word, curr_index, 1), '%'))) THEN
			SET result := FALSE;
		END IF;
        SET curr_index := curr_index + 1;
    END WHILE;
	RETURN result;
END $$

SELECT ufn_is_word_comprised('oistmiahf', 'Sofia');

DELIMITER $$
CREATE PROCEDURE usp_get_holders_full_name ()
BEGIN
	SELECT concat(first_name, ' ', last_name) AS `full_name` FROM account_holders ah
    ORDER BY full_name ASC, ah.id ASC;
END $$

CALL usp_get_holders_full_name();

DELIMITER $$
CREATE PROCEDURE usp_get_holders_with_balance_higher_than(num INT)
BEGIN
	SELECT ah.first_name, ah.last_name FROM account_holders ah
    JOIN accounts a ON ah.id = a.account_holder_id
    WHERE a.balance > num ORDER BY first_name, last_name, a.account_holder_id ASC;
END $$

CALL usp_get_holders_with_balance_higher_than(7000);

DELIMITER $$
CREATE FUNCTION ufn_calculate_future_value (sum DOUBLE, rate DOUBLE, years INT)
RETURNS DOUBLE
BEGIN
	DECLARE result DOUBLE;
    SET result := ROUND(sum * POW((1 + rate), years), 4);
	RETURN result;
END $$

SELECT ufn_calculate_future_value (1000, 0.1, 5);

DELIMITER $$
CREATE PROCEDURE usp_calculate_future_value_for_account(acc_id INT, int_rate DOUBLE)
BEGIN
	SELECT a.id AS `account_id`, ah.first_name, ah.last_name, a.balance  AS `current_balance`, 
    (SELECT ufn_calculate_future_value (a.balance, int_rate, 5)) AS `balance_in_5_years`
    FROM account_holders ah
    JOIN accounts a ON ah.id = a.id WHERE a.id = acc_id;
END
DELIMITER $$

CALL usp_calculate_future_value_for_account(2, 0.1);

CREATE TABLE logs(
log_id INT PRIMARY KEY AUTO_INCREMENT,
account_id INT,
old_sum DECIMAL(19,4),
new_sum DECIMAL(19,4)
);

DELIMITER $$
CREATE TRIGGER tr_logs
AFTER UPDATE 
ON accounts
FOR EACH ROW 
BEGIN
	INSERT INTO logs(account_id, old_sum, new_sum) VALUES(OLD.id, OLD.balance, NEW.balance);
END; $$

UPDATE accounts SET balance = balance + 10 WHERE id = 1;
SELECT * from logs;
