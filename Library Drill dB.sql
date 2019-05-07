
---------------------------- Create Library dB --------------------------------
CREATE DATABASE db_library

---------------------------- Select Library dB --------------------------------
USE db_library



----------------------------- Library Tables ----------------------------------


CREATE TABLE Library_Branch (										-- DONE
ID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
BranchName VARCHAR(50) NOT NULL
);



CREATE TABLE Publisher (											-- DONE
PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
Address VARCHAR(50) NOT NULL,
Phone VARCHAR(50) NOT NULL
);



CREATE TABLE Books (												-- DONE
BookID INT PRIMARY KEY NOT NULL IDENTITY (100,1),
Title VARCHAR(50) NOT NULL,
PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES Publisher(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE,
);



CREATE TABLE Book_Authors (											-- DONE
BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
AuthorName VARCHAR(50) NOT NULL
);



CREATE TABLE Book_Copies (											-- DONE
BookID INT NOT NULL CONSTRAINT fk_BookID1 FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
BranchID INT NOT NULL CONSTRAINT fk_ID1 FOREIGN KEY REFERENCES Library_Branch(ID) ON UPDATE CASCADE ON DELETE CASCADE,
Number_Of_Copies INT NOT NULL
);



CREATE TABLE Borrower (												-- DONE
CardNo INT PRIMARY KEY NOT NULL IDENTITY (1000,1),
Name VARCHAR(50) NOT NULL,
Address VARCHAR(50) NOT NULL,
Phone VARCHAR(50) NOT NULL
);



CREATE TABLE Book_Loans (											-- DONE
BookID INT NOT NULL CONSTRAINT fk_BookID2 FOREIGN KEY REFERENCES Books(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
BranchID INT NOT NULL CONSTRAINT fk_ID2 FOREIGN KEY REFERENCES Library_Branch(ID) ON UPDATE CASCADE ON DELETE CASCADE,
CardNo INT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
DateOut DATE,
DateDue DATE
);



--------------------------- Library Table Info ---------------------------------


INSERT INTO Library_Branch											-- DONE
(BranchName)
VALUES
('Sharpstown'),
('Central'),
('Belmonte'),
('Scappoose')
;

SELECT * FROM Library_Branch
;

INSERT INTO Publisher												-- DONE
(PublisherName, Address, Phone)
VALUES
('Grant Publishing', '19 Surrey Ln, Hampton Falls, NH 03844', '603-778-7191'),
('Doubleday Publishing', '1745 Broadway, New York, NY 10019', '212-940-7390'),
('Random House', '230 W 56th St, New York, NY 10019', '212-397-4133'),
('Tor Books', '175 5th Ave, New York, NY 10010', '212-388-0100'),
('Bloomsbury Publishing', '1385 Broadway, New York, NY 10018', '212-419-5300'),
('Penguin Publishing', '375 Hudson St, New York, NY 10014', '212-366-2000'),
('Bantam Press', '61-63 Uxbridge Rd, Ealing, London W5 5SA, UK', '44-20-8579-2652'),
('Little, Brown and Company', '53 State St, Boston, MA 02109', '800-759-0190'),
('Picador USA', '175 5th Ave, New York, NY 10010', '800-221-7945')
;

SELECT * FROM Publisher
;

INSERT INTO Books													-- DONE
(Title, PublisherName)
VALUES
('The Dark Tower', 'Grant Publishing'),
('It', 'Grant Publishing'),
('The Shinning', 'Grant Publishing'),
('Magician', 'Doubleday Publishing'),
('A Darkness at Sethanon', 'Doubleday Publishing'),
('The Sword of Shannara', 'Random House'),
('The Elfstones of Shannara', 'Random House'),
('The Eye of the World', 'Tor Books'),
('The Great Hunt', 'Tor Books'),
('Harry Potter and the Philosophers Stone', 'Bloomsbury Publishing'),
('Harry Potter and the Chamber of Secrets', 'Bloomsbury Publishing'),
('The Firm', 'Penguin Publishing'),
('A Time to Kill', 'Penguin Publishing'),
('The Killing Floor' ,'Bantam Press'),
('Die Trying' ,'Bantam Press'),
('Along Came a Spider', 'Little, Brown and Company'),
('Kiss the Girls', 'Little, Brown and Company'),
('The Lost Tribe', 'Picador USA'),
('The Canal House', 'Picador USA'),
('The Da Vinci Code', 'Doubleday Publishing'),
('Angels and Demons', 'Doubleday Publishing')
;

SELECT * FROM Books
;

INSERT INTO Book_Authors											-- DONE
(BookID, AuthorName)
VALUES
(100, 'Stephen King'),
(101, 'Stephen King'),
(102, 'Stephen King'),
(103, 'Raymond E Feist'),
(104, 'Raymond E Feist'),
(105, 'Terry Brooks'),
(106, 'Terry Brooks'),
(107, 'Robert Jordan'),
(108, 'Robert Jordan'),
(109, 'JK Rowling'),
(110, 'JK Rowling'),
(111, 'John Grisham'),
(112, 'John Grisham'),
(113, 'Lee Child'),
(114, 'Lee Child'),
(114, 'James Patterson'),
(116, 'James Patterson'),
(117, 'Mark Lee'),
(118, 'Mark Lee'),
(119, 'Dan Brown'),
(120, 'Dan Brown')
;

SELECT * FROM Book_Authors
;

INSERT INTO Book_Copies												-- DONE
(BookID, BranchID, Number_Of_Copies)
VALUES
(100, 1, 7),
(100, 2, 8),
(100, 3, 9),
(100, 4, 10),
(101, 1, 5),
(101, 3, 6),
(102, 1, 5),
(102, 2, 6),
(102, 4, 7),
(103, 1, 5),
(103, 3, 7),
(103, 4, 8),
(104, 2, 7),
(104, 3, 5),
(105, 1, 6),
(105, 4, 5),
(106, 2, 6),
(106, 3, 5),
(106, 4, 4),
(107, 1, 7),
(107, 2, 5),
(107, 3, 11),
(107, 4, 10),
(108, 1, 7),
(108, 2, 9),
(108, 4, 10),
(109, 1, 8),
(109, 2, 7),
(109, 3, 6),
(110, 2, 7),
(110, 4, 7),
(111, 3, 5),
(111, 4, 5),
(112, 3, 5),
(112, 4, 7),
(113, 2, 5),
(113, 4, 5),
(114, 1, 4),
(114, 3, 5),
(115, 3, 5),
(115, 4, 7),
(116, 2, 6),
(116, 3, 5),
(116, 4, 5),
(117, 1, 11),
(117, 3, 10),
(117, 4, 9),
(118, 1, 8),
(118, 2, 7),
(118, 4, 8),
(119, 1, 7),
(119, 2, 6),
(119, 3, 8),
(119, 4, 6),
(120, 1, 7),
(120, 2, 10),
(120, 4, 4)
;

SELECT * FROM Book_Copies
;

INSERT INTO Borrower												-- DONE
(Name, Address, Phone)
VALUES
('Dave Thomas', '1234 Park Pike, Portland, OR 97205', '503-948-5312'),
('Tiffany North', '5843 5th St, Scappoose, OR 97067', '503-543-9713'),
('Lilly Petal', '2846 47th Ave, Sandy, OR 97055', '503-826-4871'),
('Pierre Le Mon', '375 SW 24th St, Beaverton, OR 97008', '503-684-0479'),
('Korben Dallas', '1337 SW 5th Ave, Portland, OR 97214', '03-555-4321'),
('Poppy Seed', '75614 78th St, Hillsboro, Or 97003', '503-639-7815'),
('Belmon Pan', '3108 E Craven Dr, Aloha, Or 97007', '503-619-7348'),
('Stan Smith', '416 Cherry St, Portland, OR 97203', '503-679-1355'),
('Bob Jones', '9436 S Branch St, Beaverton, OR 97008', '503-678-5616'),
('Kevin Oar', '1597 SW Derry Dell Ct, Tigard, OR 97223', '503-948-3210'),
('Dan Mars', '96 SE 40th Ave, Milwaukie, OR 97222', '503-984-0565')
;

SELECT * FROM Borrower
;

INSERT INTO Book_Loans												-- DONE
(BookID, BranchID, CardNo, DateOut, DateDue)
VALUES
(100, 2, 1003, '2019-05-01', '2019-06-01'),
(100, 3, 1006, '2019-05-03', '2019-06-03'),
(100, 3, 1007, '2019-04-25', '2019-05-25'),
(101, 1, 1000, '2019-04-25', '2019-05-25'),
(101, 1, 1001, '2019-04-23', '2019-05-23'),
(102, 3, 1006, '2019-04-15', '2019-05-15'),
(102, 3, 1007, '2019-04-17', '2019-05-17'),
(102, 4, 1009, '2019-04-23', '2019-05-23'),
(103, 1, 1000, '2019-04-27', '2019-05-27'),
(103, 1, 1002, '2019-04-25', '2019-05-25'),
(103, 2, 1004, '2019-04-21', '2019-05-21'),
(103, 3, 1007, '2019-04-27', '2019-05-27'),
(103, 4, 1008, '2019-04-14', '2019-05-14'),
(104, 2, 1004, '2019-04-21', '2019-05-21'),
(104, 3, 1005, '2019-04-27', '2019-05-27'),
(104, 3, 1007, '2019-04-30', '2019-05-30'),
(104, 4, 1008, '2019-04-07', '2019-05-07'),
(105, 1, 1000, '2019-04-06', '2019-05-06'),
(105, 2, 1003, '2019-04-10', '2019-05-10'),
(105, 4, 1008, '2019-04-08', '2019-05-08'),
(106, 3, 1005, '2019-05-01', '2019-05-01'),
(106, 3, 1006, '2019-04-06', '2019-05-06'),
(106, 4, 1009, '2019-05-21', '2019-05-21'),
(107, 1, 1001, '2019-04-13', '2019-05-13'),
(107, 1, 1002, '2019-04-15', '2019-05-15'),
(107, 2, 1004, '2019-04-18', '2019-05-18'),
(108, 1, 1000, '2019-04-12', '2019-05-12'),
(108, 3, 1007, '2019-04-14', '2019-05-14'),
(108, 4, 1008, '2019-04-19', '2019-05-19'),
(109, 1, 1002, '2019-04-23', '2019-05-23'),
(109, 3, 1006, '2019-04-12', '2019-05-12'),
(109, 3, 1007, '2019-04-29', '2019-05-29'),
(109, 4, 1009, '2019-04-24', '2019-05-24'),
(110, 3, 1005, '2019-05-02', '2019-06-02'),
(110, 3, 1007, '2019-05-03', '2019-06-03'),
(111, 2, 1003, '2019-04-11', '2019-05-11'),
(111, 4, 1008, '2019-04-17', '2019-05-17'),
(112, 1, 1001, '2019-04-09', '2019-05-09'),
(112, 1, 1002, '2019-04-08', '2019-05-08'),
(112, 3, 1005, '2019-04-13', '2019-05-13'),
(113, 1, 1001, '2019-04-07', '2019-05-07'),
(114, 4, 1008, '2019-05-03', '2019-06-03'),
(114, 4, 1009, '2019-05-05', '2019-06-05'),
(115, 3, 1005, '2019-04-28', '2019-05-28'),
(115, 3, 1006, '2019-04-15', '2019-05-15'),
(115, 4, 1008, '2019-04-27', '2019-05-27'),
(116, 3, 1007, '2019-04-10', '2019-05-10'),
(117, 2, 1003, '2019-04-14', '2019-05-14'),
(117, 3, 1005, '2019-04-19', '2019-05-19'),
(117, 3, 1006, '2019-04-09', '2019-05-09'),
(118, 1, 1001, '2019-05-04', '2019-06-04'),
(118, 4, 1009, '2019-05-02', '2019-06-02'),
(119, 1, 1001, '2019-04-26', '2019-05-26'),
(119, 4, 1008, '2019-04-29', '2019-05-29'),
(120, 4, 1008, '2019-05-01', '2019-06-01')
;

SELECT * FROM Book_Loans
;



-------------------------------------- Stored Procedures Info ---------------------------------------

						-- Procedure 1 --				-- Find exact book by Specific Branch
USE db_library
GO

CREATE PROCEDURE  dbo.findBookByBranch @Book NVARCHAR(30) = NULL		
AS

SELECT a1.Number_Of_Copies
FROM Book_Copies a1
INNER JOIN Library_Branch ON
a1.BranchID = Library_Branch.ID
INNER JOIN Books a3 ON
a1.BookID = a3.BookID
WHERE Title = ISNULL(@Book, Title)
AND Library_Branch.BranchName = 'Sharpstown'
GO


EXEC [dbo].[findBookByBranch] @Book = 'The Lost Tribe'
;



						-- Procedure 2 --				-- Find exact book for all locations
USE db_library
GO

CREATE PROCEDURE  dbo.findBook @BookLookup NVARCHAR(30)
AS
SELECT a1.Number_Of_Copies
FROM Book_Copies a1
INNER JOIN Library_Branch ON
a1.BranchID = Library_Branch.ID
INNER JOIN Books a3 ON
a1.BookID = a3.BookID
WHERE Title = ISNULL(@BookLookup, Title)
AND Library_Branch.ID BETWEEN 1 and 4
GO

EXEC [dbo].[findBook] @BookLookup = 'The Lost Tribe'
;


						-- Procedure 3 --				-- Check who does not have any loans out
USE db_library
GO

CREATE PROCEDURE dbo.checkedBooks
AS
SELECT a1.Name, COUNT(a2.CardNo)
FROM Borrower a1
Left JOIN Book_Loans a2 ON
a2.CardNo = a1.CardNo
GROUP BY a1.Name
HAVING COUNT(a2.CardNo) = 0
;

EXEC [dbo].[checkedBooks]
;

/*		Other Option per Henok													Thank you Henok for the corrections and suggestions
SELECT Name FROM Borrower a1
WHERE NOT EXISTS (Select * from Book_Loans a2
WHERE a2.CardNo = a1.CardNo);
*/



						-- Procedure 4 --				-- Find all books due "today" at Sharpstown branch
USE db_library
GO

CREATE PROCEDURE dbo.DateDue @dueDate NVARCHAR(50)
AS
SELECT a2.Title, a4.Name, a4.Address
FROM Borrower a4
INNER JOIN Book_Loans a1 ON
a1.CardNo = a4.CardNo
INNER JOIN Books a2 ON
a1.BookID = a2.BookID
INNER JOIN Library_Branch a3 ON
a3.ID = a1.BranchID
WHERE a1.DateDue = ISNULL(@dueDate, a1.DateDue)
AND a3.BranchName = 'Sharpstown'
;

EXEC [dbo].[DateDue] @dueDate = '2019-05-06'
;




						-- Procedure 5 --				-- SELECT all books borrowed by branch location
USE db_library
GO

CREATE PROCEDURE dbo.BooksByBranch 
AS
SELECT a1.BranchName, COUNT(CardNo)
FROM Library_Branch a1
INNER JOIN Book_Loans a2 ON
a2.BranchID = a1.ID
WHERE CardNo BETWEEN 1000 AND 1010
GROUP BY BranchName
;

EXEC [dbo].[BooksByBranch] 
;


						-- Procedure 6 --				-- SELECT Books Loaned by Person greater than 5
USE db_library
GO

CREATE PROCEDURE dbo.BooksOutByPerson 
AS
SELECT a1.Name, a1.Address, COUNT(a2.CardNo)
FROM Borrower a1
INNER JOIN Book_Loans a2 ON
a2.CardNo = a1.CardNo 
GROUP BY a1.Name, a1.Address 
HAVING COUNT(a2.CardNo) > 5
;

EXEC [dbo].[BooksOutByPerson]
;


						-- Procedure 7 --				-- SELECT books by Author at Central branch
USE db_library
GO

CREATE PROCEDURE dbo.searchByAuthor @Author VARCHAR(50)
AS
SELECT a1.Title, a2.Number_Of_Copies
FROM Book_Copies a2
INNER JOIN Books a1 ON
a1.BookID = a2.BookID 
INNER JOIN Library_Branch a3 ON
a2.BranchID = a3.ID
INNER JOIN Book_Authors a4 ON
a1.BookID = a4.BookID 
WHERE a4.AuthorName = ISNULL(@Author, a4.AuthorName)
AND a3.BranchName = 'Central'
GROUP BY a1.Title, a2.Number_Of_Copies
;

EXEC [dbo].[searchByAuthor] @Author = 'Stephen King'
;