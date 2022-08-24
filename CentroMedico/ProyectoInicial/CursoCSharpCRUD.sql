CREATE PROC SP_InsertarUsuarios
@usuario VARCHAR(MAX),
@pass VARCHAR(MAX),
@icono VARCHAR(MAX),
@estado VARCHAR(MAX)
AS
IF EXISTS (SELECT usuario FROM Usuarios WHERE usuario = @usuario)
	RAISERROR('Usuario ya registrado', 16, 1)
ELSE
	INSERT INTO Usuarios VALUES(@usuario, @pass, @icono, @estado)
