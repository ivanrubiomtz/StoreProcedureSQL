---	Script que al ejecutar, inserte en una tabla temporal la tabla Customers los campos :
---	CustomerID
---	CompanyName
---	ContactName
--a.	Cursor para que en una columna llamada “Numero”, le inserte el valor 10 al primero y se incremente en 10 a los subsecuentes.
--b.	Muestro la tabla temporal.


USE Northwind
GO
IF EXISTS(SELECT 1 FROM sysobjects WHERE name = 'CUSTOMERS_EXAMEN' AND type = 'P')
BEGIN
DROP PROC CUSTOMERS_EXAMEN
END
GO

CREATE PROC CUSTOMERS_EXAMEN
AS

	DECLARE @Customerid		nchar(5);
	DECLARE @CompanyName		varchar(40);
	DECLARE @ContactName		varchar(30);
	DECLARE @Numero			int;

	SET     @numero=0


	CREATE TABLE #T
	(
		CustomerID		nchar(5),
		companyName	nvarchar(40),
		contacName		nvarchar(30),
		Numero		int,
	)

	DECLARE C1  cursor
	FOR 
	SELECT Customerid, CompanyName, ContactName
	FROM   Customers

	OPEN C1
	FETCH NEXT FROM C1 INTO @Customerid, @CompanyName, @ContactName
        	WHILE @@fetch_status =0
	BEGIN

		 SELECT @Numero = @Numero + 10
		 INSERT INTO #T (CustomerID,    CompanyName,  ContacName,   Numero)
		 VALUES         (@Customerid,  @CompanyName,  @ContactName, @Numero) 

         
	FETCH NEXT FROM C1 INTO @Customerid, @CompanyName, @ContactName
    	END

	CLOSE C1
	DEALLOCATE C1

SELECT * FROM #T

---EXEC CUSTOMERS_EXAMEN
