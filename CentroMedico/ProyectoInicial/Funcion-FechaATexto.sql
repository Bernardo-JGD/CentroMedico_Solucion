
PRINT dbo.FCN_FechaTexto(GETDATE())
PRINT dbo.FCN_FechaTexto('19991011')

ALTER FUNCTION FCN_FechaTexto (@fecha DATETIME)

RETURNS VARCHAR(60)

AS
BEGIN

DECLARE @dia VARCHAR(20)
DECLARE @mes VARCHAR(20)
DECLARE @fechaTexto VARCHAR(50)

SET @dia = (CASE WHEN DATEPART(DW, @fecha) = 1 THEN 'Domingo ' + CONVERT(char(2), DATEPART(dd, @fecha))
		    WHEN DATEPART(DW, @fecha) = 2 THEN 'Lunes ' + CONVERT(CHAR(2), DATEPART(dd, @fecha))
		    WHEN DATEPART(DW, @fecha) = 3 THEN 'Martes ' + CONVERT(CHAR(2), DATEPART(DD, @fecha))
		    WHEN DATEPART(DW, @fecha) = 4 THEN 'Miercoles ' + CONVERT(CHAR(2), DATEPART(DD, @fecha))
		    WHEN DATEPART(DW, @fecha) = 5 THEN 'Jueves ' + CONVERT(CHAR(2), DATEPART(DD, @fecha))
		    WHEN DATEPART(DW, @fecha) = 6 THEN 'Viernes ' + CONVERT(CHAR(2), DATEPART(DD, @fecha))
		    WHEN DATEPART(DW, @fecha) = 7 THEN 'Sabado ' + CONVERT(CHAR(2), DATEPART(DD, @fecha))

		   END)

SET @mes = (CASE WHEN DATEPART(MM, @fecha) = 1 THEN 'Enero'
		    WHEN DATEPART(MM, @fecha) = 2 THEN 'Febrero'
		    WHEN DATEPART(MM, @fecha) = 3 THEN 'Marzo'
		    WHEN DATEPART(MM, @fecha) = 4 THEN 'Abril'
		    WHEN DATEPART(MM, @fecha) = 5 THEN 'Mayo'
		    WHEN DATEPART(MM, @fecha) = 6 THEN 'Junio'
		    WHEN DATEPART(MM, @fecha) = 7 THEN 'Julio'
		    WHEN DATEPART(MM, @fecha) = 8 THEN 'Agosto'
		    WHEN DATEPART(MM, @fecha) = 9 THEN 'Septiembre'
		    WHEN DATEPART(MM, @fecha) = 10 THEN 'Octubre'
		    WHEN DATEPART(MM, @fecha) = 11 THEN 'Noviembre'
		    WHEN DATEPART(MM, @fecha) = 12 THEN 'Diciembre'
		   
		   END)

SET @fechaTexto = @dia + ' de ' +  @mes
RETURN @fechaTexto

END