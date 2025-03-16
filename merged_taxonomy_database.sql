-- START OF FILE: 00826_-00826_ScriptTareaProgramada2_CreacionBase_304730191.sql

/****** Object:  Database [taxonomia]    Script Date: 3/30/2022 8:16:18 PM ******/
-- -----------------------------------------------------
-- Creación de la base de datos
-- -----------------------------------------------------

create database [taxonomia]
GO

-- -----------------------------------------------------
-- Asignar la base de datos a utilizar
-- -----------------------------------------------------

use [taxonomia]
go

-- -----------------------------------------------------
-- Creación de las tablas
-- -----------------------------------------------------

/* Creación de la tabla reino */

CREATE TABLE reino (
  idReino VARCHAR(30) NOT NULL,
  descripcion VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (idReino))


/* Creación de la tabla phylum */

CREATE TABLE phylum (
 idPhylum VARCHAR(30) NOT NULL,
 descripcion VARCHAR(45) NULL DEFAULT NULL,
  reino_idReino VARCHAR(30) NOT NULL,
  PRIMARY KEY (idPhylum),
  INDEX fk_Phylum_reino_idx (reino_idReino ASC),
  CONSTRAINT fk_Phylum_reino
    FOREIGN KEY (reino_idReino)
    REFERENCES reino (idReino)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)


/* Creación de la tabla clase */

CREATE TABLE clase (
  idClase VARCHAR(30) NOT NULL,
  descripcion VARCHAR(45) NULL DEFAULT NULL,
  Phylum_idPhylum VARCHAR(30) NOT NULL,
  PRIMARY KEY (idClase),
  INDEX fk_Clase_Phylum1_idx (Phylum_idPhylum ASC),
  CONSTRAINT fk_Clase_Phylum1
    FOREIGN KEY (Phylum_idPhylum)
    REFERENCES phylum (idPhylum)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)


/* Creación de la tabla orden */

CREATE TABLE orden (
  idOrden VARCHAR(30) NOT NULL,
  descripcion VARCHAR(45) NULL DEFAULT NULL,
  Clase_idClase VARCHAR(30) NOT NULL,
  PRIMARY KEY (idOrden),
  INDEX fk_Orden_Clase1_idx (Clase_idClase ASC),
  CONSTRAINT fk_Orden_Clase1
    FOREIGN KEY (Clase_idClase)
    REFERENCES clase (idClase)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)


/* Creación de la tabla familia */

CREATE TABLE familia (
  idFamilia VARCHAR(30) NOT NULL,
  descripcion VARCHAR(45) NULL DEFAULT NULL,
  Orden_idOrden VARCHAR(30) NOT NULL,
  PRIMARY KEY (idFamilia),
  INDEX fk_Familia_Orden1_idx (Orden_idOrden ASC),
  CONSTRAINT fk_Familia_Orden1
    FOREIGN KEY (Orden_idOrden)
    REFERENCES orden (idOrden)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)

	
/* Creación de la tabla genero */

CREATE TABLE genero (
  idGenero VARCHAR(30) NOT NULL,
  descripcion VARCHAR(45) NULL DEFAULT NULL,
  Familia_idFamilia VARCHAR(30) NOT NULL,
  PRIMARY KEY (idGenero),
  INDEX fk_Genero_Familia1_idx (Familia_idFamilia ASC),
  CONSTRAINT fk_Genero_Familia1
    FOREIGN KEY (Familia_idFamilia)
    REFERENCES familia (idFamilia)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)


/* Creación de la tabla especie */

CREATE TABLE especie (
  idEspecie VARCHAR(30) NOT NULL,
  descripcion VARCHAR(45) NULL DEFAULT NULL,
  Genero_idGenero VARCHAR(30) NOT NULL,
  nombre_cientifico VARCHAR(45) NULL DEFAULT NULL,
  nombre_comun VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (idEspecie),
  INDEX fk_Especie_Genero1_idx (Genero_idGenero ASC),
  CONSTRAINT fk_Especie_Genero1
    FOREIGN KEY (Genero_idGenero)
    REFERENCES genero (idGenero)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)

