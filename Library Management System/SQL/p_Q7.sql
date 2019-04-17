USE [db_library]
GO

/****** Object:  StoredProcedure [dbo].[p_Q7]    Script Date: 4/17/2019 2:38:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[p_Q7]
AS
BEGIN
	SELECT books_title, bookCopies_numCopies
	FROM tbl_books
	INNER JOIN tbl_bookCopies ON bookCopies_bookID = books_bookID
	INNER JOIN tbl_bookAuthors ON bookAuthors_bookID = books_bookID
	INNER JOIN tbl_libraryBranch ON libraryBranch_branchID = bookCopies_branchID
	WHERE (bookAuthors_authorName = 'Stephen King') And libraryBranch_branchName = 'Central'
END
GO


