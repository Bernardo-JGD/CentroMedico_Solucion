--Backup full: Hace un respaldo completo/total de la base de datos.
--Backup differential: Hace un respaldo de las cosas nuevas que se han agregado a la base de datos. 
--Si se hace un differential sin haber hecho un full primero, realizará un full primero ya que el differential trabaja 
--sobre un full ya realizado por al menos una vez. Es como git, respalda modificaciones nuevas.


--Hacer respaldo gráfico: 


--Hacer restauración gráfica: Clic right Databases-->Restore database
--							  Source:Device ... Add ---> Selecciono el archivo de respaldo (debe tener en el nombre nombre.bak)
--							  Ok-->Ok
--							  Destination: Database--> Cambiar el nombre para ver la base respaldada, pero el ideal es remplazarla dejando el mismo nombre
--							--->Ok (NO tiene que estar en uso la original para poder hacer el back)

-----------------------------------
--Hacer el respaldo script/código



BACKUP DATABASE CentroMedicoRestore -- El nombre de la base de datos que quiero respaldar
TO DISK = 'C:\BackupCentroMedico\CentroMedico20220722.bak'--La ruta
WITH NO_COMPRESSION, NAME='CentroMedicoRestore1'--El nombre que va a tener nuestro backup


--Para hacerlo más dinámico
DECLARE @fecha CHAR (12)
DECLARE @path VARCHAR (100)
DECLARE @name VARCHAR (20)

--Recibimos la fecha y le damos formato
--PRINT CONVERT(CHAR(8), GETDATE(), 112) -----> 20220722
--PRINT CONVERT(CHAR (5), GETDATE(), 108) -----> 11:18
--PRINT REPLACE (CONVERT(CHAR (5), GETDATE(), 108), ':', '') -----> 1119
--PRINT CONVERT(CHAR(8), GETDATE(), 112) + REPLACE (CONVERT(CHAR (5), GETDATE(), 108), ':', '') -----> 202207221137
SET @fecha = CONVERT(CHAR(8), GETDATE(), 112) + REPLACE (CONVERT(CHAR (5), GETDATE(), 108), ':', '')
SET @path = 'C:\BackupCentroMedico\CentroMedico' + @fecha + '.bak'
SET @name = 'CentroMedico' + @fecha

BACKUP DATABASE CentroMedicoRestore
TO DISK = @path
WITH NO_COMPRESSION, NAME = @name

/*
Processed 592 pages for database 'CentroMedicoRestore', file 'CentroMedico' on file 1.
Processed 1 pages for database 'CentroMedicoRestore', file 'CentroMedico_log' on file 1.
BACKUP DATABASE successfully processed 593 pages in 0.114 seconds (40.583 MB/sec).

*/