-- END OF FILE

-- START OF FILE: 00826_-00826_ScriptTareaProgramada2_Pregunta1_304730191.sql

-- -----------------------------------------------------
-- PREGUNTA 1) Script funcional de carga de datos 
-- -----------------------------------------------------

-- INSERT / Tabla Reino

INSERT INTO reino (idReino,descripcion) 
	VALUES (1, 'Animal'), (2, 'Vegetal');

SELECT * FROM reino


-- INSERT / Tabla Phylum
-- Notese que se asigna el Foreign Key referente al id de Reino correspondiente al registro

INSERT INTO phylum (idPhylum,descripcion, reino_idReino) 
	VALUES (1, 'Chordata', 1), (2, 'Tracheophyta', 2);

SELECT * FROM phylum


-- INSERT / Tabla Clase
-- Notese que se asigna el Foreign Key referente al id de Phylum correspondiente al registro

INSERT INTO clase (idClase,descripcion, Phylum_idPhylum) 
	VALUES (1, 'mammalia', 1), (2, 'Angiosperma', 2);

SELECT * FROM clase


-- INSERT / Tabla Orden
-- Notese que se asigna el Foreign Key referente al id de Clase correspondiente al registro

INSERT INTO orden(idOrden,descripcion, Clase_idClase) 
	VALUES (1, 'Artiodactyla', 1), (2, 'Primate', 1), 
		   (3, 'carnívora', 1), (4, 'Glumifloral', 2),
		   (5, 'Cetacea', 1);

SELECT * FROM orden


-- INSERT / Tabla Familia
-- Notese que se asigna el Foreign Key referente al id de Orden correspondiente al registro

INSERT INTO familia(idFamilia,descripcion, Orden_idOrden) 
	VALUES (1, 'Bovidae', 1), (2, 'Hominidae', 2), 
		   (3, 'Canidae', 3), (4, 'Felidae', 3),
		   (5, 'Gramínea', 4), (6, 'Balaenopteridae', 5);

SELECT * FROM familia


-- INSERT / Tabla Genero
-- Notese que se asigna el Foreign Key referente al id de Familia correspondiente al registro

INSERT INTO genero(idGenero,descripcion, Familia_idFamilia) 
	VALUES (1, 'Bos', 1), (2, 'Homo', 2), 
		   (3, 'Canis', 3), (4, 'Felis', 4),
		   (5, 'Zea', 5), (6, 'Megaptera', 6);

SELECT * FROM genero


-- INSERT / Tabla Especie
-- Notese que se asigna el Foreign Key referente al id de Genero correspondiente al registro
-- Adicionalmente, se insertan los campos de nombre cientifico y nombre común

INSERT INTO especie(idEspecie,descripcion, Genero_idGenero, nombre_cientifico, nombre_comun) 
	VALUES (1, 'Taurus', 1,'Bos Taurus' ,'Vaca'),
			(2, 'Sapiens', 2, 'Homo Sapiens' ,'Hombre'), 
		   (3, 'familiaris', 3, 'Canis Familiaris' ,'Perro'),
		   (4, 'silvestris', 4, 'Felis Silvestris' ,'Gato'),
		   (5, 'Maíz', 5, 'Zea Maiz' ,'Maíz'),
		   (6, 'novaeangliae', 6, 'Megaptera Novaeangliae' ,'Ballena Jorobada');

SELECT * FROM especie

-- END OF FILE

-- START OF FILE: 00826_-00826_ScriptTareaProgramada2_Pregunta2_304730191.sql

-- -----------------------------------------------------
-- PREGUNTA 2) Script funcional para obtener la taxonomía de la vaca
-- -----------------------------------------------------

/*
Primero, seleccionamos únicamente aquellos campos que describen a cada taxón
Se modifica los nombres de las columnas para coincidir con el PDF de la Tarea
Utilizamos un JOIN basados en los foreign keys de cada tabla
Finalmente, especificamos un WHERE para obtener el registro de la Vaca
*/

