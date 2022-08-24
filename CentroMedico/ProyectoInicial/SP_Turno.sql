

CREATE PROC Alta_Turno(
	@fecha CHAR(14), ----20190215 12:00
	@idPaciente paciente,
	@idMedico medico,
	@observacion observacion=''
)

AS
--SELECT TOP--Hace que la consulta sea más eficiente
IF NOT EXISTS (SELECT TOP 1 idTurno FROM Turno WHERE fechaTurno=@fecha)
BEGIN
	INSERT INTO Turno (fechaTurno, estado, observacion)
	VALUES (@fecha, 0, @observacion)

	DECLARE @auxIdTurno turno
	SET @auxIdTurno = @@IDENTITY

	INSERT INTO TurnoPaciente (idTurno, idPaciente, idMedico)
	VALUES (@auxIdTurno, @idPaciente, @idMedico)
	
	PRINT 'El turno se agregó correctamente'

END
ELSE
BEGIN
	PRINT 'El turno ya existe'
END
GO

/*--@@IDENTITY trae el último INSERT
Una vez completada una instrucción INSERT, SELECT INTO o copia masiva,
@@IDENTITY contiene el último valor de identidad generado por la instrucción.
Si la instrucción no afecta a ninguna tabla con columnas de identidad,
@@IDENTITY devuelve NULL. Si se insertan varias filas, generando varios valores de identidad,
@@IDENTITY devuelve el último valor de identidad generado. 
*/
--Faltaban registros en la tabla médico (estaba vacio)
INSERT INTO Medico VALUES('Raul', 'Hernández')
INSERT INTO Medico VALUES('Pablo', 'Ramírez')

SELECT * FROM Medico
SELECT * FROM Paciente
EXEC Alta_Turno '20200314 14:30', 1, 1, 'El paciente tiene que estar en ayunas'
EXEC Alta_Turno '20200315 16:30', 3, 2, 'El paciente se rompió XD'

EXEC Alta_Turno '20200315 16:30', 8, 2, 'El paciente se rompió XD'
EXEC Alta_Turno '20200316 16:30', 7, 2, 'El paciente se rompió XD'
EXEC Alta_Turno '20200317 16:30', 5, 2, 'El paciente se rompió XD'
EXEC Alta_Turno '20200318 16:30', 4, 2, 'El paciente se rompió XD'
EXEC Alta_Turno '20200319 16:30', 5, 2, 'El paciente se rompió XD'
EXEC Alta_Turno '20200320 16:30', 7, 2, 'El paciente se rompió XD'
EXEC Alta_Turno '20200321 16:30', 7, 2, 'El paciente se rompió XD'
EXEC Alta_Turno '20200322 16:30', 8, 2, 'El paciente se rompió XD'
EXEC Alta_Turno '20200323 16:30', 8, 2, 'El paciente se rompió XD'
EXEC Alta_Turno '20200324 16:30', 8, 2, 'El paciente se rompió XD'

SELECT * FROM Turno
SELECT * FROM TurnoPaciente
SELECT * FROM TurnoEstado