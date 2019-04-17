USE [db_library]
GO

/****** Object:  StoredProcedure [dbo].[p_Q6]    Script Date: 4/17/2019 2:37:54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[p_Q6]
AS
BEGIN
	SELECT borrower_name AS 'Name', borrower_address AS 'Address', COUNT(bookLoans_cardNo) AS 'Books Borrowed'
	FROM tbl_borrower
	INNER JOIN tbl_bookLoans ON bookLoans_cardNo = borrower_cardNo
	GROUP BY borrower_name, borrower_address
	HAVING COUNT(bookLoans_cardNo) >5
END

--Returns names and addresses of borrowers with more than 5 books checked out.
GO


