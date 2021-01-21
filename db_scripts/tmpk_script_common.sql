-- MySQL Script generated by MySQL Workbench
-- Sun Jan 17 12:37:05 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema tmpk
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tmpk
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tmpk` DEFAULT CHARACTER SET utf8 ;
USE `tmpk` ;

-- -----------------------------------------------------
-- Table `tmpk`.`status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tmpk`.`status` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tmpk`.`company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tmpk`.`company` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(90) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tmpk`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tmpk`.`address` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(45) NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `building` VARCHAR(45) NOT NULL,
  `apartment` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tmpk`.`contract`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tmpk`.`contract` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `contract` VARCHAR(10) NOT NULL,
  `fio` VARCHAR(100) NOT NULL,
  `status_id` INT NOT NULL,
  `company_id` INT NOT NULL,
  `address_id` INT NOT NULL,
  PRIMARY KEY (`id`, `status_id`, `company_id`, `address_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `contract_UNIQUE` (`contract` ASC),
  INDEX `fk_contract_status_idx` (`status_id` ASC),
  INDEX `fk_contract_company1_idx` (`company_id` ASC),
  INDEX `fk_contract_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_contract_status`
    FOREIGN KEY (`status_id`)
    REFERENCES `tmpk`.`status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contract_company1`
    FOREIGN KEY (`company_id`)
    REFERENCES `tmpk`.`company` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contract_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `tmpk`.`address` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tmpk`.`tariff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tmpk`.`tariff` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `cost` REAL NOT NULL,
  `start_date` DATE NOT NULL,
  `finish_date` DATE NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tmpk`.`tax`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tmpk`.`tax` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `amount` REAL NOT NULL,
  `date` DATE NOT NULL,
  `contract_id` INT NOT NULL,
  `tariff_id` INT NOT NULL,
  PRIMARY KEY (`id`, `contract_id`, `tariff_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_tax_contract1_idx` (`contract_id` ASC),
  INDEX `fk_tax_tariff1_idx` (`tariff_id` ASC),
  CONSTRAINT `fk_tax_contract1`
    FOREIGN KEY (`contract_id`)
    REFERENCES `tmpk`.`contract` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_tax_tariff1`
    FOREIGN KEY (`tariff_id`)
    REFERENCES `tmpk`.`tariff` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tmpk`.`incoming`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tmpk`.`incoming` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `amount` REAL NOT NULL,
  `date` DATE NOT NULL,
  `contract_id` INT NOT NULL,
  PRIMARY KEY (`id`, `contract_id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  INDEX `fk_incoming_contract1_idx` (`contract_id` ASC),
  CONSTRAINT `fk_incoming_contract1`
    FOREIGN KEY (`contract_id`)
    REFERENCES `tmpk`.`contract` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO `tmpk`.`status` (`name`) VALUES ('Активный');
INSERT INTO `tmpk`.`status` (`name`) VALUES ('Аннулирован');

INSERT INTO `tmpk`.`company` (`name`) VALUES ('Физическое лицо');
INSERT INTO `tmpk`.`company` (`name`) VALUES ('Юридическое лицо');

INSERT INTO `tmpk`.`address` (`city`, `street`, `building`, `apartment`) VALUES ('Дубна', 'Энтузиастов', '34', '105');
INSERT INTO `tmpk`.`address` (`city`, `street`, `building`, `apartment`) VALUES ('Дубна', 'Строителей', '21', '1');

INSERT INTO `tmpk`.`contract` (`contract`, `fio`, `status_id`, `company_id`, `address_id`) VALUES ('ad/0001-20', 'Достоевский Федор Михайлович', '1', '1', '1');
INSERT INTO `tmpk`.`contract` (`contract`, `fio`, `status_id`, `company_id`, `address_id`) VALUES ('ad/0002-20', 'Пушкин Александр Сергеевич', '2', '2', '2');

INSERT INTO `tmpk`.`tariff` (`name`, `cost`, `start_date`, `finish_date`) VALUES ('Max50', '350.00', '2020-05-08', '2025-05-08');
INSERT INTO `tmpk`.`tariff` (`name`, `cost`, `start_date`, `finish_date`) VALUES ('Max100', '600', '2020-07-01', '2025-07-01');

INSERT INTO `tmpk`.`tax` (`amount`, `date`, `contract_id`, `tariff_id`) VALUES ('350', '2020-06-01', '1', '1');
INSERT INTO `tmpk`.`tax` (`amount`, `date`, `contract_id`, `tariff_id`) VALUES ('350', '2020-07-01', '1', '1');
INSERT INTO `tmpk`.`tax` (`amount`, `date`, `contract_id`, `tariff_id`) VALUES ('350', '2020-08-01', '1', '1');
INSERT INTO `tmpk`.`tax` (`amount`, `date`, `contract_id`, `tariff_id`) VALUES ('600', '2020-08-01', '2', '2');
INSERT INTO `tmpk`.`tax` (`amount`, `date`, `contract_id`, `tariff_id`) VALUES ('350', '2020-09-01', '1', '1');
INSERT INTO `tmpk`.`tax` (`amount`, `date`, `contract_id`, `tariff_id`) VALUES ('600', '2020-09-01', '2', '2');

INSERT INTO `tmpk`.`incoming` (`amount`, `date`, `contract_id`) VALUES ('350', '2020-06-02', '1');
INSERT INTO `tmpk`.`incoming` (`amount`, `date`, `contract_id`) VALUES ('350', '2020-07-02', '1');
INSERT INTO `tmpk`.`incoming` (`amount`, `date`, `contract_id`) VALUES ('350', '2020-08-02', '1');
INSERT INTO `tmpk`.`incoming` (`amount`, `date`, `contract_id`) VALUES ('600', '2020-08-04', '2');
INSERT INTO `tmpk`.`incoming` (`amount`, `date`, `contract_id`) VALUES ('350', '2020-09-02', '1');
INSERT INTO `tmpk`.`incoming` (`amount`, `date`, `contract_id`) VALUES ('600', '2020-09-05', '2');

CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `tmpk`.`tax_info` AS
    SELECT 
        `tmpk`.`tax`.`id` AS `id`,
        `tmpk`.`tax`.`amount` AS `amount`,
        `tmpk`.`tax`.`date` AS `date`,
        `tmpk`.`tariff`.`name` AS `tariff`,
        `tmpk`.`tariff`.`cost` AS `cost`,
        `tmpk`.`tariff`.`start_date` AS `start`,
        `tmpk`.`tariff`.`finish_date` AS `finish`,
        `tmpk`.`contract`.`contract` AS `contract_id`
    FROM
        ((`tmpk`.`tax`
        JOIN `tmpk`.`tariff` ON ((`tmpk`.`tariff`.`id` = `tmpk`.`tax`.`tariff_id`)))
        JOIN `tmpk`.`contract` ON ((`tmpk`.`contract`.`id` = `tmpk`.`tax`.`contract_id`)));
        
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `tmpk`.`main_contract_info` AS
    SELECT 
        `tmpk`.`contract`.`id` AS `id`,
        `tmpk`.`contract`.`contract` AS `contract_id`,
        `tmpk`.`contract`.`fio` AS `fio`,
        `tmpk`.`company`.`name` AS `is_company`,
        `tmpk`.`status`.`name` AS `status`,
        `tmpk`.`address`.`city` AS `city`,
        `tmpk`.`address`.`street` AS `street`,
        `tmpk`.`address`.`building` AS `building`,
        `tmpk`.`address`.`apartment` AS `apartment`
    FROM
        (((`tmpk`.`contract`
        JOIN `tmpk`.`address` ON ((`tmpk`.`address`.`id` = `tmpk`.`contract`.`address_id`)))
        JOIN `tmpk`.`status` ON ((`tmpk`.`status`.`id` = `tmpk`.`contract`.`status_id`)))
        JOIN `tmpk`.`company` ON ((`tmpk`.`company`.`id` = `tmpk`.`contract`.`company_id`)));
        
 CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `tmpk`.`incoming_info` AS
    SELECT 
        `tmpk`.`incoming`.`id` AS `id`,
        `tmpk`.`incoming`.`amount` AS `amount`,
        `tmpk`.`incoming`.`date` AS `date`,
        `tmpk`.`contract`.`contract` AS `contract`
    FROM
        (`tmpk`.`incoming`
        JOIN `tmpk`.`contract` ON ((`tmpk`.`contract`.`id` = `tmpk`.`incoming`.`contract_id`)))       
