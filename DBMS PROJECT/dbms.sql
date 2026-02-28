
create database library;
CREATE TABLE QUERIES;
CREATE TABLE Member (
    member_id INT PRIMARY KEY,
    name VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(50)
);

CREATE TABLE Author (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(50)
);

CREATE TABLE Book (
    book_id INT PRIMARY KEY,
    title VARCHAR(100),
    author_id INT,
     price DECIMAL(8,2),   
     FOREIGN KEY (author_id) REFERENCES Author(author_id));
	CREATE TABLE Staff (   
    staff_id INT PRIMARY KEY,   
    staff_name VARCHAR(50)
    );
    CREATE TABLE Issue (   
    issue_id INT PRIMARY KEY,    
    member_id INT,  
    book_id INT,   
    staff_id INT,
    issue_date DATE,
	return_date DATE,   
    FOREIGN KEY (member_id) REFERENCES Member(member_id),   
    FOREIGN KEY (book_id) REFERENCES Book(book_id),   
    FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
    );
    

INSERT INTO Member VALUES(1,'Ram Sharma','9800000001','ram@gmail.com'),
(2,'Sita Rai','9800000002','sita@gmail.com'),
(3,'Hari Thapa','9800000003','hari@gmail.com'),
(4,'Gita Lama','9800000004','gita@gmail.com'),
(5,'Nabin Karki','9800000005','nabin@gmail.com');
INSERT INTO Author VALUES
(1,'Chetan Bhagat'),
(2,'Paulo Coelho'),
(3,'J.K. Rowling'),
(4,'Dan Brown'),
(5,'Premchand');
INSERT INTO Book VALUES
(1,'Half Girlfriend',1,500),
(2,'Alchemist',2,450),
(3,'Harry Potter',3,800),
(4,'Da Vinci Code',4,750),
(5,'Godan',5,600);
SELECT Member.name, Book.title
FROM IssueINNER 
JOIN Member ON Issue.member_id = Member.member_id
INNER JOIN Book ON Issue.book_id = Book.book_id;
INSERT INTO Staff VALUES
(1,'Admin A'),
(2,'Admin B'),
(3,'Admin C'),
(4,'Admin D'),
(5,'Admin E');
INSERT INTO Issue VALUES
(1,1,1,1,'2026-01-01','2026-01-10'),
(2,2,2,2,'2026-01-05','2026-01-15'),
(3,3,3,3,'2026-01-07','2026-01-17'),
(4,4,4,4,'2026-01-10','2026-01-20'),
(5,5,5,5,'2026-01-12','2026-01-22');

SELECT Member.name, Book.title
FROM Issue
INNER JOIN Member ON Issue.member-id = Member.member-id
INNER JOIN Book ON Issue.book-id = Book.book-id;

SELECT Member.name, Issue.issue-date
FROM Member
LEFT JOIN Issue ON Member.member-id = Issue.member-id;

SELECT member-id, COUNT(book-id) AS total_books
FROM Issue
GROUP BY member-id;

SELECT AVG(price) AS average_price
FROM Book;

SELECT title
FROM Book
WHERE price > (SELECT AVG(price) FROM Book);


CREATE VIEW IssueDetails AS SELECT Member.name,
 Book.title, Issue.issue-date
 FROM Issue
 JOIN Member ON Issue.member-id = Member.member-id
 JOIN Book ON Issue.book-id = Book.book-id;
 
 START TRANSACTION;
 INSERT INTO Member VALUES (6,'Test User','9800000006','test@gmail.com');
 ROLLBACK;





