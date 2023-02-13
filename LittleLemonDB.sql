-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `CustomersID` INT NOT NULL AUTO_INCREMENT,
  `CustomerFirstName` VARCHAR(150) NOT NULL,
  `CustomerLastName` VARCHAR(150) NOT NULL,
  `PhoneNumber` INT NOT NULL,
  `CustomerEmail` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`CustomersID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`StaffAddress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`StaffAddress` (
  `StaffAddressID` INT NOT NULL,
  `PhoneNumber` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Street` VARCHAR(200) NOT NULL,
  `Zipcode` VARCHAR(150) NOT NULL,
  `County` VARCHAR(100) NOT NULL,
  `State` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`StaffAddressID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Staff` (
  `StaffID` INT NOT NULL,
  `StaffFullName` VARCHAR(255) NULL,
  `Role` VARCHAR(100) NULL,
  `AnnualSalary` DECIMAL(10,2) NULL,
  `StaffAddressID` INT NOT NULL,
  PRIMARY KEY (`StaffID`),
  INDEX `staffaddressid_fk_idx` (`StaffAddressID` ASC) VISIBLE,
  CONSTRAINT `staffaddressid_fk`
    FOREIGN KEY (`StaffAddressID`)
    REFERENCES `LittleLemonDB`.`StaffAddress` (`StaffAddressID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `BookingID` INT NOT NULL,
  `BookingDate` DATE NOT NULL,
  `TableNumber` INT NOT NULL,
  `BookingTime` TIME NOT NULL,
  `CustomerID` INT NOT NULL,
  `OrderID` INT NOT NULL,
  `StaffID` INT NOT NULL,
  PRIMARY KEY (`BookingID`),
  INDEX `customerid_fk_idx` (`CustomerID` ASC) VISIBLE,
  INDEX `staffid_fk_idx` (`StaffID` ASC) VISIBLE,
  CONSTRAINT `customerid_fk`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `LittleLemonDB`.`Customers` (`CustomersID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `staffid_fk`
    FOREIGN KEY (`StaffID`)
    REFERENCES `LittleLemonDB`.`Staff` (`StaffID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `OrderID` INT NOT NULL AUTO_INCREMENT,
  `OrderDate` DATE NOT NULL,
  `Quantity` INT NOT NULL,
  `TotalCost` DECIMAL(6,2) NOT NULL,
  `BookingID` INT NULL,
  `MenuID` INT NOT NULL,
  PRIMARY KEY (`OrderID`),
  UNIQUE INDEX `OrdersID_UNIQUE` (`OrderID` ASC) VISIBLE,
  INDEX `bookingid_fk_idx` (`BookingID` ASC) VISIBLE,
  CONSTRAINT `bookingid_fk`
    FOREIGN KEY (`BookingID`)
    REFERENCES `LittleLemonDB`.`Bookings` (`BookingID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`DeliveryAddress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`DeliveryAddress` (
  `DeliveryAddressID` INT NOT NULL,
  `Street` VARCHAR(200) NOT NULL,
  `Zipcode` VARCHAR(150) NOT NULL,
  `County` VARCHAR(100) NOT NULL,
  `State` VARCHAR(70) NULL,
  PRIMARY KEY (`DeliveryAddressID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`OrderDeliveryStatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`OrderDeliveryStatus` (
  `DeliveryStatusID` INT NOT NULL,
  `Status` VARCHAR(70) NOT NULL,
  `DeliveryDate` DATE NOT NULL,
  `DeliveryComment` VARCHAR(255) NULL,
  `OrderID` INT NOT NULL,
  `DeliveryAddressID` INT NOT NULL,
  PRIMARY KEY (`DeliveryStatusID`),
  INDEX `orderid_fk_idx` (`OrderID` ASC) VISIBLE,
  INDEX `deliveryaddressid_fk_idx` (`DeliveryAddressID` ASC) VISIBLE,
  CONSTRAINT `orderid_fk`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemonDB`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `deliveryaddressid_fk`
    FOREIGN KEY (`DeliveryAddressID`)
    REFERENCES `LittleLemonDB`.`DeliveryAddress` (`DeliveryAddressID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`MenuItems` (
  `MenuItemID` INT NOT NULL,
  `ItemName` VARCHAR(200) NOT NULL,
  `ItemType` VARCHAR(100) NOT NULL,
  `Price` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`MenuItemID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menus` (
  `MenuID` INT NOT NULL,
  `Cuisine` VARCHAR(70) NULL,
  `OrderID` INT NULL,
  `MenuItemID` INT NULL,
  PRIMARY KEY (`MenuID`),
  INDEX `Orderis_fk_idx` (`OrderID` ASC) VISIBLE,
  INDEX `menuiitem_fk_idx` (`MenuItemID` ASC) VISIBLE,
  CONSTRAINT `Orderis_fk`
    FOREIGN KEY (`OrderID`)
    REFERENCES `LittleLemonDB`.`Orders` (`OrderID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `menuiitem_fk`
    FOREIGN KEY (`MenuItemID`)
    REFERENCES `LittleLemonDB`.`MenuItems` (`MenuItemID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
