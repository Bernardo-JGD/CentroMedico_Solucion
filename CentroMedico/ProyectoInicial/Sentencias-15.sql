
----------------------------------------------------------------CREATE
--CREATE sirve para crear tablas,
--tipos de datos con base a los que vienen
--por defecto, y funciones
CREATE TYPE pais FROM CHAR(3)

--Creando funciones
--CREATE o ALTER
CREATE FUNCTION nombreFun (@var INT)
RETURNS INT
AS
BEGIN
	SET @var = @var *5
	RETURN @var
END

--Para consultar la función se utiliza SELECT
--SELECT esquema.nombreFuncion (parámetros)
SELECT dbo.nombreFun (5)

----------------------------------------------------------------ALTER
--Sirve para modificar tablas y modificar columnas o eliminarlas (con DROP)
--Agregando una columna nueva
ALTER TABLE Paciente ADD estado SMALLINT
SELECT * FROM Paciente 
--Modificando el tipo de dato de la columna
ALTER TABLE Paciente ALTER COLUMN estado BIT
--Eliminando la columna
ALTER TABLE Paciente DROP COLUMN estado 


----------------------------------------------------------------DROP
CREATE TABLE Ejemplo (campo1 INT, campo2 INT)
--Eliminar una tabla
DROP TABLE Ejemplo

----------------------------------------------------------------TRUNCATE
CREATE TABLE Ejemplo (campo0 INT IDENTITY(1, 1),campo1 INT, campo2 INT)
SELECT * FROM Ejemplo
INSERT INTO Ejemplo VALUES(2, 3)

--Elimina TODOS los registros de una tabla, y si hay campo IDENTITY, lo reinicia
TRUNCATE TABLE Ejemplo
