SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `Red Social` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Red Social` ;

-- -----------------------------------------------------
-- Table `Red Social`.`TrabajoActual`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`TrabajoActual` (
  `idtrabajoActual` INT NOT NULL AUTO_INCREMENT,
  `nombreEmpresa` VARCHAR(45) NULL,
  `direccionEmpresa` VARCHAR(45) NULL,
  `cargo` VARCHAR(45) NULL,
  `actividades` VARCHAR(100) NULL,
  `Egresados_Direccion_id_Direccion` INT NULL,
  PRIMARY KEY (`idtrabajoActual`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Matricula` (
  `idMatricula` INT NOT NULL AUTO_INCREMENT,
  `Matricula` VARCHAR(10) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `e-mail` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMatricula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Calendario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Calendario` (
  `idCalendario` INT NOT NULL AUTO_INCREMENT,
  `Fecha` DATETIME NULL,
  `Descripcion` VARCHAR(100) NULL,
  PRIMARY KEY (`idCalendario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Oferta Academica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Oferta Academica` (
  `idOferta Academica` INT NOT NULL AUTO_INCREMENT,
  `Matricula_id_Matricula` INT NOT NULL,
  `Calendario_id_Calendario` INT NOT NULL,
  PRIMARY KEY (`idOferta Academica`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Direccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Direccion` (
  `idDireccion` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Calle` VARCHAR(45) NOT NULL,
  `Numero` VARCHAR(45) NOT NULL,
  `Colonia` VARCHAR(45) NOT NULL,
  `Codigo_Postal` VARCHAR(5) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  `Pais` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDireccion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Registro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Registro` (
  `idRegistro` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `ApellidoPaterno` VARCHAR(45) NOT NULL,
  `ApellidoMaterno` VARCHAR(45) NOT NULL,
  `e-mail` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRegistro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `Nombre(s)` VARCHAR(45) NOT NULL,
  `Apellido_Pa` VARCHAR(45) NOT NULL,
  `Apellido_Ma` VARCHAR(45) NOT NULL,
  `Nickname` VARCHAR(45) NOT NULL,
  `Generacion` DATETIME NOT NULL,
  `Carerra` VARCHAR(45) NOT NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  `Foto` VARCHAR(100) NOT NULL,
  `Intereses` VARCHAR(45) NOT NULL,
  `Matricula_id_Matricula` INT NOT NULL,
  `Direccion_id_Direccion` INT NOT NULL,
  `Registro_idRegistro` INT NOT NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Detalle_Estudio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Detalle_Estudio` (
  `idDetalleEstudio` INT NOT NULL AUTO_INCREMENT,
  `Nivel de estudio` VARCHAR(45) NULL,
  `Universidad` VARCHAR(45) NULL,
  PRIMARY KEY (`idDetalleEstudio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Privacidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Privacidad` (
  `idPrivacidad` INT NOT NULL AUTO_INCREMENT,
  `Publico` TINYINT(1) NULL,
  `Solo_amigos` TINYINT(1) NULL,
  `Amigos_de_amigos` TINYINT(1) NULL,
  `Soloyo` TINYINT(1) NULL,
  PRIMARY KEY (`idPrivacidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Amigos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Amigos` (
  `idAmigos` INT NOT NULL AUTO_INCREMENT,
  `Privacidad_id_Privacidad` INT NOT NULL,
  PRIMARY KEY (`idAmigos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Publicaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Publicaciones` (
  `idPublicaciones` INT NOT NULL AUTO_INCREMENT,
  `Texto` VARCHAR(300) NULL,
  `Imagenes` VARCHAR(45) NULL,
  `Hora` TIME NULL,
  `Amigos_idAmigos` INT NOT NULL,
  PRIMARY KEY (`idPublicaciones`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Chat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Chat` (
  `idMensaje` INT NOT NULL AUTO_INCREMENT,
  `Texto` VARCHAR(1000) NOT NULL,
  `Imagen` VARCHAR(100) NOT NULL,
  `Hora` TIME NULL,
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
  `idNotificaciones` INT NOT NULL AUTO_INCREMENT,
  `Registro_id_usuario` INT NULL,
  PRIMARY KEY (`idNotificaciones`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Status` (
  `idStatus` INT NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(45) NULL,
  `Notificaciones_id_Notificaciones` INT NOT NULL,
  PRIMARY KEY (`idStatus`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Solicitudes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Solicitudes` (
  `idSolicitudes` INT NOT NULL AUTO_INCREMENT,
  `Enviar_solicitud` VARCHAR(45) NULL,
  `Aceptar_solicitud` VARCHAR(45) NULL,
  `Eliminar_solicitud` VARCHAR(45) NULL,
  PRIMARY KEY (`idSolicitudes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Perfil` (
  `Perfil` INT NOT NULL AUTO_INCREMENT,
  `Editar` INT NOT NULL,
  `TrabajoActual_id_trabajoActual` INT NOT NULL,
  `Privacidad_id_Privacidad` INT NOT NULL,
  `Registro_id_usuario` INT NOT NULL,
  PRIMARY KEY (`Perfil`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Amigos_has_Solicitudes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Amigos_has_Solicitudes` (
  `Amigos_idAmigos` INT NOT NULL,
  `Solicitudes_idSolicitudes` INT NOT NULL,
  PRIMARY KEY (`Amigos_idAmigos`, `Solicitudes_idSolicitudes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Mercadotecnia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Mercadotecnia` (
  `idMercadotecnia` INT NOT NULL AUTO_INCREMENT,
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
  `idCursos` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(50) NULL,
  `Matricula` VARCHAR(45) NULL,
  PRIMARY KEY (`idCursos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Bitacora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Bitacora` (
  `idBitacora` INT NULL AUTO_INCREMENT,
  `FechaConexion` DATETIME NOT NULL,
  `HoraConexion` TIME NOT NULL,
  `Usuario` VARCHAR(40) NULL,
  `ActividadRealizada` VARCHAR(45) NULL,
  `TipodeActividad` VARCHAR(45) NULL,
  PRIMARY KEY (`idBitacora`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Red Social`.`Intereses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Red Social`.`Intereses` (
  `idIntereses` INT NOT NULL AUTO_INCREMENT,
  `Libros` VARCHAR(45) NOT NULL,
  `Deportes` VARCHAR(45) NOT NULL,
  `Musica` VARCHAR(45) NOT NULL,
  `Peliculas` VARCHAR(45) NOT NULL,
  `Religion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idIntereses`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
