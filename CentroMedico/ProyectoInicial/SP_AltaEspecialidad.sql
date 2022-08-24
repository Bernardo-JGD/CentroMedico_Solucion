
/*
	EXEC SP_AltaEspecialidad 'DERMATOLOGIA'
	SELECT * FROM Especialidad
*/
CREATE PROC SP_AltaEspecialidad(
	@especialidad VARCHAR(30)
)
AS
IF	NOT EXISTS (SELECT TOP 1 idEspecialidad FROM Especialidad WHERE especialidad = @especialidad)
BEGIN
	INSERT INTO Especialidad (especialidad)
	VALUES (@especialidad) 

	PRINT 'La especialidad se agregó correctamente'
	RETURN 

END

ELSE

BEGIN
	PRINT 'La especialidad ya existe'
	RETURN 
END
GO