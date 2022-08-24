

/*Operadores aritmeticos y concatenación
	+ - * / % 
*/
DECLARE @n1 DECIMAL (9, 2) = 10
DECLARE @n2 DECIMAL (9, 2) = 5
DECLARE @suma DECIMAL (9, 2)
DECLARE @resta DECIMAL (9, 2)
DECLARE @multi DECIMAL (9, 2)
DECLARE @division DECIMAL (9, 2)
DECLARE @modulo DECIMAL (9, 2)

SET @suma = @n1 + @n2
SET @resta = @n1 - @n2
SET @multi = @n1 * @n2
SET @division = @n1 / @n2
SET @modulo = @n1 % @n2

PRINT @suma
PRINT @resta
PRINT @multi
PRINT @division
PRINT @modulo

DECLARE @cadena1 VARCHAR(20) = 'Hola'
DECLARE @cadena2 VARCHAR(20) = 'soy un Panda'
DECLARE @resultado VARCHAR(40)
SET @resultado = @cadena1 + ' ' + @cadena2
PRINT @resultado

/*Operadores de comparación---- > < >= <= <>(distinto)*/

DECLARE @num1 INT = 10
DECLARE @num2 INT = 20

IF @num1 > @num2
	PRINT 'n1 mayor'
	ELSE
	PRINT 'n2 mayor'

IF @num1 < @num2
	PRINT 'n1 menor'
	ELSE
	PRINT 'n2 menor'

IF @num1 <> @num2
	PRINT 'DIFERENTES'
	ELSE
	PRINT 'IGUALES'

DECLARE @cadena3 VARCHAR(50) = 'abc'
DECLARE @cadena4 VARCHAR(50) = 'def' 