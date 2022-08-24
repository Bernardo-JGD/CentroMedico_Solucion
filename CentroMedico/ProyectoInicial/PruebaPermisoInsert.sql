
SELECT * FROM Especialidad

INSERT INTO Especialidad VALUES('NUTRICIONISTA')

/*----Me arroja lo siguiente porque el usuario no tiene los permisos de INSERT
Msg 229, Level 14, State 5, Line 4
The INSERT permission was denied on the object 'Especialidad', database 'CentroMedicoRestore', schema 'dbo'.
*/

SELECT * FROM Pais
/*
Msg 229, Level 14, State 5, Line 11
The SELECT permission was denied on the object 'Pais', database 'CentroMedicoRestore', schema 'dbo'.
*/
SELECT * FROM Paciente
/*
Msg 229, Level 14, State 5, Line 11
The SELECT permission was denied on the object 'Pais', database 'CentroMedicoRestore', schema 'dbo'.
*/
SELECT * FROM Turno--En esta si tengo permiso con el usuario Jose porque tiene el rol de AdminTurnos