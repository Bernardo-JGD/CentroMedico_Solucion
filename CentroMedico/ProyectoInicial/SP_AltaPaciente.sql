


ALTER PROC ALTA_Paciente (
	@dni VARCHAR(20),
	@nombre VARCHAR(50),
	@apellido VARCHAR(50),
	@fNacimiento VARCHAR(8),
	@domicilio VARCHAR(50),
	@idPais CHAR(3),
	@tel VARCHAR(20) = '',
	@email VARCHAR(30),
	@observacion VARCHAR (1000) = ''
)
--Los valores inicializados son por si no se reciben como parámetros
AS

DECLARE @a BIGINT = 0
WHILE @a < 15000000
SET @a = @a + 1

IF NOT EXISTS (SELECT * FROM Paciente WHERE dni=@dni)
BEGIN 
	INSERT INTO Paciente (dni, nombre, apellido, fNacimiento, domicilio, idPais, telefono, email, observacion)
	VALUES (@dni, @nombre, @apellido, @fNacimiento, @domicilio, @idPais, @tel, @email, @observacion)
	PRINT 'El paciente se agregó correctamente'
	RETURN
END
ELSE
BEGIN
	PRINT 'El paciente ya existe'
END
GO

EXEC ALTA_Paciente '12345', 'Bernardo', 'Diaz', '19991011', 'Emiliano Zapata', 'MEX', '8318982330', 'blade@gmail', ''
SELECT * FROM Paciente


SELECT * FROM TrazaPrueba