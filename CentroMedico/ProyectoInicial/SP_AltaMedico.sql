
/*
SELECT * FROM Medico
SELECT * FROM Especialidad
SELECT * FROM MedicoEspecialidad
EXEC SP_AltaMedico 'Gerardo', 'Martinez', 1, 'Medico Residente'
*/
CREATE PROC SP_AltaMedico(
	@nombre VARCHAR(50),
	@apellido VARCHAR(50),
	@idEspecialidad INT,
	@descripcion VARCHAR(50)
)

AS

IF NOT EXISTS (SELECT TOP 1 idMedico FROM Medico WHERE @nombre = nombre AND @apellido = apellido)
BEGIN 
	
	INSERT INTO Medico (nombre, apellido)
	VALUES (@nombre, @apellido)

	DECLARE @auxIdMedico INT
	SET @auxIdMedico = @@IDENTITY

	INSERT INTO MedicoEspecialidad (idMedico, idEspecialidad, descripcion)
	VALUES (@auxIdMedico, @idEspecialidad, @descripcion)

	PRINT 'El medico se agregó correctamente'
	RETURN 


END
ELSE
BEGIN 
	PRINT 'El medico ya existe'
END

GO