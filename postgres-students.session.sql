CREATE TABLE coordinates(
  x int,
  y int,
  z int,
  CONSTRAINT "unique_coord" PRIMARY KEY(x, y, z)
);

INSERT INTO coordinates VALUES
(111,22,36),
(252,76,88);

INSERT INTO coordinates VALUES
(111,22,36);--error