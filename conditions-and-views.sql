SELECT * FROM orders
WHERE status = true;

INSERT INTO orders(customer_id, status) VALUES
(3994, 'new');

CREATE TYPE order_status AS ENUM('new', 'processing', 'shiped', 'done', 'canceled');

ALTER TABLE orders
ALTER COLUMN status
TYPE order_status
USING (
  CASE status
  WHEN false THEN 'processing'
  WHEN true THEN 'done'
  ELSE 'new'
  END
)::order_status;

DROP VIEW users_with_orders_amount, orders_with_price;

SELECT * FROM orders
ORDER BY created_at DESC;

UPDATE orders
SET status = 'done'
WHERE id = 14083;