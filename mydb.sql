-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`room types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`room types` (
  `idtype` INT(11) NOT NULL,
  `description` VARCHAR(40) NULL,
  PRIMARY KEY (`idtype`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`rooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`rooms` (
  `idroom` INT NOT NULL,
  `capacity` INT(45) NULL,
  `idtype` INT(11) NOT NULL,
  PRIMARY KEY (`idroom`),
  INDEX `fk_rooms_room types_idx` (`idtype` ASC),
  CONSTRAINT `fk_rooms_room types`
    FOREIGN KEY (`idtype`)
    REFERENCES `mydb`.`room types` (`idtype`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`guests`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`guests` (
  `idguests` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `identity` VARCHAR(45) NULL,
  PRIMARY KEY (`idguests`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`reservations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`reservations` (
  `codreservation` INT(11) NOT NULL,
  `date_start` DATE NULL,
  `date_end` DATE NULL,
  `payment` VARCHAR(45) NULL,
  `hosted_guests_number` INT NULL,
  `cancelled` INT NULL,
  `idroom` INT NOT NULL,
  `idguests` INT NOT NULL,
  PRIMARY KEY (`codreservation`),
  INDEX `fk_reservations_rooms1_idx` (`idroom` ASC),
  INDEX `fk_reservations_guests1_idx` (`idguests` ASC),
  CONSTRAINT `fk_reservations_rooms1`
    FOREIGN KEY (`idroom`)
    REFERENCES `mydb`.`rooms` (`idroom`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reservations_guests1`
    FOREIGN KEY (`idguests`)
    REFERENCES `mydb`.`guests` (`idguests`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
