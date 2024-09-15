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
-- Table `mydb`.`Autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Autor` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `nacionalidade` VARCHAR(45) NULL,
  `nascimento` DATE NULL,
  `bio` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Livro` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NULL,
  `isbn` VARCHAR(13) NULL,
  `publicacao` YEAR NULL,
  `editora` VARCHAR(50) NULL,
  `genero` VARCHAR(50) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`AutorEscreveLivro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`AutorEscreveLivro` (
  `Autor_id` INT UNSIGNED NOT NULL,
  `Livro_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Autor_id`, `Livro_id`),
  INDEX `fk_Autor_has_Livro_Livro1_idx` (`Livro_id` ASC) VISIBLE,
  INDEX `fk_Autor_has_Livro_Autor_idx` (`Autor_id` ASC) VISIBLE,
  CONSTRAINT `fk_Autor_has_Livro_Autor`
    FOREIGN KEY (`Autor_id`)
    REFERENCES `mydb`.`Autor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Autor_has_Livro_Livro1`
    FOREIGN KEY (`Livro_id`)
    REFERENCES `mydb`.`Livro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Usuario` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(80) NULL,
  `email` VARCHAR(255) NULL,
  `telefone` VARCHAR(20) NULL,
  `endereco` VARCHAR(100) NULL,
  `tipo` ENUM('Aluno', 'Professor') NULL,
  `cadastro` TIMESTAMP(3) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `usuario_UNIQUE` (`usuario` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Emprestimo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Emprestimo` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `emprestimo` TIMESTAMP(3) NOT NULL,
  `devolucao` DATE NULL,
  `Usuario_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Emprestimo_Usuario1_idx` (`Usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_Emprestimo_Usuario1`
    FOREIGN KEY (`Usuario_id`)
    REFERENCES `mydb`.`Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Exemplar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Exemplar` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `estado` VARCHAR(45) NULL,
  `observacao` TEXT NULL,
  `Livro_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Exemplar_Livro1_idx` (`Livro_id` ASC) VISIBLE,
  CONSTRAINT `fk_Exemplar_Livro1`
    FOREIGN KEY (`Livro_id`)
    REFERENCES `mydb`.`Livro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EmprestimoPossuiExemplar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EmprestimoPossuiExemplar` (
  `Emprestimo_id` INT UNSIGNED NOT NULL,
  `Exemplar_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Emprestimo_id`, `Exemplar_id`),
  INDEX `fk_Emprestimo_has_Exemplar_Exemplar1_idx` (`Exemplar_id` ASC) VISIBLE,
  INDEX `fk_Emprestimo_has_Exemplar_Emprestimo1_idx` (`Emprestimo_id` ASC) VISIBLE,
  CONSTRAINT `fk_Emprestimo_has_Exemplar_Emprestimo1`
    FOREIGN KEY (`Emprestimo_id`)
    REFERENCES `mydb`.`Emprestimo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Emprestimo_has_Exemplar_Exemplar1`
    FOREIGN KEY (`Exemplar_id`)
    REFERENCES `mydb`.`Exemplar` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
