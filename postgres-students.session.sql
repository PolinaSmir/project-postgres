CREATE TABLE products(
  id serial PRIMARY KEY,
  brand varchar(200) NOT NULL CHECK (brand != ''),
  model varchar(300) NOT NULL CHECK (model != ''),
  description text,
  cathegory varchar(200) NOT NULL CHECK (cathegory != ''),
  price numeric(10, 2) NOT NULL CHECK (price > 0),
  discounted_price numeric(10,2) CHECK (discounted_price <= price)
);

DROP TABLE products;

INSERT INTO products(brand, model, cathegory, price) VALUES
('Samsung', 'S10', 'smartphones', 200),
('IPhone', '15 Pro', 'smartphones', 1200),
('LG', '1234trc', 'TV', 300),
('Sony', '457', 'TV', 600);

INSERT INTO products(brand, model, cathegory, price) VALUES
('IPhone', '15 Pro', 'smartphones', 500);

ALTER TABLE products
ADD CONSTRAINT "unique_brand_model_pair" UNIQUE(brand, model);

ALTER TABLE products
ADD COLUMN quantity int;

ALTER TABLE products
ADD CONSTRAINT "products_quantity_check" CHECK(quantity >= 0);

ALTER TABLE products
DROP CONSTRAINT "products_quantity_check";

ALTER TABLE products
DROP COLUMN quantity;