
---------------------------------------------------------IF
DECLARE @idPaciente INT
DECLARE @idTurno INT
SET @idPaciente = 7

--Si se cumple la condici�n ejecuta la primer l�nea despu�s del IF, el SELECT lo ejecuta aunque no se cumpla, ya que continua la 
--ejecuci�n del resto de instrucciones
IF @idPaciente = 5
	SET @idTurno = 20
	SELECT * FROM Paciente WHERE idPaciente = @idPaciente
	PRINT @idTurno

--Si nosotros queremos delimitar las instrucciones como en programaci�n con las llaves, usamos BEGIN y END, como {}

SET @idPaciente = 7 
IF @idPaciente = 7
BEGIN 
	SET @idTurno = 20
	SELECT * FROM Paciente WHERE idPaciente = @idPaciente
	PRINT @idTurno
	
			
			
END
SET @idPaciente = 7 
IF @idPaciente = 5
BEGIN 
	SET @idTurno = 20
	SELECT * FROM Paciente WHERE idPaciente = @idPaciente
	PRINT @idTurno
END
ELSE
BEGIN 
	PRINT 'No pas� la primera condici�n'
END

---------------------------------------------------------EXISTS
--Sirve pa checar si existe un registro, se combina con IF
IF EXISTS (SELECT * FROM Paciente WHERE idPaciente = 4)
	PRINT 'Sim�n, si existe'

	DECLARE @existe INT = 10
	IF EXISTS (SELECT * FROM Paciente WHERE idPaciente = 10)
	BEGIN 
		SET @existe = 5
		
	END
	ELSE
	BEGIN
		SET @existe = 3
	END

PRINT @existe

---------------------------------------------------------WHILE 
--Funciona igual que en lenguajes de programaci�n
DECLARE @contador INT = 0
WHILE @contador <= 10
BEGIN 
	PRINT @contador
	SET @contador = @contador + 1
END

---------------------------------------------------------CASE
--Funciona como switch con la siguiente sintaxis

DECLARE @valor INT
DECLARE @resultado CHAR(10) = ''
SET @valor = 5

SET @resultado = (CASE WHEN @valor = 10 THEN 'ROJO'
					   WHEN @valor = 20 THEN 'VERDE'
					   WHEN @valor = 30 THEN 'AZUL'
					  ELSE 'GRIS'--Funciona como el default en programaci�n
					END)
PRINT @resultado 


--Funciona con SELECT, en este caso agrega otra columna
--dependiendo de qu� condici�n se cumple en cada registro

SELECT *, (CASE WHEN estado=0 THEN 'VERDE'
				WHEN estado=1 THEN 'ROJO'
				WHEN estado=2 THEN 'AZUL'
				ELSE 'GRIS'
				END) AS colorTurno FROM Turno
--Como la columna donde aparecen los colores es ajena a la tabla, se le puede poner un alias,
--en este caso "colorTurno", para cuando se tenga que hacer una conexi�n


---------------------------------------------------------RETURN y BREAK
--Por ahora, el return funciona como un break en programaci�n
DECLARE @contador2 INT = 0
WHILE @contador2 <= 10
BEGIN 
	PRINT @contador2
	SET @contador2 = @contador2 + 1
	if @contador2 = 3
		RETURN 
	PRINT 'RETURN'
END
PRINT 'Ya sali� del bucle'

DECLARE @contador3 INT = 0
WHILE @contador3 <= 10
BEGIN 
	PRINT @contador3
	SET @contador3 = @contador3 + 1
	if @contador3 = 3
		BREAK
	PRINT 'BREAK'
END
PRINT 'Ya sali� del bucle'

--Al parecer la diferencia radica en que el RETURN corta el bucle pero ya no ejecuta nada despu�s de salir, 
--en cabmio el BREAK corta tambi�n el bucle pero continua ejecutando el resto de instrucciones que haya despu�s del bucle


---------------------------------------------------------TRY CATCH
--Funciona como en programaci�n

DECLARE @numero INT = 'texto'
PRINT @numero
--Msg 245, Level 16, State 1, Line 123
--Conversion failed when converting the varchar value 'texto' to data type int.
--Este tipo de errores se cachan con el TRY CATCH

BEGIN TRY
	DECLARE @numero2 INT = 'texto' 
END TRY

BEGIN CATCH
	PRINT 'no se le puede asignar texto a una variable de tipo num�rico'
END CATCH
