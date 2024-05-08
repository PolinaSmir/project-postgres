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

-- CREATE TABLE employees(
--   id serial PRIMARY KEY,
--   name varchar(64) NOT NULL CHECK(name != ''),
--   salary int 
-- )