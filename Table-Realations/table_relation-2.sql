CREATE TABLE students (
student_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
name VARCHAR(60) NOT NULL
);

CREATE TABLE exams (
exam_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
name VARCHAR(60) NOT NULL
);

CREATE TABLE students_exams (
student_id INT,
exam_id INT NOT NULL,
PRIMARY KEY (student_id, exam_id)
);

INSERT INTO students(name) VALUES ('Mila');
INSERT INTO students(name) VALUES ('Toni');
INSERT INTO students(name) VALUES ('Ron');

INSERT INTO exams(exam_id, name) VALUES (101, 'Spring MVC');
INSERT INTO exams(exam_id, name) VALUES (102, 'Neo4j');
INSERT INTO exams(exam_id, name) VALUES (103, 'Oracle 11g');

INSERT INTO students_exams(student_id, exam_id) VALUES (1, 101);
INSERT INTO students_exams(student_id, exam_id) VALUES (1, 102);
INSERT INTO students_exams(student_id, exam_id) VALUES (2, 101);
INSERT INTO students_exams(student_id, exam_id) VALUES (3, 103);
INSERT INTO students_exams(student_id, exam_id) VALUES (2, 102);
INSERT INTO students_exams(student_id, exam_id) VALUES (2, 103);

SELECT * FROM students_exams;
SELECT * FROM students;
SELECT * FROM exams;

SELECT * FROM students JOIN students_exams ON students.student_id = students_exams.student_id;
SELECT * FROM exams JOIN students_exams ON exams.exam_id = students_exams.exam_id;

