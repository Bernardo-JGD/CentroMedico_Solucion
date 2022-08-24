/*
	Una transacción normalmente se utiliza para evaluar una porción de código en la que estamos actualizando datos
	o borrando datos, es decir, estamos ejecutando UPDATE sobres tablas o DELETE sobre los registros de tablas. 
	También lo vamos a usar para validar INSERT sobre tablas. En caso de que en la ejecución de alguna sentencia
	suceda algún error, por medio de transaccíones podemos volver todo a la normalidad.
*/

SELECT * FROM Paciente
--TRANSACTION  y TRAN es lo mismo, con eso abrimos la transacción
--@@ROWCOUNT----Esta variable de sistema nos dice cuantos registros fueron modificados, insertados, borrados o seleccionados
--en la instrucción inmediata anterior
--COMMIT TRAN----Confirma o da aprobación a la transacción
--ROLLBACK TRAN----Cancela la transacción
BEGIN TRAN
	UPDATE Paciente SET telefono = 444 WHERE idPaciente = 8
IF @@ROWCOUNT = 1
	COMMIT TRAN
ELSE
	ROLLBACK TRAN

BEGIN TRAN
	UPDATE Paciente SET telefono = 444 WHERE apellido = 'Perez'
IF @@ROWCOUNT = 1
	COMMIT TRAN
ELSE
	ROLLBACK

SELECT * FROM Turno
SELECT * FROM TurnoPaciente

--Este no se puede hacer directamente porque se tiene una relación en la tabla TurnoPaciente, por lo que 
--se respeta la integridad de los datos
BEGIN TRAN 
	DELETE FROM Turno WHERE estado = 0
IF	@@ROWCOUNT = 1
	COMMIT TRAN
ELSE
	ROLLBACK TRAN

--Para solucionarlo para este ejemplo,
--eliminamos dentro del begin tran todos los registros referenciados en TurnoPaciente y después eliminamos los 
--registros en la tabla de turnos para que no haya conflicto 
BEGIN TRAN 
	DELETE FROM TurnoPaciente WHERE idTurno = 11 OR idTurno = 12
	DELETE FROM Turno WHERE estado = 0
IF	@@ROWCOUNT = 1
	COMMIT TRAN
ELSE
	ROLLBACK TRAN
--Al final se ejecuta el ROLLBACK pues retorna con @@ROWCOUNT más de un registro modificadoi o alterado
--De esta manera ninguna tabla presenta cambios, como si no se hubiera ejecutado nada