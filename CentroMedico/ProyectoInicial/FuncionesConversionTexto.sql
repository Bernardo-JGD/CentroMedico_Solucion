----------------------------------------------------LEFT y RIGHT
--Extrae de izquierda a derecha o derecha a izquierda
--los caracteres indicados de una cadena
DECLARE @var1 VARCHAR(20)
DECLARE @var2 VARCHAR(20)
set @var1 = 'Joseph'
set @var2 = 'Joestar'
--LEFT/RIGHT(cadena, cantidadDeCaracteres)
PRINT LEFT(@var1, 2) + LEFT(@var2, 2)
--Ejemplo propio con SELECT 
SELECT LEFT(nombre, 2), LEFT(apellido, 2) FROM Paciente  


----------------------------------------------------LEN
--Cuenta la cantidad de caracteres de una variable
--CHAR o VARCHAR
DECLARE @nom1 VARCHAR(28)
--Si toma en cuenta los espacios en blanco LEN
SET @nom1 = 'Jose Bernardo Guzman Diaz'
PRINT LEN(@nom1)
PRINT @nom1
PRINT RIGHT(@nom1, 6)
/*
25
Jose Bernardo Guzman Diaz
n Diaz
*/
  
----------------------------------------------------LOWER y UPPER
--LOWER: convierte las mayúsculas en minúsculas
--UPPER: convierte las minúsculas en mayúsculas
DECLARE @c1 VARCHAR(30)
SET @c1 = 'CADena'
PRINT LOWER(@c1) + ' ' + UPPER(@c1)
--cadena CADENA
PRINT LOWER (LEFT(@c1, 3)) + RIGHT(@c1, 3)
PRINT LEFT(@c1, 3) + UPPER( RIGHT(@c1, 3))
SELECT UPPER(nombre) AS Nombre FROM Paciente

----------------------------------------------------REPLACE
--Sustituye uno o varios caracteres de una cadena indicada.
--Se tiene que utilizar con SELECT
DECLARE @remplazar1 VARCHAR(30)
DECLARE @remplazar2 VARCHAR(30)
SET @remplazar1 = 'Bernard0'
SET @remplazar2 = 'Gu53@n'
SELECT REPLACE (@remplazar1, '0', 'o')
SELECT REPLACE (@remplazar2, '53@', 'zma')
SELECT apellido FROM Paciente
/*
Ramirez
Perez
Perez
Perez3
Perez
Diaz
*/
SELECT REPLACE(apellido, 'rez', 'PATO') AS apellidoPato FROM Paciente
/*
RamiPATO
PePATO
PePATO
PePATO3
PePATO
Diaz
*/

----------------------------------------------------REPLICATE
--Replica el número o cadena indicado el número de veces indicado
DECLARE @nRe INT
DECLARE @cRe VARCHAR(30)
SET @nRe = 15
SET @cRe = 'pato'
PRINT REPLICATE(@nRe, 5)
PRINT REPLICATE(@cRe, 10)

----------------------------------------------------LTRIM y RTRIM
--LTRIM: Elimina los espacios en blanco al principio (izquierda) de la cadena
--RTRIM: Elimina los espacios en blanco al final (derecha) de la cadena

DECLARE @nombre VARCHAR(30)
DECLARE @apellido VARCHAR(30)
SET @nombre = '    Joseph    '
SET @apellido = '    Joestar    '
PRINT @nombre +  ' ' + @apellido + '*'
--    Joseph         Joestar    *
SELECT LTRIM(RTRIM(@nombre)) + ' ' + LTRIM(RTRIM(@apellido)) + '*'
--Joseph Joestar*
----------------------NOTA: esto sirve mucho para formatear texto que venga de la interfaz de usuario y evitar 
----------------------		guardar espacios en blanco en la base de datos

----------------------------------------------------CONCAT
--Concatena N cadenas, o sea que no tiene límite de parámetros
DECLARE @nombre1 VARCHAR(30)
DECLARE @apellido1 VARCHAR(30)
SET @nombre1 = '    Joseph    '
SET @apellido1 = '    Joestar    '
SELECT CONCAT (@nombre1, @apellido1)
PRINT CONCAT (@nombre1, @apellido1)
--    Joseph        Joestar    
--Pero si tienen espacio no los quita
--Podemos combinar con LTRIM y RTRIM para eso
--y agregar espacios entre cadenas
PRINT CONCAT (LTRIM(RTRIM(@nombre1)), ' ', LTRIM(RTRIM(@apellido1)))
--Joseph Joestar

