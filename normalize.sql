DROP TABLE employees;
DROP TABLE positions, departments;
------------------

CREATE TABLE employees(
  id serial PRIMARY KEY,
  name varchar(200),
  position varchar(200) REFERENCES positions(name)
);

CREATE TABLE positions (
  name varchar(300) PRIMARY KEY,
  department varchar(300) REFERENCES departments(name),
  car_availability boolean
);

CREATE TABLE departments(
  name VARCHAR(200) PRIMARY KEY,
  phone_number varchar(15)
);

------------------------------------

INSERT INTO employees (name, position) VALUES
('Milena', 'CFO' ),
('sergey', 'CEO'),
('Matthew','SMM/PR division' ),
('Timofey', 'Accountant'),
('John', 'JS developer'),
('Jane', 'Sales manager'),
('Jake', 'Bodyguard for developers'),
('Andrew', 'Driver');

-- INSERT INTO departments (name, phone_number) VALUES
-- ('Top managment', '11-11-11' ),
-- ('Operational department', '22-22-22'),
-- ('Financial direction', '33-33-33'),
-- ('Developers direction', '44-44-44');

-- INSERT INTO positions (name, department, car_availability) VALUES
-- ('CFO', 'Top managment', true),
-- ('CEO', 'Top managment', true),
-- ('SMM/PR division', 'Operational department', false),
-- ('Accountant', 'Financial direction', false),
-- ('JS developer', 'Developers direction', false),
-- ('Sales manager', 'Operational department', false),
-- ('Bodyguard for developers', 'Operational department', true),
-- ('Driver', 'Operational department', true);

ALTER TABLE employees
DROP COLUMN department_phone;

ALTER TABLE employees
ADD FOREIGN KEY (department) REFERENCES departments(name);


INSERT INTO positions(name, car_availability) VALUES
('JS developer', false),
('Sales manager', false),
('Bodyguard for developers', true),
('Driver', true);

INSERT INTO positions(name, car_availability) VALUES
('CFO', true),
('CEO', true),
('SMM/PR division', false),
('Accountant', false);

CREATE TABLE departments(
  name VARCHAR(200) PRIMARY KEY,
  phone_number varchar(15)
);

INSERT INTO departments (name, phone_number) VALUES
('Top managment', '11-11-11' ),
('Operational department', '22-22-22'),
('Financial direction', '33-33-33'),
('Developers direction', '44-44-44');


SELECT e.id, e.name, e.position, p.car_availability FROM employees AS e
JOIN positions AS p
ON e.position = p.name;

---------------

SELECT e.id, e.name, e.position, p.car_availability, d.phone_number AS "Department phone number" FROM employees AS e
JOIN positions AS p
ON p.name = e.position
JOIN departments AS d
ON p.department = d.name;