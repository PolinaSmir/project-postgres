CREATE TABLE students(
  id serial PRIMARY KEY,
  name varchar(30)
);

INSERT INTO students(name) VALUES
('Ivanov'),
('Petrov'),
('Sidorov');

-----------------------------------

CREATE TABLE teachers(
  id serial PRIMARY KEY,
  name varchar(30),
  subject varchar(50) REFERENCES subjects(name)
);

INSERT INTO teachers(name, subject) VALUES
('Smirnoff', 'Systems of AI'),
('Petrenko', 'Cloud computing');

-----------------------------------


-----------------------------------

CREATE TABLE subjects(
  name VARCHAR(50) PRIMARY KEY
);

INSERT INTO subjects VALUES
('Systems of AI'),
('Cloud computing');

-----------------------------------

CREATE TABLE students_to_teachers(
  teacher_id int REFERENCES teachers(id),
  student_id int REFERENCES students(id),
  PRIMARY KEY (teacher_id, student_id)
);

INSERT INTO students_to_teachers VALUES
(1, 1),
(1, 2),
(2, 1);

-----------------------------------

SELECT s.id, s.name AS "Student's name", t.name AS "Teacher's name", t.subject FROM students AS s
JOIN students_to_teachers AS std
ON s.id = std.student_id
JOIN teachers AS t
ON std.teacher_id = t.id;
















SELECT * FROM users
WHERE gender IS NULL;


ALTER TABLE orders
ADD COLUMN status boolean;



UPDATE orders
SET status = true
WHERE id % 2 = 0;

UPDATE orders
SET status = false
WHERE id % 2 = 1;


SELECT id, created_at, customer_id, status AS order_status FROM orders;


--- 1 syntax CASE

/*
CASE
    WHEN condition1 = true
    THEN result1
    WHEN condition2 = true
    THEN result2
    ...
    ELSE result3
END;
*/

-- Вивести всі замовлення, там де статус true - написати "виконано", де false - написати "нове"

SELECT id, created_at, customer_id, status, (
    CASE
    WHEN status = TRUE
    THEN 'виконано'
    WHEN status = FALSE
    THEN 'нове'
    ELSE 'інший статус'
    END
) AS order_status
FROM orders
ORDER BY id;


-- 2 syntax CASE

/*
    CASE condition WHEN value1 THEN result1
                    WHEN value2 THEN result2
                    ...
        ELSE default_result
    END;
*/

-- Витягти місяць народження юзера і на його основі вивести, народився восени, навесні, влітку чи взимку

SELECT *, (
    CASE extract('month' from birthday)
        WHEN 1 THEN 'winter'
        WHEN 2 THEN 'winter'
        WHEN 3 THEN 'spring'
        WHEN 4 THEN 'spring'
        WHEN 5 THEN 'spring'
        WHEN 6 THEN 'summer'
        WHEN 7 THEN 'summer'
        WHEN 8 THEN 'summer'
        WHEN 9 THEN 'fall'
        WHEN 10 THEN 'fall'
        WHEN 11 THEN 'fall'
        WHEN 12 THEN 'winter'
        ELSE 'unkown'
    END
) AS "пора року" FROM users;

SELECT *, (
  CASE gender
    WHEN 'female' THEN 'zhinka'
    WHEN 'male' THEN 'cholovik'
    ELSE 'inshij variant'
    END
) AS "stat propisom" FROM users;

SELECT *, (
  CASE
    WHEN price > 6000 THEN 'flagman'
    WHEN price BETWEEN 2000 AND 6000 THEN 'seredni clas'
    WHEN price < 2000 THEN 'budget'
    ELSE 'insha cinova category'
  END
) FROM products;
