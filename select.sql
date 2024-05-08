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

SELECT * FROM users
LIMIT 50
OFFSET 100;

-- OFFSET = LIMIT * page_which_we_want

SELECT id, first_name || ' ' || last_name AS "full name", gender, email FROM users;

SELECT id, concat(first_name, ' ', last_name) AS "full name", gender, email FROM users;

SELECT id, concat(first_name, ' ', last_name) AS "full name", gender, email FROM users
WHERE char_length(concat(first_name, ' ', last_name)) < 10;

SELECT * FROM
(
  SELECT id, concat(first_name, ' ', last_name) AS "full name", gender, email FROM users
) AS "FN"
WHERE char_length("FN"."full name") < 10;


-------------------
--Practice

CREATE TABLE workers(
  id serial PRIMARY KEY,
  name varchar(256) NOT NULL CHECK(name != ''),
  salary int CHECK(salary >= 0),
  birthday date
);

-- 1,2
INSERT INTO workers(name, salary) VALUES
('Oleg', 300),
('Yaroslava', 500);

-- 3
INSERT INTO workers(name, salary) VALUES
('Sasha', 1000),
('Masha', 200);

-- 4
UPDATE workers
SET salary = 500
WHERE name = 'Oleg';

-- 5
UPDATE workers
SET salary = 400
WHERE salary > 500;

-- 6
SELECT * FROM workers
WHERE salary > 400;

-- 7
SELECT * FROM workers
WHERE id = 4;

-- 8
SELECT salary, extract("years" FROM age(birthday)) FROM workers
WHERE name = 'Oleg';

-- 9
SELECT * FROM workers
WHERE name = 'Petya';

-- 10
SELECT * FROM workers
WHERE extract("years" FROM age(birthday)) = 30 OR salary > 800;

-- 11
SELECT * FROM workers
WHERE extract("years" FROM age(birthday)) BETWEEN 25 AND 28;

-- 12
SELECT * FROM workers
WHERE extract("months" FROM birthday) = 9;

-- 13
DELETE FROM workers
WHERE id = 4;

-- 14
DELETE FROM workers
WHERE name = 'Oleg';

-- 15
DELETE FROM workers
WHERE extract("years" FROM age(birthday)) > 30;


---- Agregatni functions
SELECT max(weight) FROM users;

SELECT min(weight) FROM users;

SELECT sum(weight) FROM users;

SELECT avg(weight) FROM users;

SELECT count(id) FROM users;

SELECT gender, avg(weight) FROM users
GROUP BY gender;

SELECT avg(weight) FROM users
WHERE gender = 'male';

SELECT avg(weight) FROM users
WHERE extract("years" FROM age(birthday)) > 10;

-----------------------------------------------------------
-- Homework with products

-- 1
SELECT count(*) FROM products;

-- 2
SELECT avg(price) FROM products;

-- 3
SELECT brand, avg(price) FROM products
GROUP BY brand;

-- 4
SELECT brand, count(price) FROM products
GROUP BY brand;
-- 5
SELECT * FROM
(
  SELECT brand, avg(price) FROM products
  GROUP BY brand
) AS "A"
WHERE "A".brand = 'Huawei';

-----------  Sorting  ----------

SELECT * FROM users
ORDER BY birthday;

SELECT * FROM users
ORDER BY birthday ASC,
      first_name ASC;

UPDATE users
SET birthday = '2001-09-14'
WHERE id BETWEEN 2500 AND 2532;

SELECT * FROM products
ORDER BY quantity
LIMIT 3;

-------------------------------
-- Practice sorting

-- 6
SELECT *, extract("years" FROM age(birthday)) AS age FROM users
ORDER BY extract("years" FROM age(birthday));

SELECT *, extract("years" FROM age(birthday)) AS age FROM users
ORDER BY extract("years" FROM age(birthday)) DESC;

-- 7
SELECT * FROM products
ORDER BY price DESC;

-- 8
SELECT * FROM products
ORDER BY price DESC
LIMIT 5;

----------------------------------------------------------------------
-- Frilter groups --

SELECT count(*), extract("years" FROM age(birthday)) AS "age_group" FROM users
GROUP BY "age_group";

