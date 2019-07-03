CREATE DATABASE db_library;
USE db_library;

CREATE TABLE library_branch(
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1000,1),
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL
);

INSERT INTO library_branch
	(BranchName, Address)
	VALUES
	('Sharpstown', '1111 Library Cir. Denver, CO 80014'),
	('Central', '2222 Library Way Denver, CO 80223'),
	('RiNo', '1212 Library St. Denver, CO 80222'),
	('Downtown', '1313 Library Road Denver, CO 80023')
;

CREATE TABLE Publisher(
	PublisherId INT PRIMARY KEY NOT NULL IDENTITY (2000,1),
	PublisherName VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

INSERT INTO Publisher
	(PublisherName, Address, Phone)
	VALUES
	('Penguin Random House', 'New York, NY', '+1 555-555-2345'),
	('HarperCollins', 'London, UK', '+44 5555-123456'),
	('Pan Macmillan', 'New York, NY', '+1 555-456-1234')
;

CREATE TABLE books(
	BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Title VARCHAR(50) NOT NULL,
	PublisherId INT NOT NULL CONSTRAINT fk_PublisherId FOREIGN KEY REFERENCES Publisher(PublisherId) ON UPDATE CASCADE ON DELETE CASCADE,
);

INSERT INTO books
	(Title, PublisherId)
	VALUES
	('The Lost Tribe', 2000),
	('Under the Dome', 2000),
	('11/22/63', 2000),
	('Some Book', 2001),
	('Some Other Book', 2002),
	('I Hope These Titles Aren''t Supposed to be Real', 2000),
	('Time to Find a Title Generator on the Internet!', 2001),
	('Power of the Eternity', 2000),
	('Green Alien', 2001),
	('Sip of Music-Box', 2000),
	('The Lost Blogger''s Punch', 2002),
	('The Killed Pirate', 2000),
	('The Wolfhound from the Dog', 2002),
	('Song and Blight', 2002),
	('Court of the Rogue', 2001),
	('Hunting Season', 2001),
	('The Croaking Statue', 2002),
	('Death of the Giant Boa', 2002),
	('The Accidental Wedding', 2000),
	('White Sand', 2000),
	('Roses and Flame', 2000)
;

CREATE TABLE book_authors(
	BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,	
	AuthorName VARCHAR(50) NOT NULL,
);

INSERT INTO book_authors
	(BookID, AuthorName)
	VALUES
	(1, 'Stephen King'),
	(2, 'Stephen King'),
	(3, 'Stephen King'),
	(4, 'Lilah Tennison'),
	(5, 'Lilah Tennison'),
	(6, 'Rasima Furnadjiev'),
	(7, 'Rasima Furnadjiev'),
	(8, 'Rasima Furnadjiev'),
	(9, 'Nacho Gerhardt'),
	(10, 'Slamet Biro'),
	(11, 'Slamet Biro'),
	(12, 'Chander Wauters'),
	(13, 'Nanook Nigel'),
	(14, 'Nnenna Saunders'),
	(15, 'Nnenna Saunders'),
	(16, 'Kimbra Morin'),
	(17, 'Kephas Griffin'),
	(18, 'Kephas Griffin'),
	(19, 'Salma Van Dael'),
	(20, 'Salma Van Dael'),
	(21, 'Wafi Prebensen')
;

CREATE TABLE book_copies(
	BookID INT NOT NULL FOREIGN KEY REFERENCES books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES library_branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL,
);

INSERT INTO book_copies
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(1, 1000, 4),
	(1, 1001, 7),
	(2, 1000, 3),
	(2, 1001, 5),
	(3, 1001, 6),
	(4, 1000, 2),
	(5, 1000, 5),
	(5, 1001, 6),
	(6, 1000, 3),
	(6, 1001, 5),
	(7, 1000, 3),
	(8, 1001, 2),
	(9, 1000, 4),
	(9, 1001, 3),
	(10, 1000, 4),
	(10, 1001, 3),
	(11, 1000, 2),
	(12, 1000, 2),
	(12, 1001, 3),
	(13, 1001, 4),
	(14, 1000, 2),
	(14, 1001, 7),
	(15, 1000, 6),
	(16, 1000, 3),
	(16, 1001, 3),
	(17, 1000, 4),
	(17, 1001, 3),
	(18, 1000, 2),
	(19, 1000, 2),
	(19, 1001, 3),
	(20, 1001, 4),
	(21, 1000, 2),
	(21, 1001, 2)
;

INSERT INTO book_copies
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(1, 1002, 2),
	(1, 1003, 3),
	(2, 1002, 2),
	(2, 1003, 6),
	(3, 1002, 2),
	(4, 1003, 4),
	(5, 1002, 3),
	(5, 1003, 4),
	(6, 1002, 2),
	(6, 1003, 4),
	(7, 1002, 6),
	(8, 1003, 3),
	(9, 1002, 4),
	(9, 1003, 5),
	(10, 1002, 4),
	(10, 1003, 2),
	(11, 1002, 2),
	(12, 1002, 3),
	(12, 1003, 5),
	(13, 1003, 6),
	(14, 1002, 4),
	(14, 1003, 5),
	(15, 1002, 2),
	(16, 1003, 3),
	(16, 1002, 4),
	(17, 1002, 3),
	(17, 1003, 6),
	(18, 1002, 5),
	(19, 1002, 4),
	(19, 1003, 6),
	(20, 1003, 6),
	(21, 1002, 5),
	(21, 1003, 4)
;

CREATE TABLE borrower(
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

INSERT INTO borrower
	(Name, Address, Phone)
	VALUES
	('Kenneth Palmer', '19 Lotus Dr. Littleton, CO 80120', '303-123-4567'),
	('Cheryl Freeman', '5 Queen Street Greely, CO 80631', '720-234-5678'),
	('Shawna Patton', '8485 Riverview Court San Luis, CO 81134', '720-567-8910'),
	('Donna Harmon', '9034 E. Long Ave. Wild Horse, CO 80862', '719-987-6543'),
	('Sandy Reynolds', '868 Pegasus Drive Denver, CO 80264', '303-876-5432'),
	('Ira Bowers', '833 S. Tunnel Court Colorado Springs, CO 80962', '720-654-4321'),
	('Shirley Miller', '457 N. Pioneer Lane Avondale, CO 81022', '720-555-7418'),
	('Kate Neal', '57 Fordham St. Coal Creek, CO 81221', '719-555-9638'),
	('Nelson Sandoval', '60 Sun Road Deer Trail, CO 80105', '720-555-8462')
;

CREATE TABLE book_loans(
	BookID INT NOT NULL FOREIGN KEY REFERENCES books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL FOREIGN KEY REFERENCES library_branch(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL,
);

INSERT INTO book_loans
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(1, 1000, 101, '2019-05-04', '2019-07-04'),
	(2, 1000, 101, '2019-05-04', '2019-07-04'),
	(4, 1000, 101, '2019-04-07', '2019-06-07'),
	(7, 1000, 101, '2019-06-09', '2019-08-09'),
	(18, 1000, 101, '2019-06-09', '2019-08-09'),
	(4, 1003, 102, '2019-05-13', '2019-07-13'),
	(2, 1001, 103, '2019-06-20', '2019-08-20'),
	(19, 1001, 103, '2019-07-01', '2019-09-01'),
	(21, 1001, 103, '2019-07-01', '2019-09-01'),
	(17, 1001, 103, '2019-05-30', '2019-07-30'),
	(1, 1001, 104, '2019-04-04', '2019-06-04'),
	(3, 1001, 104, '2019-04-20', '2019-06-20'),
	(5, 1001, 104, '2019-05-25', '2019-07-25'),
	(8, 1001, 104, '2019-06-02', '2019-08-02'),
	(17, 1001, 104, '2019-06-02', '2019-08-02'),
	(19, 1001, 104, '2019-06-02', '2019-08-02'),
	(9, 1001, 104, '2019-06-02', '2019-08-02'),
	(2, 1002, 105, '2019-05-26', '2019-07-26'),
	(5, 1002, 105, '2019-05-26', '2019-07-26'),
	(18, 1002, 105, '2019-06-19', '2019-08-19'),
	(15, 1002, 105, '2019-06-19', '2019-06-19'),
	(21, 1002, 105, '2019-07-01', '2019-09-01'),
	(1, 1000, 107, '2019-05-02', '2019-07-02'),
	(5, 1000, 107, '2019-05-02', '2019-07-02'),
	(11, 1000, 107, '2019-05-02', '2019-07-02'),
	(1, 1000, 107, '2019-06-30', '2019-08-30'),
	(6, 1001, 107, '2019-05-03', '2019-07-03'),
	(9, 1001, 107, '2019-05-03', '2019-07-03'),
	(1, 1000, 108, '2019-05-03', '2019-07-03'),
	(5, 1000, 108, '2019-05-03', '2019-07-03'),
	(9, 1000, 108, '2019-05-03', '2019-07-03'),
	(4, 1003, 108, '2019-05-28', '2019-07-28'),
	(14, 1003, 108, '2019-05-28', '2019-07-28'),
	(20, 1003, 108, '2019-05-28', '2019-07-28'),
	(21, 1003, 108, '2019-05-28', '2019-07-28'),
	(9, 1003, 108, '2019-05-28', '2019-07-28'),
	(9, 1003, 102, '2019-06-24', '2019-08-24'),
	(19, 1003, 102, '2019-06-24', '2019-08-24'),
	(16, 1003, 102, '2019-06-24', '2019-08-24'),
	(15, 1002, 102, '2019-06-24', '2019-08-24'),
	(17, 1002, 102, '2019-07-01', '2019-09-01'),
	(21, 1003, 101, '2019-05-27', '2019-07-27'),
	(17, 1003, 101, '2019-05-27', '2019-07-27'),
	(21, 1000, 100, '2019-05-02', '2019-07-02'),
	(9, 1000, 100, '2019-05-02', '2019-07-02'),
	(10, 1000, 100, '2019-06-07', '2019-08-07'),
	(11, 1000, 100, '2019-06-07', '2019-08-07'),
	(19, 1002, 100, '2019-06-21', '2019-08-21'),
	(5, 1002, 100, '2019-06-21', '2019-08-21'),
	(12, 1002, 100, '2019-06-21', '2019-08-21')
;

/* Procedure to find how many copies of a book are found at Sharpstown*/

CREATE PROCEDURE dbo.spCopiesAtSharpstown @bookName nvarchar(30)
AS
SELECT
	a1.Number_Of_Copies, 
	a2.BranchName
	FROM book_copies a1
	INNER JOIN library_branch a2 ON a2.BranchID = a1.BranchID
	INNER JOIN books a3 ON a3.BookID = a1.BookID
WHERE Title LIKE @bookName + '%'
AND BranchName = 'Sharpstown'
GO

EXEC spCopiesAtSharpstown @bookName = 'The Lost Tribe';


/* Procedure to find how many copies of a book are owned by each branch*/

CREATE PROCEDURE dbo.spCopiesPerBranch @bookName nvarchar(30)
AS
SELECT
	a1.Number_Of_Copies, 
	a2.BranchName
	FROM book_copies a1
	INNER JOIN library_branch a2 ON a2.BranchID = a1.BranchID
	INNER JOIN books a3 ON a3.BookID = a1.BookID
WHERE Title LIKE @bookName + '%'
GO

EXEC spCopiesPerBranch @bookName = 'The Lost Tribe';


/* Procedure to retrieve names of borrowers who do not have any books checked out*/

CREATE PROCEDURE dbo.spBorrowersNoBooks
AS
SELECT
	a1.Name
	FROM borrower a1
	LEFT JOIN book_loans a2 ON a2.CardNo = a1.CardNo
	WHERE a2.CardNo IS NULL
GO

EXEC spBorrowersNoBooks


/* Procedure to find books due today at Sharpstown and contact information for borrowers*/

CREATE PROCEDURE dbo.spDueTodaySharpstown
AS
SELECT
	a1.Title, 
	a3.Name, a3.Address
	FROM books a1
	INNER JOIN book_loans a2 ON a2.BookID = a1.BookID
	INNER JOIN borrower a3 ON a3.CardNo = a2.CardNo
	INNER JOIN library_branch a4 ON a4.BranchID = a2.BranchID
WHERE DateDue = CONVERT (date, SYSDATETIME())
AND BranchName = 'Sharpstown'
GO

EXEC spDueTodaySharpstown


/* Procedure to find total number of books currently loaned out from each branch*/

CREATE PROCEDURE dbo.spTotalBooksOut
AS
SELECT BranchName, COUNT(*) AS BooksOut
	FROM book_loans a1
	INNER JOIN library_branch a2 ON a2.BranchID = a1.BranchID
	GROUP BY BranchName
GO

EXEC spTotalBooksOut


/* Procedure to retrieve borrower contact info for >= 5 books out */

CREATE PROCEDURE dbo.spBorrowersWithFiveBooks
AS
SELECT 
	a1.Name, a1.Address, 
	COUNT(*) AS BooksOut
	FROM borrower a1
	INNER JOIN book_loans a2 ON a2.CardNo = a1.CardNo
	GROUP BY Name, Address
HAVING COUNT(*) >= 5
GO

EXEC spBorrowersWithFiveBooks


/* Procedure to retrieve number of book copies by select author at Central*/

CREATE PROCEDURE dbo.spBooksByAuthorAtCentral @Author nvarchar(30)
AS
SELECT
	a1.Title, 
	a2.Number_Of_Copies
	FROM books a1
	INNER JOIN book_copies a2 ON a2.BookID = a1.BookID
	INNER JOIN library_branch a3 ON a3.BranchID = a2.BranchID
	INNER JOIN book_authors a4 ON a4.BookID = a1.BookID
WHERE AuthorName LIKE @Author
AND BranchName = 'Central'
GO

EXEC spBooksByAuthorAtCentral @Author = 'Stephen King';