SELECT reino.descripcion as idReino, phylum.descripcion as idPhylum, clase.descripcion as idClase, orden.descripcion as idOrden,
		familia.descripcion as idFamilia, genero.descripcion as idGenero, especie.descripcion as idEspecie,
		especie.nombre_cientifico as idNombre_Cientifico, especie.nombre_comun as idNombre_Comun
	FROM reino
	JOIN phylum
	ON reino.idReino = phylum.reino_idReino
	JOIN clase
	ON phylum.idPhylum = clase.Phylum_idPhylum
	JOIN orden
	ON clase.idClase = orden.Clase_idClase
	JOIN familia
	ON orden.idOrden = familia.Orden_idOrden
	JOIN genero
	ON familia.idFamilia = genero.Familia_idFamilia
	JOIN especie
	ON genero.idGenero = especie.Genero_idGenero
	WHERE especie.nombre_comun = 'Vaca';

-- END OF FILE

-- START OF FILE: 00826_-00826_ScriptTareaProgramada2_Pregunta3_304730191.sql

-- -----------------------------------------------------
-- PREGUNTA 3) Script funcional para obtener la taxonomía del reino vegetal
-- -----------------------------------------------------

/*
Utilizamos la estrctura SELECT creada anteriormente, 
el único cambio es el condicional donde condicionamos con aquellos donde reino sea Vegetal.
*/

SELECT reino.descripcion as idReino, phylum.descripcion as idPhylum, clase.descripcion as idClase, orden.descripcion as idOrden,
		familia.descripcion as idFamilia, genero.descripcion as idGenero, especie.descripcion as idEspecie,
		especie.nombre_cientifico as idNombre_Cientifico, especie.nombre_comun as idNombre_Comun
	FROM reino
	JOIN phylum
	ON reino.idReino = phylum.reino_idReino
	JOIN clase
	ON phylum.idPhylum = clase.Phylum_idPhylum
	JOIN orden
	ON clase.idClase = orden.Clase_idClase
	JOIN familia
	ON orden.idOrden = familia.Orden_idOrden
	JOIN genero
	ON familia.idFamilia = genero.Familia_idFamilia
	JOIN especie
	ON genero.idGenero = especie.Genero_idGenero
	WHERE reino.descripcion = 'Vegetal';

-- END OF FILE

-- START OF FILE: 00826_-00826_ScriptTareaProgramada2_Pregunta4_304730191.sql

-- -----------------------------------------------------
-- PREGUNTA 4) Script funcional para borrar la Vaca 
-- -----------------------------------------------------

/*
Al establecer las tablas. Especificamos un DELETE ON CASCADE para los foreign keys,
esto permite el borrado de registros sin afectar la integridad de los datos.

Procedemos a borrar el registro VACA mediante un DELETE

Finalmente, se realiza una vista de todos los datos para confirmar el borrado.
Observamos que datos que se hubieran afectado como aquellos registos usando el Reino Animal,
no se ven afectados.
*/

DELETE from especie WHERE nombre_comun = 'Vaca';


SELECT reino.descripcion as idReino, phylum.descripcion as idPhylum, clase.descripcion as idClase, orden.descripcion as idOrden,
		familia.descripcion as idFamilia, genero.descripcion as idGenero, especie.descripcion as idEspecie,
		especie.nombre_cientifico as idNombre_Cientifico, especie.nombre_comun as idNombre_Comun
	FROM reino
	JOIN phylum
	ON reino.idReino = phylum.reino_idReino
	JOIN clase
	ON phylum.idPhylum = clase.Phylum_idPhylum
	JOIN orden
	ON clase.idClase = orden.Clase_idClase
	JOIN familia
	ON orden.idOrden = familia.Orden_idOrden
	JOIN genero
	ON familia.idFamilia = genero.Familia_idFamilia
	JOIN especie
	ON genero.idGenero = especie.Genero_idGenero;

