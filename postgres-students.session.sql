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

CREATE TABLE books(
  id serial PRIMARY KEY,
  author varchar(256) NOT NULL CHECK(author != ''),
  name varchar(256) NOT NULL CHECK(name != ''),
  year int NOT NULL CHECK(year > 0),
  видавництво varchar(200),
  cathegory varchar(64),
  synopsis text,
  quantity int,
  status boolean
);

INSERT INTO books(author, name, year, видавництво, cathegory, quantity, status ) VALUES
('Chechov', 'Sborka', 1823, 'Vydavnictvo', 'comedy', 1, true);

ALTER TABLE books
ADD CONSTRAINT "quantity_more_than_zero" CHECK (quantity > 0);

ALTER TABLE books
ADD CONSTRAINT "author_name_unique" UNIQUE(author, name);

INSERT INTO books(author, name, year, видавництво, cathegory, quantity, status ) VALUES
('Chechov', 'Basnya', 1932, '', 'detctive', 2, true);