-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema expensenest
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema expensenest
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `expensenest` DEFAULT CHARACTER SET utf8 ;
USE `expensenest` ;

-- -----------------------------------------------------
-- Table `expensenest`.`Company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `expensenest`.`Company` (
   `id` INT NOT NULL AUTO_INCREMENT,
   `name` VARCHAR(60) NULL,
    `address` VARCHAR(100) NULL,
    `phoneNumber` VARCHAR(20) NULL,
    `email` VARCHAR(75) NULL,
    PRIMARY KEY (`id`))
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `expensenest`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `expensenest`.`User` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(60) NULL,
    `email` VARCHAR(75) NULL,
    `password` VARCHAR(45) NULL,
    `isVerified` INT NULL,
    `userType` INT NULL,
    `phoneNumber` VARCHAR(20) NULL,
    `companyId` INT NULL,
    PRIMARY KEY (`id`),
    INDEX `userCompanyId_idx` (`companyId` ASC) VISIBLE,
    CONSTRAINT `userCompanyId`
    FOREIGN KEY (`companyId`)
    REFERENCES `expensenest`.`Company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `expensenest`.`Receipt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `expensenest`.`Receipt` (
   `id` INT NOT NULL AUTO_INCREMENT,
   `userId` INT NULL,
   `sellerId` INT NULL,
   `totalAmount` INT NULL,
   `isArchived` INT NULL,
   `archivedReason` VARCHAR(100) NULL,
    `dateOfPurchase` DATETIME NULL,
    PRIMARY KEY (`id`),
    INDEX `receiptUserId_idx` (`userId` ASC) VISIBLE,
    INDEX `receiptSellerId_idx` (`sellerId` ASC) VISIBLE,
    CONSTRAINT `receiptUserId`
    FOREIGN KEY (`userId`)
    REFERENCES `expensenest`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `receiptSellerId`
    FOREIGN KEY (`sellerId`)
    REFERENCES `expensenest`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `expensenest`.`Category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `expensenest`.`Category` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(60) NULL,
    `image` VARCHAR(100) NULL,
    PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `expensenest`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `expensenest`.`Products` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NULL,
    `price` INT NULL,
    `category` INT NULL,
    `image` VARCHAR(100) NULL,
    PRIMARY KEY (`id`),
    INDEX `productCategoryId_idx` (`category` ASC) VISIBLE,
    CONSTRAINT `productCategoryId`
    FOREIGN KEY (`category`)
    REFERENCES `expensenest`.`Category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `expensenest`.`ReceiptItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `expensenest`.`ReceiptItems` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `receiptId` INT NULL,
    `productId` INT NULL,
    `quantity` INT NULL,
    PRIMARY KEY (`id`),
    INDEX `itemReceiptId_idx` (`receiptId` ASC) VISIBLE,
    INDEX `itemProductId_idx` (`productId` ASC) VISIBLE,
    CONSTRAINT `itemReceiptId`
    FOREIGN KEY (`receiptId`)
    REFERENCES `expensenest`.`Receipt` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
    CONSTRAINT `itemProductId`
    FOREIGN KEY (`productId`)
    REFERENCES `expensenest`.`Products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
    ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