-- END OF FILE

-- START OF FILE: 00826_-00826_ScriptTareaProgramada2_Pregunta5_304730191.sql

-- -----------------------------------------------------
-- PREGUNTA 5) Script funcional para actualizar registro
-- -----------------------------------------------------

/*
Primero, se modifica unicamente la tabla Especie dado que el Nombre Común 
es el atributo a modificar y este es único a Especie.

Se establece una serie condiciones adicionales para asegurarnos que el registro sea el correcto. 
Pueden resultar redundantes dada la cantidad de registros, sin embargo, se realiza en vistas a futuras adiciones.
Se utiliza la función CAST para pasar los Identificadores de VarChar a Int y poder comparar

Finalmente, se realiza una vista de los datos para confirmar el update 
y condicionamos mediante un WHERE para obtener unicamente el registro actualizado
*/

UPDATE especie 
	SET nombre_comun = 'Hombre/Mujer'
	WHERE CAST(idEspecie as int) = 2 
		AND descripcion = 'Sapiens' 
		AND CAST(Genero_idGenero as int) = 2
		AND nombre_cientifico = 'Homo Sapiens';

SELECT reino.descripcion as idReino, phylum.descripcion as idPhylum, clase.descripcion as idClase, orden.descripcion as idOrden,
		familia.descripcion as idFamilia, genero.descripcion as idGenero, especie.descripcion as idEspecie,
		especie.nombre_cientifico as idNombre_Cientifico, especie.nombre_comun as idNombre_Comun
	FROM reino
	JOIN phylum
	ON reino.idReino = phylum.reino_idReino
	JOIN clase
	ON phylum.idPhylum = clase.Phylum_idPhylum
	JOIN orden
	ON clase.idClase = orden.Clase_idClase
	JOIN familia
	ON orden.idOrden = familia.Orden_idOrden
	JOIN genero
	ON familia.idFamilia = genero.Familia_idFamilia
	JOIN especie
	ON genero.idGenero = especie.Genero_idGenero
	WHERE especie.nombre_comun = 'Hombre/Mujer';

-- END OF FILE

-- START OF FILE: 00826_-00826_ScriptTareaProgramada3_CreacionBase_304730191.sql

/****** Object:  Database [taxonomia]    Script Date: 3/30/2022 8:16:18 PM ******/
-- -----------------------------------------------------
-- Creación de la base de datos
-- -----------------------------------------------------

create database [taxonomia]
GO

-- -----------------------------------------------------
-- Asignar la base de datos a utilizar
-- -----------------------------------------------------

use [taxonomia]
go

-- -----------------------------------------------------
-- Creación de las tablas
-- -----------------------------------------------------

/* Creación de la tabla reino */

CREATE TABLE reino (
  idReino VARCHAR(30) NOT NULL,
  descripcion VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (idReino))


/* Creación de la tabla phylum */

CREATE TABLE phylum (
 idPhylum VARCHAR(30) NOT NULL,
 descripcion VARCHAR(45) NULL DEFAULT NULL,
  reino_idReino VARCHAR(30) NOT NULL,
  PRIMARY KEY (idPhylum),
  INDEX fk_Phylum_reino_idx (reino_idReino ASC),
  CONSTRAINT fk_Phylum_reino
    FOREIGN KEY (reino_idReino)
    REFERENCES reino (idReino)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)


/* Creación de la tabla clase */

CREATE TABLE clase (
  idClase VARCHAR(30) NOT NULL,
  descripcion VARCHAR(45) NULL DEFAULT NULL,
  Phylum_idPhylum VARCHAR(30) NOT NULL,
  PRIMARY KEY (idClase),
  INDEX fk_Clase_Phylum1_idx (Phylum_idPhylum ASC),
  CONSTRAINT fk_Clase_Phylum1
    FOREIGN KEY (Phylum_idPhylum)
    REFERENCES phylum (idPhylum)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)


