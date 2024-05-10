SELECT u.id, u.first_name, u.last_name, u.email, count(o.id) AS "orders_amount" FROM
users AS u LEFT JOIN orders AS o
ON u.id = o.customer_id
GROUP BY u.id
ORDER BY "orders_amount";

CREATE OR REPLACE VIEW users_with_orders_amount AS (
  SELECT u.id, u.first_name, u.last_name, u.email, count(o.id) AS "orders_amount" FROM
  users AS u LEFT JOIN orders AS o
  ON u.id = o.customer_id
  GROUP BY u.id
  ORDER BY "orders_amount"
);

SELECT * FROM users_with_orders_amount;

-------------------------------------------

SELECT email, orders_amount FROM users_with_orders_amount
WHERE orders_amount < 2;

CREATE OR REPLACE VIEW orders_with_price AS (
SELECT o.id, o.customer_id, sum(p.price * otp.quantity) AS "order_sum", o.status FROM
orders AS o JOIN orders_to_products AS otp
ON o.id = otp.order_id
JOIN products AS p
ON p.id = otp.product_id
GROUP BY o.id
);

DROP VIEW orders_with_price;

-------------------------------------------

SELECT u.id, u.email, sum(owp.order_sum) AS "sum" FROM 
users AS u LEFT JOIN orders_with_price AS owp
ON u.id = owp.customer_id
GROUP BY u.id
ORDER BY "sum";

-- Создание функции 

CREATE FUNCTION add_numbers(number1 integer, number2 integer)
RETURNS integer
AS
$$
BEGIN
  RETURN number1*number2;
END;
$$
LANGUAGE plpgsql;

-- Вызов функции

SELECT add_numbers('5', 15);

-- Удаление функции

DROP FUNCTION add_numbers;

DROP FUNCTION add_numbers(integer, integer);-- Правильный вызов функции
