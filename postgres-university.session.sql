CREATE TABLE students(
  id serial PRIMARY KEY,
  name varchar(256) NOT NULL CHECK(name != ''),
  surname varchar(256) NOT NULL CHECK(surname != '')
);

CREATE TABLE groups(
  id serial PRIMARY KEY,
  faculty int REFERENCES faculties(id)
);

CREATE TABLE faculties(
  id serial PRIMARY KEY,
  name varchar(256) NOT NULL CHECK(name != '')
);

CREATE TABLE disciplines(
  id serial PRIMARY KEY,
  name varchar(256) NOT NULL CHECK(name != ''),
  teacher varchar(256) NOT NULL CHECK(teacher != '')
);

INSERT INTO disciplines(name, teacher) VALUES
('Менеджмент', 'Карел Чарпка'),
('Биоаналитическая химия', 'Ян Липов');

INSERT INTO faculties(name) VALUES
('Информатика'),
('Экономика'),
('Химия');

INSERT INTO groups(faculty) VALUES
(3), (1), (2);

ALTER TABLE students
ADD COLUMN groups int REFERENCES groups(id);

INSERT INTO students(name, surname, groups) VALUES
('Саша', 'Прокофьев', 3),
('Анна', 'Каренина', 2),
('Егор', 'Жорник', 1);


CREATE TABLE exams(
  student_id int REFERENCES students(id),
  discipline_id int REFERENCES disciplines(id),
  student_grade int NOT NULL
);

INSERT INTO exams(student_grade, student_id, discipline_id) VALUES
(26, 1, 2), 
(70, 2, 1), 
(69, 3, 3);


