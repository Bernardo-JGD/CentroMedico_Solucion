--Los triggers desencadenan eventos
--Los eventos que activan un trigger son INSERT, UPDATE  y DELETE
--Con cualquiera de estos podemos crear un trigger

ALTER TRIGGER PacientesCreados ON Paciente 
AFTER INSERT 
AS

IF (SELECT idPais FROM INSERTED) = 'MEX'
	INSERT INTO PacienteLog (idPaciente, idPais, fechaAlta)
		SELECT I.idPaciente, I.idPais, GETDATE() FROM INSERTED AS I

--	IF (SELECT idPais FROM INSERTED) = 'MEX' ---- se consulta el último registro y se checa si es de méxico
--		INSERT INTO PacienteLog (idPaciente, idPais, fechaAlta) --- se inserta en la nueva tabla...
--			SELECT I.idPais, I.idPais, GETDATE() FROM INSERTED AS I ---... los datos del último registro realizado ON Paciente

--Comprobando el funcionamiento 
--SELECT * FROM Paciente

INSERT INTO Paciente (dni, nombre, apellido, fNacimiento, domicilio, idPais, telefono, email, observacion)
VALUES ('54321', 'Pato', 'Fideos', '1850/10/09', 'Japón', 'ESP', '123454321', 'pato@gmail.com', 'es un pato blanco')

SELECT * FROM PacienteLog

INSERT INTO Paciente (dni, nombre, apellido, fNacimiento, domicilio, idPais, telefono, email, observacion)
VALUES ('7899887', 'Poyo', 'Amarillo', '1950/07/08', 'Ampérica', 'MEX', '654456', 'poyo@gmail.com', 'es un poyo amarillo')

--Resultado del trigger
--12	MEX	2022-07-12 20:32:40.533