
--------------------------------------------------------------------------------------CLAUSULAS
----------------------------------------WHERE
SELECT * FROM Paciente

SELECT * FROM Paciente WHERE apellido = 'Perez'
SELECT * FROM Paciente WHERE nombre = 'Claudio' AND apellido ='Lopez'
--2	Claudio	Lopez	2019-02-18	NULL	PER	NULL	NULL	Pacientes creados desde UI
DELETE FROM Paciente WHERE nombre = 'Claudio' AND apellido = 'Lopez'

UPDATE Paciente SET observacion = 'Observacion modificada' WHERE idPaciente = 5

----------------------------------------TOP
--Trae un limite de registros de una tabla
SELECT TOP 2 * FROM Paciente 
SELECT TOP 2 * FROM Paciente WHERE apellido = 'perez'
SELECT * FROM Turno
SELECT TOP 1 * FROM Turno--Trae el primero
SELECT TOP 1 * FROM Turno ORDER BY fechaTurno DESC--Trae el último respecto a la fecha en orden descendente

----------------------------------------ORDER BY
SELECT * FROM Paciente
--Devuelve un conjunto de registros ordenados por un campo especificado
--Por defecto lo hace en orden ascendente
SELECT * FROM Paciente ORDER BY fNacimiento
--Puedo hacerlo de manera descendente agregando al final DESC
SELECT * FROM Paciente ORDER BY fNacimiento DESC
--Puedo combinar con TOP e indicar que sea ascendente con ASC
SELECT TOP 1 * FROM Paciente ORDER BY fNacimiento ASC



----------------------------------------DISTINCT
SELECT * FROM Paciente
--1	1	Jorge	Ramirez	2019-01-18	NULL	PER	NULL	NULL	Pacientes creados desde UI
--2	3	Roberto	Perez	2017-01-01	piedra buena 21	PER			Pacientes creados desde UI
--3	4	Roberto	Perez	2017-01-01	piedra buena 21	PER			Pacientes creados desde UI
--4	5	Roberto3	Perez3	2017-01-01	piedra buena 21	PER			Observacion modificada
--Devuelve los campos que no son repetidos con respecto a la o las columnas indicadas
--Con una columna
SELECT DISTINCT (apellido) FROM Paciente
--1	Perez
--2	Perez3
--3	Ramirez
--Con dos columnas 
SELECT DISTINCT idPaciente, apellido FROM Paciente
--En este caso devuelve la columna de apellido repetida
--porque primero trae los registros no repetidos del idPaciente y estos traen consigo el apellido
--Pienso que solo toma en cuenta el primer parametro, pero si ambos parametros de dos o más registros son iguales
--solo traería el primero que encuentre
--1	1	Ramirez
--2	3	Perez
--3	4	Perez
--4	5	Perez3

----------------------------------------GROUP BY
--Funciona como el DISTINCT pero hay que especificar las columnas que queremos retornar
--Aquí marcaría error
SELECT * FROM Paciente GROUP BY apellido
--Msg 8120, Level 16, State 1, Line 59
--Column 'Paciente.idPaciente' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.

--Así que tenemos que indicar la o las (creo que las) columna que tenemos que retornar
SELECT apellido FROM Paciente GROUP BY apellido


--------------------------------------------------------------------------------------FUNCIONES DE AGREGADO
----------------------------------------MAX y MIN
--Devuelven el valor máximo y minimo de una columna
--Solo retornan un registro 
SELECT * FROM Paciente
SELECT MIN(idPaciente) FROM Paciente
SELECT MAX(idPaciente) FROM Paciente

--Se puede combinar con GROUP BY 
--En este caso primero agrupa por apellido y selecciona los registros minimos
SELECT MIN (idPaciente) FROM Paciente GROUP BY apellido

SELECT idPaciente, apellido FROM Paciente
--1	1	Ramirez
--2	3	Perez
--3	4	Perez
--4	5	Perez3
--Lo que entiendo es que primero agrupa y ordena ascendentemente los apellidosy despues selecciona el minimo 
--en caso de que encuentre un duplicado como pasa con los registros de apellido perez
SELECT apellido, MIN (idPaciente) FROM Paciente GROUP BY apellido
--1	Perez	3
--2	Perez3	5
--3	Ramirez	1
SELECT apellido, MAX (idPaciente) FROM Paciente GROUP BY apellido
--1	Perez	4
--2	Perez3	5
--3	Ramirez	1

----------------------------------------SUM
--Suma los valores de la columna indicada
SELECT idPaciente, apellido FROM Paciente
/*
1	1	Ramirez
2	3	Perez
3	4	Perez
4	5	Perez3
*/
SELECT SUM(idPaciente) FROM Paciente
/*1	13*/
SELECT SUM(idPaciente), apellido FROM Paciente GROUP BY apellido
/*
1	7	Perez -- agrupo los perez y sumo todos los id de los registros con el apellido perez
2	5	Perez3
3	1	Ramirez
*/

