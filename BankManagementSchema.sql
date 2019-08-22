-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BankDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BankDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BankDB` DEFAULT CHARACTER SET utf8 ;
USE `BankDB` ;

-- -----------------------------------------------------
-- Table `BankDB`.`account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BankDB`.`account` (
  `account_number` INT NOT NULL,
  `account_type` VARCHAR(45) NOT NULL CHECK("fixed" OR "savings" OR "monthly"),
  `date_of_creation` VARCHAR(45) NOT NULL,
  `account_balance` DECIMAL,
  PRIMARY KEY (`account_number`),
  UNIQUE INDEX `account_balance_UNIQUE` (`account_balance` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BankDB`.`transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BankDB`.`transactions` (
  `transaction_id` VARCHAR(45) NOT NULL,
  `transaction_amount` DECIMAL NOT NULL,
  `action` VARCHAR(45) NOT NULL CHECK("withdraw" OR "deposit"),
  `transaction_date` VARCHAR(45) NOT NULL,
  `transaction_balance` DECIMAL NOT NULL,
  `transaction_account` INT NULL,
  PRIMARY KEY (`transaction_id`),
  INDEX `transaction_account_idx` (`transaction_account` ASC) VISIBLE,
  CONSTRAINT `transaction_account`
    FOREIGN KEY (`transaction_account`)
    REFERENCES `BankDB`.`account` (`account_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BankDB`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BankDB`.`customer` (
  `customer_id` INT NOT NULL,
  `customer_name` VARCHAR(45) NOT NULL,
  `customer_address` VARCHAR(45) NOT NULL,
  `customer_age` INT NOT NULL,
  `customer_contactNumber` INT NOT NULL,
  `customer_email` VARCHAR(45) NOT NULL,
  `customer_account` INT NOT NULL,
  PRIMARY KEY (`customer_id`),
  INDEX `customer_account_idx` (`customer_account` ASC) VISIBLE,
  CONSTRAINT `customer_account`
    FOREIGN KEY (`customer_account`)
    REFERENCES `BankDB`.`account` (`account_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
