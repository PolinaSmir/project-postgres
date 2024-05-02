CREATE TABLE orders(
  id serial PRIMARY KEY,
  created_at timestamp NOT NULL DEFAULT current_timestamp,
  customer_id int REFERENCES users(id)
);

DROP TABLE orders;

ALTER TABLE users
ADD COLUMN id serial PRIMARY KEY;

CREATE TABLE orders_to_products(
  product_id int REFERENCES products(id),
  order_id int REFERENCES orders(id),
  quantity int,
  PRIMARY KEY(order_id, product_id)
);

INSERT INTO orders (customer_id) VALUES
(3);

INSERT INTO orders_to_products (product_id, order_id, quantity) VALUES
(2, 1, 1),
(3, 1, 2),
(4, 1, 1);