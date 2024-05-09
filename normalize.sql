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