----------------------------------------AVG (AVERAGE)
--Calcula el promedio de columnas de tipo de dato numérico
SELECT idPaciente FROM Paciente
/*
1	1
2	3
3	4
4	5
*/
SELECT AVG(idPaciente) FROM Paciente
--1	3 ---En caso de que sean enteros redondea

----------------------------------------COUNT
--Cuenta el numero de registros con o sin condiciones
--Aquí cuenta todos todos los registros
SELECT COUNT(*) FROM Paciente
--Aquí cuenta el numero de registros con la columa idPaciente
SELECT COUNT(idPaciente) FROM Paciente
SELECT * FROM Paciente
INSERT INTO Paciente VALUES('Juan', 'Perez', '2017-01-04', 'piedra buena 21', 'ESP', '', '', '')
--Se puede combinar con el where, retornar una valor
SELECT COUNT(idPaciente) FROM Paciente WHERE apellido = 'Perez'


----------------------------------------HAVING
INSERT INTO Turno VALUES ('20190101', 2, 'obs')
INSERT INTO Turno VALUES ('20190102', 1, 'obs')
INSERT INTO Turno VALUES ('20190103', 0, 'obs')
SELECT * FROM TurnoEstado
SELECT idTurno, estado FROM Turno
/*
1	1	0
2	2	0
3	3	1
4	4	2
5	5	2
6	6	2
7	7	1
8	8	1
9	9	0
10	10	0
*/

--A diferencia del where, el HAVING devuelve un grupo de registros,
--normalmente (o debe) se usa con GROUP BY.
--NOTA: al momento de agrupar, la columna que indiqueen el GROUP BY debe estar en el SELECT,
--sino marcará error
SELECT estado FROM turno GROUP BY estado HAVING estado = 2
SELECT estado FROM turno GROUP BY estado HAVING COUNT (estado) = 3
/*Lo que hace aquí es que agrupa por estados (0, 1 o 2) y cuenta que estados tienen 3 registros,
entonces del estado 1 hay tres registros y del estado 2 también hay 3 registros
1	1
2	2
*/
SELECT estado FROM turno GROUP BY estado HAVING COUNT (estado) >=2
/*
1	0
2	1
3	2
*/


--------------------------------------------------------------------------------------OPERADORES LÓGICOS
----------------------------------------AND
--Concatena condiciones, igual que en programación, todas se tienen que cumplir
SELECT idPaciente, nombre, apellido  FROM Paciente
/*
1	1	Jorge	Ramirez
2	3	Roberto	Perez
3	4	Roberto	Perez
4	5	Roberto3	Perez3
5	7	Juan	Perez
*/
SELECT idPaciente, nombre, apellido FROM Paciente WHERE apellido = 'Perez' AND nombre = 'Roberto'
/*
1	3	Roberto	Perez
2	4	Roberto	Perez
*/
SELECT idPaciente, nombre, apellido FROM Paciente WHERE apellido = 'Perez' AND nombre = 'Roberto' AND idPaciente = 3
--1	3	Roberto	Perez

----------------------------------------OR
--Solo se tiene que cumplir una de las condiciones para que se cumpla y traer registros
SELECT idPaciente, nombre, apellido  FROM Paciente
/*
1	1	Jorge	Ramirez
2	3	Roberto	Perez
3	4	Roberto	Perez
4	5	Roberto3	Perez3
5	7	Juan	Perez
*/
SELECT idPaciente, nombre, apellido FROM Paciente WHERE apellido = 'Perez' OR nombre = 'Roberto' OR idPaciente = 3
/*
1	3	Roberto	Perez
2	4	Roberto	Perez
3	7	Juan	Perez
*/

----------------------------------------IN
--Se le indican valores que queremos que encuentre,
--y retornar todos aquellos registros que coincidan con esos valores indicados
SELECT idTurno, estado FROM Turno
/*
1	1	0
2	2	0
3	3	1
4	4	2
5	5	2
6	6	2
7	7	1
8	8	1
9	9	0
10	10	0
*/
SELECT idTurno, estado FROM Turno WHERE estado IN(0, 2)
/*
1	1	0
2	2	0
3	4	2
4	5	2
5	6	2
6	9	0
7	10	0
*/
--También podemos indicarle cadenas, pero con comillas y separadas por comas
SELECT * FROM Paciente 
SELECT idPaciente, nombre, apellido FROM Paciente WHERE apellido IN('Ramirez', 'Perez3')
/*
1	1	Jorge	Ramirez
2	5	Roberto3	Perez3
*/

