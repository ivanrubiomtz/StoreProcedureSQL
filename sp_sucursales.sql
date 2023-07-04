-------------------------------------------------
-------------------------------------------------
-- INSERTA DATOS EN TABLA STORES SP_SUCURSALES --
-------------------------------------------------
-------------------------------------------------

USE pubs
GO

IF EXISTS(SELECT 1 FROM sysobjects WHERE name = 'sp_sucursales' AND type = 'P')
BEGIN
DROP PROC sp_sucursales
END
GO

CREATE PROCEDURE sp_sucursales (@id char(4), @nom varchar(40), @dir varchar (40), @ciu varchar(20), @st char(2), @zp char (5))

AS
BEGIN
	INSERT INTO stores (stor_id, stor_name, stor_address, city, state, zip)
		VALUES (@id, @nom, @dir, @ciu, @st, @zp)
END
GO

--EJECUTA PROCEDIMIENTO SP_SUCURSALES
EXEC sp_sucursales '2023', 'Centro', '66 Las Torres', 'MEX', 'MX','09090'

SELECT * FROM stores
	
