

CREATE FUNCTION listaPaises()
RETURNS @paises TABLE(idPais CHAR(3), pais VARCHAR(50))
AS
BEGIN 
	
	INSERT INTO @paises VALUES ('ARG', 'Argentina')
	INSERT INTO @paises VALUES ('BRA', 'Brasil')
	INSERT INTO @paises VALUES ('COL', 'Colombia')
	INSERT INTO @paises VALUES ('ESP', 'Espa�a')
	INSERT INTO @paises VALUES ('MEX', 'Mexico')
	INSERT INTO @paises VALUES ('PER', 'Per�')

	RETURN 

END

SELECT * FROM dbo.listaPaises()

SELECT * FROM Pais

