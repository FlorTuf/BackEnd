-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema PortfolioWEB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PortfolioWEB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PortfolioWEB` DEFAULT CHARACTER SET utf8 ;
USE `PortfolioWEB` ;

-- -----------------------------------------------------
-- Table `PortfolioWEB`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortfolioWEB`.`Persona` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `domicilio` VARCHAR(45) NOT NULL,
  `fechaNac` DATE NOT NULL,
  `telefono` VARCHAR(12) NOT NULL,
  `correo` VARCHAR(50) NOT NULL,
  `acerca_de` VARCHAR(200) NOT NULL,
  `url_foto` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortfolioWEB`.`tipo_empleo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortfolioWEB`.`tipo_empleo` (
  `id` INT NOT NULL,
  `tipo_emple` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortfolioWEB`.`Experiencia_Laboral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortfolioWEB`.`Experiencia_Laboral` (
  `id` INT NOT NULL,
  `nombre_empresa` VARCHAR(45) NOT NULL,
  `periodo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `esTrabajoActual` TINYINT NOT NULL,
  `Persona_id` INT NOT NULL,
  `tipo_empleo_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Persona_id`, `tipo_empleo_id`),
  INDEX `fk_Experiencia_Laboral_Persona_idx` (`Persona_id` ASC) VISIBLE,
  INDEX `fk_Experiencia_Laboral_tipo_empleo1_idx` (`tipo_empleo_id` ASC) VISIBLE,
  CONSTRAINT `fk_Experiencia_Laboral_Persona`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `PortfolioWEB`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Experiencia_Laboral_tipo_empleo1`
    FOREIGN KEY (`tipo_empleo_id`)
    REFERENCES `PortfolioWEB`.`tipo_empleo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortfolioWEB`.`Educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortfolioWEB`.`Educacion` (
  `id` INT NOT NULL,
  `nombre_capacitacion` VARCHAR(50) NOT NULL,
  `nombre_institucion` VARCHAR(90) NOT NULL,
  `periodo` VARCHAR(40) NOT NULL,
  `Persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Persona_id`),
  INDEX `fk_Educacion_Persona1_idx` (`Persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_Educacion_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `PortfolioWEB`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortfolioWEB`.`Proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortfolioWEB`.`Proyectos` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(60) NOT NULL,
  `periodo` VARCHAR(20) NOT NULL,
  `link` VARCHAR(100) NOT NULL,
  `breve_descripcion` VARCHAR(200) NOT NULL,
  `Persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Persona_id`),
  INDEX `fk_Proyectos_Persona1_idx` (`Persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_Proyectos_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `PortfolioWEB`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortfolioWEB`.`Habilidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortfolioWEB`.`Habilidades` (
  `id` INT NOT NULL,
  `habilidades` VARCHAR(45) NOT NULL,
  `idiomas` VARCHAR(60) NULL,
  `Persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Persona_id`),
  INDEX `fk_Habilidades_Persona1_idx` (`Persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_Habilidades_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `PortfolioWEB`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortfolioWEB`.`Login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortfolioWEB`.`Login` (
  `id` INT NOT NULL,
  `nombre_usuario` VARCHAR(20) NOT NULL,
  `contraseña` VARCHAR(8) NOT NULL,
  `Persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Persona_id`),
  UNIQUE INDEX `user_name_UNIQUE` (`nombre_usuario` ASC) VISIBLE,
  UNIQUE INDEX `contraseña_UNIQUE` (`contraseña` ASC) VISIBLE,
  INDEX `fk_Login_Persona1_idx` (`Persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_Login_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `PortfolioWEB`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
