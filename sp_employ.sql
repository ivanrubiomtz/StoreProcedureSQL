-----------------------------------
-----------------------------------
-- CONSULTA SELECT SP_EMPLOY ------
-----------------------------------
-----------------------------------

USE pubs  
GO 

IF EXISTS(SELECT 1 FROM sysobjects WHERE name = 'sp_employ' AND type = 'P')
BEGIN
DROP PROC sp_employ
END
GO

CREATE PROCEDURE sp_employ  (@fn varchar(20))   

AS   
BEGIN
    SELECT *  
    FROM employee AS e 
    WHERE e.fname LIKE '%' + @fn + '%' 
END
GO 

--EJECUTA PROCEDIMIENTO SP_EMPLOY
EXEC sp_employ @fn = 'Mar'

SELECT * FROM employee
