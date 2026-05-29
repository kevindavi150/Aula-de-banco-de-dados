-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema biblioteca
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `biblioteca` DEFAULT CHARACTER SET utf8 ;
USE `biblioteca` ;

-- -----------------------------------------------------
-- Table `biblioteca`.`emprestimos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`emprestimos` (
  `id_emprestimo` INT NOT NULL AUTO_INCREMENT,
  `usuario_cpf` DECIMAL(11) NOT NULL,
  `livro_id` INT NOT NULL,
  `data_emprestimo` DATE NOT NULL,
  `data_devolucao` DATE NOT NULL,
  PRIMARY KEY (`id_emprestimo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT,
  `cpf` DECIMAL(11) NOT NULL,
  `nome` VARCHAR(16) NOT NULL,
  `email` VARCHAR(55) NOT NULL,
  `senha` VARCHAR(11) NOT NULL,
  `nascimento` DATE NOT NULL,
  `data_registro` TIMESTAMP NOT NULL,
  `emprestimos_id_emprestimo` INT NOT NULL,
  PRIMARY KEY (`id_usuario`),
  INDEX `fk_usuario_emprestimos1_idx` (`emprestimos_id_emprestimo` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_emprestimos1`
    FOREIGN KEY (`emprestimos_id_emprestimo`)
    REFERENCES `biblioteca`.`emprestimos` (`id_emprestimo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `biblioteca`.`livros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`livros` (
  `idlivros` INT NOT NULL AUTO_INCREMENT,
  `ISBN` VARCHAR(45) NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `ano` YEAR(4) NOT NULL,
  `editora` VARCHAR(45) NOT NULL,
  `data_registro` TIMESTAMP(6) NOT NULL,
  `autor_id` INT NOT NULL,
  PRIMARY KEY (`idlivros`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`autores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`autores` (
  `nome` VARCHAR(45) NOT NULL,
  `nacionalidade` VARCHAR(45) NOT NULL,
  `livros_idlivros` INT NOT NULL,
  PRIMARY KEY (`livros_idlivros`),
  CONSTRAINT `fk_autores_livros1`
    FOREIGN KEY (`livros_idlivros`)
    REFERENCES `biblioteca`.`livros` (`idlivros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`categoria` (
  `codigo_categoria` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo_categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `biblioteca`.`livros_has_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `biblioteca`.`livros_has_categoria` (
  `livros_idlivros` INT NOT NULL,
  `categoria_codigo_categoria` INT NOT NULL,
  PRIMARY KEY (`livros_idlivros`, `categoria_codigo_categoria`),
  INDEX `fk_livros_has_categoria_categoria1_idx` (`categoria_codigo_categoria` ASC) VISIBLE,
  INDEX `fk_livros_has_categoria_livros1_idx` (`livros_idlivros` ASC) VISIBLE,
  CONSTRAINT `fk_livros_has_categoria_livros1`
    FOREIGN KEY (`livros_idlivros`)
    REFERENCES `biblioteca`.`livros` (`idlivros`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_livros_has_categoria_categoria1`
    FOREIGN KEY (`categoria_codigo_categoria`)
    REFERENCES `biblioteca`.`categoria` (`codigo_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
