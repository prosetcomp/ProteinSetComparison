-- MySQL Workbench Forward Engineering


SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema comp_prot_tool
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema comp_prot_tool
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `comp_prot_tool` DEFAULT CHARACTER SET utf8 ;
USE `comp_prot_tool` ;

-- -----------------------------------------------------
-- Table `TAXON`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TAXON` ;

CREATE TABLE IF NOT EXISTS `TAXON` (
  `ID` MEDIUMINT UNSIGNED NOT NULL,
  `NAME` VARCHAR(200) NOT NULL
  )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `PRIMARY2SECONDARY`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PRIMARY2SECONDARY` ;

CREATE TABLE IF NOT EXISTS `PRIMARY2SECONDARY` (
  `PRIMARY_ACCESSION` VARCHAR(10) NOT NULL,
  `SECONDARY_ACCESSION` VARCHAR(10) NOT NULL
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PROTEIN`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PROTEIN` ;

CREATE TABLE IF NOT EXISTS `PROTEIN` (
  `ACCESSION` VARCHAR(10) NOT NULL,
  `ID` VARCHAR(30) NOT NULL,
  `NAME` MEDIUMTEXT NOT NULL,
  `TAXON_ID` MEDIUMINT UNSIGNED NOT NULL,
  `IS_REVIEWED` BOOLEAN NOT NULL,
  `LENGTH` MEDIUMINT UNSIGNED NOT NULL
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PATHWAY`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PATHWAY` ;

CREATE TABLE IF NOT EXISTS `PATHWAY` (
  `ID` INT NOT NULL,
  `NAME` VARCHAR(255) NOT NULL,
  `SPECIES` CHAR(3) NOT NULL
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GO_TERMS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GO_TERMS` ;

CREATE TABLE IF NOT EXISTS `GO_TERMS` (
  `TERM_ID` INT NOT NULL,
  `NAME` VARCHAR(255) NOT NULL,
  `NAMESPACE` TINYINT NOT NULL,
  `DEFINITION` TEXT NOT NULL,
  `IS_OBSOLETE` BOOLEAN NOT NULL
  )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `NAMESPACE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `NAMESPACE` ;

CREATE TABLE IF NOT EXISTS `NAMESPACE` (
  `NAMESPACE` TINYINT NOT NULL,
  `NAME` TINYTEXT NOT NULL
  )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `TERM_RELATIONS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TERM_RELATIONS` ;

CREATE TABLE IF NOT EXISTS `TERM_RELATIONS` (
  `TERM_ID` INT NOT NULL,
  `IS_A` INT NOT NULL
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PROTEIN_PATHWAY`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PROTEIN_PATHWAY` ;

CREATE TABLE IF NOT EXISTS `PROTEIN_PATHWAY` (
  `ACCESSION` VARCHAR(10) NOT NULL,
  `PATHWAY` INT NOT NULL,
  `SPEC` CHAR(3) NOT NULL
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PROTEIN_ONTOLOGY`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PROTEIN_ONTOLOGY` ;

CREATE TABLE IF NOT EXISTS `PROTEIN_ONTOLOGY` (
  `ACCESSION` VARCHAR(10) NOT NULL,
  `ONTOLOGY` INT NOT NULL
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PUBLICATION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PUBLICATION` ;

CREATE TABLE IF NOT EXISTS `PUBLICATION` (
  `PMID` INT UNSIGNED NOT NULL,
  `TITLE` TEXT NOT NULL,
  `LOCATION` TINYTEXT NOT NULL
  )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `PMID2AUTHOR`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PMID2AUTHOR` ;

CREATE TABLE IF NOT EXISTS `PMID2AUTHOR` (
  `PUBLICATION_PMID` INT UNSIGNED NOT NULL,
  `AUTHOR_NAME` VARCHAR(255) BINARY NOT NULL
  )
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `PROTEIN_PUBLICATION`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PROTEIN_PUBLICATION` ;

CREATE TABLE IF NOT EXISTS `PROTEIN_PUBLICATION` (
  `ACCESSION` VARCHAR(10) NOT NULL,
  `PMID` INT UNSIGNED NOT NULL
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DOMAIN`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DOMAIN` ;

CREATE TABLE IF NOT EXISTS `DOMAIN` (
  `PFAM` INT NOT NULL,
  `IPR_ID` INT NOT NULL,
  `ENTRY_TYPE` VARCHAR(15) NOT NULL,
  `NAME` VARCHAR(100) NOT NULL,
  `PARENT_NAME` VARCHAR(255)  NULL DEFAULT NULL,
  `PARENT_ID` INT  NULL DEFAULT NULL
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PROTEIN_COORDINATES`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DOMAIN_COORDINATES` ;

CREATE TABLE IF NOT EXISTS `DOMAIN_COORDINATES` (
  `ACCESSION` VARCHAR(10) NOT NULL,
  `DOMAIN` INT NOT NULL,
  `START` SMALLINT UNSIGNED NOT NULL,
  `END` SMALLINT UNSIGNED NOT NULL
  )
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `PROTEIN_DOMAIN`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PROTEIN_DOMAIN` ;

CREATE TABLE IF NOT EXISTS `PROTEIN_DOMAIN` (
  `ACCESSION` VARCHAR(10) NOT NULL,
  `DOMAIN` INT NOT NULL
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PROTEIN_PDB`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PROTEIN_PDB` ;

CREATE TABLE IF NOT EXISTS `PROTEIN_PDB` (
  `ACCESSION` VARCHAR(10)  NOT NULL,
  `PDB` VARCHAR(6)  NOT NULL,
  `CHAIN` CHAR(2) BINARY NOT NULL
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `DISEASE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DISEASE` ;

CREATE TABLE IF NOT EXISTS `DISEASE` (
  `ACC` SMALLINT NOT NULL,
  `MIM` MEDIUMINT UNSIGNED NOT NULL,
  `IDENTIFIER` MEDIUMTEXT NOT NULL,
  `ACRONYM` VARCHAR(50) NOT NULL,
  `DEFINITION` MEDIUMTEXT NULL
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `GENE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GENE` ;

CREATE TABLE IF NOT EXISTS `GENE` (
  `ID` INT UNSIGNED NOT NULL,
  `SYMBOL` VARCHAR(100) NOT NULL,
  `LOCUSTAG` VARCHAR(100) NULL,
  `DESCRIPTION` TEXT NULL
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PROTEIN_GENE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PROTEIN_GENE` ;

CREATE TABLE IF NOT EXISTS `PROTEIN_GENE` (
  `ACCESSION` VARCHAR(10) NOT NULL,
  `GENE` INT UNSIGNED NOT NULL
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TAXON_HIERARCHY`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TAXON_HIERARCHY` ;

CREATE TABLE IF NOT EXISTS `TAXON_HIERARCHY` (
  `CHILD` MEDIUMINT UNSIGNED NOT NULL,
  `PARENT` MEDIUMINT UNSIGNED NOT NULL
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PROTEIN_CROSSREF`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PROTEIN_CROSSREF` ;

CREATE TABLE IF NOT EXISTS `PROTEIN_CROSSREF` (
  `ACCESSION` VARCHAR(10) NOT NULL,
  `TYPE` VARCHAR(45) NOT NULL,
  `CROSSREF` VARCHAR(100) BINARY NOT NULL
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PATHWAY_HIERARCHY`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PATHWAY_HIERARCHY` ;

CREATE TABLE IF NOT EXISTS `PATHWAY_HIERARCHY` (
  `PARENT_ID` INT NOT NULL,
  `CHILD_ID` INT NOT NULL,
  `PARENT_SPEC` CHAR(3) NOT NULL,
  `CHILD_SPEC` CHAR(3) NOT NULL
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PROTEIN_DISEASE`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PROTEIN_DISEASE` ;

CREATE TABLE IF NOT EXISTS `PROTEIN_DISEASE` (
  `ACCESSION` VARCHAR(10) NOT NULL,
  `MIM` MEDIUMINT UNSIGNED NOT NULL
  )
ENGINE = InnoDB;


DROP TABLE IF EXISTS `MOLFUNC` ;

CREATE TABLE IF NOT EXISTS `MOLFUNC` (
  `GO_MOLFUNC` INT UNSIGNED NOT NULL,
  `GO_ID` TEXT NOT NULL,
  `PARENTS` TEXT  NULL DEFAULT NULL,
  `DEPTH` SMALLINT NULL DEFAULT NULL 
  )
ENGINE = InnoDB;


DROP TABLE IF EXISTS `BIOPROC` ;

CREATE TABLE IF NOT EXISTS `BIOPROC` (
  `GO_BIOPROC` INT UNSIGNED NOT NULL,
  `GO_ID` TEXT NOT NULL,
  `PARENTS` TEXT  NULL DEFAULT NULL,
  `DEPTH` SMALLINT  NULL DEFAULT NULL
  )
ENGINE = InnoDB;

DROP TABLE IF EXISTS `PFAM` ;

CREATE TABLE IF NOT EXISTS `PFAM` (
  `PFAM_ID` INT UNSIGNED NOT NULL,
  `IPR_ID` INT UNSIGNED NOT NULL,
  `IPR`  TEXT NOT NULL,
  `PARENTS` TEXT NULL DEFAULT NULL
  )
ENGINE = InnoDB;

DROP TABLE IF EXISTS `REACTOME` ;

CREATE TABLE IF NOT EXISTS `REACTOME` (
  `ID` INT UNSIGNED NOT NULL,
  `SPEC` VARCHAR(3) NOT NULL,
  `IPR_ID`  TEXT NOT NULL,
  `PARENTS` TEXT NULL DEFAULT NULL
  )
ENGINE = InnoDB;


DROP TABLE IF EXISTS `PROT` ;

CREATE TABLE IF NOT EXISTS `PROT` (
  `ACC` VARCHAR(10) NOT NULL,
  `ACCESSION` TEXT NOT NULL,
  `NAME` TEXT NOT NULL,
  `TAXON_ID`  INT NOT NULL,
  `TAXON_NAME` VARCHAR(200) NOT NULL,
  `IS_REVIEWED` BOOLEAN NOT NULL
  )
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;