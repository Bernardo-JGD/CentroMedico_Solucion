

CREATE FUNCTION Concatenar(
				@nombre VARCHAR(50),
				@apellido VARCHAR(50)
)
RETURNS VARCHAR(100)

AS
BEGIN
	
	DECLARE @resultado VARCHAR(100)
	SET @resultado = @nombre + ' ' + @apellido
	RETURN @resultado

END


SELECT dbo.Concatenar('Bernardo', 'Guzmán')


CREATE FUNCTION ObtenerPais(
				@idPaciente paciente
)
RETURNS VARCHAR (50)
AS
BEGIN 
	DECLARE @pais VARCHAR(50)
	SET @pais = (SELECT Pais.pais
				   FROM Paciente
				   INNER JOIN Pais
				   ON Pais.idPais = Paciente.idPais
				   WHERE idPaciente = @idPaciente)
	RETURN @pais
END

SELECT * FROM Paciente

SELECT dbo.ObtenerPais (8)