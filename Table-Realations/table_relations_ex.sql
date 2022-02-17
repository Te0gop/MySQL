CREATE TABLE persons(
person_id INT AUTO_INCREMENT PRIMARY KEY,
first_name VARCHAR(50),
salary DOUBLE,
passport_id INT
);

SELECT * FROM persons;

CREATE TABLE passports(
passport_id INT PRIMARY KEY AUTO_INCREMENT,
passport_number VARCHAR(50)
);

SELECT * FROM passports;

INSERT INTO persons(first_name, salary, passport_id) 
VALUES('Roberto', 43330.00, 102);

INSERT INTO persons(first_name, salary, passport_id)
VALUES('Tom', 56100.00, 103);

INSERT INTO persons(first_name, salary, passport_id)
VALUES('Yana', 60200.00, 101);

ALTER TABLE persons MODIFY COLUMN salary DOUBLE NOT NULL;
UPDATE persons SET salary = 56100.00 WHERE person_id = 2;
UPDATE persons SET salary = 60200.00 WHERE person_id = 3;
DROP TABLE persons;

SELECT * FROM persons;

INSERT INTO passports(passport_id, passport_number)
VALUES(101, 'N34FG21B');

INSERT INTO passports(passport_id, passport_number)
VALUES(102, 'K65LO4R7');

INSERT INTO passports(passport_id, passport_number)
VALUES(103, 'ZE657QP2');

ALTER TABLE passports MODIFY COLUMN passport_number VARCHAR(60) UNIQUE;

SELECT * FROM persons JOIN passports ON persons.passport_id = passports.passport_id;

ALTER TABLE passports ADD CONSTRAINT fk_passports_persons
FOREIGN KEY(passport_id) REFERENCES persons(passport_id);