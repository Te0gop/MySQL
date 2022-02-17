CREATE TABLE teachers (
teacher_id INT PRIMARY KEY,
name VARCHAR(50),
manager_id INT,
CONSTRAINT fk_teachers
FOREIGN KEY(manager_id) REFERENCES teachers(teacher_id)
);

SELECT * FROM teachers;

INSERT INTO teachers(teacher_id, name, manager_id) VALUES (101, 'John', 0);
INSERT INTO teachers(teacher_id, name, manager_id) VALUES (102, 'Maya', 106);
INSERT INTO teachers(teacher_id, name, manager_id) VALUES (103, 'Silvia', 106);
INSERT INTO teachers(teacher_id, name, manager_id) VALUES (104, 'Ted', 105);
INSERT INTO teachers(teacher_id, name, manager_id) VALUES (105, 'Mark', 101);
INSERT INTO teachers(teacher_id, name, manager_id) VALUES (106, 'Greta', 101);

