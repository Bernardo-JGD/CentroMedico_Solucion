

------------------------------------------------INNER JOIN
--Junta todas las coincidencias de la tabla de la izquierda con las de la derecha (Intersección)
--Hay que tener 

SELECT * FROM Paciente
SELECT * FROM TurnoPaciente

SELECT * FROM Paciente AS P 
INNER JOIN TurnoPaciente AS T
ON T.idPaciente = P.idPaciente
/*
1	NULL	Jorge	Ramirez	2019-01-18	NULL	PER	NULL	NULL	Pacientes creados desde UI	11	1	1
3	NULL	Roberto	Perez	2017-01-01	NULL	PER			Pacientes creados desde UI	12	3	2
*/

------------------------------------------------LEFT JOIN
--Retorna todos los registros de la tabla izquierda y además retorna todos los registros de la tabla derecha que 
--hagan match con la tabla de la izquierda (puede haber registros vacios al lado izquierdo al no haber coincidencias)

SELECT * FROM Paciente AS P
LEFT JOIN TurnoPaciente T
ON T.idPaciente = P.idPaciente

/*
1	NULL	Jorge	Ramirez	2019-01-18	NULL	PER	NULL	NULL	Pacientes creados desde UI	11	1	1
3	NULL	Roberto	Perez	2017-01-01	NULL	PER			Pacientes creados desde UI	12	3	2
4	NULL	Roberto	Perez	2017-01-01	piedra buena 21	PER			Pacientes creados desde UI	NULL	NULL	NULL
5	NULL	Roberto3	Perez3	2017-01-01	piedra buena 21	PER			Observacion modificada	NULL	NULL	NULL
7	NULL	Juan	Perez	2017-01-04	piedra buena 21	ESP				NULL	NULL	NULL
8	12345	Bernardo	Diaz	1999-10-11	Emiliano Zapata	MEX	444	blade@gmail		NULL	NULL	NULL
*/

------------------------------------------------RIGHT JOIN
--Lo contrario del LEFT JOIN

SELECT * FROM Paciente AS P
INNER JOIN TurnoPaciente T
ON T.idPaciente = P.idPaciente
/*
1	NULL	Jorge	Ramirez	2019-01-18	NULL	PER	NULL	NULL	Pacientes creados desde UI	11	1	1
3	NULL	Roberto	Perez	2017-01-01	NULL	PER			Pacientes creados desde UI	12	3	2
*/

------------------------------------------------Consideraciones
--1) ON siempre por las PRIMARY KEY, priorizarlo, mejora la eficiencia
--2) Colocar del lado izquierdo el campo que pertenece a la primer tabla conectada con el INNER JOIN
--3) Usar alias para los nombres de las tablas

------------------------------------------------UNION y UNION ALL
--UNION----Permite unir dos resultados de dos consultas diferentes con la misma cantidad de campos
--Requiere que los campos de ambos SELECT sean los mismo, o sea, la misma cantidad (de columnas) y el mismo tipo de dato para hacer
--una sola tabla

SELECT * FROM Turno
UNION
SELECT * FROM Turno
--En este caso retorna lo mismo, no doble

SELECT * FROM Turno WHERE estado = 0
UNION
SELECT * FROM Turno WHERE estado = 1
--En este caso retorna lo mismo pero en diferente orden, primero los registros con 0 y después los registros con 1

SELECT * FROM Paciente 
UNION
SELECT * FROM Turno
--All queries combined using a UNION, INTERSECT or EXCEPT operator must have an equal number of expressions in their target lists.
--No puede hacer la union por la diferencia de cantidad de columnas y los tipos de datos

SELECT idPaciente FROM Paciente 
/*
1
3
4
5
7
8
*/

SELECT idTurno FROM Turno 
/*
1
2
3
4
5
6
7
8
9
10
11
12
*/
SELECT idPaciente FROM Paciente 
UNION
SELECT idTurno FROM Turno

/*
1
2
3
4
5
6
7
8
9
10
11
12
*/
--En este caso trae todo de ambas tablas, si hay iguales no repite, y solo le interesa que sea 1 y 1 columna y que 
--ambas tengan el mismo tipo de dato

SELECT idPaciente FROM Paciente 
UNION ALL
SELECT idTurno FROM Turno
--UNION ALL si repite resultados que sean iguales
/*
1
3
4
5
7
8
1
2
3
4
5
6
7
8
9
10
11
12
*/