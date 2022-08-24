
-------------------------------------------------SP_SELECT_TurnosPaciente
/*
ALTER PROC SP_SELECT_TurnosPaciente(
			@idPaciente paciente
			)
AS
SET NOCOUNT ON
IF EXISTS (
	SELECT * FROM Paciente P
	INNER JOIN TurnoPaciente TP
	ON TP.idPaciente = P.idPaciente
	INNER JOIN Turno T
	ON T.idTurno = TP.idTurno
	INNER JOIN MedicoEspecialidad M
	ON M.idMedico = TP.idMedico
	WHERE P.idPaciente = @idPaciente
)
	SELECT * FROM Paciente P
	INNER JOIN TurnoPaciente TP
	ON TP.idPaciente = P.idPaciente
	INNER JOIN Turno T
	ON T.idTurno = TP.idTurno
	INNER JOIN MedicoEspecialidad M
	ON M.idMedico = TP.idMedico
	WHERE P.idPaciente = @idPaciente

ELSE
	SELECT 0 AS Resultado
GO
--RECOMENDACIÓN: no utilizar la variable en los JOIN, utilizarla hasta después, con un WHERE 

/*
SELECT * FROM Turno 
SELECT * FROM TurnoPaciente
SELECT * FROM Paciente
SELECT * FROM MedicoEspecialidad
INSERT INTO MedicoEspecialidad VALUES(1, 2, 'Médico Clínico')
*/

EXEC SP_SELECT_TurnosPaciente 1

*/
-------------------------------------------------SP_SELECT_HistoriaClinica
/*
ALTER PROC SP_SELECT_HistoriaClinica (
			@idPaciente paciente
			)
AS
SET NOCOUNT ON
--SELECT * FROM Paciente
--SELECT * FROM Historia
--SELECT * FROM HistoriaPaciente
--SELECT * FROM MedicoEspecialidad
--SELECT * FROM Medico
--INSERT INTO Historia VALUES ('20190215', 'Esta vivo')
--INSERT INTO HistoriaPaciente VALUES(1, 7, 2)

IF EXISTS (

	SELECT * FROM Paciente P
	INNER JOIN HistoriaPaciente HP
	ON HP.idPaciente = P.idPaciente 
	INNER JOIN Historia H 
	ON H.idHistoria = HP.idHistoria 
	INNER JOIN MedicoEspecialidad ME
	ON ME.idMedico = HP.idMedico
	INNER JOIN Medico M
	ON M.idMedico = ME.idMedico
	WHERE P.idPaciente = @idPaciente

)
	SELECT * FROM Paciente P
	INNER JOIN HistoriaPaciente HP
	ON HP.idPaciente = P.idPaciente 
	INNER JOIN Historia H 
	ON H.idHistoria = HP.idHistoria 
	INNER JOIN MedicoEspecialidad ME
	ON ME.idMedico = HP.idMedico
	INNER JOIN Medico M
	ON M.idMedico = ME.idMedico
	WHERE P.idPaciente = @idPaciente
ELSE
	SELECT 0 AS Resultado

GO

EXEC SP_SELECT_HistoriaClinica 2

*/

-------------------------------------------------SP_SELECT_Especialidad

--Cuando no enviamos parametros no ponemos paréntesis
/**
CREATE PROC SP_SELECT_Especialidad 
AS
SET NOCOUNT ON
IF EXISTS(SELECT * FROM Especialidad)
	SELECT * FROM Especialidad
ELSE
	SELECT 0 AS Resultado
GO
EXEC SP_SELECT_Especialidad

**/

-------------------------------------------------SP_ActualizarTurno
/**
ALTER PROC SP_ActualizarTurno (
				@idTurno turno,
				@estado TINYINT,
				@observacion observacion
				)
AS
SET NOCOUNT ON
--Si existe el registro que quiero modificar actualizo
--Si hay más instrucciones además de un update uso BEGIN y END 
IF EXISTS (SELECT * FROM Turno WHERE idTurno = @idTurno)
	UPDATE Turno SET estado = @estado, 
					 observacion = @observacion
	WHERE idTurno = @idTurno
ELSE
	SELECT 0 AS Resultado

GO

SELECT * FROM Turno
SELECT * FROM TurnoEstado
EXEC SP_ActualizarTurno 1, 1, 'Ya no está roto'
EXEC SP_ActualizarTurno 2, 1, 'Sigue vivio'

SELECT T.fechaTurno, T.observacion, TE.descripcion
FROM Turno AS T
INNER JOIN TurnoEstado AS TE
ON TE.idestado = T.estado
ORDER BY (fechaTurno)

SELECT T.fechaTurno, T.observacion, TE.descripcion
FROM Turno AS T
INNER JOIN TurnoEstado AS TE
ON TE.idestado = T.estado
ORDER BY (idEstado)
**/


-------------------------------------------------SP_ActualizarPaciente

/**

CREATE PROC SP_ActualizarPaciente(
				@idPaciente paciente,
				@nombre VARCHAR(50),
				@apellido VARCHAR(50),
				@domicilio VARCHAR(50),
				@telefono VARCHAR(20),
				@email VARCHAR(30)
				)

AS

SET NOCOUNT ON

IF EXISTS (SELECT * FROM Paciente WHERE idPaciente = @idPaciente)
	UPDATE Paciente SET nombre = @nombre,
						apellido = @apellido,
						domicilio = @domicilio,
						telefono = @telefono,
						email = @email
	WHERE idPaciente = @idPaciente
	
ELSE
	SELECT 0 AS Resultado
GO

--SELECT idPaciente, nombre, apellido, domicilio, telefono, email FROM Paciente
EXEC SP_ActualizarPaciente 1, 'Jorge', 'Ramirez', 'Reach', '138111934', 'jorge@mail.com'

**/

-------------------------------------------------SP_EliminarTurno

--Este me va a servir mucho para tenerlo de rerferencia para hacer DELETE en otros proyectos
ALTER PROC SP_EliminarTurno (
					@idTurno turno
					)
AS 
SET NOCOUNT ON

IF EXISTS (SELECT * FROM Turno WHERE idTurno = @idTurno)
BEGIN	 
	 DELETE FROM TurnoPaciente WHERE idTurno = @idTurno
	 DELETE FROM Turno WHERE idTurno = @idTurno
END

ELSE
	 SELECT 0 AS Resultado
GO



	 SELECT * FROM Turno
	 SELECT * FROM TurnoPaciente
	 EXEC SP_EliminarTurno 12
	 SELECT * FROM Turno
	 SELECT * FROM TurnoPaciente