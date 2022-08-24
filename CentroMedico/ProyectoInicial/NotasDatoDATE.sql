DECLARE @fecha SMALLDATETIME
SET @fecha = '20180304'

PRINT @fecha
--Mar  4 2018 12:00AM ------Me da esto como resultado
--Esto quiere decir que la fecha sin separar  guiones me la acepta, por eso en el procedimiento
--se creo la variable como varchar(8), pues puede recibir este tipo de dato.

SET @fecha = '20180304 14:30:20'
PRINT @fecha
--Mar  4 2018  2:30PM -- me retorna esto
-- ha que checar según convenga en el proyecto