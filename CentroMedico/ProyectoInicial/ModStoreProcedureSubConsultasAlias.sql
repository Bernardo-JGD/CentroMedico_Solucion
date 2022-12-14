USE [CentroMedico]
GO
/****** Object:  StoredProcedure [dbo].[S_paciente]    Script Date: 31/01/2022 01:21:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[S_paciente] (
	@idPaciente INT
)
AS
SELECT apellido, nombre, idPais, observacion,
	(SELECT pais FROM Pais ps WHERE ps.idPais = pa.idPais) descPais
FROM Paciente pa WHERE idPaciente = @idPaciente
