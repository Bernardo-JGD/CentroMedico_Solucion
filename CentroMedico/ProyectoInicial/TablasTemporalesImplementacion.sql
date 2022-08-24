
----------------------------------------Implementación de tablas temporales

--A veces los SELECT principales usan muchos INNER JOIN y generan una demora muy
--excesiva en el STORED PROCEDURE que hace que el resultado tarde unos cuantos segundos
--y con esto podría llegar a optimizarse

DECLARE @turnos TABLE (id INT IDENTITY (1, 1), idTurno turno, idPaciente paciente)
DECLARE @idPaciente paciente
SET @idPaciente = 8
--Este INSERT INTO SELECT se puede usar tanto para tablas temporales como para tablas
--normales o convencionales
INSERT INTO @turnos (idTurno, idPaciente)
SELECT TP.idTurno, TP.idPaciente FROM Paciente P
INNER JOIN TurnoPaciente TP
ON TP.idPaciente = P.idPaciente

DECLARE @i  INT, @total INT
SET @i = 1
SET @total = (SELECT COUNT(*) FROM @turnos)
PRINT @total

WHILE @i <= @total
BEGIN 
	IF (SELECT idPaciente FROM @turnos WHERE id = @i) <>8
		DELETE FROM @turnos WHERE id = @i

	SET @i = @i + 1
END

SELECT * FROM Paciente P 
INNER JOIN @turnos T
ON T.idPaciente = P.idPaciente

SELECT * FROM @turnos