SELECT count(*), extract("years" FROM age(birthday)) AS "age_group" FROM users
GROUP BY "age_group"
HAVING count(*) < 500;

SELECT count(*), extract("years" FROM age(birthday)) AS "age_group" FROM users
GROUP BY "age_group"
ORDER BY "age_group";

---------------------------------------------------------------------------
-- Relation operations --

CREATE TABLE A(
  v char(3),
  t int
);

CREATE TABLE B(
  v char(3)
);

INSERT INTO A VALUES
('XXX', 1),
('XXY', 1),
('XXZ', 1),
('XYX', 2),
('XYY', 2),
('XYZ', 2),
('YXX', 3),
('YXY', 3),
('YXZ', 3);

INSERT INTO B VALUES
('ZXX'),
('XXX'),-- A
('ZXZ'),
('YXZ'),-- A
('YXY');-- A

SELECT * FROM A, B;

SELECT v FROM A
UNION
SELECT * FROM B;

SELECT v FROM A
INTERSECT
SELECT * FROM b;

SELECT * FROM B
EXCEPT
SELECT v FROM A;

INSERT INTO users (first_name, last_name, email,gender,birthday,is_subscribed)
VALUES 
('User 1', 'Test 1', 'email1@gmail.com', 'male', '1990-09-10', true),
('User 2', 'Test 2', 'email2@gmail.com', 'female', '1990-09-10', true),
('User 3', 'Test 3', 'email3@gmail.com', 'male', '1990-09-10', false);

SELECT id FROM users
INTERSECT
SELECT customer_id FROM orders;

SELECT id FROM users
EXCEPT
SELECT customer_id FROM orders;

----------------------------------------------------
-- Объединение множеств --


SELECT a.v AS id, a.t AS price, b.v AS "phone.id" FROM a, b
WHERE a.v = b.v;

---

SELECT a.v AS id, a.t AS price, b.v AS "phone.id"
FROM a JOIN b
ON a.v = b.v;

SELECT * 
FROM users JOIN orders
ON users.id = orders.customer_id
WHERE users.id = 2501;
-------
SELECT u.*, o.id AS "order_id"
FROM users AS u JOIN orders AS o
ON u.id = o.customer_id
WHERE u.id = 2501;

SELECT *
FROM products AS p JOIN orders_to_products AS otp
ON p.id = otp.product_id
WHERE p.brand = 'Samsung';

SELECT count(*)
FROM products AS p JOIN orders_to_products AS otp
ON p.id = otp.product_id
WHERE p.brand = 'Samsung';

SELECT brand, count(*) AS "quantity"
FROM products AS p JOIN orders_to_products AS otp
ON p.id = otp.product_id
GROUP BY p.brand
ORDER BY "quantity" DESC;

-- users + amount of orders

SELECT u.*, count(*) FROM
users AS u JOIN orders AS o
ON u.id = o.customer_id
GROUP BY u.id
ORDER BY u.id DESC;

-- users that dont have an order

-- var 1

SELECT * FROM
users AS u LEFT JOIN orders AS o
ON u.id = o.customer_id
WHERE o.customer_id IS NULL;

-- var 2

SELECT * FROM users
WHERE id IN (
  SELECT id FROM users
  EXCEPT
  SELECT customer_id FROM orders
);

INSERT INTO products (brand, model, category, price, quantity)
VALUES ('Microsoft', '12345', 'phones', 200, 2);

-- SELECT * FROM products
-- WHERE brand = 'Microsoft';

---------------------------------------
-- Homework

-- 1
SELECT * FROM
products AS p LEFT JOIN orders_to_products AS otp
ON p.id = otp.product_id
WHERE otp.product_id IS NULL;

-- 2
SELECT order_id, count(*) FROM orders_to_products
GROUP BY order_id
ORDER BY order_id;

-- 3
SELECT p.id, p.brand, p.model, sum(otp.quantity) AS customer_sum FROM
products AS p JOIN orders_to_products AS otp
ON p.id = otp.product_id
GROUP BY p.id
ORDER BY customer_sum DESC;