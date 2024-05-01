DROP TABLE users;

CREATE TABLE  users(
  first_name varchar(64),
  last_name VARCHAR(64),
  biography text,
  gender varchar(30),
  is_subscribed boolean,
  birthday date,
  foot_size smallint,
  height numeric(5, 2)
);

INSERT INTO users VALUES('John', 'Doe', 'Tady je hodne textu', 'male', true, '2004-09-14', 43, 1.75);

INSERT INTO users VALUES
('Susan', 'Doe', 'Tady je hodne textu o Susan', 'female', true, '1994-09-14', 40, 1.65),
('Peter', 'Doe', 'Tady je hodne textu o Peteru', 'male', true, '1990-09-14', 46, 1.95);

INSERT INTO users VALUES('Blake', 'Doe', 'Tady je hodne textu o Blaku', 'male', false, '2004-09-14', NULL, NULL);