/*
CREATE PROC SP_EliminarUsuarios @idUsuario INT

AS

DELETE FROM Usuarios WHERE idUsuario = @idUsuario

SELECT * FROM Usuarios
*/

CREATE PROC SP_BuscarUsuario @nombre VARCHAR(50)
AS
SELECT * FROM Usuarios WHERE usuario LIKE '%' + @nombre + '%'

