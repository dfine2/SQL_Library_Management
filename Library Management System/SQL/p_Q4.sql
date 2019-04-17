USE [db_library]
GO

/****** Object:  StoredProcedure [dbo].[p_Q4]    Script Date: 4/17/2019 2:37:00 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[p_Q4] @branch VARCHAR(50), @date DATE
AS
BEGIN
	SELECT books_title, borrower_name, borrower_address
	FROM tbl_books
	INNER JOIN tbl_bookLoans ON bookLoans_bookID = books_bookID
	INNER JOIN tbl_borrower ON borrower_cardNo = bookLoans_cardNo
	INNER JOIN tbl_libraryBranch ON libraryBranch_branchID = bookLoans_branchID
	WHERE (libraryBranch_branchName = @branch AND bookLoans_dateDue = @date )
END

-- Will find all books due on a given date at a given branch, as well as borrower names and addresses.
/*WITH PARAMETERS TO MATCH DRILL
--EXEC dbo.p_Q4 'Sharpstown', '2019-04-15'
GO*/