/* Creación de la tabla orden */

CREATE TABLE orden (
  idOrden VARCHAR(30) NOT NULL,
  descripcion VARCHAR(45) NULL DEFAULT NULL,
  Clase_idClase VARCHAR(30) NOT NULL,
  PRIMARY KEY (idOrden),
  INDEX fk_Orden_Clase1_idx (Clase_idClase ASC),
  CONSTRAINT fk_Orden_Clase1
    FOREIGN KEY (Clase_idClase)
    REFERENCES clase (idClase)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)


/* Creación de la tabla familia */

CREATE TABLE familia (
  idFamilia VARCHAR(30) NOT NULL,
  descripcion VARCHAR(45) NULL DEFAULT NULL,
  Orden_idOrden VARCHAR(30) NOT NULL,
  PRIMARY KEY (idFamilia),
  INDEX fk_Familia_Orden1_idx (Orden_idOrden ASC),
  CONSTRAINT fk_Familia_Orden1
    FOREIGN KEY (Orden_idOrden)
    REFERENCES orden (idOrden)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)

	
/* Creación de la tabla genero */

CREATE TABLE genero (
  idGenero VARCHAR(30) NOT NULL,
  descripcion VARCHAR(45) NULL DEFAULT NULL,
  Familia_idFamilia VARCHAR(30) NOT NULL,
  PRIMARY KEY (idGenero),
  INDEX fk_Genero_Familia1_idx (Familia_idFamilia ASC),
  CONSTRAINT fk_Genero_Familia1
    FOREIGN KEY (Familia_idFamilia)
    REFERENCES familia (idFamilia)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)


/* Creación de la tabla especie */

CREATE TABLE especie (
  idEspecie VARCHAR(30) NOT NULL,
  descripcion VARCHAR(45) NULL DEFAULT NULL,
  Genero_idGenero VARCHAR(30) NOT NULL,
  nombre_cientifico VARCHAR(45) NULL DEFAULT NULL,
  nombre_comun VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (idEspecie),
  INDEX fk_Especie_Genero1_idx (Genero_idGenero ASC),
  CONSTRAINT fk_Especie_Genero1
    FOREIGN KEY (Genero_idGenero)
    REFERENCES genero (idGenero)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)

-- -----------------------------------------------------
-- Script funcional de carga de datos 
-- -----------------------------------------------------

-- INSERT / Tabla Reino

INSERT INTO reino (idReino,descripcion) 
	VALUES (1, 'Animal'), (2, 'Vegetal');

SELECT * FROM reino


-- INSERT / Tabla Phylum

INSERT INTO phylum (idPhylum,descripcion, reino_idReino) 
	VALUES (1, 'Chordata', 1), (2, 'Tracheophyta', 2);

SELECT * FROM phylum


-- INSERT / Tabla Clase

INSERT INTO clase (idClase,descripcion, Phylum_idPhylum) 
	VALUES (1, 'mammalia', 1), (2, 'Angiosperma', 2);

SELECT * FROM clase


-- INSERT / Tabla Orden

INSERT INTO orden(idOrden,descripcion, Clase_idClase) 
	VALUES (1, 'Artiodactyla', 1), (2, 'Primate', 1), 
		   (3, 'carnívora', 1), (4, 'Glumifloral', 2),
		   (5, 'Cetacea', 1);

SELECT * FROM orden


-- INSERT / Tabla Familia

INSERT INTO familia(idFamilia,descripcion, Orden_idOrden) 
	VALUES (1, 'Bovidae', 1), (2, 'Hominidae', 2), 
		   (3, 'Canidae', 3), (4, 'Felidae', 3),
		   (5, 'Gramínea', 4), (6, 'Balaenopteridae', 5);

SELECT * FROM familia


-- INSERT / Tabla Genero

INSERT INTO genero(idGenero,descripcion, Familia_idFamilia) 
	VALUES (1, 'Bos', 1), (2, 'Homo', 2), 
		   (3, 'Canis', 3), (4, 'Felis', 4),
		   (5, 'Zea', 5), (6, 'Megaptera', 6);

