-- MySQL Script generated by MySQL Workbench
-- Wed Dec  4 19:31:20 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Persona` (
  `idPersona` INT NOT NULL,
  `Nombres` VARCHAR(45) NULL,
  `Apellido_Paterno` VARCHAR(45) NULL,
  `Apellido_Materno` VARCHAR(45) NULL,
  `Domicilio` VARCHAR(90) NULL,
  `Colonia` VARCHAR(90) NULL,
  `Codigo_Postal` DECIMAL(10) NULL,
  `Telefono_Fijo` DECIMAL(20) NULL,
  `Telefono_Movil` VARCHAR(20) NULL,
  `Lugar_De_Nacimiento` VARCHAR(200) NULL,
  `Vive_con` VARCHAR(100) NULL,
  `Estatura` DECIMAL(4) NULL,
  `Peso` DECIMAL(4) NULL,
  `Personas_que_dependen` VARCHAR(100) NULL,
  `Estado_Civil` VARCHAR(45) NULL,
  PRIMARY KEY (`idPersona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Solicitud`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Solicitud` (
  `idSolicitud` INT NOT NULL AUTO_INCREMENT,
  `Fecha` DATETIME NULL,
  `Puesto_Solicitado` VARCHAR(45) NULL,
  `Sueldo` DECIMAL(10) NULL,
  `Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`idSolicitud`),
  INDEX `fk_Solicitud_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Solicitud_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `mydb`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Documentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Documentos` (
  `Solicitud_idSolicitud` INT NOT NULL,
  `Licencia_de_conducir` VARCHAR(45) NULL,
  `Tipo_de_licencia` VARCHAR(45) NULL,
  `Pasaporte` VARCHAR(45) NULL,
  `Tipo_pasaporte` VARCHAR(45) NULL,
  INDEX `fk_Documentos_Solicitud1_idx` (`Solicitud_idSolicitud` ASC) VISIBLE,
  CONSTRAINT `fk_Documentos_Solicitud1`
    FOREIGN KEY (`Solicitud_idSolicitud`)
    REFERENCES `mydb`.`Solicitud` (`idSolicitud`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Escolaridad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Escolaridad` (
  `Solicitud de empleo_idSolicitud de empleo` INT NOT NULL,
  `Escuela_o_Institucion` VARCHAR(60) NULL,
  `Educacion` VARCHAR(45) NULL,
  `Domicilio` VARCHAR(45) NULL,
  `Fecha_ingreso` DATETIME(10) NULL,
  `Fecha_finalizacion` DATETIME(10) NULL,
  `Certificado` VARCHAR(45) NULL,
  INDEX `fk_Habitos_De_La_Persona_Solicitud de empleo1_idx` (`Solicitud de empleo_idSolicitud de empleo` ASC) VISIBLE,
  CONSTRAINT `fk_Habitos_De_La_Persona_Solicitud de empleo1`
    FOREIGN KEY (`Solicitud de empleo_idSolicitud de empleo`)
    REFERENCES `mydb`.`Solicitud` (`idSolicitud`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Familiares`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Familiares` (
  `Solicitud de empleo_idSolicitud de empleo` INT NOT NULL,
  `Nombres` VARCHAR(45) NULL,
  `vivo` DECIMAL(1) NULL,
  `finado` DECIMAL(1) NULL,
  `Domicilio` VARCHAR(45) NULL,
  `Ocupacion` VARCHAR(45) NULL,
  INDEX `fk_Informacion_Familiar_Solicitud de empleo1_idx` (`Solicitud de empleo_idSolicitud de empleo` ASC) VISIBLE,
  CONSTRAINT `fk_Informacion_Familiar_Solicitud de empleo1`
    FOREIGN KEY (`Solicitud de empleo_idSolicitud de empleo`)
    REFERENCES `mydb`.`Solicitud` (`idSolicitud`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Habitos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Habitos` (
  `Solicitud de empleo_idSolicitud de empleo` INT NOT NULL,
  `Salud` VARCHAR(40) NULL,
  `Enfermedades` VARCHAR(400) NULL,
  `Deportes` VARCHAR(200) NULL,
  `Pasatiempos` VARCHAR(200) NULL,
  INDEX `fk_Datos_Escolaridad_Solicitud de empleo1_idx` (`Solicitud de empleo_idSolicitud de empleo` ASC) VISIBLE,
  CONSTRAINT `fk_Datos_Escolaridad_Solicitud de empleo1`
    FOREIGN KEY (`Solicitud de empleo_idSolicitud de empleo`)
    REFERENCES `mydb`.`Solicitud` (`idSolicitud`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
