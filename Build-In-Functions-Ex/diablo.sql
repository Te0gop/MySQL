SELECT * FROM diablo.users;
SELECT user_name, RIGHT(email, length(email)-INSTR(email, '@')) AS `Email Provider` FROM users 
ORDER BY `Email Provider` ASC, user_name ASC;

SELECT u.user_name, substr(u.email, position('@' IN u.email) + 1) AS `Email Provider` FROM users u 
ORDER BY `Email Provider` ASC, user_name ASC;

SELECT user_name, ip_address FROM users WHERE ip_address LIKE '___.1%.%.___' ORDER BY user_name ASC;
