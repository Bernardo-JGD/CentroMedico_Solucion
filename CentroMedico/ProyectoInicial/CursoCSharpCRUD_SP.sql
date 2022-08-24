CREATE PROC SP_MostrarUsuarios
AS
SELECT * FROM Usuarios

EXEC SP_MostrarUsuarios

CREATE PROC SP_EditarUsuarios (

	@idUsuario INT,
	@usuario VARCHAR(MAX),
	@pass VARCHAR(MAX),
	@icono IMAGE,
	@estado VARCHAR(MAX)

)
AS
IF EXISTS (SELECT usuario FROM Usuarios WHERE usuario = @usuario AND idUsuario<>@idUsuario)
	RAISERROR ('Usuario en uso, usa otro nombre de usuario por favor', 16, 1)
ELSE
	UPDATE Usuarios SET usuario = @usuario, pass = @pass, icono = @icono, estado = @estado
	WHERE idUsuario = @idUsuario
