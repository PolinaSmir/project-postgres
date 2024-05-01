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