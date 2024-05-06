DROP TABLE orders_to_products;

DROP TABLE orders;

DROP TABLE messages;

DROP TABLE chats_to_users;

DROP TABLE chats;

DROP TABLE products;

DROP TABLE products_version_2;

DROP TABLE users;

-----------------------------

CREATE TABLE users(
  id serial PRIMARY KEY,
  first_name varchar(64) NOT NULL CHECK(first_name != ''),
  last_name varchar(64) NOT NULL CHECK(last_name != ''),
  email text NOT NULL CHECK(email != ''),
  gender varchar(30),
  is_subscribed boolean NOT NULL,
  birthday date CHECK(birthday <= current_date),
  foot_size smallint,
  height numeric(5,2) CHECK(height < 3.0)
);

CREATE TABLE products(
  id serial PRIMARY KEY,
  brand varchar(200) NOT NULL CHECK(brand != ''),
  model varchar(300) NOT NULL CHECK(model != ''),
  description text,
  category varchar(200) NOT NULL CHECK(category != ''),
  price numeric(10, 2) NOT NULL CHECK(price > 0),
  discounted_price numeric(10, 2) CHECK(discounted_price < price),
  quantity int CHECK(quantity >= 0)
);

CREATE TABLE orders(
  id serial PRIMARY KEY,
  created_at timestamp NOT NULL DEFAULT current_timestamp,
  customer_id int REFERENCES users(id)
);

CREATE TABLE orders_to_products(
  order_id int REFERENCES orders(id),
  product_id int REFERENCES products(id),
  quantity int NOT NULL DEFAULT 1,
  PRIMARY KEY(order_id, product_id)
);

ALTER TABLE users
ADD COLUMN is_subscribed boolean NOT NULL;

DELETE FROM users;

INSERT INTO products (brand, model, price, quantity, category) VALUES
      ('Nokia', 'model 0)', '8413', '1396', 'phones' RETURNING *;