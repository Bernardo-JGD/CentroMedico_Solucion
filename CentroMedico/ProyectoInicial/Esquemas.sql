/*
Un esquema es un espacio de nombres que agrupa objetos. Estos objetos pueden ser tablas, vistas, procedimientos almacenados,
funciones, tipos de datos, etc. Todos los objetos la base de datos que podamos crear. ¿Cómo los agrupa?, en espacio de nombre
separados.

Los esquemas de base de datos los podemos utilizar por si queremos por ejemplo aislar ciertas tablas de cierto sector de la 
empresa
*/

ALTER SCHEMA Facturacion TRANSFER Pais
ALTER SCHEMA Facturacion TRANSFER Medico

SELECT * FROM Facturacion.Pais

SELECT * FROM dbo.Paciente

/*
Msg 229, Level 14, State 5, Line 15
The SELECT permission was denied on the object 'Paciente', database 'CentroMedicoRestore', schema 'dbo'.
*/

SELECT * FROM Paciente