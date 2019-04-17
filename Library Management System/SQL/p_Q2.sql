USE [db_library]
GO

/****** Object:  StoredProcedure [dbo].[p_Q2]    Script Date: 4/17/2019 2:34:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[p_Q2] @title VARCHAR(50)
AS
BEGIN
	SELECT libraryBranch_branchName, bookCopies_numCopies
	FROM tbl_bookCopies
	INNER JOIN tbl_books ON books_bookID = bookCopies_bookID
	INNER JOIN tbl_libraryBranch ON libraryBranch_branchID = bookCopies_branchID
	WHERE (books_title = @title)
END

--Will count number of books titled "@title" for all branches.

/*WITH PARAMETERS TO MATCH DRILL
EXEC dbo.p_Q2 'The Lost Tribe'
GO*/


