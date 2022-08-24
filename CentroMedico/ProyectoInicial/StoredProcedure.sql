--Procedimientos almacenados
--Es un conjunto de instrucciones almacenadas internamente en SQL-Server.
--Y queda disponible para cuando necesitemos hacer uso de el.
--Están diseñados para cumplir acciones o consultas concretas.
--Para crearlo podemos utilizar "CREATE PROC" o "CREATE PROCEDURE"

/*puede recibir varios parametros
CREATE PROC SP_ejemplo (-----------------El nombre del procedimiento debe de llevar buenas practicas para entender en que consiste
	@variables tipoDatoSQLdeLasVariables
)
AS -- Palabra reservada, despues de ella viene la consulta que queremos hacer
SELECT * FROM Paciente WHERE idPaciente = @idPaciente -- aquí utilizamos la variable que recibimos de parámetros
GO -- por lo que entendí corta por si hay otra instrucción despues del procedimiento almacenado

*/
CREATE PROC S_paciente (
	@idPaciente INT
)
AS
SELECT * FROM Paciente WHERE idPaciente = @idPaciente
GO

--El procedimiento una vez creado se guarda dentro de la base de datos, dentro de la carpeta Programmability
--y dentro de está dentro de la carpeta de Stored Procedures.

--Si nosotros le damos clic derecho en el procedimiento y le damos en modify, nos muestra el código de la consulta.
--Pero SQL-Server le agrega unas líneas de código extras. Se explican a continuación.
--SET ANSI_NULLS ON------esta es por si encuentra valores NULL, no los retorne, si queremos traer registros con valores NULL
--la colocamos en OFF
--SET ANSI_NULLS OFF
SELECT idPaciente, nombre, apellido, domicilio FROM Paciente
/*
1	1	Jorge	Ramirez	NULL
2	3	Roberto	Perez	NULL
3	4	Roberto	Perez	piedra buena 21
4	5	Roberto3	Perez3	piedra buena 21
5	7	Juan	Perez	piedra buena 21
*/
SET ANSI_NULLS ON
SELECT idPaciente, nombre, apellido, domicilio FROM Paciente WHERE domicilio = NULL
--Lo anterio no retorno nada
--Pero el siguiente código si retorna con los valores NULL
SET ANSI_NULLS OFF
SELECT idPaciente, nombre, apellido, domicilio FROM Paciente WHERE domicilio = NULL
/*
1	1	Jorge	Ramirez	NULL
2	3	Roberto	Perez	NULL
*/

--SET QUOTED_IDENTIFIER ON------ Permite (en ON) crear tablas o nombrar cosas con palabras reservadas. 
--Si se coloca en OFF, prohibe que se utilicen palabras reservada para nombrar tablas u otras cosas
--Ejemplo del video 
/*Si quiero llamar a una tabla con el nombre de una palabra reservada, el nombre tiene que estar entre comillas
SET QUOTED_IDENTIFIER ON
CREATE TABALE "SELECT" (campo1 VARCHAR(50))
-------------------------------------------
En este caso no creará la tabla y marcará error 
SET QUOTED_IDENTIFIER OFF
CREATE TABALE "SELECT" (campo1 VARCHAR(50))
*/
--Si nosotros le damos en modificar "modify", al principio mostrará "CREATE" al procedimiento, pero después, mostrará "ALTER"
--pues se considera modificado el procedimiento. 

--No puede haber dos procedimientos almacenados con el mismo nombre

--Para ejecutar un procedimiento almacenado se hace de la siguiente manera
-- Para el o los parámetros se respetan los tipos de datos que debe de recibir la variable de parámetro
EXEC S_paciente 7
--Retorna los siguiente
--1	7	Juan	Perez	2017-01-04	piedra buena 21	ESP			


-----------------------------------------------VARIABLE
--Declarar e inicializar
DECLARE @ordenamiento CHAR(1) = 'A'

--Asignar o inicializar variable
SET @ordenamiento = 'D'

PRINT @ordenamiento

DECLARE @valor1 CHAR(1)
DECLARE @valor2 CHAR(1)

SET @valor2 = @valor1 

PRINT @valor2
--ISNUL(valorAasignar, valor en caso de que el primer valor sea null)
SET @valor2 = ISNULL(@valor1, 'V')
PRINT @valor2

-----------------------------------------------SUB-CONSULTAS y Alias (AS)


SELECT apellido, nombre, idPais, observacion,
	(SELECT pais FROM Pais WHERE idPais = idPais)
FROM Paciente WHERE idPaciente = 7
--Subquery returned more than 1 value. This is not permitted when the subquery follows =, !=, <, <= , >, >= or when the subquery is used as an expression.
--Retorna esto porque hay conflicto con la subconsulta, ya que retorna más de un registro
--SELECT pais FROM Pais WHERE idPais = idPais-----esto retorna todos los paises y queremos que solo retorne uno
--Entonces esto se soluciona con el alias

SELECT apellido, nombre, idPais, observacion,
	(SELECT pais FROM Pais ps WHERE ps.idPais = pa.idPais) descPais
FROM Paciente pa WHERE idPaciente = 7
--Los alias los puedo agregar simplemente despues del nombre de la tabla y usarlos dentro de la consulta para diferencias columnas.
--Sobre todo cuando los id se llaman igua, e indicar a que tabla corresponde cada uno
--Esta es una modificación al procedimiento almacenado. Cuando quiera modificar su código puedo o no guardar el script 
--pero para que se realice el cambio en el procedimiento tengo que ejecutar el código.
EXEC S_paciente 7--Ya funciona :D


