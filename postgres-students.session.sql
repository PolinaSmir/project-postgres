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

CREATE TABLE chats(
  id serial PRIMARY KEY,
  name varchar(256) NOT NULL CHECK(name != ''),
  owner_id int REFERENCES users(id),
  created_at timestamp NOT NULL DEFAULT current_timestamp
);

INSERT INTO chats(name, owner_id) VALUES
('superchat', 2);

CREATE TABLE chats_to_users(
  chat_id int REFERENCES chats(id),
  user_id int REFERENCES users(id),
  join_at timestamp DEFAULT current_timestamp,
  PRIMARY KEY(chat_id, user_id)
);

INSERT INTO chats_to_users(chat_id, user_id) VALUES
(2, 2);

CREATE TABLE messages(
  id serial PRIMARY KEY,
  body text NOT NULL CHECK(body != ''),
  created_at timestamp DEFAULT current_timestamp,
  is_read boolean NOT NULL DEFAULT false,
  author_id int, -- REFERENCES chats_to_users(user_id),
  chat_id int, -- REFERENCES chats_to_users(chat_id)
  FOREIGN KEY (author_id, chat_id) REFERENCES chats_to_users(user_id, chat_id)
);

INSERT INTO messages(body, author_id, chat_id) VALUES
('Go for coffee?', 3, 2),
('go', 2, 2);