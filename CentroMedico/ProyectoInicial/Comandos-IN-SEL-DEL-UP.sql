

--Inserto los valores directamente
INSERT INTO Paciente VALUES('Roberto', 'Perez', '2017-01-01', 'piedra buena 21', 'ESP', '', '', '')
--Inserto los valores especificando las columnas en las que los quiero insertar
INSERT INTO Paciente (nombre, apellido, fNacimiento, domicilio, idPais, telefono, email, observacion)
VALUES('Roberto3', 'Perez3', '2017-01-01', 'piedra buena 21', 'ESP', '', '', '')
--Consulto todas las columnas de la tabla
SELECT * FROM Paciente
--Consulto algunas columnas de la tabla
SELECT idPaciente, nombre, apellido FROM Paciente


--Inserto un registro 
INSERT INTO Paciente (nombre, apellido, fNacimiento, domicilio, idPais, telefono, email, observacion)
VALUES('Luis', 'Robles', '2017-01-01', 'piedra buena 21', 'ESP', '', '', '')
--Lo selecciono para ver si id
SELECT * FROM Paciente WHERE apellido = 'Robles'
--Lo elimino mediante su id
DELETE FROM Paciente WHERE idPaciente = 6

SELECT * FROM Paciente
--Actualizo toda una columna de la tabla
UPDATE Paciente SET idPais = 'PER'
UPDATE Paciente SET observacion = 'Pacientes creados desde UI'