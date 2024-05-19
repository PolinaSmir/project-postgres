CREATE SCHEMA new_schema;

CREATE TABLE new_schema.users(
  first_name VARCHAR(20) NOT NULL CHECK(first_name != ''),
  last_name VARCHAR(20) NOT NULL CHECK(last_name != ''),
  email VARCHAR(20) NOT NULL CHECK(email != '')
);

DROP TABLE new_schema.employees;

CREATE SCHEMA new_schema_2;

CREATE TABLE new_schema.users(
  login VARCHAR(256) NOT NULL CHECK(login != ''),
  email VARCHAR(256) NOT NULL CHECK(email != ''),
  password VARCHAR(256) NOT NULL CHECK(password != '')
);

CREATE TABLE new_schema.employees(
  name VARCHAR(256) NOT NULL CHECK(name != ''),
  salary int NOT NULL CHECK(salary >= 0),
  department VARCHAR(256) NOT NULL CHECK(department != ''),
  position VARCHAR(256) NOT NULL CHECK(position != ''),
  hire_date date DEFAULT current_date
);

-------------------------------------------------

CREATE TABLE new_schema.users(
  login VARCHAR(256) NOT NULL CHECK(login != ''),
  email VARCHAR(256) PRIMARY KEY,
  password VARCHAR(256) NOT NULL CHECK(password != '')
);

CREATE TABLE new_schema.employees(
  id serial PRIMARY KEY,
  name VARCHAR(256) NOT NULL CHECK(name != ''),
  salary int NOT NULL CHECK(salary >= 0),
  position int REFERENCES new_schema.positions(id),
  hire_date date DEFAULT current_date
);

CREATE TABLE new_schema.positions(
  id serial PRIMARY KEY,
  department VARCHAR(256) NOT NULL CHECK(department != ''),
  position VARCHAR(256) NOT NULL CHECK(position != '')
);