SELECT * FROM genero


-- INSERT / Tabla Especie
INSERT INTO especie(idEspecie,descripcion, Genero_idGenero, nombre_cientifico, nombre_comun) 
	VALUES (1, 'Taurus', 1,'Bos Taurus' ,'Vaca'),
			(2, 'Sapiens', 2, 'Homo Sapiens' ,'Hombre'), 
		   (3, 'familiaris', 3, 'Canis Familiaris' ,'Perro'),
		   (4, 'silvestris', 4, 'Felis Silvestris' ,'Gato'),
		   (5, 'Maíz', 5, 'Zea Maiz' ,'Maíz'),
		   (6, 'novaeangliae', 6, 'Megaptera Novaeangliae' ,'Ballena Jorobada');

SELECT * FROM especie

-- END OF FILE

-- START OF FILE: 00826_-00826_ScriptTareaProgramada3_Funcion_304730191.sql

-- -----------------------------------------------------
-- PREGUNTA 1) Crear una función llamada fnc_get_reino. 
-- -----------------------------------------------------

--Evitar correr todo el script de una unica vez. Correrlo por bloques.

-- BLOQUE 1
use taxonomia

DROP function IF EXISTS fnc_get_reino;

-- BLOQUE 2. Declaración de la función. CREATE FUNCTION debe correrse en un bloque por aparte, para que sea la primera línea de código según lo solicitado por Microsoft SQL SMS.

CREATE FUNCTION fnc_get_reino(@Temp AS VARCHAR(45)) RETURNS VARCHAR(45)
AS
BEGIN
		DECLARE @Reino_Raiz AS VARCHAR(45)

  		SET @Reino_Raiz = (SELECT reino.descripcion as idReino
							FROM reino
							JOIN phylum
							ON reino.idReino = phylum.reino_idReino
							JOIN clase
							ON phylum.idPhylum = clase.Phylum_idPhylum
							JOIN orden
							ON clase.idClase = orden.Clase_idClase
							JOIN familia
							ON orden.idOrden = familia.Orden_idOrden
							JOIN genero
							ON familia.idFamilia = genero.Familia_idFamilia
							JOIN especie
							ON genero.idGenero = especie.Genero_idGenero
							WHERE especie.nombre_comun = @Temp)

RETURN @Reino_Raiz;
END;

-- BLOQUE 3. Llamado a la función.

select [dbo].[fnc_get_reino]('Maíz') as Reino;



-- END OF FILE

-- START OF FILE: 00826_-00826_ScriptTareaProgramada3_Procedimiento_304730191.sql

-- -----------------------------------------------------
-- PREGUNTA 2) Genere un procedimiento llamado sp_inserta_registro. 
-- -----------------------------------------------------

--Evitar correr todo el script de una unica vez. Correrlo por bloques.

-- BLOQUE 1

use taxonomia;

DROP procedure IF EXISTS sp_inserta_registro;

-- BLOQUE 2. Declaración del procedimiento. CREATE PROCEDURE debe correrse en un bloque por aparte, para que sea la primera línea de código según lo solicitado por Microsoft SQL SMS.

CREATE PROCEDURE sp_inserta_registro (
										@N_Reino AS VARCHAR(45),
										@N_Phylum AS VARCHAR(45), 
										@N_Clase AS VARCHAR(45), 
										@N_Orden AS VARCHAR(45), 
										@N_Familia AS VARCHAR(45), 
										@N_Genero AS VARCHAR(45),
										@N_Especie AS VARCHAR(45),
										@N_NombreCientifico AS VARCHAR(45),
										@N_NombreComun AS VARCHAR(45)
										) AS
