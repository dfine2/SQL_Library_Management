USE [db_library]
GO

/****** Object:  StoredProcedure [dbo].[p_createLibrary]    Script Date: 4/17/2019 2:32:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[p_createLibrary]
AS
BEGIN

CREATE DATABASE db_library

CREATE TABLE tbl_libraryBranch(
	libraryBranch_branchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	libraryBranch_branchName VARCHAR(50) NOT NULL,
	libraryBranch_Address VARCHAR(90) NOT NULL
);

CREATE TABLE tbl_publisher(
	publisher_publisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	publisher_address VARCHAR(90) NOT NULL,
	publisher_phone VARCHAR(30) NOT NULL
);

CREATE TABLE tbl_books(
	books_bookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	books_title VARCHAR(50) NOT NULL,
	books_publisherName VARCHAR(50) NOT NULL CONSTRAINT fk_publisher_publisherName FOREIGN KEY REFERENCES tbl_publisher(publisher_publisherName) ON UPDATE CASCADE ON DELETE CASCADE,
);

CREATE TABLE tbl_bookAuthors(
	bookAuthors_bookID INT NOT NULL CONSTRAINT fk_books_bookID FOREIGN KEY REFERENCES tbl_books(books_bookID) ON UPDATE CASCADE ON DELETE CASCADE,
	bookAuthors_authorName VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_bookCopies(
	bookCopies_bookID INT NOT NULL CONSTRAINT fk1_books_bookID FOREIGN KEY REFERENCES tbl_books(books_bookID) ON UPDATE CASCADE ON DELETE CASCADE,
	bookCopies_branchID INT NOT NULL CONSTRAINT fk_libraryBranch_branchID FOREIGN KEY REFERENCES tbl_libraryBranch(libraryBranch_branchID) ON UPDATE CASCADE ON DELETE CASCADE,
	bookCopies_numCopies INT NOT NULL
);

CREATE TABLE tbl_borrower(
	borrower_cardNo INT NOT NULL PRIMARY KEY IDENTITY (1000,1),
	borrower_name VARCHAR(50) NOT NULL,
	borrower_address VARCHAR(50) NOT NULL,
	borrower_phone VARCHAR(30) NOT NULL
);

CREATE TABLE tbl_bookLoans(
	bookLoans_bookID INT NOT NULL CONSTRAINT fk2_books_bookID FOREIGN KEY REFERENCES tbl_books(books_bookID) ON UPDATE CASCADE ON DELETE CASCADE,
	bookLoans_branchID INT NOT NULL CONSTRAINT fk1_libraryBranch_branchID FOREIGN KEY REFERENCES tbl_libraryBranch(libraryBranch_branchID) ON UPDATE CASCADE ON DELETE CASCADE,
	bookLoans_cardNo INT NOT NULL CONSTRAINT fk_borrower_cardNo FOREIGN KEY REFERENCES tbl_borrower(borrower_cardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	bookLoans_dateOut DATE NOT NULL,
	bookLoans_dateDue DATE NOT NULL
);

INSERT INTO tbl_libraryBranch
	(libraryBranch_branchName, libraryBranch_Address)
	VALUES
	('Sharpstown', '7498 Beech Lane'),
	('Central', '8110 Main Street'),
	('Barksdale', '2100 Albany Drive'),
	('Northwood', '4883 Newton Street'),
	('Stockton', '5381 Lowell Street')
;

INSERT INTO tbl_publisher
	(publisher_publisherName, publisher_address, publisher_phone)
	VALUES
	('HarperCollins','195 Broadway, New York, NY', '212-207-7000'),
	('Penguin Random House', '80 Strand, London, UK','1-800-733-3000'),
	('Simon & Schuster','1230 Avenue of the Americas, New York, NY','1-800-223-2336'),
	('Hachette', '1290 6th Ave, New York, NY', '1-800-759-0190'),
	('Macmillan', 'The Macmillan Campus, Crinan Street, London, UK', '888-330-8477')
;

INSERT INTO tbl_books
	(books_title, books_publisherName)
	VALUES
	('It', 'Penguin Random House'),
	('Carrie','Penguin Random House'),
	('What Should be Wild','HarperCollins'),
	('American Gods', 'HarperCollins'),
	('Pet Sematary', 'Simon & Schuster'),
	('Pride and Prejudice', 'Penguin Random House'),
	('Wuthering Heights', 'Penguin Random House'),
	('Little Women', 'Penguin Random House'),
	('Wolf Hall', 'HarperCollins'),
	('The Exorcist','HarperCollins'),
	('A Game of Thrones', 'HarperCollins'),
	('Go Set a Watchman', 'HarperCollins'),
	('Where the Wild Things Are', 'HarperCollins'),
	('What Happened', 'Simon & Schuster'),
	('Fahrenheit 451', 'Simon & Schuster'),
	('All the Light We Cannot See','Simon & Schuster'),
	('Twilight', 'Hachette'),
	('The House of Broken Angels','Hachette'),
	('The Great American Divorce','Macmillan'),
	('The Winner''''s Curse', 'Macmillan'),
	('Yes Please', 'HarperCollins'),
	('The Lost Tribe', 'Macmillan')
;

INSERT INTO tbl_bookAuthors
	(bookAuthors_bookID, bookAuthors_authorName)
	VALUES
	(1, 'Stephen King'),
	(2, 'Stephen King'),
	(3, 'Julia Fine'),
	(4, 'Neil Gaiman'),
	(5, 'Stephen King'),
	(6, 'Jane Austen'),
	(7, 'Emily Bronte'),
	(8, 'Louisa May Alcott'),
	(9, 'Hilary Mantel'),
	(10, 'William Peter Blatty'),
	(11, 'George R.R. Martin'),
	(12, 'Harper Lee'),
	(13, 'Maurice Sendak'),
	(14, 'Hillary Rodham Clinton'),
	(15, 'Ray Bradbury'),
	(16, 'Anthony Doerr'),
	(17, 'Stephenie Meyer'),
	(18, 'Luis Alberto Urrea'),
	(19, 'David French'),
	(20, 'Marie Rutkoski'),
	(21, 'Amy Poehler'),
	(22, 'Hector Hill')
;

INSERT INTO tbl_borrower
	(borrower_name, borrower_address, borrower_phone)
	VALUES
	('Rick Rickson', '2890 Little Park Road', '333-987-0075'),
	('Alexandra Lewis', '7214 Grant Drive', '333-456-2771'),
	('Larry Jameson', '6210 Riverton Road', '333-973-1056'),
	('Harold Hope', '7249 Oak Street', '333-168-9213'),
	('Lydia Lawrence', '6758 Yew Lane', '333-767-2224'),
	('Diane Derby', '3478 Beaker Street', '333-249-1206'),
	('Christopher Graham', '5780 Montgomery Road', '333-7893-9914'),
	('Alissa Holt', '6204 Newton Street', '333-676-8629'),
	('Lester Logan', '5720 Poplar Drive', '333-765-0058')
;

INSERT INTO tbl_bookCopies
	(bookCopies_bookID, bookCopies_branchID, bookCopies_numCopies)
	VALUES
	(22,1,4),
	(4,1,2),
	(3,1,2),
	(6,1,3),
	(9,1,4),
	(20,1,3),
	(1,1,2),
	(17,1,3),
	(12,1,2),
	(20,1,2),
	(7,1,3),
	(5,2,3),
	(1,2,6),
	(3,2,2),
	(11,2,3),
	(9,2,2),
	(14,2,2),
	(18,2,2),
	(19,2,2),
	(7,2,3),
	(21,2,2),
	(22,2,1),
	(6,2,1),
	(3,3,3),
	(8,3,7),
	(21,3,2),
	(22,3,2),
	(4,3,2),
	(9,3,2),
	(13,3,2),
	(15,3,4),
	(6,3,2),
	(1,3,2),
	(5,3,2),
	(5,4,2),
	(9,4,2),
	(11,4,3),
	(19,4,2),
	(8,4,2),
	(21,4,3),
	(2,4,2),
	(16,4,2),
	(22,4,2),
	(7,4,3)
;

INSERT INTO tbl_bookLoans
	(bookLoans_bookID, bookLoans_branchID, bookLoans_cardNo, bookLoans_dateDue, bookLoans_dateOut)
	VALUES
	(6,1,1000,'2019-05-03','2019-04-02'),
	(22,2,1002,'2019-05-07','2019-04-06'),
	(22,4,1002,'2019-05-07','2019-04-06'),
	(19,4,1000,'2019-05-14','2019-04-13'),
	(9,4,1005,'2019-05-16','2019-04-15'),
	(11,4,1007,'2019-05-03','2019-04-02'),
	(15,3,1007,'2019-05-06','2019-04-05'),
	(21,2,1004,'2019-05-07','2019-04-06'),
	(20,1,1003,'2019-05-09','2019-04-08'),
	(4,1,1003,'2019-05-09','2019-04-08'),
	(18,2,1004,'2019-05-07','2019-04-06'),
	(15,3,1002,'2019-05-18','2019-04-17'),
	(11,2,1000,'2019-05-03','2019-04-02'),
	(18,2,1005,'2019-05-06','2019-04-05'),
	(3,1,1007,'2019-03-29','2019-02-28'),
	(2,4,1003,'2019-03-27','2019-02-26'),
	(21,4,1008,'2019-05-11','2019-04-10'),
	(3,2,1003,'2019-05-16','2019-04-15'),
	(7,1,1000,'2019-05-13','2019-04-12'),
	(1,3,1007,'2019-05-17','2019-04-16'),
	(17,1,1000,'2019-05-01','2019-03-31'),
	(5,2,1003,'2019-05-06','2019-04-05'),
	(22,3,1005,'2019-05-16','2019-04-15'),
	(6,2,1004,'2019-04-30','2019-03-29'),
	(8,3,1004,'2019-04-30','2019-03-29'),
	(7,4,1002,'2019-05-03','2019-04-02'),
	(19,4,1002,'2019-05-03','2019-04-02'),
	(13,3,1001,'2019-05-02','2019-04-01'),
	(9,2,1001,'2019-05-11','2019-04-10'),
	(22,1,1003,'2019-04-18','2019-03-17'),
	(15,3,1003,'2019-05-18','2019-04-17'),
	(3,3,1000,'2019-06-10','2019-05-09'),
	(5,2,1001,'2019-05-20','2019-04-19'),
	(16,4,1000,'2019-05-01','2019-03-31'),
	(8,3,1008,'2019-04-25','2019-03-24'),
	(9,4,1000,'2019-05-01','2019-03-31'),
	(12,1,1003,'2019-04-18','2019-03-17'),
	(20,1,1005,'2019-05-06','2019-04-05'),
	(13,3,1002,'2019-05-16','2019-04-15'),
	(21,2,1000,'2019-05-04','2019-04-03'),
	(8,3,1007,'2019-05-08','2019-04-07'),
	(7,2,1007,'2019-05-16','2019-04-15'),
	(17,1,1008,'2019-05-02','2019-04-01'),
	(1,2,1003,'2019-05-07','2019-04-06'),
	(1,2,1007,'2019-05-16','2019-04-15'),
	(21,4,1005,'2019-04-28','2019-03-27'),
	(7,4,1002,'2019-05-19','2019-04-18'),
	(9,2,1000,'2019-03-28','2019-02-27'),
	(8,3,1001,'2019-04-27','2019-03-26'),
	(9,1,1003,'2019-05-02','2019-04-01'),
	(14,2,1005,'2019-05-06','2019-04-05')
;
END
GO


