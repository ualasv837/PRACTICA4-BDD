SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP SCHEMA IF EXISTS `PrestamosBiblioteca` ;
CREATE SCHEMA IF NOT EXISTS `PrestamosBiblioteca` DEFAULT CHARACTER SET latin1 ;
USE `PrestamosBiblioteca` ;

-- -----------------------------------------------------
-- Table `PrestamosBiblioteca`.`Categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PrestamosBiblioteca`.`Categoria` ;

CREATE  TABLE IF NOT EXISTS `PrestamosBiblioteca`.`Categoria` (
  `categoria` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`categoria`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PrestamosBiblioteca`.`Estado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PrestamosBiblioteca`.`Estado` ;

CREATE  TABLE IF NOT EXISTS `PrestamosBiblioteca`.`Estado` (
  `estado` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`estado`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PrestamosBiblioteca`.`Libro`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PrestamosBiblioteca`.`Libro` ;

CREATE  TABLE IF NOT EXISTS `PrestamosBiblioteca`.`Libro` (
  `id` INT(10) NOT NULL AUTO_INCREMENT ,
  `titulo` VARCHAR(255) NULL DEFAULT NULL ,
  `autor` VARCHAR(255) NULL DEFAULT NULL ,
  `editorial` VARCHAR(255) NULL DEFAULT NULL ,
  `publicadoEn` SMALLINT(5) NULL DEFAULT NULL ,
  `categoria` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `CategoriaLibro` (`categoria` ASC) ,
  INDEX `id` (`id` ASC) ,
  CONSTRAINT `fk_Libro_Categoria`
    FOREIGN KEY (`categoria` )
    REFERENCES `PrestamosBiblioteca`.`Categoria` (`categoria` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PrestamosBiblioteca`.`Ejemplar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PrestamosBiblioteca`.`Ejemplar` ;

CREATE  TABLE IF NOT EXISTS `PrestamosBiblioteca`.`Ejemplar` (
  `numeroInventario` VARCHAR(255) NOT NULL ,
  `estado` VARCHAR(255) NULL DEFAULT NULL ,
  `idLibro` INT(10) NULL DEFAULT NULL ,
  PRIMARY KEY (`numeroInventario`) ,
  INDEX `EstadoEjemplar` (`estado` ASC) ,
  INDEX `id` (`numeroInventario` ASC) ,
  INDEX `idLibro` (`idLibro` ASC) ,
  INDEX `LibroEjemplar` (`idLibro` ASC) ,
  CONSTRAINT `fk_Ejemplar_Estado1`
    FOREIGN KEY (`estado` )
    REFERENCES `PrestamosBiblioteca`.`Estado` (`estado` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ejemplar_Libro1`
    FOREIGN KEY (`idLibro` )
    REFERENCES `PrestamosBiblioteca`.`Libro` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PrestamosBiblioteca`.`TipoUsuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PrestamosBiblioteca`.`TipoUsuario` ;

CREATE  TABLE IF NOT EXISTS `PrestamosBiblioteca`.`TipoUsuario` (
  `tipoUsuario` VARCHAR(255) NOT NULL ,
  PRIMARY KEY (`tipoUsuario`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PrestamosBiblioteca`.`Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PrestamosBiblioteca`.`Usuario` ;

CREATE  TABLE IF NOT EXISTS `PrestamosBiblioteca`.`Usuario` (
  `id` INT(10) NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(255) NULL DEFAULT NULL ,
  `apellidos` VARCHAR(255) NULL DEFAULT NULL ,
  `email` VARCHAR(255) NULL DEFAULT NULL ,
  `telefono` VARCHAR(255) NULL DEFAULT NULL ,
  `sancionadoHasta` DATETIME NULL ,
  `tipoUsuario` VARCHAR(255) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `id` (`id` ASC) ,
  INDEX `TipoUsuarioUsuario` (`tipoUsuario` ASC) ,
  CONSTRAINT `fk_Usuario_TipoUsuario1`
    FOREIGN KEY (`tipoUsuario` )
    REFERENCES `PrestamosBiblioteca`.`TipoUsuario` (`tipoUsuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PrestamosBiblioteca`.`HistorialPrestamos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PrestamosBiblioteca`.`HistorialPrestamos` ;

CREATE  TABLE IF NOT EXISTS `PrestamosBiblioteca`.`HistorialPrestamos` (
  `id` INT(10) NOT NULL AUTO_INCREMENT ,
  `numeroInventario` VARCHAR(255) NULL DEFAULT NULL ,
  `idUsuario` INT(10) NULL DEFAULT NULL ,
  `fechaPrestamo` DATETIME NULL DEFAULT NULL ,
  `fechaDevolucion` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `EjemplarHistorialPrestamos` (`numeroInventario` ASC) ,
  INDEX `id` (`id` ASC) ,
  INDEX `idEjemplar` (`numeroInventario` ASC) ,
  INDEX `idUsuario` (`idUsuario` ASC) ,
  INDEX `UsuarioHistorialPrestamos` (`idUsuario` ASC) ,
  CONSTRAINT `fk_HistorialPrestamos_Ejemplar1`
    FOREIGN KEY (`numeroInventario` )
    REFERENCES `PrestamosBiblioteca`.`Ejemplar` (`numeroInventario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_HistorialPrestamos_Usuario1`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `PrestamosBiblioteca`.`Usuario` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PrestamosBiblioteca`.`Prestamo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PrestamosBiblioteca`.`Prestamo` ;

CREATE  TABLE IF NOT EXISTS `PrestamosBiblioteca`.`Prestamo` (
  `id` INT(10) NOT NULL AUTO_INCREMENT ,
  `numeroInventario` VARCHAR(255) NOT NULL ,
  `idUsuario` INT(10) NULL DEFAULT NULL ,
  `fechaPrestamo` DATETIME NULL DEFAULT NULL ,
  `fechaLimite` DATETIME NULL DEFAULT NULL ,
  `fechaDevolucion` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `EjemplarPrestamo` (`numeroInventario` ASC) ,
  UNIQUE INDEX `id` (`numeroInventario` ASC) ,
  INDEX `id1` (`id` ASC) ,
  INDEX `idUsuario` (`idUsuario` ASC) ,
  INDEX `UsuarioPrestamo` (`idUsuario` ASC) ,
  CONSTRAINT `fk_Prestamo_Ejemplar1`
    FOREIGN KEY (`numeroInventario` )
    REFERENCES `PrestamosBiblioteca`.`Ejemplar` (`numeroInventario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prestamo_Usuario1`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `PrestamosBiblioteca`.`Usuario` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PrestamosBiblioteca`.`Reseña`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PrestamosBiblioteca`.`Reseña` ;

CREATE  TABLE IF NOT EXISTS `PrestamosBiblioteca`.`Reseña` (
  `idUsuario` INT(10) NOT NULL ,
  `idLibro` INT(10) NOT NULL ,
  `valoracion` TINYINT NULL ,
  `opinion` VARCHAR(255) NULL ,
  PRIMARY KEY (`idUsuario`, `idLibro`) ,
  INDEX `fk_Usuario_has_Libro_Libro1_idx` (`idLibro` ASC) ,
  INDEX `fk_Usuario_has_Libro_Usuario1_idx` (`idUsuario` ASC) ,
  CONSTRAINT `fk_Usuario_has_Libro_Usuario1`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `PrestamosBiblioteca`.`Usuario` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Libro_Libro1`
    FOREIGN KEY (`idLibro` )
    REFERENCES `PrestamosBiblioteca`.`Libro` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PrestamosBiblioteca`.`Reserva`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PrestamosBiblioteca`.`Reserva` ;

CREATE  TABLE IF NOT EXISTS `PrestamosBiblioteca`.`Reserva` (
  `idUsuario` INT(10) NOT NULL ,
  `idLibro` INT(10) NOT NULL ,
  `fechaReserva` DATETIME NULL ,
  PRIMARY KEY (`idUsuario`, `idLibro`) ,
  INDEX `fk_Usuario_has_Libro_Libro2_idx` (`idLibro` ASC) ,
  INDEX `fk_Usuario_has_Libro_Usuario2_idx` (`idUsuario` ASC) ,
  CONSTRAINT `fk_Usuario_has_Libro_Usuario2`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `PrestamosBiblioteca`.`Usuario` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Libro_Libro2`
    FOREIGN KEY (`idLibro` )
    REFERENCES `PrestamosBiblioteca`.`Libro` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `PrestamosBiblioteca`.`Sancion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PrestamosBiblioteca`.`Sancion` ;

CREATE  TABLE IF NOT EXISTS `PrestamosBiblioteca`.`Sancion` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `fechaInicio` DATETIME NULL ,
  `fechaFin` DATETIME NULL ,
  `numeroInventario` VARCHAR(255) NOT NULL ,
  `idUsuario` INT(10) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_Sancion_Ejemplar1_idx` (`numeroInventario` ASC) ,
  INDEX `fk_Sancion_Usuario1_idx` (`idUsuario` ASC) ,
  CONSTRAINT `fk_Sancion_Ejemplar1`
    FOREIGN KEY (`numeroInventario` )
    REFERENCES `PrestamosBiblioteca`.`Ejemplar` (`numeroInventario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sancion_Usuario1`
    FOREIGN KEY (`idUsuario` )
    REFERENCES `PrestamosBiblioteca`.`Usuario` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `PrestamosBiblioteca` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
