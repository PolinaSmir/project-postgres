/* BEGIN;

-- COMMIT; -- FIXATES CHANGES

-- ROLLBACK; -- CANCEL ALL CHANGES AND RETURNS TO THE STARTING POINT */

BEGIN;

-- 1
INSERT INTO orders(customer_id, status) VALUES
(2501, 'new')
RETURNING id;

-- 2
INSERT INTO orders_to_products(order_id, product_id, quantity) VALUES
(LASTVAL(), 1, 1),
(LASTVAL(), 2, 3),
(LASTVAL(), 3, 1);

COMMIT;


ROLLBACK;

-- 8073 + 1 = 8074 orders +
-- 20172 + 3 = 20175 otp +