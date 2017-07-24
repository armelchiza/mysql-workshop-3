-- -----------------------------------------------------
-- Schema addressbook_normalized
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `addressbook_normalized` ;
-- -----------------------------------------------------
-- Schema addressbook_normalized/ comment
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `addressbook_normalized` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `addressbook_normalized` ;



CREATE TABLE Account(
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(250),
    password VARCHAR(40),
    createdOn DATETIME,
    modifiedOn DATETIME
);

CREATE TABLE AddressBook(
    id INT AUTO_INCREMENT PRIMARY KEY,
    accountId INT,
    name VARCHAR(255),
    createdOn DATETIME,
    modifiedOn DATETIME
);

CREATE TABLE Entry(
    id INT AUTO_INCREMENT PRIMARY KEY,
    AddressBookId INT,
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    birthday DATETIME,
    type ENUM('phone', 'address', 'electronic-mail')
);

CREATE TABLE Phone(
    id INT AUTO_INCREMENT PRIMARY KEY,
    entryId INT,
    type ENUM('home', 'work', 'other'),
    subtype ENUM('landline', 'cellular', 'fax'),
    content VARCHAR(250)
);

CREATE TABLE Address(
    id INT AUTO_INCREMENT PRIMARY KEY,
    entryId INT,
    type ENUM('home', 'work', 'other'),
    addressLine1 VARCHAR(255),
    addressLine2 VARCHAR(255),
    city VARCHAR(255),
    province VARCHAR(128),
    country VARCHAR(128),
    postalCode VARCHAR(10)
);

CREATE TABLE ElectronicMail(
    id INT AUTO_INCREMENT PRIMARY KEY,
    entryId INT,
    type ENUM('home', 'work', 'other'),
    content VARCHAR(255)
);

-- -----------------------------------------------------
-- Table `addressbook_normalized`.`Account`
-- -----------------------------------------------------
-- DROP TABLE IF EXISTS `addressbook_normalized`.`Account` ;
-- CREATE TABLE IF NOT EXISTS `addressbook_normalized`.`Account` (
--   `id` INT NOT NULL AUTO_INCREMENT COMMENT '', -- 1ry Auto
--   `email` VARCHAR(255),
--   `password` VARCHAR(40),
--   `createdOn` DATETIME,
--   `modifiedOn` DATETIME)
-- ENGINE = InnoDB;
--
--
--
-- -- -----------------------------------------------------
-- -- Table `addressbook_normalized`.`AddressBook`
-- -- -----------------------------------------------------
-- DROP TABLE IF EXISTS `addressbook_normalized`.`AddressBook` ;
-- CREATE TABLE IF NOT EXISTS `addressbook_normalized`.`AddressBook` (
--   `id` INT AUTO_INCREMENT, -- 1ry Auto
--   `accountId` INT,
--   `name` VARCHAR(255),
--   `createdOn` DATETIME,
--   `modifiedOn` DATETIME)
-- ENGINE = InnoDB;
--
--
--
-- -- -----------------------------------------------------
-- -- Table `addressbook_normalized`.`Entry`
-- -- -----------------------------------------------------
-- DROP TABLE IF EXISTS `addressbook_normalized`.`Entry` ;
-- CREATE TABLE IF NOT EXISTS `addressbook_normalized`.`Entry` (
--   `id` INT AUTO_INCREMENT, -- 1ry Auto
--   `type` ENUM('phone', 'address', 'electronic-mail'),
--   `addressBookId` INT, -- AddressBookId
--   `firstName` VARCHAR(255),
--   `lastName` VARCHAR(255),
--   `birthday` DATETIME)
--   -- CREATE FOREIGN KEYS
--   -- **********************************
-- ENGINE = InnoDB;
--
--
--
-- -- -----------------------------------------------------
-- -- Table `addressbook_normalized`.`Address`
-- -- -----------------------------------------------------
-- DROP TABLE IF EXISTS `addressbook_normalized`.`Address` ;
-- CREATE TABLE IF NOT EXISTS `addressbook_normalized`.`Address` (
--   `id` INT NOT NULL AUTO_INCREMENT COMMENT '', -- 1ry Auto
--   `type` ENUM('home', 'work', 'other') -- removed coma
--   -- **********************************
--   -- `accountId` INT NOT NULL COMMENT '',
--   -- `name` VARCHAR(255) NOT NULL COMMENT '',
--   -- `createdOn` DATETIME NOT NULL COMMENT '',
--   -- `modifiedOn` DATETIME NULL COMMENT '',
--   -- PRIMARY KEY (`id`)  COMMENT '')
-- ENGINE = InnoDB;
--
--
-- CREATE TABLE Address(
--    id INT AUTO_INCREMENT PRIMARY KEY,
--    entryId INT,
--    type ENUM('home', 'work', 'other'),
--    addressLine1 VARCHAR(255),
--    addressLine2 VARCHAR(255),
--    city VARCHAR(255),
--    province VARCHAR(128),
--    country VARCHAR(128),
--    postalCode VARCHAR(10)
-- );
--
--
--
-- -- -----------------------------------------------------
-- DROP TABLE IF EXISTS `addressbook_normalized`.`ElectronicMail` ;
--
-- CREATE TABLE IF NOT EXISTS `addressbook_normalized`.`ElectronicMail` (
--   `id` INT NOT NULL AUTO_INCREMENT COMMENT '', -- 1ry Auto
--   `type` ENUM('home', 'work', 'other')
--   -- **********************************
--   -- `accountId` INT NOT NULL COMMENT '',
--   -- `name` VARCHAR(255) NOT NULL COMMENT '',
--   -- `createdOn` DATETIME NOT NULL COMMENT '',
--   -- `modifiedOn` DATETIME NULL COMMENT '',
--   -- PRIMARY KEY (`id`)  COMMENT '')
-- ENGINE = InnoDB;
--
--
-- -- -----------------------------------------------------
-- DROP TABLE IF EXISTS `addressbook_normalized`.`Phone` ;
--
-- CREATE TABLE IF NOT EXISTS `addressbook_normalized`.`Phone` (
--   `id` INT NOT NULL AUTO_INCREMENT COMMENT '', -- 1ry Auto
--   `type` ENUM('home', 'work', 'other'),
--   `subtype` ENUM('landline', 'cellular', 'fax')
--   -- **********************************
--   -- `accountId` INT NOT NULL COMMENT '',
--   -- `name` VARCHAR(255) NOT NULL COMMENT '',
--   -- `createdOn` DATETIME NOT NULL COMMENT '',
--   -- `modifiedOn` DATETIME NULL COMMENT '',
--   -- PRIMARY KEY (`id`)  COMMENT '')
-- ENGINE = InnoDB;
--
-- CREATE TABLE Phone(
--    id INT AUTO_INCREMENT PRIMARY KEY,
--    entryId INT,
--    type ENUM('home', 'work', 'other'),
--    subtype ENUM('landline', 'cellular', 'fax'),
--    content VARCHAR(250)
-- );
--
--
-- CREATE TABLE ElectronicMail(
--    id INT AUTO_INCREMENT PRIMARY KEY,
--    entryId INT,
--    type ENUM('home', 'work', 'other'),
--    content VARCHAR(255)
--
-- );