BEGIN

	-- INSERT / Tabla Reino

	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
		BEGIN TRANSACTION
			DECLARE @CountReino AS INT
			SELECT @CountReino = idReino FROM reino WHERE LOWER(reino.descripcion)=LOWER(@N_Reino)
			IF @CountReino IS NULL
			BEGIN
				UPDATE [taxonomia].[dbo].[reino]
				SET @CountReino = (SELECT max(idReino) FROM reino)+1
				INSERT INTO reino (idReino,descripcion) VALUES (@CountReino,@N_Reino);
			END
	COMMIT TRANSACTION

	-- INSERT / Tabla Phylum

	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
		BEGIN TRANSACTION
			DECLARE @CountPhylum AS INT
			DECLARE @CountFK_Reino AS INT
			SELECT @CountPhylum = idPhylum FROM phylum WHERE LOWER(phylum.descripcion)=LOWER(@N_Phylum)
			SELECT @CountFK_Reino = idReino FROM reino WHERE LOWER(reino.descripcion)=LOWER(@N_Reino)
			IF @CountPhylum IS NULL
			BEGIN
				UPDATE [taxonomia].[dbo].[phylum]
				SET @CountPhylum = (SELECT max(idPhylum) FROM phylum)+1
				INSERT INTO phylum (idPhylum,descripcion, reino_idReino) VALUES (@CountPhylum,@N_Phylum,@CountFK_Reino);
			END
	COMMIT TRANSACTION

	-- INSERT / Tabla Clase

	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
		BEGIN TRANSACTION
			DECLARE @CountClase AS INT
			DECLARE @CountFK_Phylum AS INT
			SELECT @CountClase = idClase FROM clase WHERE LOWER(clase.descripcion)=LOWER(@N_Clase)
			SELECT @CountFK_Phylum = idPhylum FROM phylum WHERE LOWER(phylum.descripcion)=LOWER(@N_Phylum)
			IF @CountClase IS NULL
			BEGIN
				UPDATE [taxonomia].[dbo].[clase]
				SET @CountClase = (SELECT max(idClase) FROM clase)+1
				INSERT INTO clase (idClase,descripcion, Phylum_idPhylum) VALUES (@CountClase,@N_Clase,@CountFK_Phylum);
			END
	COMMIT TRANSACTION

	-- INSERT / Tabla Orden

	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
		BEGIN TRANSACTION
			DECLARE @CountOrden AS INT
			DECLARE @CountFK_Clase AS INT
			SELECT @CountOrden = idOrden FROM orden WHERE LOWER(orden.descripcion)=LOWER(@N_Orden)
			SELECT @CountFK_Clase = idClase FROM clase WHERE LOWER(clase.descripcion)=LOWER(@N_Clase)
			IF @CountOrden IS NULL
			BEGIN
				UPDATE [taxonomia].[dbo].[orden]
				SET @CountOrden = (SELECT max(idOrden) FROM orden)+1
				INSERT INTO orden(idOrden,descripcion, Clase_idClase) VALUES (@CountOrden,@N_Orden,@CountFK_Clase);
			END
	COMMIT TRANSACTION

	-- INSERT / Tabla Familia

	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
		BEGIN TRANSACTION
			DECLARE @CountFamilia AS INT
			DECLARE @CountFK_Orden AS INT
			SELECT @CountFamilia = idFamilia FROM familia WHERE LOWER(familia.descripcion)=LOWER(@N_Familia)
			SELECT @CountFK_Orden = idOrden FROM orden WHERE LOWER(orden.descripcion)=LOWER(@N_Orden)
			IF @CountFamilia IS NULL
			BEGIN
				UPDATE [taxonomia].[dbo].[familia]
				SET @CountFamilia = (SELECT max(idFamilia) FROM familia)+1
				INSERT INTO familia(idFamilia,descripcion, Orden_idOrden) VALUES (@CountFamilia,@N_Familia,@CountFK_Orden);
			END
	COMMIT TRANSACTION

	-- INSERT / Tabla Genero

	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
		BEGIN TRANSACTION
			DECLARE @CountGenero AS INT
			DECLARE @CountFK_Familia AS INT
			SELECT @CountGenero = idGenero FROM genero WHERE LOWER(genero.descripcion)=LOWER(@N_Genero)
			SELECT @CountFK_Familia = idFamilia FROM familia WHERE LOWER(familia.descripcion)=LOWER(@N_Familia)
			IF @CountGenero IS NULL
			BEGIN
				UPDATE [taxonomia].[dbo].[genero]
				SET @CountGenero = (SELECT max(idGenero) FROM genero)+1
				INSERT INTO genero(idGenero,descripcion, Familia_idFamilia) VALUES (@CountGenero,@N_Genero,@CountFK_Familia);
			END
	COMMIT TRANSACTION

	-- INSERT / Tabla Especie

	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
		BEGIN TRANSACTION
			DECLARE @CountEspecie AS INT
			DECLARE @CountFK_Genero AS INT
			SELECT @CountEspecie = idEspecie FROM especie WHERE LOWER(especie.descripcion)=LOWER(@N_Especie)
			SELECT @CountFK_Genero = idGenero FROM genero WHERE LOWER(genero.descripcion)=LOWER(@N_Genero)
			IF @CountEspecie IS NULL
			BEGIN
				UPDATE [taxonomia].[dbo].[especie]
				SET @CountEspecie = (SELECT max(idEspecie) FROM especie)+1
				INSERT INTO especie(idEspecie, descripcion, Genero_idGenero, nombre_cientifico, nombre_comun)  VALUES (@CountEspecie, @N_Especie, @CountFK_Genero,@N_NombreCientifico, @N_NombreComun);
			END
	COMMIT TRANSACTION
