CREATE TABLE messages(
  id serial PRIMARY KEY,
  body text NOT NULL CHECK (body != ''),
  author varchar(256) NOT NULL CHECK (author != ''),
  created_at timestamp DEFAULT current_timestamp,
  is_read boolean DEFAULT false
);

-- INSERT INTO messages VALUES('Hello John.', 'Me');

INSERT INTO messages(author, body) VALUES
('John', 'Hello.'),
('Me', 'Go to coffee~'),
('John', 'Go.');

INSERT INTO messages(author, body) VALUES
('Peter', 'Hello.'),
('Peter', 'Hello.');

DROP TABLE messages;

INSERT INTO messages(id, body, author) VALUES
(NULL, 'Message text 3', 'Message author 3');-- error