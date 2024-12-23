-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `biblioteca` ;

-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `biblioteca` DEFAULT CHARACTER SET utf8 ;
USE `biblioteca` ;

-- -----------------------------------------------------
-- Table `biblioteca`.`libraries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`libraries` (
  `library_id` VARCHAR(5) NOT NULL,
  `career` VARCHAR(45) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `enabled` TINYINT NOT NULL,
  `theme` VARCHAR(45) NULL,
  `logo` VARCHAR(45) NULL,
  PRIMARY KEY (`library_id`),
  UNIQUE INDEX `carrera_UNIQUE` (`career` ASC) VISIBLE);

-- -----------------------------------------------------
-- Table `biblioteca`.`people`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`people` (
  `email` VARCHAR(70) NOT NULL,
  `password` VARCHAR(60) NOT NULL,
  `names` VARCHAR(50) NOT NULL,
  `last_names` VARCHAR(50) NOT NULL,
  `phone_number` VARCHAR(20) NOT NULL,
  `account_number` VARCHAR(11) NOT NULL,
  `creation_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `enabled` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`email`));

-- -----------------------------------------------------
-- Table `biblioteca`.`languages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`languages` (
  `language_id` INT NOT NULL AUTO_INCREMENT,
  `language` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`language_id`));

-- -----------------------------------------------------
-- Table `biblioteca`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`books` (
  `book_id` INT NOT NULL AUTO_INCREMENT,
  `language_id` INT NOT NULL,
  `title` VARCHAR(255) NOT NULL,
  `isbn` VARCHAR(15) NOT NULL,
  `edition` VARCHAR(10) NULL,
  `publication_date` DATE NULL,
  `publisher` VARCHAR(45) NULL,
  `description` VARCHAR(200) NULL,
  `amount_pages` INT NULL,
  PRIMARY KEY (`book_id`),
  INDEX `fk_tbl_lib_tbl_idi_idx` (`language_id` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_lib_tbl_idi`
    FOREIGN KEY (`language_id`)
    REFERENCES `biblioteca`.`languages` (`language_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `biblioteca`.`authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`authors` (
  `author_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(90) NOT NULL,
  PRIMARY KEY (`author_id`));

-- -----------------------------------------------------
-- Table `biblioteca`.`authors_per_book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`authors_per_book` (
  `book_id` INT NOT NULL,
  `author_id` INT NOT NULL,
  INDEX `fk_au_li_idx` (`book_id` ASC) VISIBLE,
  INDEX `fk_au_li_tbl_au_idx` (`author_id` ASC) VISIBLE,
  PRIMARY KEY (`book_id`, `author_id`),
  CONSTRAINT `fk_tbl_aul_lib`
    FOREIGN KEY (`book_id`)
    REFERENCES `biblioteca`.`books` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_au_lib_au`
    FOREIGN KEY (`author_id`)
    REFERENCES `biblioteca`.`authors` (`author_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `biblioteca`.`stock`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`stock` (
  `stock_id` INT NOT NULL AUTO_INCREMENT,
  `book_id` INT NOT NULL,
  `library_id` VARCHAR(5) NOT NULL,
  `enabled` TINYINT NOT NULL DEFAULT 1,
  `total_amount` INT NOT NULL,
  `location` VARCHAR(100) NULL,
  `units_available` INT NULL,
  `description` VARCHAR(300) NULL,
  PRIMARY KEY (`stock_id`),
  INDEX `fk_tbl_sto_tbl_li_idx` (`book_id` ASC) VISIBLE,
  INDEX `fk_tbl_sto_tbl_bi_idx` (`library_id` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_sto_tbl_li`
    FOREIGN KEY (`book_id`)
    REFERENCES `biblioteca`.`books` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_sto_tbl_bi`
    FOREIGN KEY (`library_id`)
    REFERENCES `biblioteca`.`libraries` (`library_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `biblioteca`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`categories` (
  `category_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `parent_category_id` INT NULL,
  `icon` VARCHAR(45) NULL,
  `enabled` TINYINT(1) NULL,
  PRIMARY KEY (`category_id`),
  INDEX `fk_tbl_cat_idx` (`parent_category_id` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_cat`
    FOREIGN KEY (`parent_category_id`)
    REFERENCES `biblioteca`.`categories` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `biblioteca`.`categories_per_book`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`categories_per_book` (
  `book_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  INDEX `fk_cat_li_idx` (`book_id` ASC) VISIBLE,
  INDEX `fk_tbl_cat_idx` (`category_id` ASC) VISIBLE,
  PRIMARY KEY (`book_id`, `category_id`),
  CONSTRAINT `fk_tbl_cat_lib`
    FOREIGN KEY (`book_id`)
    REFERENCES `biblioteca`.`books` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_cat_lib_cat`
    FOREIGN KEY (`category_id`)
    REFERENCES `biblioteca`.`categories` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `biblioteca`.`states`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`states` (
  `state_id` INT NOT NULL AUTO_INCREMENT,
  `state` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`state_id`));

-- -----------------------------------------------------
-- Table `biblioteca`.`administrators`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`administrators` (
  `administrator_id` VARCHAR(70) NOT NULL,
  `library_id` VARCHAR(5) NOT NULL,
  INDEX `fk_tbl_adm_tbl_per_idx` (`administrator_id` ASC) VISIBLE,
  PRIMARY KEY (`administrator_id`),
  INDEX `fk_tbl_adm_tbl_bi_idx` (`library_id` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_administrador_tbl_persona1`
    FOREIGN KEY (`administrator_id`)
    REFERENCES `biblioteca`.`people` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_administrador_tbl_biblioteca1`
    FOREIGN KEY (`library_id`)
    REFERENCES `biblioteca`.`libraries` (`library_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `biblioteca`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`users` (
  `user_id` VARCHAR(70) NOT NULL,
  `reputation` INT NULL,
  INDEX `fk_tbl_us_tbl_per_idx` (`user_id` ASC) VISIBLE,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_tbl_us_tbl_per`
    FOREIGN KEY (`user_id`)
    REFERENCES `biblioteca`.`people` (`email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `biblioteca`.`tbl_reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`tbl_reserva` (
  `reservation_id` INT NOT NULL AUTO_INCREMENT,
  `state_id` INT NOT NULL,
  `user_id` VARCHAR(70) NOT NULL,
  `book_id` INT NOT NULL,
  `loan_admin_id` VARCHAR(70) NOT NULL,
  `reception_admin_id` VARCHAR(70) NULL,
  `loaned_on` DATETIME NOT NULL,
  `expires_on` DATETIME NOT NULL,
  `received_on` DATETIME NULL,
  `initial_notes` VARCHAR(200) NULL,
  `final_notes` VARCHAR(200) NULL,
  PRIMARY KEY (`reservation_id`),
  INDEX `fk_tbl_res_tbl_sto_idx` (`book_id` ASC) VISIBLE,
  INDEX `fk_tbl_res_tbl_est_idx` (`state_id` ASC) VISIBLE,
  INDEX `fk_tbl_res_tbl_adm_idx` (`reception_admin_id` ASC) VISIBLE,
  INDEX `fk_tbl_res_adm2_idx` (`loan_admin_id` ASC) VISIBLE,
  INDEX `fk_tbl_res_tbl_us_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_res_tbl_sto`
    FOREIGN KEY (`book_id`)
    REFERENCES `biblioteca`.`stock` (`stock_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_res_tbl_est`
    FOREIGN KEY (`state_id`)
    REFERENCES `biblioteca`.`states` (`state_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_res_tbl_adm`
    FOREIGN KEY (`reception_admin_id`)
    REFERENCES `biblioteca`.`administrators` (`administrator_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_res_tbl_adm2`
    FOREIGN KEY (`loan_admin_id`)
    REFERENCES `biblioteca`.`administrators` (`administrator_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_res_tbl_us`
    FOREIGN KEY (`user_id`)
    REFERENCES `biblioteca`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `biblioteca`.`petitions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`petitions` (
  `petition_id` INT NOT NULL AUTO_INCREMENT,
  `book_id` INT NOT NULL,
  `user_id` VARCHAR(70) NOT NULL,
  `approved` TINYINT NULL,
  `date` DATETIME NULL,
  PRIMARY KEY (`petition_id`),
  INDEX `fk_tbl_pet_tbl_sto_idx` (`book_id` ASC) VISIBLE,
  INDEX `fk_tbl_pet_tbl_us_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_pet_tbl_sto`
    FOREIGN KEY (`book_id`)
    REFERENCES `biblioteca`.`stock` (`stock_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_pet_tbl_us`
    FOREIGN KEY (`user_id`)
    REFERENCES `biblioteca`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `biblioteca`.`notifications`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`notifications` (
  `notification_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `body` VARCHAR(200) NOT NULL,
  `date` DATETIME NOT NULL,
  `library_id` VARCHAR(5) NULL,
  `user_id` VARCHAR(70) NULL,
  `petition_id` INT NULL,
  `reservation_id` INT NULL,
  PRIMARY KEY (`notification_id`),
  INDEX `fk_tbl_not_tbl_bi_idx` (`library_id` ASC) VISIBLE,
  INDEX `fk_tbl_not_tbl_pet_idx` (`petition_id` ASC) VISIBLE,
  INDEX `fk_tbl_not_tbl_res_idx` (`reservation_id` ASC) VISIBLE,
  INDEX `fk_tbl_not_tbl_us_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_not_tbl_bi`
    FOREIGN KEY (`library_id`)
    REFERENCES `biblioteca`.`libraries` (`library_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_not_tbl_pet`
    FOREIGN KEY (`petition_id`)
    REFERENCES `biblioteca`.`petitions` (`petition_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_not_tbl_res`
    FOREIGN KEY (`reservation_id`)
    REFERENCES `biblioteca`.`tbl_reserva` (`reservation_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_not_tbl_us`
    FOREIGN KEY (`user_id`)
    REFERENCES `biblioteca`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- -----------------------------------------------------
-- Table `biblioteca`.`libraries_per_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`libraries_per_user` (
  `library_id` VARCHAR(5) NOT NULL,
  `user_id` VARCHAR(70) NOT NULL,
  INDEX `fk_tbl_bi_est_tbl_bi_idx` (`library_id` ASC) VISIBLE,
  PRIMARY KEY (`library_id`, `user_id`),
  INDEX `fk_tbl_bi_tbl_us_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_tbl_bi_est_tbl_bi`
    FOREIGN KEY (`library_id`)
    REFERENCES `biblioteca`.`libraries` (`library_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_bi_est_tbl_us`
    FOREIGN KEY (`user_id`)
    REFERENCES `biblioteca`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
