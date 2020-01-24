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
-- Table `mydb`.`gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`gene` (
  `Gene_name` VARCHAR(45) NOT NULL,
  `Gene description` TEXT(1000) NULL,
  PRIMARY KEY (`Gene_name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Mutation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mutation` (
  `ID` INT NOT NULL COMMENT ' ',
  `Gene_name` VARCHAR(45) NULL,
  `Start` INT NULL,
  `END` INT NULL,
  `chromosome` FLOAT NULL,
  PRIMARY KEY (`ID`),
  INDEX `gene_idx` (`Gene_name` ASC) VISIBLE,
  CONSTRAINT `gene`
    FOREIGN KEY (`Gene_name`)
    REFERENCES `mydb`.`gene` (`Gene_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Syndrome` (
  `Syndrome name` VARCHAR(45) NOT NULL,
  `Syndrome description` TEXT(1000) NULL,
  PRIMARY KEY (`Syndrome name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `idPatient` INT NOT NULL,
  `Name Patient` VARCHAR(45) NULL,
  `Gender` ENUM('M', 'F') NULL,
  `Age at diagnosis` DECIMAL NULL,
  `Syndrome name` VARCHAR(45) NULL,
  PRIMARY KEY (`idPatient`),
  INDEX `syndrome_idx` (`Syndrome name` ASC) VISIBLE,
  CONSTRAINT `patient`
    FOREIGN KEY (`idPatient`)
    REFERENCES `mydb`.`Mutation` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `syndrome`
    FOREIGN KEY (`Syndrome name`)
    REFERENCES `mydb`.`Syndrome` (`Syndrome name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
