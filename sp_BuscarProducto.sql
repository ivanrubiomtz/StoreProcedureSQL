------------------------------------------
------------------------------------------
-- BUSCAR PRODUCTOS SP_BUSCARPRODUCTO ----
------------------------------------------
------------------------------------------

USE Northwind
GO

IF EXISTS(SELECT 1 FROM sysobjects WHERE name = 'sp_BuscarProducto' AND type = 'P')
BEGIN
DROP PROC sp_BuscarProducto
END
GO

CREATE PROCEDURE sp_BuscarProducto (@nom nvarchar(40))

AS
BEGIN
	SELECT * 
		FROM Products AS p
		WHERE p.ProductName LIKE '%' + @nom + '%'
END 
GO

--EJECUTA PROCEDIMIENTO SP_BUSCARPRODUCTO
EXEC sp_BuscarProducto 'Chai'