----------------------------------------Like
--Busca registros bajo ciertas condiciones. Puede buscar una cadena completa o parte de la cadena.
--Buscando que coincida al principio, al final o en medio de las cadenas de los registros.

 SELECT * FROM Paciente
 SELECT idPaciente, nombre, apellido FROM Paciente
 /*
1	1	Jorge	Ramirez
2	3	Roberto	Perez
3	4	Roberto	Perez
4	5	Roberto3	Perez3
5	7	Juan	Perez
 */
 SELECT idPaciente, nombre, apellido FROM Paciente WHERE nombre LIKE 'Roberto'
 /*
1	3	Roberto	Perez
2	4	Roberto	Perez 
 */
SELECT idPaciente, nombre, apellido FROM Paciente WHERE nombre LIKE 'Rober%'
/*Con % especificamos que busque 'Rober' al principio de la cadena, y que no importa que es lo que tenga después
1	3	Roberto	Perez
2	4	Roberto	Perez
3	5	Roberto3	Perez3
*/
SELECT idPaciente, nombre, apellido FROM Paciente WHERE nombre LIKE '%ober%'
/*Con %cadena% indicamos que busque la cadena indicada en medio de las cadenas a comparar, no importan los caracteres
de antes ni después, solo que esté esta este pedazo de la cadena dentro de la cadena especificada
1	3	Roberto	Perez
2	4	Roberto	Perez
3	5	Roberto3	Perez3
*/


----------------------------------------NOT
--Busca todo lo contrario a lo indicado, se puede usasr con LIKE, IN
SELECT idPaciente, nombre, apellido FROM Paciente WHERE apellido NOT IN('Ramirez', 'Perez3')
/*
1	3	Roberto	Perez
2	4	Roberto	Perez
3	7	Juan	Perez
*/
SELECT idPaciente, nombre, apellido FROM Paciente WHERE nombre NOT LIKE '%ober%'
/*
1	1	Jorge	Ramirez
2	7	Juan	Perez
*/

----------------------------------------BETWEEN
--Permite buscar registros dentro de un rango determinado. Este rango pueden ser fechas, números o textos.
--Se usa en conjunto con el operador AND
SELECT * FROM Turno
SELECT idTurno, fechaTurno FROM Turno
/*
1	1	2020-03-02 13:00:00.000
2	2	2020-03-03 14:00:00.000
3	3	2020-03-03 15:30:00.000
4	4	2020-03-05 18:00:00.000
5	5	2019-01-01 00:00:00.000
6	6	2019-01-01 00:00:00.000
7	7	2019-01-02 00:00:00.000
8	8	2019-01-02 00:00:00.000
9	9	2019-01-03 00:00:00.000
10	10	2019-01-03 00:00:00.000
*/
SELECT idTurno, fechaTurno FROM Turno WHERE fechaTurno BETWEEN '20190101' AND '20190103'
/*Hay que tener en cuenta cuando el dato es DATETIME, pues puede despreciar registros por la hora, ya que si esta no 
  se indica dentro del rango, por defecto asume que es 00:00:00
1	5	2019-01-01 00:00:00.000
2	6	2019-01-01 00:00:00.000
3	7	2019-01-02 00:00:00.000
4	8	2019-01-02 00:00:00.000
5	9	2019-01-03 00:00:00.000
6	10	2019-01-03 00:00:00.000
*/
SELECT idTurno, estado FROM Turno 
/*
1	1	0
2	2	0
3	3	1
4	4	2
5	5	2
6	6	2
7	7	1
8	8	1
9	9	0
10	10	0
*/
SELECT idTurno, estado FROM Turno WHERE estado BETWEEN 0 AND 1
/*
1	1	0
2	2	0
3	3	1
4	7	1
5	8	1
6	9	0
7	10	0
*/
--Cuando se usa BETWEEN los rangos serían entre las letras en orden alfabético

----------------------------------------COMBINANDO OPERADORES

SELECT idPaciente, nombre, apellido, idPais FROM Paciente
/*
1	1	Jorge	Ramirez	PER
2	3	Roberto	Perez	PER
3	4	Roberto	Perez	PER
4	5	Roberto3	Perez3	PER
5	7	Juan	Perez	ESP
*/
SELECT idPaciente, nombre, apellido, idPais FROM Paciente
WHERE apellido = 'Perez' AND nombre = 'Roberto' OR idPaciente = 7 
OR idPais = 'PER'
/*No es lo mismo esta consulta
1	1	Jorge	Ramirez	PER
2	3	Roberto	Perez	PER
3	4	Roberto	Perez	PER
4	5	Roberto3	Perez3	PER
5	7	Juan	Perez	ESP
*/
SELECT idPaciente, nombre, apellido, idPais FROM Paciente
WHERE apellido = 'Perez' AND (nombre = 'Roberto' OR idPaciente = 7 
OR idPais = 'PER')
/*A esta consulta
1	3	Roberto	Perez	PER
2	4	Roberto	Perez	PER
3	7	Juan	Perez	ESP
*/
--Hay que tener cuidado con el uso de paréntesis

