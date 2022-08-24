DECLARE @fecha CHAR (12)
DECLARE @path VARCHAR (100)
DECLARE @name VARCHAR (20)

SET @fecha = CONVERT(CHAR(8), GETDATE(), 112) + REPLACE (CONVERT(CHAR (5), GETDATE(), 108), ':', '')
SET @path = 'C:\BackupCentroMedico\CentroMedico' + @fecha + '.bak'
SET @name = 'CentroMedico' + @fecha

BACKUP DATABASE CentroMedicoRestore
TO DISK = @path
WITH NO_COMPRESSION, NAME = @name