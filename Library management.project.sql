create database library;
use library;
CREATE TABLE branch (
  branch_no INT PRIMARY KEY,
  manager_id INT,
  branch_address VARCHAR(100) NOT NULL,
  contact_no VARCHAR(20) NOT NULL
);
insert into branch values
  ('1', '101', '123 Main Street', '+1 123-456-7890'),
  ('2', '102', '456 Elm Avenue', '+1 987-654-3210'),
  ('3', '103', '789 Oak Road', '+1 555-123-4567'),
  ('4', '104', '321 Pine Lane', '+1 777-888-9999'),
  ('5', '105', '678 Maple Court', '+1 444-555-6666'),
  ('6', '106', '910 Cherry Boulevard', '+1 222-333-4444'),
  ('7', '107', '543 Cedar Drive', '+1 999-888-7777'),
  ('8', '108', '876 Walnut Circle', '+1 666-777-8888');
CREATE TABLE employee (
  emp_id INT PRIMARY KEY,
  emp_name VARCHAR(50) NOT NULL,
  position VARCHAR(50) NOT NULL,
  salary DECIMAL(10, 2) NOT null
  );

INSERT INTO employee (emp_id, emp_name, position, salary)
VALUES
  (1, 'John Doe', 'Manager', 60000),
  (2, 'Jane Smith', 'Assistant', 45000),
  (3, 'Michael Lee', 'Librarian', 35000),
  (4, 'Sarah Johnson', 'Clerk', 40000),
  (5, 'David Brown', 'Accountant', 55000),
  (6, 'Emily Davis', 'Administrator', 38000),
  (7, 'Daniel Wilson', 'Librarian', 52000),
  (8, 'Jessica Clark', 'Assistant', 48000);
CREATE TABLE customer (
  customer_id INT PRIMARY KEY AUTO_INCREMENT,
  customer_name VARCHAR(50) NOT NULL,
  address VARCHAR(100) NOT NULL,
  reg_date date not null);
  
  INSERT INTO customer (customer_id, customer_name, address, reg_date)
VALUES
  (1, 'John Doe', '123 Main Street', '2022-01-15'),
  (2, 'Jane Smith', '456 Elm Avenue', '2021-02-20'),
  (3, 'Michael Lee', '789 Oak Road', '2022-03-10'),
  (4, 'Sarah Johnson', '321 Pine Lane', '2023-06-05'),
  (5, 'David Brown', '678 Maple Court', '2022-05-12'),
  (6, 'Emily Davis', '910 Cherry Boulevard', '2022-06-08'),
  (7, 'Daniel Wilson', '543 Cedar Drive', '2023-07-25'),
  (8, 'Jessica Clark', '876 Walnut Circle', '2021-08-18');
  CREATE TABLE issuestatus (
  issue_id INT PRIMARY KEY,
  issued_cost DECIMAL(10, 2),
  issue_book_name VARCHAR(100),
  issue_date DATE,
  isbn_book VARCHAR(20),
  FOREIGN KEY (isbn_book) REFERENCES books(isbn)
);
INSERT INTO issuestatus (issue_id, issued_cost, issue_book_name, issue_date, isbn_book)
VALUES
  (1, 10.99, 'Book A', '2023-06-01', '1'),
  (2, 15.99, 'Book B', '2023-06-03', '2'),
  (3, 8.99, 'Book C', '2023-06-05', '3'),
  (4, 12.99, 'Book D', '2023-06-07', '4'),
  (5, 9.99, 'Book E', '2023-06-09', '5');

CREATE TABLE returnstatus (
  return_id INT PRIMARY KEY AUTO_INCREMENT,
  return_cost DECIMAL(10, 2),
  return_book_name VARCHAR(100) NOT NULL,
  return_date DATE NOT NULL,
  isbn_book2 varchar(255),
  FOREIGN KEY (isbn_book2) REFERENCES books(isbn),
  foreign key(return_cost) references customer(customer_id)
);
INSERT INTO returnstatus VALUES
  (1, 5.99, 'Book A', '2023-06-02','1'),
  (2, 10.99, 'Book B', '2023-06-04', '2'),
  (3, 7.99, 'Book C', '2023-06-06', '3'),
  (4, 8.99, 'Book D', '2023-06-08', '4'),
  (5, 6.99, 'Book E', '2023-06-10', '5');


CREATE TABLE books (ISBN varchar(100) primary key,
  book_title VARCHAR(100) NOT NULL,
  category VARCHAR(50),
  rental_price DECIMAL(10, 2),
  status ENUM('yes', 'no') NOT NULL,
  author VARCHAR(50) NOT NULL,
  publisher VARCHAR(50)
);
INSERT INTO books (ISBN, book_title, category, rental_price, status, author, publisher)
VALUES
  ('1', 'Book A', 'Fiction', 9.99, 'Yes', 'John Smith', 'Publisher A'),
  ('2', 'Book B', 'Mystery', 12.99, 'No', 'Jane Johnson', 'Publisher B'),
  ('3', 'Book C', 'History', 11.99, 'Yes', 'Michael Davis', 'Publisher C'),
  ('4', 'Book D', 'Thriller', 10.99, 'Yes', 'Sarah Brown', 'Publisher D'),
  ('5', 'Book E', 'Romance', 8.99, 'No', 'David Wilson', 'Publisher E'),
  ('6', 'Book F', 'Horror', 9.99, 'No', 'Jessica Moore','publisher F'),
  ('7', 'Book G', 'Romance',10.99, 'Yes','Ross Geller', 'publisher G'),
  ('8', 'Book H', 'Science',7.99, 'Yes', 'Chandler Bing', 'publisher H');


SELECT book_title, category, rental_price
FROM books
WHERE status = 'yes';

SELECT emp_name, salary
FROM employee
ORDER BY salary DESC;

SELECT b.book_title, c.customer_name
FROM books b
JOIN issuestatus i ON b.isbn = i.isbn_book
JOIN customer c ON i.customer_id = c.customer_id;

SELECT category, COUNT(*) AS book_count
FROM books
GROUP BY category;

SELECT emp_name, position
FROM employee
WHERE salary > 50000;

SELECT customer_name
FROM customer
WHERE reg_date < '2022-01-01'
AND customer_id NOT IN (SELECT customer_id FROM issuestatus);

SELECT branch.branch_no, COUNT(employee.emp_id) AS total_employees
FROM branch
LEFT JOIN employee ON branch.manager_id = employee.emp_id
GROUP BY branch.branch_no;

SELECT c.customer_name
FROM customer c
INNER JOIN issuestatus i ON c.customer_id = i.customer_id
WHERE MONTH(i.issue_date) = 6 AND YEAR(i.issue_date) = 2023;

SELECT book_title
FROM books
WHERE category LIKE '%history%';

select branch_no, count(*) as total_employees 
from employee
group by branch_no having count(*) > 5;





















