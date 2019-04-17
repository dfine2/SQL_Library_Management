USE [db_library]
GO

/****** Object:  StoredProcedure [dbo].[p_Q5]    Script Date: 4/17/2019 2:37:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[p_Q5]
AS
BEGIN
SELECT libraryBranch_branchName AS 'Branch', COUNT(bookLoans_branchID) AS 'Books Loaned'
	FROM tbl_libraryBranch
	INNER JOIN tbl_bookLoans ON bookLoans_branchID = libraryBranch_branchID
	GROUP BY libraryBranch_branchName
END

--Returns the number of books loaned at each branch.

--EXEC dbo.p_Q5
GO