END;

-- BLOQUE 3. Llamado a la función.
-- Registro de prueba. Todos los argumentos son nuevos.
execute sp_inserta_registro @N_Reino = 'pruebaReino', @N_Phylum = 'pruebaPhylum', @N_Clase = 'pruebaClase', @N_Orden = 'pruebaClase', @N_Familia = 'pruebaFamilia', @N_Genero = 'pruebaGenero', @N_Especie = 'pruebaEspecie', @N_NombreCientifico = 'pruebaNombreCientifico', @N_NombreComun = 'pruebaNombreComun';
SELECT * FROM reino
SELECT * FROM phylum
SELECT * FROM clase
SELECT * FROM orden
SELECT * FROM familia
SELECT * FROM genero
SELECT * FROM especie
-- Registro ya existente, el procedimiento no debe hacer nada
execute sp_inserta_registro @N_Reino = 'Animal', @N_Phylum = 'Chordata', @N_Clase = 'mammalia', @N_Orden = 'Artiodactyla', @N_Familia = 'Bovidae', @N_Genero = 'Bos', @N_Especie = 'Taurus', @N_NombreCientifico = 'Bos Taurus', @N_NombreComun = 'Vaca';
SELECT * FROM reino
SELECT * FROM phylum
SELECT * FROM clase
SELECT * FROM orden
SELECT * FROM familia
SELECT * FROM genero
SELECT * FROM especie
-- La prueba siguiente justifica el uso de LOWER () en el procedimiento. Reino cambia como string a pesar de que los caracetres son el mismo. Por ende, la tabla reino no deberia registrar nada
execute sp_inserta_registro @N_Reino = 'AnimaL', @N_Phylum = 'Chordata', @N_Clase = 'mammalia', @N_Orden = 'Artiodactyla', @N_Familia = 'Bovidae', @N_Genero = 'Bos', @N_Especie = 'Taurus', @N_NombreCientifico = 'Bos Taurus', @N_NombreComun = 'Vaca';
execute sp_inserta_registro @N_Reino = 'AnImaL', @N_Phylum = 'Chordata', @N_Clase = 'mammalia', @N_Orden = 'Artiodactyla', @N_Familia = 'Bovidae', @N_Genero = 'Bos', @N_Especie = 'Taurus', @N_NombreCientifico = 'Bos Taurus', @N_NombreComun = 'Vaca';
SELECT * FROM reino

-- END OF FILE

