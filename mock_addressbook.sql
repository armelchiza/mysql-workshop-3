-- -----------------------------------------------------
-- Schema mock_addressbook_import
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mock_addressbook` ;

-- -----------------------------------------------------
-- Schema mock_addressbook_import/ comment
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mock_addressbook` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;

USE `mock_addressbook` ;

-- -----------------------------------------------------
-- Table `mock_addressbook_import`.`Account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mock_addressbook`.`Account` ;

CREATE TABLE IF NOT EXISTS `mock_addressbook`.`Account` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `email` VARCHAR(255) NOT NULL COMMENT '',
  `password` VARCHAR(40) NOT NULL COMMENT '',
  `createdOn` DATETIME NOT NULL COMMENT '',
  `modifiedOn` DATETIME NULL COMMENT '',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

INSERT INTO mock_addressbook.Account (email, password, createdOn, modifiedOn)
  VALUES
  ('abc@gmail.com' , 'passw8rd', '2017-07-10 08:15:00', '2017-07-11 08:15:00')
;
SELECT * FROM mock_addressbook.Account;

UPDATE mock_addressbook.Account SET email='abc@hotmail.com' WHERE id=1;

SELECT * FROM mock_addressbook.Account;

-- -----------------------------------------------------
-- Table `mock_addressbook_import`.`AddressBook`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mock_addressbook`.`AddressBook` ;

CREATE TABLE IF NOT EXISTS `mock_addressbook`.`AddressBook` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `accountId` INT NOT NULL COMMENT '',
  `name` VARCHAR(255) NOT NULL COMMENT '',
  `createdOn` DATETIME NOT NULL COMMENT '',
  `modifiedOn` DATETIME NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;

INSERT INTO mock_addressbook.AddressBook (accountId, name, createdOn, modifiedOn)
  VALUES
  (1786448 , 'Joe Perrier', '2017-07-10 08:15:00', '2017-07-11 08:15:00')
;
SELECT * FROM mock_addressbook.AddressBook;

UPDATE mock_addressbook.AddressBook SET accountId=2786448 WHERE id=1;

DELETE FROM mock_addressbook.AddressBook;

SELECT * FROM mock_addressbook.AddressBook;

-- -----------------------------------------------------
-- Table `mock_addressbook_import`.`Entry`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mock_addressbook`.`Entry` ;

CREATE TABLE IF NOT EXISTS `mock_addressbook`.`Entry` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `addressBookId` INT NOT NULL COMMENT '',
  `firstName` VARCHAR(255) NOT NULL COMMENT '',
  `lastName` VARCHAR(255) NULL COMMENT '',
  `birthday` DATETIME NULL COMMENT '',
  `type` ENUM('home', 'work', 'other') NOT NULL COMMENT '',
  `subtype` ENUM('phone', 'address', 'email') NOT NULL COMMENT '',
  `contentLineOne` VARCHAR(255) NOT NULL COMMENT '',
  `contentLineTwo` VARCHAR(255) NULL COMMENT '',
  `contentLineThree` VARCHAR(255) NULL COMMENT '',
  `contentLineFour` VARCHAR(255) NULL COMMENT '',
  `contentLineFive` VARCHAR(255) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;

-- UPDATE mock_addressbook.Entry SET accountId=2786448 WHERE id=1;

INSERT INTO mock_addressbook.Entry
  (addressBookId, firstName, lastName, birthday, type, subtype
  , contentLineOne, contentLineTwo, contentLineThree
, contentLineFour, contentLineFive)
  VALUES
  (178644890 , 'Joe', 'Perrier',  '2000-07-10 08:15:00', 'home', 'email'
    ,'sdjkfnskjfn','sjkfbasljkf','sjhfbashj','dhjfbasjhf','jhsdbfaj')
    , (178623890 , 'Peter', 'Perrier',  '2000-02-20 08:15:00', 'work', 'address'
      ,'sdjkfnskjfn','sjkfbasljkf','sjhfbashj','dhjfbasjhf','jhsdbfaj')
      , (111167890 , 'Jenny', 'Perrier',  '1992-07-10 08:15:00', 'other', 'phone'
        ,'sdjjukjfn','sjjjjbasljkf','zzzfbashj','dhjfbasjhfzz','jhfaj')
;
SELECT * FROM mock_addressbook.Entry;

UPDATE mock_addressbook.Entry SET lastName='Perry' WHERE lastName='Perrier';

TRUNCATE mock_addressbook.Entry;


-- /usr/local/mysql/bin/mysqldump -u root -p backuptables.sql
-- < /Users/admin/Desktop/mysql-workshop-2/data/database_addressbook.sql ;
-- DOESN'T WORK :(
