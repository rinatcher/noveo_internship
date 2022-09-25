-- Database: postgres

-- DROP DATABASE IF EXISTS postgres;

CREATE DATABASE postgres
    WITH
    OWNER = rinatello
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

COMMENT ON DATABASE postgres
    IS 'default administrative connection database';

CREATE TABLE Authors (
	Id INTEGER NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	age INTEGER NOT NULL
);
CREATE TABLE Books (
	id INTEGER NOT NULL PRIMARY KEY,
	title VARCHAR(50) NOT NULL,
	author_id INTEGER NOT NULL,
	copies_sold INTEGER NOT NULL,
	FOREIGN KEY (author_id)  REFERENCES Authors (Id)
);
INSERT INTO authors (id, first_name, last_name, age) VALUES
    (1,'Arthur', 'Conan Doyle', 70),
    (2,'Lewis', 'Carroll', 50),
		(3,'Daniel', 'Defoe', 45),
		(4,'Jonathan', 'Swift', 45),
    (5,'Samuel', 'Richardson', 51);

INSERT INTO books (id, title, author_id, copies_sold) VALUES
		(1,'Gulliver’s Travels', 4, 1000),
		(2,'The Walrus and the Carpenter', 2, 900),
		(3,'Robinson Crusoe', 3, 2000),
		(4,'Alice in Wonderland', 2, 3000),
		(5,'Sherlock Holmes', 1, 4000);

SELECT first_name, LENGTH(first_name) as length FROM authors WHERE LENGTH(first_name)>6

SELECT age, COUNT(age) as ages_count FROM authors GROUP BY age

SELECT title FROM books ORDER BY copies_sold DESC LIMIT 3

SELECT authors.first_name, authors.last_name,
authors.age, COUNT(books.author_id) as books_count
FROM books
RIGHT JOIN authors ON books.author_id = authors.id
GROUP BY authors.id

DROP TABLE books;
DROP TABLE authors;
DROP DATABASE IF EXISTS postgres WITH (FORCE);
