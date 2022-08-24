--TABLA TEMPORAL EN MEMORIA
--Una tabla temporal en memoria va a existir mienstras el SCRIPT se est� ejecutando,
--una vez que termine de ejecutarse, la tabla en memoria se va a destruir

DECLARE @miTabla TABLE(id INT IDENTITY(1, 1), pais VARCHAR(50))

INSERT INTO @miTabla VALUES('Argentina')
INSERT INTO @miTabla VALUES('Brasil')
INSERT INTO @miTabla VALUES('Colombia')
INSERT INTO @miTabla VALUES('Espa�a')
INSERT INTO @miTabla VALUES('M�xico')
INSERT INTO @miTabla VALUES('Per�')

SELECT * FROM @miTabla

SELECT * FROM Pais


--TABLA TEMPORAL F�SICA
--Va a existir en la base de datos como una tabla temporal hasta que reiniciemos el 
--servidor de la base de datos, ah� es cuano se destruye la tabla temporal f�sica. 

--llevan #nombreTabla

CREATE TABLE #miTabla (id INT IDENTITY(1, 1), nombre VARCHAR(50), apellido VARCHAR(50))
--Podemos insertar en ella como en una tabla normal
INSERT INTO #miTabla VALUES('Panda', 'Rojo')
INSERT INTO #miTabla VALUES('Panda', 'Verde')
INSERT INTO #miTabla VALUES('Panda', 'Azul')
--Podemos hacer consultar como en una tabla normal
SELECT * FROM #miTabla
--Puedo borrarla como una tabla m�s de la base de datos
DROP TABLE #miTabla




