

CREATE VIEW PacientesYTurnosPendientes AS

SELECT P.idPaciente, P.nombre, P.apellido, T.idTurno, T.estado
	FROM Paciente P 
	INNER JOIN TurnoPaciente TP
	ON TP.idPaciente =P.idPaciente
	INNER JOIN Turno T
	ON T.idTurno = TP.idTurno
WHERE ISNULL(T.estado, 0) = 0 

--Las vistas son como tablas
--Podemos usarlas como tablas
--Se hacen consultas especificas

SELECT * FROM PacientesYTurnosPendientes
SELECT * FROM VistaPrueba
