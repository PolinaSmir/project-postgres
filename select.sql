SELECT * FROM users;

SELECT id, first_name, last_name, email FROM users;

SELECT id, first_name, last_name, email FROM users
WHERE id >3995;

SELECT first_name, last_name FROM users
WHERE gender = 'female';

SELECT first_name, last_name, email FROM users
WHERE is_subscribed;

SELECT * FROM users
WHERE height IS NOT NULL;

SELECT first_name, last_name, email, is_subscribed FROM users
WHERE is_subscribed IS FALSE;

SELECT first_name, last_name, email FROM users
WHERE first_name = 'William';

SELECT id, first_name, last_name, email FROM users
WHERE first_name NOT IN ('William', 'John', 'Jason');

SELECT first_name, last_name, id FROM users
WHERE id >= 3100 AND id<=3200;

SELECT first_name, last_name, id FROM users
WHERE id BETWEEN 3100 AND 3200;

SELECT first_name, last_name FROM users
WHERE first_name LIKE 'K%';

SELECT first_name, last_name FROM users
WHERE first_name LIKE '_____';

SELECT first_name, last_name FROM users
WHERE first_name LIKE 'A__';

SELECT first_name, last_name FROM users
WHERE first_name LIKE '%f';

ALTER TABLE users
ADD COLUMN weight int CHECK(weight != 0 AND weight > 0);

UPDATE users
SET weight = 60;

UPDATE users
SET weight = 100
WHERE id BETWEEN 2000 AND 3000;

UPDATE users
SET weight = 95
WHERE id = 2568;

SELECT * FROM users
WHERE id = 2568;

/* Homework employees */

CREATE TABLE employees(
  id serial PRIMARY KEY,
  name varchar(64) NOT NULL CHECK(name != ''),
  salary int NOT NULL CHECK(salary >= 0),
  work_hours int NOT NULL CHECK(work_hours >= 0)
);

INSERT INTO employees(name, salary, work_hours) VALUES
('John', 1000, 20),
('Marrie', 2000, 200),
('Mark', 500, 0);

UPDATE employees
SET salary = salary*1.2
WHERE work_hours > 150;

INSERT INTO users(first_name, last_name, email, gender, birthday, is_subscribed) VALUES
('Test', 'Testovic', 'test@gmail.com', 'gender', '1800-12-12', false) RETURNING *;

SELECT * FROM users
WHERE id = 4001;

DELETE FROM users
WHERE id = 4001;

UPDATE users
SET birthday = '2010-01-01'
WHERE (gender = 'female' AND is_subscribed);

SELECT id,first_name, last_name, birthday, EXTRACT("years" FROM age(birthday)) FROM users;

-- SELECT id, first_name, last_name, make_interval(40, 8) FROM users;

SELECT id AS "Персональный номер", first_name AS "Имя", last_name AS "Фамилия" FROM users;

SELECT id, first_name, last_name, birthday, EXTRACT("years" FROM age(birthday)) AS years_old FROM users
WHERE EXTRACT("years" FROM age(birthday)) BETWEEN 2 AND 10;