----------------------------------------------------GETDATE y GETUTCDATE
/*
La diferencia entre GETDATE() y GETUTCDATE() está en la zona horaria, la función GETDATE()
devuelve la fecha y hora actuales en la zona horaria local,
la zona horaria donde se ejecuta el servidor de base de datos,
pero GETUTCDATE() devuelve la hora y la fecha actuales en UTC (Coordenada horaria universal) o GMT.
*/
SELECT GETDATE()
--2022-02-09 08:30:25.873
SELECT GETUTCDATE()
--2022-02-09 14:30:54.770

----------------------------------------------------DATEADD
--Recurso Microsoft--Aquí se pueden checar los argumentos que recibe como primer parámetro
--https://docs.microsoft.com/en-us/sql/t-sql/functions/dateadd-transact-sql?view=sql-server-ver15
--Sirve para modificar la fecha agregando números a la fecha actual o indicada. 
--DATEADD(minutos/horas/dias/meses/años/etc, cantidadNumérica, fechaAModificar)
SELECT DATEADD(mi, 2, GETDATE())
--2022-02-09 08:43:50.137
--2022-02-09 08:46:01.383
SELECT DATEADD(day, 2, GETDATE())
--2022-02-09 08:44:29.717
--2022-02-11 08:44:41.177


----------------------------------------------------DATEDIFF
--Devuelve la diferencia entre fechas con respecto a un parámetro
--formato: minutos, horas, dia, mes, año
--DATEDIFF(formato, fecha1, fecha2)
SELECT GETDATE()
--2022-02-09 09:10:17.187
SELECT DATEDIFF(DAY, '20200314', GETDATE())
--697 dias
SELECT DATEDIFF(MONTH, '20200314', GETDATE())
--23 meses 
SELECT DATEDIFF(YY, '20200314', GETDATE())
--2 AÑOS


----------------------------------------------------DATEPART
--Devuelve una parte de la fecha
--Día de la semana
SELECT DATEPART(DW, GETDATE())--4
--Día del mes
SELECT DATEPART(DAY, GETDATE())--9
--Mes del año
SELECT DATEPART(MONTH, GETDATE())--2
--Año
SELECT DATEPART(YEAR, GETDATE())--2022

----------------------------------------------------ISDATE
--Indica si es una fecha valida o no en el formato y contenido, retorna 1 true, 0 false

IF ISDATE('20051011') = 1
	PRINT 'Es una fecha correcta'
ELSE
	PRINT 'No es una fecha correcta'

IF ISDATE('20191332') = 1
	PRINT 'Es una fecha correcta'
ELSE
	PRINT 'No es una fecha correcta'

----------------------------------------------------CAST y CONVERT
/*
-- CAST Syntax:  
CAST ( expression AS data_type [ ( length ) ] )  
  
-- CONVERT Syntax:  
CONVERT ( data_type [ ( length ) ] , expression [ , style ] )  
*/
--https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-ver15
--CAST: Convierte entre tipos de datos similares, por ejemplo, no puede de char a int
--Ejemplos
DECLARE @numeroCast MONEY
SET @numeroCast = 500.00
PRINT @numeroCast
SELECT CAST(@numeroCast AS INT)
--500.00
--500
SELECT CAST(idPaciente AS MONEY) AS idPaciente FROM Paciente
/*
1.00
3.00
4.00
5.00
7.00
8.00
*/

--CONVERT: En el video lo utilizó para cortar fecha o cambiar el formato de presentación.
--Este formato es con códigos que se pueden checar en la página de Microsoft o el pdf que compartió

SELECT CONVERT(CHAR(8), GETDATE())
--Feb  9 2
PRINT CONVERT(CHAR(8), GETDATE())

--Con el tercer parámetro se da formato
SELECT CONVERT(CHAR(20), GETDATE(), 112)
--20220209            
PRINT CONVERT(CHAR(20), GETDATE(), 112)
--20220209
SELECT CONVERT(CHAR(20), GETDATE(), 104)
--09.02.2022                      
PRINT CONVERT(CHAR(20), GETDATE(), 104)
--09.02.2022
