SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `Red Social` ;
CREATE SCHEMA IF NOT EXISTS `Red Social` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Red Social` ;

-- -----------------------------------------------------
-- Table `Red Social`.`TrabajoActual`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`TrabajoActual` (
  `id_trabajoActual` INT NULL,
  `nombreEmpresa` VARCHAR(45) NULL,
  `direccionEmpresa` VARCHAR(45) NULL,
  `cargo` VARCHAR(45) NULL,
  `actividades` VARCHAR(100) NULL,
  `Egresados_Direccion_id_Direccion` INT NULL,
  PRIMARY KEY (`id_trabajoActual`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Matricula` (
  `id_Matricula` INT NOT NULL,
  `Matricula` VARCHAR(10) NULL,
  `Nombre` VARCHAR(45) NULL,
  `e-mail` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Matricula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Calendario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Calendario` (
  `id_Calendario` INT NOT NULL,
  `Fecha` DATETIME NULL,
  `Descripcion` VARCHAR(100) NULL,
  PRIMARY KEY (`id_Calendario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Oferta Academica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Oferta Academica` (
  `id_Oferta Academica` INT NOT NULL,
  `Matricula_id_Matricula` INT NOT NULL,
  `Calendario_id_Calendario` INT NOT NULL,
  PRIMARY KEY (`id_Oferta Academica`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Direccion` (
  `id_Direccion` INT NOT NULL,
  `Nombre_Calle` VARCHAR(45) NULL,
  `Numero` VARCHAR(45) NULL,
  `Colonia` VARCHAR(45) NULL,
  `Codigo_Postal` VARCHAR(5) NULL,
  `Municipio` VARCHAR(45) NULL,
  `Pais` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Direccion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `Nombre(s)` VARCHAR(45) NULL,
  `Apellido_Pa` VARCHAR(45) NULL,
  `Apellido_Ma` VARCHAR(45) NULL,
  `Nickname` VARCHAR(45) NULL,
  `Generacion` DATETIME NULL,
  `Carerra` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NULL,
  `Foto` VARCHAR(100) NULL,
  `Intereses` VARCHAR(45) NULL,
  `Matricula_id_Matricula` INT NOT NULL,
  `Direccion_id_Direccion` INT NOT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Detalle_Estudio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Detalle_Estudio` (
  `id_DetalleEstudio` INT NOT NULL,
  `Nivel de estudio` VARCHAR(45) NULL,
  `Universidad` VARCHAR(45) NULL,
  PRIMARY KEY (`id_DetalleEstudio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Privacidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Privacidad` (
  `id_Privacidad` INT NOT NULL,
  `Publico` TINYINT(1) NULL,
  `Solo_amigos` TINYINT(1) NULL,
  `Amigos_de_amigos` TINYINT(1) NULL,
  `Solo_yo` TINYINT(1) NULL,
  PRIMARY KEY (`id_Privacidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Amigos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Amigos` (
  `idAmigos` INT NOT NULL,
  `Privacidad_id_Privacidad` INT NOT NULL,
  PRIMARY KEY (`idAmigos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Publicaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Publicaciones` (
  `idPublicaciones` INT NOT NULL,
  `Texto` VARCHAR(300) NULL,
  `Imagenes` VARCHAR(45) NULL,
  `Amigos_idAmigos` INT NOT NULL,
  PRIMARY KEY (`idPublicaciones`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Chat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Chat` (
  `idMensaje` INT NULL,
  `Texto` VARCHAR(1000) NULL,
  `Imagen` VARCHAR(100) NULL,
  PRIMARY KEY (`idMensaje`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Amigos_has_Chat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Amigos_has_Chat` (
  `Amigos_idAmigos` INT NOT NULL,
  `Chat_idMensaje` INT NOT NULL,
  PRIMARY KEY (`Amigos_idAmigos`, `Chat_idMensaje`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Notificaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Notificaciones` (
  `id_Notificaciones` INT NULL,
  `Registro_id_usuario` INT NULL,
  PRIMARY KEY (`id_Notificaciones`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Status` (
  `id_Status` INT NOT NULL,
  `Descripcion` VARCHAR(45) NULL,
  `Notificaciones_id_Notificaciones` INT NOT NULL,
  PRIMARY KEY (`id_Status`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Solicitudes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Solicitudes` (
  `id_Solicitudes` INT NOT NULL,
  `Enviar_solicitud` VARCHAR(45) NULL,
  `Aceptar_solicitud` VARCHAR(45) NULL,
  `Eliminar_solicitud` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Solicitudes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Perfil` (
  `Perfil` VARCHAR(45) NOT NULL,
  `Editar` INT NULL,
  `TrabajoActual_id_trabajoActual` INT NOT NULL,
  `Privacidad_id_Privacidad` INT NOT NULL,
  `Registro_id_usuario` INT NOT NULL,
  PRIMARY KEY (`Perfil`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Amigos_has_Solicitudes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Amigos_has_Solicitudes` (
  `Amigos_idAmigos` INT NULL,
  `Solicitudes_id_Solicitudes` INT NULL,
  PRIMARY KEY (`Amigos_idAmigos`, `Solicitudes_id_Solicitudes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Mercadotecnia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Mercadotecnia` (
  `idMercadotecnia` INT NOT NULL,
  `Encuestas` VARCHAR(45) NULL,
  PRIMARY KEY (`idMercadotecnia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Oferta Academica_has_Mercadotecnia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Oferta Academica_has_Mercadotecnia` (
  `Oferta Academica_id_Oferta Academica` INT NOT NULL,
  `Mercadotecnia_idMercadotecnia` INT NOT NULL,
  PRIMARY KEY (`Oferta Academica_id_Oferta Academica`, `Mercadotecnia_idMercadotecnia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Cursos` (
  `idCursos` INT NOT NULL,
  PRIMARY KEY (`idCursos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Registro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Registro` (
  `idRegistro` INT NULL,
  `Nombre` VARCHAR(45) NULL,
  `ApellidoPaterno` VARCHAR(45) NULL,
  `ApellidoMaterno` VARCHAR(45) NULL,
  `e-mail` VARCHAR(45) NULL,
  `Password` VARCHAR(45) NULL,
  PRIMARY KEY (`idRegistro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Bitacora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Bitacora` (
  `idBitacora` INT NOT NULL AUTO_INCREMENT,
  `FechaConexion` DATETIME(10) NULL,
  `HoraConexion` TIME(5) NULL,
  `Usuario` VARCHAR(40) NULL,
  `ActividadRealizada` VARCHAR(45) NULL,
  PRIMARY KEY (`idBitacora`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
