USE [db_library]
GO

/****** Object:  StoredProcedure [dbo].[p_Q3]    Script Date: 4/17/2019 2:36:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[p_Q3] @count int
AS
BEGIN
SELECT borrower_name
	FROM tbl_bookLoans
	INNER JOIN tbl_borrower ON borrower_cardNo = bookLoans_cardNo
	GROUP BY borrower_name
	HAVING COUNT(bookLoans_cardNo) = @count 
END

--Gets the names of all borrowers who have "@count" books out.
/* WITH PARAMETERS TO MATCH DRILL
--EXEC dbo.p_Q3 0
GO*/


