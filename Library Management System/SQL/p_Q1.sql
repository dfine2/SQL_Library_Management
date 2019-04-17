USE [db_library]
GO

/****** Object:  StoredProcedure [dbo].[p_Q1]    Script Date: 4/17/2019 2:33:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[p_Q1] @title VARCHAR(50), @branch VARCHAR(50)
AS
BEGIN
	SELECT bookCopies_numCopies
	FROM tbl_bookCopies
	INNER JOIN tbl_books ON books_bookID = bookCopies_bookID
	INNER JOIN tbl_libraryBranch ON libraryBranch_branchID = bookCopies_branchID
	WHERE (books_title = @title AND libraryBranch_branchName = @branch)
END

--Will count number of books titled "@title" at branch named "@branch".

/* WITH PARAMETERS TO MATCH DRILL

EXEC dbo.p_Q1 'The Lost Tribe', 'Sharpstown'
GO
*/


