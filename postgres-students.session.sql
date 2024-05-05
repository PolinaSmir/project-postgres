CREATE TABLE products_version_2(
  id serial PRIMARY KEY,
  brand varchar(256) NOT NULL CHECK(brand != ''),
  model varchar(256) NOT NULL CHECK(model != ''),
  price numeric(8, 2) NOT NULL,
  is_luxury boolean GENERATED ALWAYS AS (price > 800) STORED
);

INSERT INTO products_version_2(brand, model, price) VALUES
('IPhone', '15 Pro', 1300),
('Samsung', 'S10', 400),
('Xiaomi', 'Model 5', 200);

ALTER TABLE products
ADD COLUMN is_luxury boolean GENERATED ALWAYS AS (price > 800) STORED;

---

UPDATE products SET price=price*3 WHERE price < 600;

INSERT INTO products (brand, model, price, cathegory) VALUES
('Xiaomi','22222223', 1000, 'smartphones') RETURNING id;

INSERT INTO products (brand, model, price, cathegory) VALUES
('IPhone','14 pro', 850, 'smartphones') RETURNING *;

---

DELETE FROM users WHERE id >= 10;