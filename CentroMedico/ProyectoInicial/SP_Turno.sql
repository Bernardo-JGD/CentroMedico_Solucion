

CREATE PROC Alta_Turno(
	@fecha CHAR(14), ----20190215 12:00
	@idPaciente paciente,
	@idMedico medico,
	@observacion observacion=''
)

AS
--SELECT TOP--Hace que la consulta sea m�s eficiente
IF NOT EXISTS (SELECT TOP 1 idTurno FROM Turno WHERE fechaTurno=@fecha)
BEGIN
	INSERT INTO Turno (fechaTurno, estado, observacion)
	VALUES (@fecha, 0, @observacion)

	DECLARE @auxIdTurno turno
	SET @auxIdTurno = @@IDENTITY

	INSERT INTO TurnoPaciente (idTurno, idPaciente, idMedico)
	VALUES (@auxIdTurno, @idPaciente, @idMedico)
	
	PRINT 'El turno se agreg� correctamente'

END
ELSE
BEGIN
	PRINT 'El turno ya existe'
END
GO

/*--@@IDENTITY trae el �ltimo INSERT
Una vez completada una instrucci�n INSERT, SELECT INTO o copia masiva,
@@IDENTITY contiene el �ltimo valor de identidad generado por la instrucci�n.
Si la instrucci�n no afecta a ninguna tabla con columnas de identidad,
@@IDENTITY devuelve NULL. Si se insertan varias filas, generando varios valores de identidad,
@@IDENTITY devuelve el �ltimo valor de identidad generado. 
*/
--Faltaban registros en la tabla m�dico (estaba vacio)
INSERT INTO Medico VALUES('Raul', 'Hern�ndez')
INSERT INTO Medico VALUES('Pablo', 'Ram�rez')

SELECT * FROM Medico
SELECT * FROM Paciente
EXEC Alta_Turno '20200314 14:30', 1, 1, 'El paciente tiene que estar en ayunas'
EXEC Alta_Turno '20200315 16:30', 3, 2, 'El paciente se rompi� XD'

EXEC Alta_Turno '20200315 16:30', 8, 2, 'El paciente se rompi� XD'
EXEC Alta_Turno '20200316 16:30', 7, 2, 'El paciente se rompi� XD'
EXEC Alta_Turno '20200317 16:30', 5, 2, 'El paciente se rompi� XD'
EXEC Alta_Turno '20200318 16:30', 4, 2, 'El paciente se rompi� XD'
EXEC Alta_Turno '20200319 16:30', 5, 2, 'El paciente se rompi� XD'
EXEC Alta_Turno '20200320 16:30', 7, 2, 'El paciente se rompi� XD'
EXEC Alta_Turno '20200321 16:30', 7, 2, 'El paciente se rompi� XD'
EXEC Alta_Turno '20200322 16:30', 8, 2, 'El paciente se rompi� XD'
EXEC Alta_Turno '20200323 16:30', 8, 2, 'El paciente se rompi� XD'
EXEC Alta_Turno '20200324 16:30', 8, 2, 'El paciente se rompi� XD'

SELECT * FROM Turno
SELECT * FROM TurnoPaciente
SELECT * FROM TurnoEstado