----------------------------------------------------------
----------------------------------------------------------
--PROCEDIMIENTO OUTPUT CALCULA PROMEDIO DE DOS NUMEROS ---
----------------------------------------------------------
----------------------------------------------------------
USE Northwind
GO

IF EXISTS(SELECT 1 FROM sysobjects WHERE name = 'sp_CalculaPromedio' AND type = 'P')
BEGIN
DROP PROC sp_CalculaPromedio
END
GO

CREATE PROCEDURE sp_CalculaPromedio (@n1 DECIMAL(4,2), @n2 DECIMAL(4,2), @resu DECIMAL(4,2) OUTPUT)

AS
BEGIN
	SELECT @resu = (@n1 + @n2) / 2
END 
GO

--EJECUTA PROCEDIMIENTO OUTPUT
USE Northwind
GO

DECLARE @varesultado DECIMAL (4,2)
EXECUTE sp_CalculaPromedio 50, 10, @varesultado OUTPUT
SELECT @varesultado AS Promedio
