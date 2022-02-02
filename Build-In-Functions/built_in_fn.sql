SELECT concat(SUBSTRING(first_name, 1, 1), '. ', last_name) AS 'full_name' FROM authors;

SELECT title FROM books WHERE SUBSTRING(title, 1, 3) = 'The';

SELECT REPLACE ('Pesho', 'Pe', 'Go');

SELECT REPLACE(title, 'The', '***') AS title FROM books WHERE SUBSTRING(title, 1, 3) = 'The';

SELECT TRIM('    abc    ');
SELECT LTRIM('    abc    ');
SELECT RTRIM('    abc    ');
SELECT first_name FROM authors WHERE char_length(first_name) > 5;

SELECT LEFT('George', 3);
SELECT RIGHT('George', 2);

SELECT LOWER('GEORGE');
SELECT UPPER('george');

SELECT * FROM books WHERE LEFT(title, 3) = 'The';

SELECT REVERSE(first_name) FROM authors;

SELECT REPEAT('1', 5);

SELECT first_name, REPEAT('*', CHAR_LENGTH(first_name)) FROM authors;

SELECT first_name, LOCATE('g', first_name) FROM authors;

SELECT first_name FROM authors WHERE LOCATE('e', first_name, 2) > 2;

SELECT INSERT(first_name, 2, 0, '------') FROM authors;

SELECT ABS(-1), SQRT(2), SQRT(7), POW(2, 10), POW(PI(), 2), CONV(15, 10, 2), ROUND(2,23), FLOOR(2.2), CEILING(2.7),
SIGN(-1), SIGN(1), RAND();

SELECT first_name, last_name, timestampdiff(YEAR, born, NOW()) FROM authors; 
SELECT first_name, last_name, timestampdiff(DAY, born, died) FROM authors; 

SELECT * FROM books WHERE title LIKE 'Harry Potter%';


            