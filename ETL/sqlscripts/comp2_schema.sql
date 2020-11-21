-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: comp_prot_tool2
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `BIOPROC`
--

DROP TABLE IF EXISTS `BIOPROC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BIOPROC` (
  `GO_BIOPROC` int(10) unsigned NOT NULL,
  `GO_ID` text NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PARENTS` text,
  `DEPTH` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`GO_BIOPROC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `COMPOUND`
--

DROP TABLE IF EXISTS `COMPOUND`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPOUND` (
  `ID` int(11) NOT NULL,
  `NAME` text NOT NULL,
  `DEF` mediumtext,
  `SYNONYM` mediumtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DBank_a_sessionID`
--

DROP TABLE IF EXISTS `DBank_a_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DBank_a_sessionID` (
  `CID` int(11) NOT NULL,
  `ACCESSION` char(10) NOT NULL,
  PRIMARY KEY (`CID`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DBank_ac_sessionID`
--

DROP TABLE IF EXISTS `DBank_ac_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DBank_ac_sessionID` (
  `CID` int(11) NOT NULL,
  `ACCESSION` char(10) NOT NULL,
  PRIMARY KEY (`CID`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DBank_b_sessionID`
--

DROP TABLE IF EXISTS `DBank_b_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DBank_b_sessionID` (
  `CID` int(11) NOT NULL,
  `ACCESSION` char(10) NOT NULL,
  PRIMARY KEY (`CID`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DBank_bc_sessionID`
--

DROP TABLE IF EXISTS `DBank_bc_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DBank_bc_sessionID` (
  `CID` int(11) NOT NULL,
  `ACCESSION` char(10) NOT NULL,
  PRIMARY KEY (`CID`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DBank_c_sessionID`
--

DROP TABLE IF EXISTS `DBank_c_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DBank_c_sessionID` (
  `CID` int(11) NOT NULL,
  `ACCESSION` char(10) NOT NULL,
  PRIMARY KEY (`CID`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DISEASE`
--

DROP TABLE IF EXISTS `DISEASE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DISEASE` (
  `ACC` smallint(6) NOT NULL,
  `MIM` mediumint(8) unsigned NOT NULL,
  `IDENTIFIER` mediumtext NOT NULL,
  `ACRONYM` varchar(50) NOT NULL,
  `DEFINITION` mediumtext,
  PRIMARY KEY (`ACC`,`MIM`),
  KEY `disease_mim_idx` (`MIM`),
  FULLTEXT KEY `disease_acroynm_idx` (`ACRONYM`),
  FULLTEXT KEY `disease_identifier_idx` (`IDENTIFIER`),
  FULLTEXT KEY `disease_def_idx` (`DEFINITION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_a_k7fx0zc9`
--

DROP TABLE IF EXISTS `DM_a_k7fx0zc9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_a_k7fx0zc9` (
  `DOMAIN` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`DOMAIN`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_a_k7kyfiod`
--

DROP TABLE IF EXISTS `DM_a_k7kyfiod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_a_k7kyfiod` (
  `DOMAIN` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`DOMAIN`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_a_k7m05j9k`
--

DROP TABLE IF EXISTS `DM_a_k7m05j9k`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_a_k7m05j9k` (
  `DOMAIN` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`DOMAIN`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_a_k7mlsbau`
--

DROP TABLE IF EXISTS `DM_a_k7mlsbau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_a_k7mlsbau` (
  `DOMAIN` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`DOMAIN`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_a_sessionID`
--

DROP TABLE IF EXISTS `DM_a_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_a_sessionID` (
  `DOMAIN` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`DOMAIN`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_ac_k7m05j9k`
--

DROP TABLE IF EXISTS `DM_ac_k7m05j9k`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_ac_k7m05j9k` (
  `DOMAIN` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`DOMAIN`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_ac_sessionID`
--

DROP TABLE IF EXISTS `DM_ac_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_ac_sessionID` (
  `DOMAIN` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`DOMAIN`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_b_k7m05j9k`
--

DROP TABLE IF EXISTS `DM_b_k7m05j9k`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_b_k7m05j9k` (
  `DOMAIN` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`DOMAIN`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_b_sessionID`
--

DROP TABLE IF EXISTS `DM_b_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_b_sessionID` (
  `DOMAIN` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`DOMAIN`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_bc_k7m05j9k`
--

DROP TABLE IF EXISTS `DM_bc_k7m05j9k`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_bc_k7m05j9k` (
  `DOMAIN` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`DOMAIN`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_bc_sessionID`
--

DROP TABLE IF EXISTS `DM_bc_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_bc_sessionID` (
  `DOMAIN` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`DOMAIN`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_c_k7m05j9k`
--

DROP TABLE IF EXISTS `DM_c_k7m05j9k`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_c_k7m05j9k` (
  `DOMAIN` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`DOMAIN`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_c_sessionID`
--

DROP TABLE IF EXISTS `DM_c_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_c_sessionID` (
  `DOMAIN` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`DOMAIN`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DOMAIN`
--

DROP TABLE IF EXISTS `DOMAIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DOMAIN` (
  `PFAM` int(11) NOT NULL,
  `IPR_ID` int(11) NOT NULL,
  `ENTRY_TYPE` varchar(15) NOT NULL,
  `NAME` varchar(100) NOT NULL,
  `PARENT_NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PFAM`,`IPR_ID`),
  KEY `domain_ipr_idx` (`IPR_ID`),
  FULLTEXT KEY `domain_name_idx` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DOMAIN_COORDINATES`
--

DROP TABLE IF EXISTS `DOMAIN_COORDINATES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DOMAIN_COORDINATES` (
  `ACCESSION` varchar(10) NOT NULL,
  `DOMAIN` int(11) NOT NULL,
  `START` smallint(5) unsigned NOT NULL,
  `END` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`ACCESSION`,`DOMAIN`,`START`,`END`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DRUGBANK`
--

DROP TABLE IF EXISTS `DRUGBANK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DRUGBANK` (
  `COMPID` int(11) NOT NULL,
  `IDURL` varchar(200) NOT NULL,
  `NAME` text NOT NULL,
  `SYN` mediumtext,
  `DEF` mediumtext,
  `ACTION` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GB_a_k7fx0zc9`
--

DROP TABLE IF EXISTS `GB_a_k7fx0zc9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GB_a_k7fx0zc9` (
  `ONTOLOGY` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ONTOLOGY`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GB_a_k7kyfiod`
--

DROP TABLE IF EXISTS `GB_a_k7kyfiod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GB_a_k7kyfiod` (
  `ONTOLOGY` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ONTOLOGY`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GB_a_k7m05j9k`
--

DROP TABLE IF EXISTS `GB_a_k7m05j9k`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GB_a_k7m05j9k` (
  `ONTOLOGY` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ONTOLOGY`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GB_a_k7mlsbau`
--

DROP TABLE IF EXISTS `GB_a_k7mlsbau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GB_a_k7mlsbau` (
  `ONTOLOGY` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ONTOLOGY`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GB_a_sessionID`
--

DROP TABLE IF EXISTS `GB_a_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GB_a_sessionID` (
  `ONTOLOGY` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ONTOLOGY`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GB_ac_k7m05j9k`
--

DROP TABLE IF EXISTS `GB_ac_k7m05j9k`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GB_ac_k7m05j9k` (
  `ONTOLOGY` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ONTOLOGY`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GB_ac_sessionID`
--

DROP TABLE IF EXISTS `GB_ac_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GB_ac_sessionID` (
  `ONTOLOGY` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ONTOLOGY`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GB_b_k7m05j9k`
--

DROP TABLE IF EXISTS `GB_b_k7m05j9k`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GB_b_k7m05j9k` (
  `ONTOLOGY` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ONTOLOGY`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GB_b_sessionID`
--

DROP TABLE IF EXISTS `GB_b_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GB_b_sessionID` (
  `ONTOLOGY` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ONTOLOGY`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GB_bc_k7m05j9k`
--

DROP TABLE IF EXISTS `GB_bc_k7m05j9k`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GB_bc_k7m05j9k` (
  `ONTOLOGY` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ONTOLOGY`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GB_bc_sessionID`
--

DROP TABLE IF EXISTS `GB_bc_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GB_bc_sessionID` (
  `ONTOLOGY` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ONTOLOGY`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GB_c_k7m05j9k`
--

DROP TABLE IF EXISTS `GB_c_k7m05j9k`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GB_c_k7m05j9k` (
  `ONTOLOGY` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ONTOLOGY`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GB_c_sessionID`
--

DROP TABLE IF EXISTS `GB_c_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GB_c_sessionID` (
  `ONTOLOGY` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ONTOLOGY`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GENE`
--

DROP TABLE IF EXISTS `GENE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GENE` (
  `ID` int(10) unsigned NOT NULL,
  `SYMBOL` varchar(100) NOT NULL,
  `LOCUSTAG` varchar(100) DEFAULT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`ID`),
  FULLTEXT KEY `gene_sym_idx` (`SYMBOL`),
  FULLTEXT KEY `gene_desc_idx` (`DESCRIPTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GM_a_k7fx0zc9`
--

DROP TABLE IF EXISTS `GM_a_k7fx0zc9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GM_a_k7fx0zc9` (
  `ONTOLOGY` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ONTOLOGY`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GM_a_k7kyfiod`
--

DROP TABLE IF EXISTS `GM_a_k7kyfiod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GM_a_k7kyfiod` (
  `ONTOLOGY` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ONTOLOGY`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GM_a_k7m05j9k`
--

DROP TABLE IF EXISTS `GM_a_k7m05j9k`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GM_a_k7m05j9k` (
  `ONTOLOGY` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ONTOLOGY`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GM_a_k7mlsbau`
--

DROP TABLE IF EXISTS `GM_a_k7mlsbau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GM_a_k7mlsbau` (
  `ONTOLOGY` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ONTOLOGY`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GM_a_sessionID`
--

DROP TABLE IF EXISTS `GM_a_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GM_a_sessionID` (
  `ONTOLOGY` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ONTOLOGY`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GM_ac_k7m05j9k`
--

DROP TABLE IF EXISTS `GM_ac_k7m05j9k`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GM_ac_k7m05j9k` (
  `ONTOLOGY` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ONTOLOGY`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GM_ac_sessionID`
--

DROP TABLE IF EXISTS `GM_ac_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GM_ac_sessionID` (
  `ONTOLOGY` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ONTOLOGY`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GM_b_k7m05j9k`
--

DROP TABLE IF EXISTS `GM_b_k7m05j9k`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GM_b_k7m05j9k` (
  `ONTOLOGY` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ONTOLOGY`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GM_b_sessionID`
--

DROP TABLE IF EXISTS `GM_b_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GM_b_sessionID` (
  `ONTOLOGY` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ONTOLOGY`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GM_bc_k7m05j9k`
--

DROP TABLE IF EXISTS `GM_bc_k7m05j9k`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GM_bc_k7m05j9k` (
  `ONTOLOGY` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ONTOLOGY`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GM_bc_sessionID`
--

DROP TABLE IF EXISTS `GM_bc_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GM_bc_sessionID` (
  `ONTOLOGY` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ONTOLOGY`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GM_c_k7m05j9k`
--

DROP TABLE IF EXISTS `GM_c_k7m05j9k`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GM_c_k7m05j9k` (
  `ONTOLOGY` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ONTOLOGY`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GM_c_sessionID`
--

DROP TABLE IF EXISTS `GM_c_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GM_c_sessionID` (
  `ONTOLOGY` int(11) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ONTOLOGY`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `GO_TERMS`
--

DROP TABLE IF EXISTS `GO_TERMS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GO_TERMS` (
  `TERM_ID` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `NAMESPACE` tinyint(4) NOT NULL,
  `DEFINITION` text NOT NULL,
  `IS_OBSOLETE` tinyint(1) NOT NULL,
  PRIMARY KEY (`TERM_ID`),
  KEY `go_name_idx` (`NAME`),
  KEY `go_namespace_idx` (`NAMESPACE`),
  FULLTEXT KEY `go_def_idx` (`DEFINITION`),
  CONSTRAINT `fk_goterms_namespace` FOREIGN KEY (`NAMESPACE`) REFERENCES `NAMESPACE` (`NAMESPACE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `MOLFUNC`
--

DROP TABLE IF EXISTS `MOLFUNC`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MOLFUNC` (
  `GO_MOLFUNC` int(10) unsigned NOT NULL,
  `GO_ID` text NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PARENTS` text,
  `DEPTH` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`GO_MOLFUNC`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NAMESPACE`
--

DROP TABLE IF EXISTS `NAMESPACE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `NAMESPACE` (
  `NAMESPACE` tinyint(4) NOT NULL,
  `NAME` tinytext NOT NULL,
  PRIMARY KEY (`NAMESPACE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PATHWAY`
--

DROP TABLE IF EXISTS `PATHWAY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PATHWAY` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `SPECIES` char(3) NOT NULL,
  PRIMARY KEY (`ID`,`SPECIES`),
  KEY `pathway_name_idx` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PATHWAY_HIERARCHY`
--

DROP TABLE IF EXISTS `PATHWAY_HIERARCHY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PATHWAY_HIERARCHY` (
  `PARENT_ID` int(11) NOT NULL,
  `CHILD_ID` int(11) NOT NULL,
  `PARENT_SPEC` char(3) NOT NULL,
  `CHILD_SPEC` char(3) NOT NULL,
  PRIMARY KEY (`PARENT_ID`,`CHILD_ID`,`PARENT_SPEC`),
  KEY `pathwayh_child_idx` (`CHILD_ID`),
  CONSTRAINT `fk_path_child` FOREIGN KEY (`CHILD_ID`) REFERENCES `PATHWAY` (`ID`),
  CONSTRAINT `fk_path_parent` FOREIGN KEY (`PARENT_ID`) REFERENCES `PATHWAY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PFAM`
--

DROP TABLE IF EXISTS `PFAM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PFAM` (
  `PFAM_ID` int(10) unsigned NOT NULL,
  `IPR_ID` int(10) unsigned NOT NULL,
  `IPR` text NOT NULL,
  `PARENTS` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PMID2AUTHOR`
--

DROP TABLE IF EXISTS `PMID2AUTHOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PMID2AUTHOR` (
  `PUBLICATION_PMID` int(10) unsigned NOT NULL,
  `AUTHOR_NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`PUBLICATION_PMID`,`AUTHOR_NAME`),
  CONSTRAINT `fk_pmid2author_pmid` FOREIGN KEY (`PUBLICATION_PMID`) REFERENCES `PUBLICATION` (`PMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PRIMARY2SECONDARY`
--

DROP TABLE IF EXISTS `PRIMARY2SECONDARY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRIMARY2SECONDARY` (
  `PRIMARY_ACCESSION` varchar(10) NOT NULL,
  `SECONDARY_ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`PRIMARY_ACCESSION`,`SECONDARY_ACCESSION`),
  CONSTRAINT `fk_prisec_acc` FOREIGN KEY (`PRIMARY_ACCESSION`) REFERENCES `PROTEIN` (`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROT`
--

DROP TABLE IF EXISTS `PROT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROT` (
  `ACC` varchar(10) NOT NULL,
  `ACCESSION` text NOT NULL,
  `NAME` text NOT NULL,
  `TAXON_ID` int(11) NOT NULL,
  `TAXON_NAME` varchar(200) NOT NULL,
  `IS_REVIEWED` tinyint(1) NOT NULL,
  PRIMARY KEY (`ACC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROTEIN`
--

DROP TABLE IF EXISTS `PROTEIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTEIN` (
  `ACCESSION` varchar(10) NOT NULL,
  `ID` varchar(30) NOT NULL,
  `NAME` mediumtext NOT NULL,
  `TAXON_ID` mediumint(8) unsigned NOT NULL,
  `IS_REVIEWED` tinyint(1) NOT NULL,
  `LENGTH` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`ACCESSION`),
  KEY `protein_id_idx` (`ID`),
  KEY `protein_taxon_idx` (`TAXON_ID`),
  FULLTEXT KEY `protein_name_idx` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROTEIN_COMPOUND`
--

DROP TABLE IF EXISTS `PROTEIN_COMPOUND`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTEIN_COMPOUND` (
  `CID` int(11) NOT NULL,
  `ACTION` mediumtext,
  `ACCESSION` char(10) NOT NULL,
  PRIMARY KEY (`ACCESSION`,`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROTEIN_CROSSREF`
--

DROP TABLE IF EXISTS `PROTEIN_CROSSREF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTEIN_CROSSREF` (
  `ACCESSION` varchar(10) NOT NULL,
  `TYPE` varchar(45) NOT NULL,
  `CROSSREF` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ACCESSION`,`TYPE`,`CROSSREF`),
  KEY `prot_cross_acc_idx` (`ACCESSION`),
  KEY `prot_cross_cross_idx` (`CROSSREF`),
  KEY `prot_cross_type_idx` (`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROTEIN_DISEASE`
--

DROP TABLE IF EXISTS `PROTEIN_DISEASE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTEIN_DISEASE` (
  `ACCESSION` varchar(10) NOT NULL,
  `MIM` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`ACCESSION`,`MIM`),
  KEY `protdisease_mim_idx` (`MIM`),
  CONSTRAINT `fk_prot_disease_acc` FOREIGN KEY (`ACCESSION`) REFERENCES `PROTEIN` (`ACCESSION`),
  CONSTRAINT `fk_prot_disease_mim` FOREIGN KEY (`MIM`) REFERENCES `DISEASE` (`MIM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROTEIN_DOMAIN`
--

DROP TABLE IF EXISTS `PROTEIN_DOMAIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTEIN_DOMAIN` (
  `ACCESSION` varchar(10) NOT NULL,
  `DOMAIN` int(11) NOT NULL,
  PRIMARY KEY (`ACCESSION`,`DOMAIN`),
  KEY `protdomain_idx` (`DOMAIN`),
  CONSTRAINT `fk_domain` FOREIGN KEY (`DOMAIN`) REFERENCES `DOMAIN` (`PFAM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROTEIN_GENE`
--

DROP TABLE IF EXISTS `PROTEIN_GENE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTEIN_GENE` (
  `ACCESSION` varchar(10) NOT NULL,
  `GENE` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ACCESSION`,`GENE`),
  CONSTRAINT `fk_prot_gene_acc` FOREIGN KEY (`ACCESSION`) REFERENCES `PROTEIN` (`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROTEIN_ONTOLOGY`
--

DROP TABLE IF EXISTS `PROTEIN_ONTOLOGY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTEIN_ONTOLOGY` (
  `ACCESSION` varchar(10) NOT NULL,
  `ONTOLOGY` int(11) NOT NULL,
  PRIMARY KEY (`ACCESSION`,`ONTOLOGY`),
  KEY `protontology_acc_idx` (`ACCESSION`),
  KEY `protontology_ontology_idx` (`ONTOLOGY`),
  CONSTRAINT `fk_prot_go_acc` FOREIGN KEY (`ACCESSION`) REFERENCES `PROTEIN` (`ACCESSION`),
  CONSTRAINT `fk_prot_go_id` FOREIGN KEY (`ONTOLOGY`) REFERENCES `GO_TERMS` (`TERM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROTEIN_PATHWAY`
--

DROP TABLE IF EXISTS `PROTEIN_PATHWAY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTEIN_PATHWAY` (
  `ACCESSION` varchar(10) NOT NULL,
  `PATHWAY` int(11) NOT NULL,
  `SPEC` char(3) NOT NULL,
  PRIMARY KEY (`ACCESSION`,`PATHWAY`),
  KEY `prot_pathway_pathway_idx` (`PATHWAY`),
  KEY `prot_pathway_acc_idx` (`ACCESSION`),
  CONSTRAINT `fk_prot_path_acc` FOREIGN KEY (`ACCESSION`) REFERENCES `PROTEIN` (`ACCESSION`),
  CONSTRAINT `fk_prot_path_id` FOREIGN KEY (`PATHWAY`) REFERENCES `PATHWAY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROTEIN_PDB`
--

DROP TABLE IF EXISTS `PROTEIN_PDB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTEIN_PDB` (
  `ACCESSION` varchar(10) NOT NULL,
  `PDB` varchar(6) NOT NULL,
  `CHAIN` char(2) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ACCESSION`,`PDB`,`CHAIN`),
  KEY `pdb_idx` (`PDB`),
  KEY `pdb_chain_idx` (`CHAIN`),
  CONSTRAINT `fk_prot_pdb_acc` FOREIGN KEY (`ACCESSION`) REFERENCES `PROTEIN` (`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PROTEIN_PUBLICATION`
--

DROP TABLE IF EXISTS `PROTEIN_PUBLICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PROTEIN_PUBLICATION` (
  `ACCESSION` varchar(10) NOT NULL,
  `PMID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ACCESSION`,`PMID`),
  KEY `protpub_pmid_idx` (`PMID`),
  CONSTRAINT `fk_prot_pub_acc` FOREIGN KEY (`ACCESSION`) REFERENCES `PROTEIN` (`ACCESSION`),
  CONSTRAINT `fk_prot_pub_pmid` FOREIGN KEY (`PMID`) REFERENCES `PUBLICATION` (`PMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PUBLICATION`
--

DROP TABLE IF EXISTS `PUBLICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PUBLICATION` (
  `PMID` int(10) unsigned NOT NULL,
  `TITLE` text NOT NULL,
  `LOCATION` tinytext NOT NULL,
  PRIMARY KEY (`PMID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PW_a_k7fx0zc9`
--

DROP TABLE IF EXISTS `PW_a_k7fx0zc9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PW_a_k7fx0zc9` (
  `PATHWAY` int(11) NOT NULL,
  `SPEC` char(3) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`PATHWAY`,`SPEC`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PW_a_k7kyfiod`
--

DROP TABLE IF EXISTS `PW_a_k7kyfiod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PW_a_k7kyfiod` (
  `PATHWAY` int(11) NOT NULL,
  `SPEC` char(3) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`PATHWAY`,`SPEC`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PW_a_k7m05j9k`
--

DROP TABLE IF EXISTS `PW_a_k7m05j9k`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PW_a_k7m05j9k` (
  `PATHWAY` int(11) NOT NULL,
  `SPEC` char(3) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`PATHWAY`,`SPEC`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PW_a_k7mlsbau`
--

DROP TABLE IF EXISTS `PW_a_k7mlsbau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PW_a_k7mlsbau` (
  `PATHWAY` int(11) NOT NULL,
  `SPEC` char(3) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`PATHWAY`,`SPEC`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PW_a_sessionID`
--

DROP TABLE IF EXISTS `PW_a_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PW_a_sessionID` (
  `PATHWAY` int(11) NOT NULL,
  `SPEC` char(3) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`PATHWAY`,`SPEC`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PW_ac_k7m05j9k`
--

DROP TABLE IF EXISTS `PW_ac_k7m05j9k`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PW_ac_k7m05j9k` (
  `PATHWAY` int(11) NOT NULL,
  `SPEC` char(3) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`PATHWAY`,`SPEC`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PW_ac_sessionID`
--

DROP TABLE IF EXISTS `PW_ac_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PW_ac_sessionID` (
  `PATHWAY` int(11) NOT NULL,
  `SPEC` char(3) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`PATHWAY`,`SPEC`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PW_b_k7m05j9k`
--

DROP TABLE IF EXISTS `PW_b_k7m05j9k`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PW_b_k7m05j9k` (
  `PATHWAY` int(11) NOT NULL,
  `SPEC` char(3) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`PATHWAY`,`SPEC`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PW_b_sessionID`
--

DROP TABLE IF EXISTS `PW_b_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PW_b_sessionID` (
  `PATHWAY` int(11) NOT NULL,
  `SPEC` char(3) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`PATHWAY`,`SPEC`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PW_bc_k7m05j9k`
--

DROP TABLE IF EXISTS `PW_bc_k7m05j9k`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PW_bc_k7m05j9k` (
  `PATHWAY` int(11) NOT NULL,
  `SPEC` char(3) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`PATHWAY`,`SPEC`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PW_bc_sessionID`
--

DROP TABLE IF EXISTS `PW_bc_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PW_bc_sessionID` (
  `PATHWAY` int(11) NOT NULL,
  `SPEC` char(3) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`PATHWAY`,`SPEC`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PW_c_k7m05j9k`
--

DROP TABLE IF EXISTS `PW_c_k7m05j9k`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PW_c_k7m05j9k` (
  `PATHWAY` int(11) NOT NULL,
  `SPEC` char(3) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`PATHWAY`,`SPEC`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PW_c_sessionID`
--

DROP TABLE IF EXISTS `PW_c_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PW_c_sessionID` (
  `PATHWAY` int(11) NOT NULL,
  `SPEC` char(3) NOT NULL,
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`PATHWAY`,`SPEC`,`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `P_a_k7fx0zc9`
--

DROP TABLE IF EXISTS `P_a_k7fx0zc9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `P_a_k7fx0zc9` (
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `P_a_k7kyfiod`
--

DROP TABLE IF EXISTS `P_a_k7kyfiod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `P_a_k7kyfiod` (
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `P_a_k7m05j9k`
--

DROP TABLE IF EXISTS `P_a_k7m05j9k`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `P_a_k7m05j9k` (
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `P_a_k7mlsbau`
--

DROP TABLE IF EXISTS `P_a_k7mlsbau`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `P_a_k7mlsbau` (
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `P_a_sessionID`
--

DROP TABLE IF EXISTS `P_a_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `P_a_sessionID` (
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `P_ac_k7m05j9k`
--

DROP TABLE IF EXISTS `P_ac_k7m05j9k`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `P_ac_k7m05j9k` (
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `P_ac_sessionID`
--

DROP TABLE IF EXISTS `P_ac_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `P_ac_sessionID` (
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `P_b_k7m05j9k`
--

DROP TABLE IF EXISTS `P_b_k7m05j9k`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `P_b_k7m05j9k` (
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `P_b_sessionID`
--

DROP TABLE IF EXISTS `P_b_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `P_b_sessionID` (
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `P_bc_k7m05j9k`
--

DROP TABLE IF EXISTS `P_bc_k7m05j9k`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `P_bc_k7m05j9k` (
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `P_bc_sessionID`
--

DROP TABLE IF EXISTS `P_bc_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `P_bc_sessionID` (
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `P_c_k7m05j9k`
--

DROP TABLE IF EXISTS `P_c_k7m05j9k`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `P_c_k7m05j9k` (
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `P_c_sessionID`
--

DROP TABLE IF EXISTS `P_c_sessionID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `P_c_sessionID` (
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `REACTOME`
--

DROP TABLE IF EXISTS `REACTOME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REACTOME` (
  `ID` int(10) unsigned NOT NULL,
  `SPEC` varchar(3) NOT NULL,
  `IPR_ID` text NOT NULL,
  `PARENTS` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TAXON`
--

DROP TABLE IF EXISTS `TAXON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TAXON` (
  `ID` mediumint(8) unsigned NOT NULL,
  `NAME` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`),
  FULLTEXT KEY `taxon_name_idx` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TAXON_HIERARCHY`
--

DROP TABLE IF EXISTS `TAXON_HIERARCHY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TAXON_HIERARCHY` (
  `CHILD` mediumint(8) unsigned NOT NULL,
  `PARENT` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`CHILD`,`PARENT`),
  KEY `tax_h_parent_idx` (`PARENT`),
  CONSTRAINT `fk_tax_child` FOREIGN KEY (`CHILD`) REFERENCES `TAXON` (`ID`),
  CONSTRAINT `fk_tax_parent` FOREIGN KEY (`PARENT`) REFERENCES `TAXON` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TERM_RELATIONS`
--

DROP TABLE IF EXISTS `TERM_RELATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TERM_RELATIONS` (
  `TERM_ID` int(11) NOT NULL,
  `IS_A` int(11) NOT NULL,
  PRIMARY KEY (`TERM_ID`,`IS_A`),
  KEY `termrelations_isa_idx` (`IS_A`),
  CONSTRAINT `fk_go_id` FOREIGN KEY (`TERM_ID`) REFERENCES `GO_TERMS` (`TERM_ID`),
  CONSTRAINT `fk_go_isa` FOREIGN KEY (`IS_A`) REFERENCES `GO_TERMS` (`TERM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `protlist1_k7kyfiod`
--

DROP TABLE IF EXISTS `protlist1_k7kyfiod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protlist1_k7kyfiod` (
  `ACCESSION` varchar(10) NOT NULL,
  PRIMARY KEY (`ACCESSION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'comp_prot_tool2'
--
/*!50003 DROP PROCEDURE IF EXISTS `1SET_DBank_a_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `1SET_DBank_a_`(IN s_id VARCHAR(64))
BEGIN

SET @DBank = CONCAT('DBank_a_',s_id);
SET @sDBank = CONCAT('SELECT COMPID,IDURL,NAME,SYN,DEF FROM DRUGBANK INNER JOIN ',@DBank,' ON DRUGBANK.COMPID=',@DBank,'.CID;');


PREPARE stmtDBank FROM @sDBank;
EXECUTE stmtDBank;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `1SET_DM_a_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `1SET_DM_a_`(IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_a_',s_id);
SET @sDM = CONCAT('SELECT IPR,PARENTS,ACCESSION FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `1SET_GB_a_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `1SET_GB_a_`(IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_a_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,PARENTS,DEPTH,ACCESSION FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `1SET_GM_a_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `1SET_GM_a_`(IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_a_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,PARENTS,DEPTH,ACCESSION FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');


PREPARE stmtGM FROM @sGM ;
EXECUTE stmtGM;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `1SET_PW_a_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `1SET_PW_a_`(IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_a_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,PARENTS,ACCESSION FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `1SET_P_a_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `1SET_P_a_`(IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_a_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON ',@P,'.ACCESSION=PROT.ACC;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `2SET_DBank_a_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `2SET_DBank_a_`(IN s_id VARCHAR(64))
BEGIN

SET @DBank = CONCAT('DBank_a_',s_id);
SET @sDBank = CONCAT('SELECT COMPID,IDURL,NAME,SYN,DEF FROM DRUGBANK INNER JOIN ',@DBank,' ON DRUGBANK.COMPID=',@DBank,'.CID;');

PREPARE stmtDBank FROM @sDBank;
EXECUTE stmtDBank;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `2SET_DBank_b_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `2SET_DBank_b_`(IN s_id VARCHAR(64))
BEGIN

SET @DBank = CONCAT('DBank_b_',s_id);
SET @sDBank = CONCAT('SELECT COMPID,IDURL,NAME,SYN,DEF FROM DRUGBANK INNER JOIN ',@DBank,' ON DRUGBANK.COMPID=',@DBank,'.CID;');

PREPARE stmtDBank FROM @sDBank;
EXECUTE stmtDBank;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `2SET_DBank_c_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `2SET_DBank_c_`(IN s_id VARCHAR(64))
BEGIN

SET @DBank = CONCAT('DBank_c_',s_id);
SET @sDBank = CONCAT('SELECT COMPID,IDURL,NAME,SYN,DEF FROM DRUGBANK INNER JOIN ',@DBank,' ON DRUGBANK.COMPID=',@DBank,'.CID;');

PREPARE stmtDBank FROM @sDBank;
EXECUTE stmtDBank;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `2SET_DM_a_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `2SET_DM_a_`(IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_a_',s_id);
SET @sDM = CONCAT('SELECT IPR,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `2SET_DM_b_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `2SET_DM_b_`(IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_b_',s_id);
SET @sDM = CONCAT('SELECT IPR,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `2SET_DM_c_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `2SET_DM_c_`(IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_c_',s_id);
SET @sDM = CONCAT('SELECT IPR,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `2SET_GB_a_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `2SET_GB_a_`(IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_a_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `2SET_GB_b_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `2SET_GB_b_`(IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_b_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `2SET_GB_c_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `2SET_GB_c_`(IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_c_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `2SET_GM_a_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `2SET_GM_a_`(IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_a_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `2SET_GM_b_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `2SET_GM_b_`(IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_b_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `2SET_GM_c_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `2SET_GM_c_`(IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_c_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `2SET_PW_a_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `2SET_PW_a_`(IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_a_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,PARENTS,ACCESSION FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `2SET_PW_b_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `2SET_PW_b_`(IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_b_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `2SET_PW_c_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `2SET_PW_c_`(IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_c_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `2SET_P_a_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `2SET_P_a_`(IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_a_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `2SET_P_b_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `2SET_P_b_`(IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_b_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `2SET_P_c_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `2SET_P_c_`(IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_c_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_DBank_a_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_DBank_a_`(IN s_id VARCHAR(64))
BEGIN

SET @DBank = CONCAT('DBank_a_',s_id);
SET @sDBank = CONCAT('SELECT COMPID,IDURL,NAME,SYN,DEF FROM DRUGBANK INNER JOIN ',@DBank,' ON DRUGBANK.COMPID=',@DBank,'.CID;');

PREPARE stmtDBank FROM @sDBank;
EXECUTE stmtDBank;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_DBank_b_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_DBank_b_`(IN s_id VARCHAR(64))
BEGIN

SET @DBank = CONCAT('DBank_b_',s_id);
SET @sDBank = CONCAT('SELECT COMPID,IDURL,NAME,SYN,DEF FROM DRUGBANK INNER JOIN ',@DBank,' ON DRUGBANK.COMPID=',@DBank,'.CID;');

PREPARE stmtDBank FROM @sDBank;
EXECUTE stmtDBank;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_DBank_c_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_DBank_c_`(IN s_id VARCHAR(64))
BEGIN

SET @DBank = CONCAT('DBank_c_',s_id);
SET @sDBank = CONCAT('SELECT COMPID,IDURL,NAME,SYN,DEF FROM DRUGBANK INNER JOIN ',@DBank,' ON DRUGBANK.COMPID=',@DBank,'.CID;');

PREPARE stmtDBank FROM @sDBank;
EXECUTE stmtDBank;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_DBank_d_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_DBank_d_`(IN s_id VARCHAR(64))
BEGIN

SET @DBank = CONCAT('DBank_d_',s_id);
SET @sDBank = CONCAT('SELECT COMPID,IDURL,NAME,SYN,DEF FROM DRUGBANK INNER JOIN ',@DBank,' ON DRUGBANK.COMPID=',@DBank,'.CID;');

PREPARE stmtDBank FROM @sDBank;
EXECUTE stmtDBank;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_DBank_e_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_DBank_e_`(IN s_id VARCHAR(64))
BEGIN

SET @DBank = CONCAT('DBank_e_',s_id);
SET @sDBank = CONCAT('SELECT COMPID,IDURL,NAME,SYN,DEF FROM DRUGBANK INNER JOIN ',@DBank,' ON DRUGBANK.COMPID=',@DBank,'.CID;');

PREPARE stmtDBank FROM @sDBank;
EXECUTE stmtDBank;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_DBank_f_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_DBank_f_`(IN s_id VARCHAR(64))
BEGIN

SET @DBank = CONCAT('DBank_f_',s_id);
SET @sDBank = CONCAT('SELECT COMPID,IDURL,NAME,SYN,DEF FROM DRUGBANK INNER JOIN ',@DBank,' ON DRUGBANK.COMPID=',@DBank,'.CID;');

PREPARE stmtDBank FROM @sDBank;
EXECUTE stmtDBank;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_DBank_g_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_DBank_g_`(IN s_id VARCHAR(64))
BEGIN

SET @DBank = CONCAT('DBank_g_',s_id);
SET @sDBank = CONCAT('SELECT COMPID,IDURL,NAME,SYN,DEF FROM DRUGBANK INNER JOIN ',@DBank,' ON DRUGBANK.COMPID=',@DBank,'.CID;');

PREPARE stmtDBank FROM @sDBank;
EXECUTE stmtDBank;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_DM_a_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_DM_a_`(IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_a_',s_id);
SET @sDM = CONCAT('SELECT IPR,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_DM_b_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_DM_b_`(IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_b_',s_id);
SET @sDM = CONCAT('SELECT IPR,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_DM_c_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_DM_c_`(IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_c_',s_id);
SET @sDM = CONCAT('SELECT IPR,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_DM_d_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_DM_d_`(IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_d_',s_id);
SET @sDM = CONCAT('SELECT IPR,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_DM_e_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_DM_e_`(IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_e_',s_id);
SET @sDM = CONCAT('SELECT IPR,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_DM_f_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_DM_f_`(IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_f_',s_id);
SET @sDM = CONCAT('SELECT IPR,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_DM_g_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_DM_g_`(IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_g_',s_id);
SET @sDM = CONCAT('SELECT IPR,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_GB_a_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_GB_a_`(IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_a_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_GB_b_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_GB_b_`(IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_b_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_GB_c_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_GB_c_`(IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_c_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_GB_d_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_GB_d_`(IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_d_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_GB_e_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_GB_e_`(IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_e_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_GB_f_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_GB_f_`(IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_f_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_GB_g_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_GB_g_`(IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_g_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_GM_a_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_GM_a_`(IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_a_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_GM_b_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_GM_b_`(IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_b_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_GM_c_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_GM_c_`(IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_c_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_GM_d_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_GM_d_`(IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_d_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_GM_e_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_GM_e_`(IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_e_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_GM_f_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_GM_f_`(IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_f_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_GM_g_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_GM_g_`(IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_g_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_PW_a_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_PW_a_`(IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_a_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_PW_b_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_PW_b_`(IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_b_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_PW_c_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_PW_c_`(IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_c_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_PW_d_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_PW_d_`(IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_d_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_PW_e_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_PW_e_`(IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_e_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_PW_f_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_PW_f_`(IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_f_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_PW_g_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_PW_g_`(IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_g_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_P_a_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_P_a_`(IN s_id VARCHAR(64))
BEGIN


SET @P = CONCAT('P_a_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_P_b_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_P_b_`(IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_b_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_P_c_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_P_c_`(IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_c_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_P_d_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_P_d_`(IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_d_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_P_e_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_P_e_`(IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_e_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_P_f_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_P_f_`(IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_f_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `3SET_P_g_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `3SET_P_g_`(IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_g_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DBank_a_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DBank_a_`(IN s_id VARCHAR(64))
BEGIN

SET @DBank = CONCAT('DBank_a_',s_id);
SET @sDBank = CONCAT('SELECT COMPID,IDURL,NAME,SYN,DEF FROM DRUGBANK INNER JOIN ',@DBank,' ON DRUGBANK.COMPID=',@DBank,'.CID;');

PREPARE stmtDBank FROM @sDBank;
EXECUTE stmtDBank;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DBank_b_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DBank_b_`(IN s_id VARCHAR(64))
BEGIN

SET @DBank = CONCAT('DBank_b_',s_id);
SET @sDBank = CONCAT('SELECT COMPID,IDURL,NAME,SYN,DEF FROM DRUGBANK INNER JOIN ',@DBank,' ON DRUGBANK.COMPID=',@DBank,'.CID;');

PREPARE stmtDBank FROM @sDBank;
EXECUTE stmtDBank;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DBank_c_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DBank_c_`(IN s_id VARCHAR(64))
BEGIN

SET @DBank = CONCAT('DBank_c_',s_id);
SET @sDBank = CONCAT('SELECT COMPID,IDURL,NAME,SYN,DEF FROM DRUGBANK INNER JOIN ',@DBank,' ON DRUGBANK.COMPID=',@DBank,'.CID;');

PREPARE stmtDBank FROM @sDBank;
EXECUTE stmtDBank;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DBank_d_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DBank_d_`(IN s_id VARCHAR(64))
BEGIN

SET @DBank = CONCAT('DBank_d_',s_id);
SET @sDBank = CONCAT('SELECT COMPID,IDURL,NAME,SYN,DEF FROM DRUGBANK INNER JOIN ',@DBank,' ON DRUGBANK.COMPID=',@DBank,'.CID;');

PREPARE stmtDBank FROM @sDBank;
EXECUTE stmtDBank;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DBank_e_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DBank_e_`(IN s_id VARCHAR(64))
BEGIN

SET @DBank = CONCAT('DBank_e_',s_id);
SET @sDBank = CONCAT('SELECT COMPID,IDURL,NAME,SYN,DEF FROM DRUGBANK INNER JOIN ',@DBank,' ON DRUGBANK.COMPID=',@DBank,'.CID;');

PREPARE stmtDBank FROM @sDBank;
EXECUTE stmtDBank;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DBank_f_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DBank_f_`(IN s_id VARCHAR(64))
BEGIN

SET @DBank = CONCAT('DBank_f_',s_id);
SET @sDBank = CONCAT('SELECT COMPID,IDURL,NAME,SYN,DEF FROM DRUGBANK INNER JOIN ',@DBank,' ON DRUGBANK.COMPID=',@DBank,'.CID;');

PREPARE stmtDBank FROM @sDBank;
EXECUTE stmtDBank;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DBank_g_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DBank_g_`(IN s_id VARCHAR(64))
BEGIN

SET @DBank = CONCAT('DBank_g_',s_id);
SET @sDBank = CONCAT('SELECT COMPID,IDURL,NAME,SYN,DEF FROM DRUGBANK INNER JOIN ',@DBank,' ON DRUGBANK.COMPID=',@DBank,'.CID;');

PREPARE stmtDBank FROM @sDBank;
EXECUTE stmtDBank;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DBank_h_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DBank_h_`(IN s_id VARCHAR(64))
BEGIN

SET @DBank = CONCAT('DBank_h_',s_id);
SET @sDBank = CONCAT('SELECT COMPID,IDURL,NAME,SYN,DEF FROM DRUGBANK INNER JOIN ',@DBank,' ON DRUGBANK.COMPID=',@DBank,'.CID;');

PREPARE stmtDBank FROM @sDBank;
EXECUTE stmtDBank;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DBank_i_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DBank_i_`(IN s_id VARCHAR(64))
BEGIN

SET @DBank = CONCAT('DBank_i_',s_id);
SET @sDBank = CONCAT('SELECT COMPID,IDURL,NAME,SYN,DEF FROM DRUGBANK INNER JOIN ',@DBank,' ON DRUGBANK.COMPID=',@DBank,'.CID;');

PREPARE stmtDBank FROM @sDBank;
EXECUTE stmtDBank;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DBank_j_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DBank_j_`(IN s_id VARCHAR(64))
BEGIN

SET @DBank = CONCAT('DBank_j_',s_id);
SET @sDBank = CONCAT('SELECT COMPID,IDURL,NAME,SYN,DEF FROM DRUGBANK INNER JOIN ',@DBank,' ON DRUGBANK.COMPID=',@DBank,'.CID;');

PREPARE stmtDBank FROM @sDBank;
EXECUTE stmtDBank;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DBank_k_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DBank_k_`(IN s_id VARCHAR(64))
BEGIN

SET @DBank = CONCAT('DBank_k_',s_id);
SET @sDBank = CONCAT('SELECT COMPID,IDURL,NAME,SYN,DEF FROM DRUGBANK INNER JOIN ',@DBank,' ON DRUGBANK.COMPID=',@DBank,'.CID;');

PREPARE stmtDBank FROM @sDBank;
EXECUTE stmtDBank;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DBank_l_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DBank_l_`(IN s_id VARCHAR(64))
BEGIN

SET @DBank = CONCAT('DBank_l_',s_id);
SET @sDBank = CONCAT('SELECT COMPID,IDURL,NAME,SYN,DEF FROM DRUGBANK INNER JOIN ',@DBank,' ON DRUGBANK.COMPID=',@DBank,'.CID;');

PREPARE stmtDBank FROM @sDBank;
EXECUTE stmtDBank;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DBank_m_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DBank_m_`(IN s_id VARCHAR(64))
BEGIN

SET @DBank = CONCAT('DBank_m_',s_id);
SET @sDBank = CONCAT('SELECT COMPID,IDURL,NAME,SYN,DEF FROM DRUGBANK INNER JOIN ',@DBank,' ON DRUGBANK.COMPID=',@DBank,'.CID;');

PREPARE stmtDBank FROM @sDBank;
EXECUTE stmtDBank;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DBank_n_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DBank_n_`(IN s_id VARCHAR(64))
BEGIN

SET @DBank = CONCAT('DBank_n_',s_id);
SET @sDBank = CONCAT('SELECT COMPID,IDURL,NAME,SYN,DEF FROM DRUGBANK INNER JOIN ',@DBank,' ON DRUGBANK.COMPID=',@DBank,'.CID;');

PREPARE stmtDBank FROM @sDBank;
EXECUTE stmtDBank;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DBank_o_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DBank_o_`(IN s_id VARCHAR(64))
BEGIN

SET @DBank = CONCAT('DBank_o_',s_id);
SET @sDBank = CONCAT('SELECT COMPID,IDURL,NAME,SYN,DEF FROM DRUGBANK INNER JOIN ',@DBank,' ON DRUGBANK.COMPID=',@DBank,'.CID;');

PREPARE stmtDBank FROM @sDBank;
EXECUTE stmtDBank;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DM_a_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DM_a_`(IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_a_',s_id);
SET @sDM = CONCAT('SELECT IPR,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DM_b_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DM_b_`(IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_b_',s_id);
SET @sDM = CONCAT('SELECT IPR,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DM_c_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DM_c_`(IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_c_',s_id);
SET @sDM = CONCAT('SELECT IPR,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DM_d_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DM_d_`(IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_d_',s_id);
SET @sDM = CONCAT('SELECT IPR,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DM_e_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DM_e_`(IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_e_',s_id);
SET @sDM = CONCAT('SELECT IPR,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DM_f_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DM_f_`(IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_f_',s_id);
SET @sDM = CONCAT('SELECT IPR,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DM_g_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DM_g_`(IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_g_',s_id);
SET @sDM = CONCAT('SELECT IPR,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DM_h_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DM_h_`(IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_h_',s_id);
SET @sDM = CONCAT('SELECT IPR,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DM_i_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DM_i_`(IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_i_',s_id);
SET @sDM = CONCAT('SELECT IPR,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DM_j_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DM_j_`(IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_j_',s_id);
SET @sDM = CONCAT('SELECT IPR,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DM_k_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DM_k_`(IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_k_',s_id);
SET @sDM = CONCAT('SELECT IPR,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DM_l_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DM_l_`(IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_l_',s_id);
SET @sDM = CONCAT('SELECT IPR,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DM_m_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DM_m_`(IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_m_',s_id);
SET @sDM = CONCAT('SELECT IPR,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DM_n_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DM_n_`(IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_n_',s_id);
SET @sDM = CONCAT('SELECT IPR,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_DM_o_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_DM_o_`(IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_o_',s_id);
SET @sDM = CONCAT('SELECT IPR,PARENTS FROM PFAM INNER JOIN ',@DM,' ON PFAM.PFAM_ID=',@DM,'.DOMAIN;');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GB_a_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GB_a_`(IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_a_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GB_b_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GB_b_`(IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_b_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GB_c_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GB_c_`(IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_c_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GB_d_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GB_d_`(IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_d_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GB_e_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GB_e_`(IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_e_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GB_f_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GB_f_`(IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_f_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GB_g_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GB_g_`(IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_g_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GB_h_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GB_h_`(IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_h_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GB_i_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GB_i_`(IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_i_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GB_j_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GB_j_`(IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_j_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GB_k_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GB_k_`(IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_k_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GB_l_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GB_l_`(IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_l_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GB_m_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GB_m_`(IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_m_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GB_n_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GB_n_`(IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_n_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GB_o_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GB_o_`(IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_o_',s_id);
SET @sGB = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM BIOPROC INNER JOIN ',@GB,' ON BIOPROC.GO_BIOPROC=',@GB,'.ONTOLOGY;');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GM_a_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GM_a_`(IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_a_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GM_b_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GM_b_`(IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_b_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GM_c_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GM_c_`(IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_c_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GM_d_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GM_d_`(IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_d_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GM_e_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GM_e_`(IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_e_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GM_f_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GM_f_`(IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_f_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GM_g_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GM_g_`(IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_g_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GM_h_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GM_h_`(IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_h_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GM_i_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GM_i_`(IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_i_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GM_j_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GM_j_`(IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_j_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GM_k_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GM_k_`(IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_k_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GM_l_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GM_l_`(IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_l_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GM_m_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GM_m_`(IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_m_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GM_n_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GM_n_`(IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_n_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_GM_o_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_GM_o_`(IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_o_',s_id);
SET @sGM = CONCAT('SELECT GO_ID,PARENTS,DEPTH FROM MOLFUNC INNER JOIN ',@GM,' ON MOLFUNC.GO_MOLFUNC=',@GM,'.ONTOLOGY;');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_PW_a_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_PW_a_`(IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_a_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_PW_b_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_PW_b_`(IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_b_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_PW_c_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_PW_c_`(IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_c_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_PW_d_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_PW_d_`(IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_d_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_PW_e_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_PW_e_`(IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_e_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_PW_f_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_PW_f_`(IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_f_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_PW_g_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_PW_g_`(IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_g_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_PW_h_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_PW_h_`(IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_h_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_PW_i_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_PW_i_`(IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_i_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_PW_j_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_PW_j_`(IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_j_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_PW_k_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_PW_k_`(IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_k_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_PW_l_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_PW_l_`(IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_l_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_PW_m_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_PW_m_`(IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_m_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_PW_n_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_PW_n_`(IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_n_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_PW_o_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_PW_o_`(IN s_id VARCHAR(64))
BEGIN

SET @PW = CONCAT('PW_o_',s_id);
SET @sPW = CONCAT('SELECT IPR_ID,PARENTS FROM REACTOME INNER JOIN ',@PW,' ON REACTOME.ID=',@PW,'.PATHWAY AND REACTOME.SPEC=',@PW,'.SPEC;');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_P_a_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_P_a_`(IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_a_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_P_b_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_P_b_`(IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_b_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_P_c_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_P_c_`(IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_c_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_P_d_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_P_d_`(IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_d_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_P_e_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_P_e_`(IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_e_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_P_f_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_P_f_`(IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_f_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_P_g_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_P_g_`(IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_g_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_P_h_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_P_h_`(IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_h_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_P_i_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_P_i_`(IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_i_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_P_j_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_P_j_`(IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_j_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_P_k_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_P_k_`(IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_k_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_P_l_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_P_l_`(IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_l_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_P_m_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_P_m_`(IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_m_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_P_n_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_P_n_`(IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_n_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `4SET_P_o_` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `4SET_P_o_`(IN s_id VARCHAR(64))
BEGIN

SET @P = CONCAT('P_o_',s_id);
SET @sP = CONCAT('SELECT PROT.ACCESSION,NAME,TAXON_ID,TAXON_NAME,IS_REVIEWED FROM PROT INNER JOIN ',@P,' ON PROT.ACC=',@P,'.ACCESSION;');

PREPARE stmtP FROM @sP;
EXECUTE stmtP;

 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DBank_1SET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DBank_1SET`(IN s_id VARCHAR(64))
BEGIN

SET @DBank = CONCAT('DBank_a_',s_id);
SET @plist = CONCAT('protlist1_',s_id);
SET @sDBank = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT CID,ACCESSION from PROTEIN_COMPOUND, COMPOUND where PROTEIN_COMPOUND.CID=COMPOUND.ID AND ACCESSION IN (select ACCESSION from ', @plist,');');

PREPARE stmtDBank FROM @sDBank;
EXECUTE stmtDBank;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DBank_2SET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DBank_2SET`(IN s_id VARCHAR(64))
BEGIN

SET @DBank_b = CONCAT('DBank_b_',s_id);
SET @DBank_c = CONCAT('DBank_c_',s_id);
SET @DBank_a = CONCAT('DBank_a_',s_id);
SET @DBank_bc = CONCAT('DBank_bc_',s_id);
SET @DBank_ac = CONCAT('DBank_ac_',s_id);

SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);

SET @sDBank_bc = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_bc,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT PROTEIN_COMPOUND.CID,PROTEIN_COMPOUND.ACCESSION  from PROTEIN_COMPOUND, COMPOUND where PROTEIN_COMPOUND.CID=COMPOUND.ID AND ACCESSION IN (select ACCESSION from ',@plist1,');');
SET @sDBank_ac = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_ac,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT PROTEIN_COMPOUND.CID,PROTEIN_COMPOUND.ACCESSION  from PROTEIN_COMPOUND, COMPOUND where PROTEIN_COMPOUND.CID=COMPOUND.ID AND ACCESSION IN (select ACCESSION from ',@plist2,');');

SET @sDBank_c = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_c,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_bc,'.CID,',@DBank_bc,'.ACCESSION  from ',@DBank_bc,' join ',@DBank_ac,' on ',@DBank_bc,'.CID=',@DBank_ac,'.CID;');
SET @sDBank_b = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_b,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_bc,'.CID,',@DBank_bc,'.ACCESSION  from ',@DBank_bc,' left outer join ',@DBank_ac,' on ',@DBank_bc,'.CID=',@DBank_ac,'.CID where ',@DBank_ac,'.CID is null;');
SET @sDBank_a = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_a,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_ac,'.CID,',@DBank_ac,'.ACCESSION  from ',@DBank_ac,' left outer join ',@DBank_bc,' on ',@DBank_bc,'.CID=',@DBank_ac,'.CID where ',@DBank_bc,'.CID is null;');

PREPARE stmtDBank_bc FROM @sDBank_bc;
EXECUTE stmtDBank_bc;

PREPARE stmtDBank_ac FROM @sDBank_ac;
EXECUTE stmtDBank_ac;

PREPARE stmtDBank_a FROM @sDBank_a;
EXECUTE stmtDBank_a;

PREPARE stmtDBank_b FROM @sDBank_b;
EXECUTE stmtDBank_b;

PREPARE stmtDBank_c FROM @sDBank_c;
EXECUTE stmtDBank_c;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DBank_3SET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DBank_3SET`(IN s_id VARCHAR(64))
BEGIN

SET @DBank_a = CONCAT('DBank_a_',s_id);
SET @DBank_b = CONCAT('DBank_b_',s_id);
SET @DBank_c = CONCAT('DBank_c_',s_id);
SET @DBank_d = CONCAT('DBank_d_',s_id);
SET @DBank_e = CONCAT('DBank_e_',s_id);
SET @DBank_f = CONCAT('DBank_f_',s_id);
SET @DBank_g = CONCAT('DBank_g_',s_id);

SET @DBank_fg = CONCAT('DBank_fg_',s_id);
SET @DBank_eg = CONCAT('DBank_eg_',s_id);
SET @DBank_cg = CONCAT('DBank_cg_',s_id);

SET @DBank_defg = CONCAT('DBank_defg_',s_id);
SET @DBank_bcfg = CONCAT('DBank_bcfg_',s_id);
SET @DBank_aceg = CONCAT('DBank_aceg_',s_id);

SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);
SET @plist3 = CONCAT('protlist3_',s_id);

SET @sDBank_defg = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_defg,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT CID,ACCESSION from PROTEIN_COMPOUND, COMPOUND where PROTEIN_COMPOUND.CID=COMPOUND.ID AND ACCESSION IN (select ACCESSION from ',@plist1,');');
SET @sDBank_bcfg = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_bcfg,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT CID,ACCESSION from PROTEIN_COMPOUND, COMPOUND where PROTEIN_COMPOUND.CID=COMPOUND.ID AND ACCESSION IN (select ACCESSION from ',@plist2,');');
SET @sDBank_aceg = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_aceg,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT CID,ACCESSION from PROTEIN_COMPOUND, COMPOUND where PROTEIN_COMPOUND.CID=COMPOUND.ID AND ACCESSION IN (select ACCESSION from ',@plist3,');');

SET @sDBank_fg = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_fg,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_defg,'.CID, ',@DBank_defg,'.ACCESSION from ',@DBank_defg,' join ',@DBank_bcfg,' on ',@DBank_defg,'.CID=',@DBank_bcfg,'.CID;');
SET @sDBank_eg = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_eg,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_defg,'.CID, ',@DBank_defg,'.ACCESSION from ',@DBank_defg,' join ',@DBank_aceg,' on ',@DBank_defg,'.CID=',@DBank_aceg,'.CID;');
SET @sDBank_cg = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_cg,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_bcfg,'.CID, ',@DBank_bcfg,'.ACCESSION from ',@DBank_bcfg,' join ',@DBank_aceg,' on ',@DBank_bcfg,'.CID=',@DBank_aceg,'.CID;');

SET @sDBank_g = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_g,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_fg,'.CID, ',@DBank_fg,'.ACCESSION from ',@DBank_fg,' join ',@DBank_eg,' on ',@DBank_fg,'.CID=',@DBank_eg,'.CID and ',@DBank_fg,'.CID IN ( select CID from ',@DBank_cg,');');

SET @sDBank_f = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_f,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_fg,'.CID, ',@DBank_fg,'.ACCESSION from ',@DBank_fg,' left outer join ',@DBank_aceg,' on ',@DBank_fg,'.CID=',@DBank_aceg,'.CID where ',@DBank_aceg,'.CID is null;');
SET @sDBank_e = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_e,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_eg,'.CID, ',@DBank_eg,'.ACCESSION from ',@DBank_eg,' left outer join ',@DBank_bcfg,' on ',@DBank_eg,'.CID=',@DBank_bcfg,'.CID where ',@DBank_bcfg,'.CID is null;');
SET @sDBank_c = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_c,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_cg,'.CID, ',@DBank_cg,'.ACCESSION from ',@DBank_cg,' left outer join ',@DBank_defg,' on ',@DBank_cg,'.CID=',@DBank_defg,'.CID where ',@DBank_defg,'.CID is null;');

SET @sDBank_d = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_d,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_defg,'.CID, ',@DBank_defg,'.ACCESSION from ',@DBank_defg,' where ',@DBank_defg,'.CID NOT IN (select CID from ',@DBank_fg,' union select CID from ',@DBank_eg,');');
SET @sDBank_b = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_b,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_bcfg,'.CID, ',@DBank_bcfg,'.ACCESSION from ',@DBank_bcfg,' where ',@DBank_bcfg,'.CID NOT IN (select CID from ',@DBank_fg,' union select CID from ',@DBank_cg,');');
SET @sDBank_a = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_a,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_aceg,'.CID, ',@DBank_aceg,'.ACCESSION from ',@DBank_aceg,' where ',@DBank_aceg,'.CID NOT IN (select CID from ',@DBank_eg,' union select CID from ',@DBank_cg,');');


PREPARE stmtDBank_defg FROM @sDBank_defg;
EXECUTE stmtDBank_defg;

PREPARE stmtDBank_bcfg FROM @sDBank_bcfg;
EXECUTE stmtDBank_bcfg;

PREPARE stmtDBank_aceg FROM @sDBank_aceg;
EXECUTE stmtDBank_aceg;

PREPARE stmtDBank_fg FROM @sDBank_fg;
EXECUTE stmtDBank_fg;

PREPARE stmtDBank_eg FROM @sDBank_eg; 
EXECUTE stmtDBank_eg; 

PREPARE stmtDBank_cg FROM @sDBank_cg;
EXECUTE stmtDBank_cg;

PREPARE stmtDBank_a FROM @sDBank_a;
EXECUTE stmtDBank_a;

PREPARE stmtDBank_b FROM @sDBank_b;
EXECUTE stmtDBank_b;

PREPARE stmtDBank_c FROM @sDBank_c;
EXECUTE stmtDBank_c;

PREPARE stmtDBank_d FROM @sDBank_d;
EXECUTE stmtDBank_d;

PREPARE stmtDBank_e FROM @sDBank_e;
EXECUTE stmtDBank_e;

PREPARE stmtDBank_f FROM @sDBank_f;
EXECUTE stmtDBank_f;

PREPARE stmtDBank_g FROM @sDBank_g;
EXECUTE stmtDBank_g;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DBank_4SET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DBank_4SET`(IN s_id VARCHAR(64))
BEGIN


SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);
SET @plist3 = CONCAT('protlist3_',s_id);
SET @plist4 = CONCAT('protlist4_',s_id);

SET @DBank_hijklmno = CONCAT('DBank_hijklmno_',s_id);
SET @DBank_defglmno = CONCAT('DBank_defglmno_',s_id);
SET @DBank_bcfgjkno = CONCAT('DBank_bcfgjkno_',s_id);
SET @DBank_acegikmo = CONCAT('DBank_acegikmo_',s_id);

SET @DBank_lmno = CONCAT('DBank_lmno_',s_id);
SET @DBank_jkno = CONCAT('DBank_jkno_',s_id);
SET @DBank_ikmo = CONCAT('DBank_ikmo_',s_id);
SET @DBank_fgno = CONCAT('DBank_fgno_',s_id);
SET @DBank_egmo = CONCAT('DBank_egmo_',s_id);
SET @DBank_cgko = CONCAT('DBank_cgko_',s_id);

SET @DBank_no = CONCAT('DBank_no_',s_id);
SET @DBank_mo = CONCAT('DBank_mo_',s_id);
SET @DBank_ko = CONCAT('DBank_ko_',s_id);
SET @DBank_go = CONCAT('DBank_go_',s_id);

SET @DBank_o = CONCAT('DBank_o_',s_id);
SET @DBank_n = CONCAT('DBank_n_',s_id);
SET @DBank_m = CONCAT('DBank_m_',s_id);
SET @DBank_k = CONCAT('DBank_k_',s_id);
SET @DBank_g = CONCAT('DBank_g_',s_id);

SET @DBank_l = CONCAT('DBank_l_',s_ID);
SET @DBank_j = CONCAT('DBank_j_',s_ID);
SET @DBank_i = CONCAT('DBank_i_',s_ID);
SET @DBank_f = CONCAT('DBank_f_',s_ID);
SET @DBank_e = CONCAT('DBank_e_',s_ID);
SET @DBank_c = CONCAT('DBank_c_',s_ID);


SET @DBank_lm = CONCAT('DBank_lm_',s_ID);
SET @DBank_jk = CONCAT('DBank_jk_',s_ID);
SET @DBank_ik = CONCAT('DBank_ik_',s_ID);
SET @DBank_fg = CONCAT('DBank_fg_',s_ID);
SET @DBank_eg = CONCAT('DBank_eg_',s_ID);
SET @DBank_cg = CONCAT('DBank_cg_',s_ID);

SET @DBank_cegikmo = CONCAT('DBank_cegikmo_',s_ID);
SET @DBank_cfgjkno = CONCAT('DBank_cfgjkno_',s_ID);
SET @DBank_efglmno = CONCAT('DBank_efglmno_',s_ID);
SET @DBank_ijklmno = CONCAT('DBank_ijklmno_',s_ID);


SET @DBank_a = CONCAT('DBank_a_',s_ID);
SET @DBank_b = CONCAT('DBank_b_',s_ID);
SET @DBank_d = CONCAT('DBank_d_',s_ID);
SET @DBank_h = CONCAT('DBank_h_',s_ID);


SET @sDBank_hijklmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_hijklmno,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT CID,ACCESSION from PROTEIN_COMPOUND, COMPOUND where PROTEIN_COMPOUND.CID=COMPOUND.ID AND ACCESSION IN (select ACCESSION from ',@plist1,');');
SET @sDBank_defglmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_defglmno,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT CID,ACCESSION from PROTEIN_COMPOUND, COMPOUND where PROTEIN_COMPOUND.CID=COMPOUND.ID AND ACCESSION IN (select ACCESSION from ',@plist2,');');
SET @sDBank_bcfgjkno = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_bcfgjkno,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT CID,ACCESSION from PROTEIN_COMPOUND, COMPOUND where PROTEIN_COMPOUND.CID=COMPOUND.ID AND ACCESSION IN (select ACCESSION from ',@plist3,');');
SET @sDBank_acegikmo = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_acegikmo,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT CID,ACCESSION from PROTEIN_COMPOUND, COMPOUND where PROTEIN_COMPOUND.CID=COMPOUND.ID AND ACCESSION IN (select ACCESSION from ',@plist4,');');

SET @sDBank_lmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_lmno,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_hijklmno,'.CID, ',@DBank_hijklmno,'.ACCESSION from ',@DBank_hijklmno,' join ',@DBank_defglmno,' on ',@DBank_hijklmno,'.CID=',@DBank_defglmno,'.CID;');
SET @sDBank_jkno = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_jkno,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_hijklmno,'.CID, ',@DBank_hijklmno,'.ACCESSION from ',@DBank_hijklmno,' join ',@DBank_bcfgjkno,' on ',@DBank_hijklmno,'.CID=',@DBank_bcfgjkno,'.CID;');
SET @sDBank_ikmo = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_ikmo,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_hijklmno,'.CID, ',@DBank_hijklmno,'.ACCESSION from ',@DBank_hijklmno,' join ',@DBank_acegikmo,' on ',@DBank_hijklmno,'.CID=',@DBank_acegikmo,'.CID;');
SET @sDBank_fgno = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_fgno,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_defglmno,'.CID, ',@DBank_defglmno,'.ACCESSION from ',@DBank_defglmno,' join ',@DBank_bcfgjkno,' on ',@DBank_defglmno,'.CID=',@DBank_bcfgjkno,'.CID;');
SET @sDBank_egmo = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_egmo,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_defglmno,'.CID, ',@DBank_defglmno,'.ACCESSION from ',@DBank_defglmno,' join ',@DBank_acegikmo,' on ',@DBank_defglmno,'.CID=',@DBank_acegikmo,'.CID;');
SET @sDBank_cgko = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_cgko,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_bcfgjkno,'.CID, ',@DBank_bcfgjkno,'.ACCESSION from ',@DBank_bcfgjkno,' join ',@DBank_acegikmo,' on ',@DBank_bcfgjkno,'.CID=',@DBank_acegikmo,'.CID;');

SET @sDBank_no = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_no,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_hijklmno,'.CID, ',@DBank_hijklmno,'.ACCESSION from ',@DBank_hijklmno,' join ',@DBank_fgno,' on ',@DBank_hijklmno,'.CID=',@DBank_fgno,'.CID;');
SET @sDBank_mo = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_mo,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_hijklmno,'.CID, ',@DBank_hijklmno,'.ACCESSION from ',@DBank_hijklmno,' join ',@DBank_egmo,' on ',@DBank_hijklmno,'.CID=',@DBank_egmo,'.CID;');
SET @sDBank_ko = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_ko,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_hijklmno,'.CID, ',@DBank_hijklmno,'.ACCESSION from ',@DBank_hijklmno,' join ',@DBank_cgko,' on ',@DBank_hijklmno,'.CID=',@DBank_cgko,'.CID;');
SET @sDBank_go = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_go,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_defglmno,'.CID, ',@DBank_defglmno,'.ACCESSION from ',@DBank_defglmno,' join ',@DBank_cgko,' on ',@DBank_defglmno,'.CID=',@DBank_cgko,'.CID;');

SET @sDBank_o = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_o,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_hijklmno,'.CID, ',@DBank_hijklmno,'.ACCESSION from ',@DBank_hijklmno,' join ',@DBank_go,' on ',@DBank_hijklmno,'.CID=',@DBank_go,'.CID;');


SET @sDBank_n = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_n,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_no,'.CID, ',@DBank_no,'.ACCESSION from ',@DBank_no,' left outer join ',@DBank_o,' on ',@DBank_no,'.CID=',@DBank_o,'.CID where ',@DBank_o,'.CID is null;');
SET @sDBank_m = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_m,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_mo,'.CID, ',@DBank_mo,'.ACCESSION from ',@DBank_mo,' left outer join ',@DBank_o,' on ',@DBank_mo,'.CID=',@DBank_o,'.CID where ',@DBank_o,'.CID is null;');
SET @sDBank_k = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_k,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_ko,'.CID, ',@DBank_ko,'.ACCESSION from ',@DBank_ko,' left outer join ',@DBank_o,' on ',@DBank_ko,'.CID=',@DBank_o,'.CID where ',@DBank_o,'.CID is null;');
SET @sDBank_g = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_g,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_go,'.CID, ',@DBank_go,'.ACCESSION from ',@DBank_go,' left outer join ',@DBank_o,' on ',@DBank_go,'.CID=',@DBank_o,'.CID where ',@DBank_o,'.CID is null;');


SET @sDBank_lm = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_lm,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_lmno,'.CID, ',@DBank_lmno,'.ACCESSION from ',@DBank_lmno,' left outer join ',@DBank_no,' on ',@DBank_lmno,'.CID=',@DBank_no,'.CID where ',@DBank_no,'.CID is null;');
SET @sDBank_jk = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_jk,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_jkno,'.CID, ',@DBank_jkno,'.ACCESSION from ',@DBank_jkno,' left outer join ',@DBank_no,' on ',@DBank_jkno,'.CID=',@DBank_no,'.CID where ',@DBank_no,'.CID is null;');
SET @sDBank_ik = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_ik,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_ikmo,'.CID, ',@DBank_ikmo,'.ACCESSION from ',@DBank_ikmo,' left outer join ',@DBank_mo,' on ',@DBank_ikmo,'.CID=',@DBank_mo,'.CID where ',@DBank_mo,'.CID is null;');
SET @sDBank_fg = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_fg,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_fgno,'.CID, ',@DBank_fgno,'.ACCESSION from ',@DBank_fgno,' left outer join ',@DBank_no,' on ',@DBank_fgno,'.CID=',@DBank_no,'.CID where ',@DBank_no,'.CID is null;');
SET @sDBank_eg = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_eg,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_egmo,'.CID, ',@DBank_egmo,'.ACCESSION from ',@DBank_egmo,' left outer join ',@DBank_mo,' on ',@DBank_egmo,'.CID=',@DBank_mo,'.CID where ',@DBank_mo,'.CID is null;');
SET @sDBank_cg = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_cg,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_cgko,'.CID, ',@DBank_cgko,'.ACCESSION from ',@DBank_cgko,' left outer join ',@DBank_ko,' on ',@DBank_cgko,'.CID=',@DBank_ko,'.CID where ',@DBank_ko,'.CID is null;');


SET @sDBank_l = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_l,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_lm,'.CID, ',@DBank_lm,'.ACCESSION from ',@DBank_lm,' left outer join ',@DBank_m,' on ',@DBank_lm,'.CID=',@DBank_m,'.CID where ',@DBank_m,'.CID is null;');
SET @sDBank_j = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_j,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_jk,'.CID, ',@DBank_jk,'.ACCESSION from ',@DBank_jk,' left outer join ',@DBank_k,' on ',@DBank_jk,'.CID=',@DBank_k,'.CID where ',@DBank_k,'.CID is null;');
SET @sDBank_i = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_i,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_ik,'.CID, ',@DBank_ik,'.ACCESSION from ',@DBank_ik,' left outer join ',@DBank_k,' on ',@DBank_ik,'.CID=',@DBank_k,'.CID where ',@DBank_k,'.CID is null;');
SET @sDBank_f = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_f,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_fg,'.CID, ',@DBank_fg,'.ACCESSION from ',@DBank_fg,' left outer join ',@DBank_g,' on ',@DBank_fg,'.CID=',@DBank_g,'.CID where ',@DBank_g,'.CID is null;');
SET @sDBank_e = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_e,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_eg,'.CID, ',@DBank_eg,'.ACCESSION from ',@DBank_eg,' left outer join ',@DBank_g,' on ',@DBank_eg,'.CID=',@DBank_g,'.CID where ',@DBank_g,'.CID is null;');
SET @sDBank_c = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_c,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_cg,'.CID, ',@DBank_cg,'.ACCESSION from ',@DBank_cg,' left outer join ',@DBank_g,' on ',@DBank_cg,'.CID=',@DBank_g,'.CID where ',@DBank_g,'.CID is null;');


SET @sDBank_cegikmo = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_cegikmo,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_egmo,'.CID, ',@DBank_egmo,'.ACCESSION from ',@DBank_egmo,', ',@DBank_ik,', ',@DBank_c,' where ',@DBank_egmo,'.CID=',@DBank_ik,'.CID and ',@DBank_ik,'.CID=',@DBank_c,'.CID;');
SET @sDBank_cfgjkno = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_cfgjkno,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_fgno,'.CID, ',@DBank_fgno,'.ACCESSION from ',@DBank_fgno,', ',@DBank_jk,', ',@DBank_c,' where ',@DBank_fgno,'.CID=',@DBank_jk,'.CID and ',@DBank_jk,'.CID=',@DBank_c,'.CID;');
SET @sDBank_ijklmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_ijklmno,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_lmno,'.CID, ',@DBank_lmno,'.ACCESSION from ',@DBank_lmno,', ',@DBank_jk,', ',@DBank_i,' where ',@DBank_lmno,'.CID=',@DBank_jk,'.CID and ',@DBank_jk,'.CID=',@DBank_i,'.CID;');
SET @sDBank_efglmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_efglmno,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_lmno,'.CID, ',@DBank_lmno,'.ACCESSION from ',@DBank_lmno,', ',@DBank_fg,', ',@DBank_e,' where ',@DBank_lmno,'.CID=',@DBank_fg,'.CID and ',@DBank_fg,'.CID=',@DBank_e,'.CID;');


SET @sDBank_a = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_a,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_acegikmo,'.CID, ',@DBank_acegikmo,'.ACCESSION from ',@DBank_acegikmo,' left outer join ',@DBank_cegikmo,' on ',@DBank_acegikmo,'.CID=',@DBank_cegikmo,'.CID where ',@DBank_cegikmo,'.CID is null;');
SET @sDBank_b = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_b,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_bcfgjkno,'.CID, ',@DBank_bcfgjkno,'.ACCESSION from ',@DBank_bcfgjkno,' left outer join ',@DBank_cfgjkno,' on ',@DBank_bcfgjkno,'.CID=',@DBank_cfgjkno,'.CID where ',@DBank_cfgjkno,'.CID is null;');
SET @sDBank_d = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_d,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_defglmno,'.CID, ',@DBank_defglmno,'.ACCESSION from ',@DBank_defglmno,' left outer join ',@DBank_efglmno,' on ',@DBank_defglmno,'.CID=',@DBank_efglmno,'.CID where ',@DBank_efglmno,'.CID is null;');
SET @sDBank_h = CONCAT('CREATE TABLE IF NOT EXISTS ',@DBank_h,' (PRIMARY KEY my_pkey (CID,ACCESSION)) select DISTINCT ',@DBank_hijklmno,'.CID, ',@DBank_hijklmno,'.ACCESSION from ',@DBank_hijklmno,' left outer join ',@DBank_ijklmno,' on ',@DBank_hijklmno,'.CID=',@DBank_ijklmno,'.CID where ',@DBank_ijklmno,'.CID is null;');


PREPARE stmtDBank_hijklmno FROM @sDBank_hijklmno;
EXECUTE stmtDBank_hijklmno;

PREPARE stmtDBank_defglmno FROM @sDBank_defglmno;
EXECUTE stmtDBank_defglmno;

PREPARE stmtDBank_bcfgjkno FROM @sDBank_bcfgjkno;
EXECUTE stmtDBank_bcfgjkno;

PREPARE stmtDBank_acegikmo FROM @sDBank_acegikmo;
EXECUTE stmtDBank_acegikmo;

PREPARE stmtDBank_lmno FROM @sDBank_lmno;
EXECUTE stmtDBank_lmno;

PREPARE stmtDBank_jkno FROM @sDBank_jkno;
EXECUTE stmtDBank_jkno;

PREPARE stmtDBank_ikmo FROM @sDBank_ikmo;
EXECUTE stmtDBank_ikmo;

PREPARE stmtDBank_fgno FROM @sDBank_fgno;
EXECUTE stmtDBank_fgno;

PREPARE stmtDBank_egmo FROM @sDBank_egmo;
EXECUTE stmtDBank_egmo;

PREPARE stmtDBank_cgko FROM @sDBank_cgko;
EXECUTE stmtDBank_cgko;

PREPARE stmtDBank_no FROM @sDBank_no;
EXECUTE stmtDBank_no;

PREPARE stmtDBank_mo FROM @sDBank_mo;
EXECUTE stmtDBank_mo;

PREPARE stmtDBank_ko FROM @sDBank_ko;
EXECUTE stmtDBank_ko;

PREPARE stmtDBank_go FROM @sDBank_go;
EXECUTE stmtDBank_go;

PREPARE stmtDBank_o FROM @sDBank_o;
EXECUTE stmtDBank_o;

PREPARE stmtDBank_n FROM @sDBank_n;
EXECUTE stmtDBank_n;

PREPARE stmtDBank_m FROM @sDBank_m;
EXECUTE stmtDBank_m;

PREPARE stmtDBank_k FROM @sDBank_k;
EXECUTE stmtDBank_k;

PREPARE stmtDBank_g FROM @sDBank_g;
EXECUTE stmtDBank_g;

PREPARE stmtDBank_lm FROM @sDBank_lm;
EXECUTE stmtDBank_lm;

PREPARE stmtDBank_l FROM @sDBank_l;
EXECUTE stmtDBank_l;

PREPARE stmtDBank_jk FROM @sDBank_jk;
EXECUTE stmtDBank_jk;

PREPARE stmtDBank_j FROM @sDBank_j;
EXECUTE stmtDBank_j;

PREPARE stmtDBank_ik FROM @sDBank_ik;
EXECUTE stmtDBank_ik;

PREPARE stmtDBank_i FROM @sDBank_i;
EXECUTE stmtDBank_i;

PREPARE stmtDBank_fg FROM @sDBank_fg;
EXECUTE stmtDBank_fg;

PREPARE stmtDBank_f FROM @sDBank_f;
EXECUTE stmtDBank_f;

PREPARE stmtDBank_eg FROM @sDBank_eg;
EXECUTE stmtDBank_eg;

PREPARE stmtDBank_e FROM @sDBank_e;
EXECUTE stmtDBank_e;

PREPARE stmtDBank_cg FROM @sDBank_cg;
EXECUTE stmtDBank_cg;

PREPARE stmtDBank_c FROM @sDBank_c;
EXECUTE stmtDBank_c;


PREPARE stmtDBank_cegikmo FROM @sDBank_cegikmo;
EXECUTE stmtDBank_cegikmo;

PREPARE stmtDBank_cfgjkno FROM @sDBank_cfgjkno;
EXECUTE stmtDBank_cfgjkno;

PREPARE stmtDBank_ijklmno FROM @sDBank_ijklmno;
EXECUTE stmtDBank_ijklmno;

PREPARE stmtDBank_efglmno FROM @sDBank_efglmno;
EXECUTE stmtDBank_efglmno;


PREPARE stmtDBank_a FROM @sDBank_a;
EXECUTE stmtDBank_a;

PREPARE stmtDBank_b FROM @sDBank_b;
EXECUTE stmtDBank_b;

PREPARE stmtDBank_d FROM @sDBank_d;
EXECUTE stmtDBank_d;

PREPARE stmtDBank_h FROM @sDBank_h;
EXECUTE stmtDBank_h;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DM_1SET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DM_1SET`(IN s_id VARCHAR(64))
BEGIN

SET @DM = CONCAT('DM_a_',s_id);
SET @plist = CONCAT('protlist1_',s_id);
SET @sDM = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT DOMAIN,ACCESSION from PROTEIN_DOMAIN, DOMAIN where PROTEIN_DOMAIN.DOMAIN=DOMAIN.PFAM AND ACCESSION IN (select ACCESSION from ',@plist,');');

PREPARE stmtDM FROM @sDM;
EXECUTE stmtDM;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DM_2SET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DM_2SET`(IN s_id VARCHAR(64))
BEGIN

SET @DM_a = CONCAT('DM_a_',s_id);
SET @DM_b = CONCAT('DM_b_',s_id);
SET @DM_c = CONCAT('DM_c_',s_id);
SET @DM_bc = CONCAT('DM_bc_',s_id);
SET @DM_ac = CONCAT('DM_ac_',s_id);

SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);


SET @sDM_bc = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_bc,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT DOMAIN,ACCESSION from PROTEIN_DOMAIN, DOMAIN where PROTEIN_DOMAIN.DOMAIN=DOMAIN.PFAM AND ACCESSION IN (select ACCESSION from ',@plist1,');');
SET @sDM_ac = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_ac,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT DOMAIN,ACCESSION from PROTEIN_DOMAIN, DOMAIN where PROTEIN_DOMAIN.DOMAIN=DOMAIN.PFAM AND ACCESSION IN (select ACCESSION from ',@plist2,');');

SET @sDM_c = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_c,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_bc,'.DOMAIN,',@DM_bc,'.ACCESSION  from ',@DM_bc,' join ',@DM_ac,' on ',@DM_bc,'.DOMAIN=',@DM_ac,'.DOMAIN;');
SET @sDM_b = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_b,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_bc,'.DOMAIN,',@DM_bc,'.ACCESSION  from ',@DM_bc,' left outer join ',@DM_ac,' on ',@DM_bc,'.DOMAIN=',@DM_ac,'.DOMAIN where ',@DM_ac,'.DOMAIN is null;');
SET @sDM_a = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_a,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_ac,'.DOMAIN,',@DM_ac,'.ACCESSION  from ',@DM_ac,' left outer join ',@DM_bc,' on ',@DM_bc,'.DOMAIN=',@DM_ac,'.DOMAIN where ',@DM_bc,'.DOMAIN is null;');


PREPARE stmtDM_bc FROM @sDM_bc;
EXECUTE stmtDM_bc;

PREPARE stmtDM_ac FROM @sDM_ac;
EXECUTE stmtDM_ac;

PREPARE stmtDM_a FROM @sDM_a;
EXECUTE stmtDM_a;

PREPARE stmtDM_b FROM @sDM_b;
EXECUTE stmtDM_b;

PREPARE stmtDM_c FROM @sDM_c;
EXECUTE stmtDM_c;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DM_3SET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DM_3SET`(IN s_id VARCHAR(64))
BEGIN

SET @DM_a = CONCAT('DM_a_',s_id);
SET @DM_b = CONCAT('DM_b_',s_id);
SET @DM_c = CONCAT('DM_c_',s_id);
SET @DM_d = CONCAT('DM_d_',s_id);
SET @DM_e = CONCAT('DM_e_',s_id);
SET @DM_f = CONCAT('DM_f_',s_id);
SET @DM_g = CONCAT('DM_g_',s_id);

SET @DM_fg = CONCAT('DM_fg_',s_id);
SET @DM_eg = CONCAT('DM_eg_',s_id);
SET @DM_cg = CONCAT('DM_cg_',s_id);

SET @DM_defg = CONCAT('DM_defg_',s_id);
SET @DM_bcfg = CONCAT('DM_bcfg_',s_id);
SET @DM_aceg = CONCAT('DM_aceg_',s_id);

SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);
SET @plist3 = CONCAT('protlist3_',s_id);

SET @sDM_defg = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_defg,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT DOMAIN,ACCESSION from PROTEIN_DOMAIN, DOMAIN where PROTEIN_DOMAIN.DOMAIN=DOMAIN.PFAM AND ACCESSION IN (select ACCESSION from ',@plist1,');');
SET @sDM_bcfg = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_bcfg,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT DOMAIN,ACCESSION from PROTEIN_DOMAIN, DOMAIN where PROTEIN_DOMAIN.DOMAIN=DOMAIN.PFAM AND ACCESSION IN (select ACCESSION from ',@plist2,');');
SET @sDM_aceg = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_aceg,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT DOMAIN,ACCESSION from PROTEIN_DOMAIN, DOMAIN where PROTEIN_DOMAIN.DOMAIN=DOMAIN.PFAM AND ACCESSION IN (select ACCESSION from ',@plist3,');');

SET @sDM_fg = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_fg,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_defg,'.DOMAIN, ',@DM_defg,'.ACCESSION from ',@DM_defg,' join ',@DM_bcfg,' on ',@DM_defg,'.DOMAIN=',@DM_bcfg,'.DOMAIN;');
SET @sDM_eg = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_eg,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_defg,'.DOMAIN, ',@DM_defg,'.ACCESSION from ',@DM_defg,' join ',@DM_aceg,' on ',@DM_defg,'.DOMAIN=',@DM_aceg,'.DOMAIN;');
SET @sDM_cg = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_cg,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_bcfg,'.DOMAIN, ',@DM_bcfg,'.ACCESSION from ',@DM_bcfg,' join ',@DM_aceg,' on ',@DM_bcfg,'.DOMAIN=',@DM_aceg,'.DOMAIN;');

SET @sDM_g = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_g,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_fg,'.DOMAIN, ',@DM_fg,'.ACCESSION from ',@DM_fg,' join ',@DM_eg,' on ',@DM_fg,'.DOMAIN=',@DM_eg,'.DOMAIN and ',@DM_fg,'.DOMAIN IN ( select DOMAIN from ',@DM_cg,');');

SET @sDM_f = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_f,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_fg,'.DOMAIN, ',@DM_fg,'.ACCESSION from ',@DM_fg,' left outer join ',@DM_aceg,' on ',@DM_fg,'.DOMAIN=',@DM_aceg,'.DOMAIN where ',@DM_aceg,'.DOMAIN is null;');
SET @sDM_e = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_e,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_eg,'.DOMAIN, ',@DM_eg,'.ACCESSION from ',@DM_eg,' left outer join ',@DM_bcfg,' on ',@DM_eg,'.DOMAIN=',@DM_bcfg,'.DOMAIN where ',@DM_bcfg,'.DOMAIN is null;');
SET @sDM_c = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_c,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_cg,'.DOMAIN, ',@DM_cg,'.ACCESSION from ',@DM_cg,' left outer join ',@DM_defg,' on ',@DM_cg,'.DOMAIN=',@DM_defg,'.DOMAIN where ',@DM_defg,'.DOMAIN is null;');

SET @sDM_d = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_d,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_defg,'.DOMAIN, ',@DM_defg,'.ACCESSION from ',@DM_defg,' where ',@DM_defg,'.DOMAIN NOT IN (select DOMAIN from ',@DM_fg,' union select DOMAIN from ',@DM_eg,');');
SET @sDM_b = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_b,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_bcfg,'.DOMAIN, ',@DM_bcfg,'.ACCESSION from ',@DM_bcfg,' where ',@DM_bcfg,'.DOMAIN NOT IN (select DOMAIN from ',@DM_fg,' union select DOMAIN from ',@DM_cg,');');
SET @sDM_a = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_a,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_aceg,'.DOMAIN, ',@DM_aceg,'.ACCESSION from ',@DM_aceg,' where ',@DM_aceg,'.DOMAIN NOT IN (select DOMAIN from ',@DM_eg,' union select DOMAIN from ',@DM_cg,');');



PREPARE stmtDM_defg FROM @sDM_defg;
EXECUTE stmtDM_defg;

PREPARE stmtDM_bcfg FROM @sDM_bcfg;
EXECUTE stmtDM_bcfg;

PREPARE stmtDM_aceg FROM @sDM_aceg;
EXECUTE stmtDM_aceg;

PREPARE stmtDM_fg FROM @sDM_fg;
EXECUTE stmtDM_fg;

PREPARE stmtDM_eg FROM @sDM_eg;
EXECUTE stmtDM_eg;

PREPARE stmtDM_cg FROM @sDM_cg;
EXECUTE stmtDM_cg;

PREPARE stmtDM_a FROM @sDM_a;
EXECUTE stmtDM_a;

PREPARE stmtDM_b FROM @sDM_b;
EXECUTE stmtDM_b;

PREPARE stmtDM_c FROM @sDM_c;
EXECUTE stmtDM_c;

PREPARE stmtDM_d FROM @sDM_d;
EXECUTE stmtDM_d;

PREPARE stmtDM_e FROM @sDM_e;
EXECUTE stmtDM_e;

PREPARE stmtDM_f FROM @sDM_f;
EXECUTE stmtDM_f;

PREPARE stmtDM_g FROM @sDM_g;
EXECUTE stmtDM_g;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DM_4SET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DM_4SET`(IN s_ID VARCHAR(64))
BEGIN

SET @plist1 = CONCAT('protlist1_',s_ID);
SET @plist2 = CONCAT('protlist2_',s_ID);
SET @plist3 = CONCAT('protlist3_',s_ID);
SET @plist4 = CONCAT('protlist4_',s_ID);

SET @DM_hijklmno = CONCAT('DM_hijklmno_',s_ID);
SET @DM_defglmno = CONCAT('DM_defglmno_',s_ID);
SET @DM_bcfgjkno = CONCAT('DM_bcfgjkno_',s_ID);
SET @DM_acegikmo = CONCAT('DM_acegikmo_',s_ID);

SET @DM_lmno = CONCAT('DM_lmno_',s_ID);
SET @DM_jkno = CONCAT('DM_jkno_',s_ID);
SET @DM_ikmo = CONCAT('DM_ikmo_',s_ID);
SET @DM_fgno = CONCAT('DM_fgno_',s_ID);
SET @DM_egmo = CONCAT('DM_egmo_',s_ID);
SET @DM_cgko = CONCAT('DM_cgko_',s_ID);

SET @DM_no = CONCAT('DM_no_',s_ID);
SET @DM_mo = CONCAT('DM_mo_',s_ID);
SET @DM_ko = CONCAT('DM_ko_',s_ID);
SET @DM_go = CONCAT('DM_go_',s_ID);

SET @DM_lm = CONCAT('DM_lm_',s_ID);
SET @DM_jk = CONCAT('DM_jk_',s_ID);
SET @DM_ik = CONCAT('DM_ik_',s_ID);
SET @DM_fg = CONCAT('DM_fg_',s_ID);
SET @DM_eg = CONCAT('DM_eg_',s_ID);
SET @DM_cg = CONCAT('DM_cg_',s_ID);


SET @DM_o = CONCAT('DM_o_',s_ID);
SET @DM_n = CONCAT('DM_n_',s_ID);
SET @DM_m = CONCAT('DM_m_',s_ID);
SET @DM_k = CONCAT('DM_k_',s_ID);
SET @DM_g = CONCAT('DM_g_',s_ID);

SET @DM_l = CONCAT('DM_l_',s_ID);
SET @DM_j = CONCAT('DM_j_',s_ID);
SET @DM_i = CONCAT('DM_i_',s_ID);
SET @DM_f = CONCAT('DM_f_',s_ID);
SET @DM_e = CONCAT('DM_e_',s_ID);
SET @DM_c = CONCAT('DM_c_',s_ID);


SET @DM_cegikmo = CONCAT('DM_cegikmo_',s_ID);
SET @DM_cfgjkno = CONCAT('DM_cfgjkno_',s_ID);
SET @DM_efglmno = CONCAT('DM_efglmno_',s_ID);
SET @DM_ijklmno = CONCAT('DM_ijklmno_',s_ID);


SET @DM_a = CONCAT('DM_a_',s_ID);
SET @DM_b = CONCAT('DM_b_',s_ID);
SET @DM_d = CONCAT('DM_d_',s_ID);
SET @DM_h = CONCAT('DM_h_',s_ID);

SET @sDM_hijklmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_hijklmno,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT DOMAIN,ACCESSION from PROTEIN_DOMAIN, DOMAIN where PROTEIN_DOMAIN.DOMAIN=DOMAIN.PFAM AND ACCESSION IN (select ACCESSION from ',@plist1,');');
SET @sDM_defglmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_defglmno,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT DOMAIN,ACCESSION from PROTEIN_DOMAIN, DOMAIN where PROTEIN_DOMAIN.DOMAIN=DOMAIN.PFAM AND ACCESSION IN (select ACCESSION from ',@plist2,');');
SET @sDM_bcfgjkno = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_bcfgjkno,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT DOMAIN,ACCESSION from PROTEIN_DOMAIN, DOMAIN where PROTEIN_DOMAIN.DOMAIN=DOMAIN.PFAM AND ACCESSION IN (select ACCESSION from ',@plist3,');');
SET @sDM_acegikmo = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_acegikmo,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT DOMAIN,ACCESSION from PROTEIN_DOMAIN, DOMAIN where PROTEIN_DOMAIN.DOMAIN=DOMAIN.PFAM AND ACCESSION IN (select ACCESSION from ',@plist4,');');


SET @sDM_lmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_lmno,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_hijklmno,'.DOMAIN, ',@DM_hijklmno,'.ACCESSION from ',@DM_hijklmno,' join ',@DM_defglmno,' on ',@DM_hijklmno,'.DOMAIN=',@DM_defglmno,'.DOMAIN;');
SET @sDM_jkno = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_jkno,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_hijklmno,'.DOMAIN, ',@DM_hijklmno,'.ACCESSION from ',@DM_hijklmno,' join ',@DM_bcfgjkno,' on ',@DM_hijklmno,'.DOMAIN=',@DM_bcfgjkno,'.DOMAIN;');
SET @sDM_ikmo = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_ikmo,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_hijklmno,'.DOMAIN, ',@DM_hijklmno,'.ACCESSION from ',@DM_hijklmno,' join ',@DM_acegikmo,' on ',@DM_hijklmno,'.DOMAIN=',@DM_acegikmo,'.DOMAIN;');
SET @sDM_fgno = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_fgno,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_defglmno,'.DOMAIN, ',@DM_defglmno,'.ACCESSION from ',@DM_defglmno,' join ',@DM_bcfgjkno,' on ',@DM_defglmno,'.DOMAIN=',@DM_bcfgjkno,'.DOMAIN;');
SET @sDM_egmo = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_egmo,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_defglmno,'.DOMAIN, ',@DM_defglmno,'.ACCESSION from ',@DM_defglmno,' join ',@DM_acegikmo,' on ',@DM_defglmno,'.DOMAIN=',@DM_acegikmo,'.DOMAIN;');
SET @sDM_cgko = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_cgko,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_bcfgjkno,'.DOMAIN, ',@DM_bcfgjkno,'.ACCESSION from ',@DM_bcfgjkno,' join ',@DM_acegikmo,' on ',@DM_bcfgjkno,'.DOMAIN=',@DM_acegikmo,'.DOMAIN;');

SET @sDM_no = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_no,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_hijklmno,'.DOMAIN, ',@DM_hijklmno,'.ACCESSION from ',@DM_hijklmno,' join ',@DM_fgno,' on ',@DM_hijklmno,'.DOMAIN=',@DM_fgno,'.DOMAIN;');
SET @sDM_mo = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_mo,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_hijklmno,'.DOMAIN, ',@DM_hijklmno,'.ACCESSION from ',@DM_hijklmno,' join ',@DM_egmo,' on ',@DM_hijklmno,'.DOMAIN=',@DM_egmo,'.DOMAIN;');
SET @sDM_ko = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_ko,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_hijklmno,'.DOMAIN, ',@DM_hijklmno,'.ACCESSION from ',@DM_hijklmno,' join ',@DM_cgko,' on ',@DM_hijklmno,'.DOMAIN=',@DM_cgko,'.DOMAIN;');
SET @sDM_go = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_go,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_defglmno,'.DOMAIN, ',@DM_defglmno,'.ACCESSION from ',@DM_defglmno,' join ',@DM_cgko,' on ',@DM_defglmno,'.DOMAIN=',@DM_cgko,'.DOMAIN;');

SET @sDM_o = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_o,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_hijklmno,'.DOMAIN, ',@DM_hijklmno,'.ACCESSION from ',@DM_hijklmno,' join ',@DM_go,' on ',@DM_hijklmno,'.DOMAIN=',@DM_go,'.DOMAIN;');

SET @sDM_n = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_n,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_no,'.DOMAIN, ',@DM_no,'.ACCESSION from ',@DM_no,' left outer join ',@DM_o,' on ',@DM_no,'.DOMAIN=',@DM_o,'.DOMAIN where ',@DM_o,'.DOMAIN is null;');
SET @sDM_m = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_m,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_mo,'.DOMAIN, ',@DM_mo,'.ACCESSION from ',@DM_mo,' left outer join ',@DM_o,' on ',@DM_mo,'.DOMAIN=',@DM_o,'.DOMAIN where ',@DM_o,'.DOMAIN is null;');
SET @sDM_k = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_k,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_ko,'.DOMAIN, ',@DM_ko,'.ACCESSION from ',@DM_ko,' left outer join ',@DM_o,' on ',@DM_ko,'.DOMAIN=',@DM_o,'.DOMAIN where ',@DM_o,'.DOMAIN is null;');
SET @sDM_g = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_g,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_go,'.DOMAIN, ',@DM_go,'.ACCESSION from ',@DM_go,' left outer join ',@DM_o,' on ',@DM_go,'.DOMAIN=',@DM_o,'.DOMAIN where ',@DM_o,'.DOMAIN is null;');


SET @sDM_lm = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_lm,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_lmno,'.DOMAIN, ',@DM_lmno,'.ACCESSION from ',@DM_lmno,' left outer join ',@DM_no,' on ',@DM_lmno,'.DOMAIN=',@DM_no,'.DOMAIN where ',@DM_no,'.DOMAIN is null;');
SET @sDM_jk = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_jk,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_jkno,'.DOMAIN, ',@DM_jkno,'.ACCESSION from ',@DM_jkno,' left outer join ',@DM_no,' on ',@DM_jkno,'.DOMAIN=',@DM_no,'.DOMAIN where ',@DM_no,'.DOMAIN is null;');
SET @sDM_ik = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_ik,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_ikmo,'.DOMAIN, ',@DM_ikmo,'.ACCESSION from ',@DM_ikmo,' left outer join ',@DM_mo,' on ',@DM_ikmo,'.DOMAIN=',@DM_mo,'.DOMAIN where ',@DM_mo,'.DOMAIN is null;');
SET @sDM_fg = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_fg,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_fgno,'.DOMAIN, ',@DM_fgno,'.ACCESSION from ',@DM_fgno,' left outer join ',@DM_no,' on ',@DM_fgno,'.DOMAIN=',@DM_no,'.DOMAIN where ',@DM_no,'.DOMAIN is null;');
SET @sDM_eg = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_eg,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_egmo,'.DOMAIN, ',@DM_egmo,'.ACCESSION from ',@DM_egmo,' left outer join ',@DM_mo,' on ',@DM_egmo,'.DOMAIN=',@DM_mo,'.DOMAIN where ',@DM_mo,'.DOMAIN is null;');
SET @sDM_cg = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_cg,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_cgko,'.DOMAIN, ',@DM_cgko,'.ACCESSION from ',@DM_cgko,' left outer join ',@DM_ko,' on ',@DM_cgko,'.DOMAIN=',@DM_ko,'.DOMAIN where ',@DM_ko,'.DOMAIN is null;');


SET @sDM_l = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_l,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_lm,'.DOMAIN, ',@DM_lm,'.ACCESSION from ',@DM_lm,' left outer join ',@DM_m,' on ',@DM_lm,'.DOMAIN=',@DM_m,'.DOMAIN where ',@DM_m,'.DOMAIN is null;');
SET @sDM_j = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_j,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_jk,'.DOMAIN, ',@DM_jk,'.ACCESSION from ',@DM_jk,' left outer join ',@DM_k,' on ',@DM_jk,'.DOMAIN=',@DM_k,'.DOMAIN where ',@DM_k,'.DOMAIN is null;');
SET @sDM_i = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_i,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_ik,'.DOMAIN, ',@DM_ik,'.ACCESSION from ',@DM_ik,' left outer join ',@DM_k,' on ',@DM_ik,'.DOMAIN=',@DM_k,'.DOMAIN where ',@DM_k,'.DOMAIN is null;');
SET @sDM_f = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_f,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_fg,'.DOMAIN, ',@DM_fg,'.ACCESSION from ',@DM_fg,' left outer join ',@DM_g,' on ',@DM_fg,'.DOMAIN=',@DM_g,'.DOMAIN where ',@DM_g,'.DOMAIN is null;');
SET @sDM_e = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_e,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_eg,'.DOMAIN, ',@DM_eg,'.ACCESSION from ',@DM_eg,' left outer join ',@DM_g,' on ',@DM_eg,'.DOMAIN=',@DM_g,'.DOMAIN where ',@DM_g,'.DOMAIN is null;');
SET @sDM_c = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_c,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_cg,'.DOMAIN, ',@DM_cg,'.ACCESSION from ',@DM_cg,' left outer join ',@DM_g,' on ',@DM_cg,'.DOMAIN=',@DM_g,'.DOMAIN where ',@DM_g,'.DOMAIN is null;');


SET @sDM_cegikmo = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_cegikmo,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_egmo,'.DOMAIN, ',@DM_egmo,'.ACCESSION from ',@DM_egmo,', ',@DM_ik,', ',@DM_c,' where ',@DM_egmo,'.DOMAIN=',@DM_ik,'.DOMAIN and ',@DM_ik,'.DOMAIN=',@DM_c,'.DOMAIN;');
SET @sDM_cfgjkno = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_cfgjkno,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_fgno,'.DOMAIN, ',@DM_fgno,'.ACCESSION from ',@DM_fgno,', ',@DM_jk,', ',@DM_c,' where ',@DM_fgno,'.DOMAIN=',@DM_jk,'.DOMAIN and ',@DM_jk,'.DOMAIN=',@DM_c,'.DOMAIN;');
SET @sDM_ijklmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_ijklmno,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_lmno,'.DOMAIN, ',@DM_lmno,'.ACCESSION from ',@DM_lmno,', ',@DM_jk,', ',@DM_i,' where ',@DM_lmno,'.DOMAIN=',@DM_jk,'.DOMAIN and ',@DM_jk,'.DOMAIN=',@DM_i,'.DOMAIN;');
SET @sDM_efglmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_efglmno,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_lmno,'.DOMAIN, ',@DM_lmno,'.ACCESSION from ',@DM_lmno,', ',@DM_fg,', ',@DM_e,' where ',@DM_lmno,'.DOMAIN=',@DM_fg,'.DOMAIN and ',@DM_fg,'.DOMAIN=',@DM_e,'.DOMAIN;');


SET @sDM_a = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_a,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_acegikmo,'.DOMAIN, ',@DM_acegikmo,'.ACCESSION from ',@DM_acegikmo,' left outer join ',@DM_cegikmo,' on ',@DM_acegikmo,'.DOMAIN=',@DM_cegikmo,'.DOMAIN where ',@DM_cegikmo,'.DOMAIN is null;');
SET @sDM_b = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_b,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_bcfgjkno,'.DOMAIN, ',@DM_bcfgjkno,'.ACCESSION from ',@DM_bcfgjkno,' left outer join ',@DM_cfgjkno,' on ',@DM_bcfgjkno,'.DOMAIN=',@DM_cfgjkno,'.DOMAIN where ',@DM_cfgjkno,'.DOMAIN is null;');
SET @sDM_d = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_d,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_defglmno,'.DOMAIN, ',@DM_defglmno,'.ACCESSION from ',@DM_defglmno,' left outer join ',@DM_efglmno,' on ',@DM_defglmno,'.DOMAIN=',@DM_efglmno,'.DOMAIN where ',@DM_efglmno,'.DOMAIN is null;');
SET @sDM_h = CONCAT('CREATE TABLE IF NOT EXISTS ',@DM_h,' (PRIMARY KEY my_pkey (DOMAIN,ACCESSION)) select DISTINCT ',@DM_hijklmno,'.DOMAIN, ',@DM_hijklmno,'.ACCESSION from ',@DM_hijklmno,' left outer join ',@DM_ijklmno,' on ',@DM_hijklmno,'.DOMAIN=',@DM_ijklmno,'.DOMAIN where ',@DM_ijklmno,'.DOMAIN is null;');



PREPARE stmtDM_hijklmno FROM @sDM_hijklmno;
EXECUTE stmtDM_hijklmno;

PREPARE stmtDM_defglmno FROM @sDM_defglmno;
EXECUTE stmtDM_defglmno;

PREPARE stmtDM_bcfgjkno FROM @sDM_bcfgjkno;
EXECUTE stmtDM_bcfgjkno;

PREPARE stmtDM_acegikmo FROM @sDM_acegikmo;
EXECUTE stmtDM_acegikmo;

PREPARE stmtDM_lmno FROM @sDM_lmno;
EXECUTE stmtDM_lmno;

PREPARE stmtDM_jkno FROM @sDM_jkno;
EXECUTE stmtDM_jkno;

PREPARE stmtDM_ikmo FROM @sDM_ikmo;
EXECUTE stmtDM_ikmo;

PREPARE stmtDM_fgno FROM @sDM_fgno;
EXECUTE stmtDM_fgno;

PREPARE stmtDM_egmo FROM @sDM_egmo;
EXECUTE stmtDM_egmo;

PREPARE stmtDM_cgko FROM @sDM_cgko;
EXECUTE stmtDM_cgko;

PREPARE stmtDM_no FROM @sDM_no;
EXECUTE stmtDM_no;

PREPARE stmtDM_mo FROM @sDM_mo;
EXECUTE stmtDM_mo;

PREPARE stmtDM_ko FROM @sDM_ko;
EXECUTE stmtDM_ko;

PREPARE stmtDM_go FROM @sDM_go;
EXECUTE stmtDM_go;


PREPARE stmtDM_o FROM @sDM_o;
EXECUTE stmtDM_o;

PREPARE stmtDM_n FROM @sDM_n;
EXECUTE stmtDM_n;

PREPARE stmtDM_m FROM @sDM_m;
EXECUTE stmtDM_m;

PREPARE stmtDM_k FROM @sDM_k;
EXECUTE stmtDM_k;

PREPARE stmtDM_g FROM @sDM_g;
EXECUTE stmtDM_g;



PREPARE stmtDM_lm FROM @sDM_lm;
EXECUTE stmtDM_lm;

PREPARE stmtDM_l FROM @sDM_l;
EXECUTE stmtDM_l;

PREPARE stmtDM_jk FROM @sDM_jk;
EXECUTE stmtDM_jk;

PREPARE stmtDM_j FROM @sDM_j;
EXECUTE stmtDM_j;

PREPARE stmtDM_ik FROM @sDM_ik;
EXECUTE stmtDM_ik;

PREPARE stmtDM_i FROM @sDM_i;
EXECUTE stmtDM_i;

PREPARE stmtDM_fg FROM @sDM_fg;
EXECUTE stmtDM_fg;

PREPARE stmtDM_f FROM @sDM_f;
EXECUTE stmtDM_f;

PREPARE stmtDM_eg FROM @sDM_eg;
EXECUTE stmtDM_eg;

PREPARE stmtDM_e FROM @sDM_e;
EXECUTE stmtDM_e;

PREPARE stmtDM_cg FROM @sDM_cg;
EXECUTE stmtDM_cg;

PREPARE stmtDM_c FROM @sDM_c;
EXECUTE stmtDM_c;

PREPARE stmtDM_cegikmo FROM @sDM_cegikmo;
EXECUTE stmtDM_cegikmo;

PREPARE stmtDM_cfgjkno FROM @sDM_cfgjkno;
EXECUTE stmtDM_cfgjkno;

PREPARE stmtDM_efglmno FROM @sDM_efglmno;
EXECUTE stmtDM_efglmno;

PREPARE stmtDM_ijklmno FROM @sDM_ijklmno;
EXECUTE stmtDM_ijklmno;


PREPARE stmtDM_a FROM @sDM_a;
EXECUTE stmtDM_a;

PREPARE stmtDM_b FROM @sDM_b;
EXECUTE stmtDM_b;

PREPARE stmtDM_d FROM @sDM_d;
EXECUTE stmtDM_d;

PREPARE stmtDM_h FROM @sDM_h;
EXECUTE stmtDM_h;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `dropTruncatedTables` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `dropTruncatedTables`(db varchar(50))
BEGIN

drop table if exists dropTables;
create temporary table dropTables as (
	select table_name
    from information_schema.tables
    where table_type = 'BASE TABLE'
		and table_rows = 0
		and table_schema = db
);

set @total = 0;
set @cnt = 0;
set @size = 1;

select * from dropTables;
select count(*) from dropTables into @total;

while @cnt <= @total do
	prepare fooStmt from "select table_name from dropTables order by table_name limit ?, ? into @t";
	execute fooStmt using @cnt, @size;
	deallocate prepare fooStmt; 

	set @query = concat('DROP TABLE ', @t , ';');
	select @query;
	prepare stmt from @query;
	execute stmt;
	deallocate prepare stmt; 

	set @cnt = @cnt + 1;
end while;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GB_1SET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GB_1SET`(IN s_id VARCHAR(64))
BEGIN

SET @GB = CONCAT('GB_a_',s_id);
SET @plist = CONCAT('protlist1_',s_id);
SET @sGB = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ONTOLOGY,ACCESSION from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=0 AND ACCESSION IN (select ACCESSION from ', @plist,');');

PREPARE stmtGB FROM @sGB;
EXECUTE stmtGB;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GB_2SET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GB_2SET`(IN s_id VARCHAR(64))
BEGIN


SET @GB_a = CONCAT('GB_a_',s_id);
SET @GB_b = CONCAT('GB_b_',s_id);
SET @GB_c = CONCAT('GB_c_',s_id);
SET @GB_bc = CONCAT('GB_bc_',s_id);
SET @GB_ac = CONCAT('GB_ac_',s_id);

SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);

SET @sGB_bc = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_bc,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ONTOLOGY,ACCESSION from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=0 AND ACCESSION IN (select ACCESSION from ',@plist1,');');
SET @sGB_ac = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_ac,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ONTOLOGY,ACCESSION from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=0 AND ACCESSION IN (select ACCESSION from ',@plist2,');');

SET @sGB_c = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_c,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_bc,'.ONTOLOGY, ',@GB_bc,'.ACCESSION from ',@GB_bc,' join ',@GB_ac,' on ',@GB_bc,'.ONTOLOGY=',@GB_ac,'.ONTOLOGY;');
SET @sGB_b = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_b,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_bc,'.ONTOLOGY, ',@GB_bc,'.ACCESSION from ',@GB_bc,' left outer join ',@GB_ac,' on ',@GB_bc,'.ONTOLOGY=',@GB_ac,'.ONTOLOGY where ',@GB_ac,'.ONTOLOGY is null;');
SET @sGB_a = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_a,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_ac,'.ONTOLOGY, ',@GB_ac,'.ACCESSION from ',@GB_ac,' left outer join ',@GB_bc,' on ',@GB_bc,'.ONTOLOGY=',@GB_ac,'.ONTOLOGY where ',@GB_bc,'.ONTOLOGY is null;');

PREPARE stmtGB_bc FROM @sGB_bc;
EXECUTE stmtGB_bc;

PREPARE stmtGB_ac FROM @sGB_ac;
EXECUTE stmtGB_ac;

PREPARE stmtGB_a FROM @sGB_a;
EXECUTE stmtGB_a;

PREPARE stmtGB_b FROM @sGB_b;
EXECUTE stmtGB_b;

PREPARE stmtGB_c FROM @sGB_c;
EXECUTE stmtGB_c;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GB_3SET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GB_3SET`(IN s_id VARCHAR(64))
BEGIN

SET @GB_a = CONCAT('GB_a_',s_id);
SET @GB_b = CONCAT('GB_b_',s_id);
SET @GB_c = CONCAT('GB_c_',s_id);
SET @GB_d = CONCAT('GB_d_',s_id);
SET @GB_e = CONCAT('GB_e_',s_id);
SET @GB_f = CONCAT('GB_f_',s_id);
SET @GB_g = CONCAT('GB_g_',s_id);

SET @GB_fg = CONCAT('GB_fg_',s_id);
SET @GB_eg = CONCAT('GB_eg_',s_id);
SET @GB_cg = CONCAT('GB_cg_',s_id);

SET @GB_defg = CONCAT('GB_defg_',s_id);
SET @GB_bcfg = CONCAT('GB_bcfg_',s_id);
SET @GB_aceg = CONCAT('GB_aceg_',s_id);


SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);
SET @plist3 = CONCAT('protlist3_',s_id);


SET @sGB_defg = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_defg,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ONTOLOGY,ACCESSION from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=0 AND ACCESSION IN (select ACCESSION from ',@plist1,');');
SET @sGB_bcfg = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_bcfg,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ONTOLOGY,ACCESSION from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=0 AND ACCESSION IN (select ACCESSION from ',@plist2,');');
SET @sGB_aceg = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_aceg,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ONTOLOGY,ACCESSION from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=0 AND ACCESSION IN (select ACCESSION from ',@plist3,');');

SET @sGB_fg = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_fg,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_defg,'.ONTOLOGY, ',@GB_defg,'.ACCESSION from ',@GB_defg,' join ',@GB_bcfg,' on ',@GB_defg,'.ONTOLOGY=',@GB_bcfg,'.ONTOLOGY;');
SET @sGB_eg = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_eg,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_defg,'.ONTOLOGY, ',@GB_defg,'.ACCESSION from ',@GB_defg,' join ',@GB_aceg,' on ',@GB_defg,'.ONTOLOGY=',@GB_aceg,'.ONTOLOGY;');
SET @sGB_cg = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_cg,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_bcfg,'.ONTOLOGY, ',@GB_bcfg,'.ACCESSION from ',@GB_bcfg,' join ',@GB_aceg,' on ',@GB_bcfg,'.ONTOLOGY=',@GB_aceg,'.ONTOLOGY;');

SET @sGB_g = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_g,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_fg,'.ONTOLOGY, ',@GB_fg,'.ACCESSION from ',@GB_fg,' join ',@GB_eg,' on ',@GB_fg,'.ONTOLOGY=',@GB_eg,'.ONTOLOGY and ',@GB_fg,'.ONTOLOGY IN ( select ONTOLOGY from ',@GB_cg,');');

SET @sGB_f = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_f,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_fg,'.ONTOLOGY, ',@GB_fg,'.ACCESSION from ',@GB_fg,' left outer join ',@GB_aceg,' on ',@GB_fg,'.ONTOLOGY=',@GB_aceg,'.ONTOLOGY where ',@GB_aceg,'.ONTOLOGY is null;');
SET @sGB_e = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_e,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_eg,'.ONTOLOGY, ',@GB_eg,'.ACCESSION from ',@GB_eg,' left outer join ',@GB_bcfg,' on ',@GB_eg,'.ONTOLOGY=',@GB_bcfg,'.ONTOLOGY where ',@GB_bcfg,'.ONTOLOGY is null;');
SET @sGB_c = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_c,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_cg,'.ONTOLOGY, ',@GB_cg,'.ACCESSION from ',@GB_cg,' left outer join ',@GB_defg,' on ',@GB_cg,'.ONTOLOGY=',@GB_defg,'.ONTOLOGY where ',@GB_defg,'.ONTOLOGY is null;');

SET @sGB_d = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_d,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_defg,'.ONTOLOGY, ',@GB_defg,'.ACCESSION from ',@GB_defg,' where ',@GB_defg,'.ONTOLOGY NOT IN (select ONTOLOGY from ',@GB_fg,' union select ONTOLOGY from ',@GB_eg,');');
SET @sGB_b = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_b,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_bcfg,'.ONTOLOGY, ',@GB_bcfg,'.ACCESSION from ',@GB_bcfg,' where ',@GB_bcfg,'.ONTOLOGY NOT IN (select ONTOLOGY from ',@GB_fg,' union select ONTOLOGY from ',@GB_cg,');');
SET @sGB_a = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_a,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_aceg,'.ONTOLOGY, ',@GB_aceg,'.ACCESSION from ',@GB_aceg,' where ',@GB_aceg,'.ONTOLOGY NOT IN (select ONTOLOGY from ',@GB_eg,' union select ONTOLOGY from ',@GB_cg,');');


PREPARE stmtGB_defg FROM @sGB_defg;
EXECUTE stmtGB_defg;

PREPARE stmtGB_bcfg FROM @sGB_bcfg;
EXECUTE stmtGB_bcfg;

PREPARE stmtGB_aceg FROM @sGB_aceg;
EXECUTE stmtGB_aceg;

PREPARE stmtGB_fg FROM @sGB_fg;
EXECUTE stmtGB_fg;

PREPARE stmtGB_eg FROM @sGB_eg;
EXECUTE stmtGB_eg;

PREPARE stmtGB_cg FROM @sGB_cg;
EXECUTE stmtGB_cg;

PREPARE stmtGB_a FROM @sGB_a;
EXECUTE stmtGB_a;

PREPARE stmtGB_b FROM @sGB_b;
EXECUTE stmtGB_b;

PREPARE stmtGB_c FROM @sGB_c;
EXECUTE stmtGB_c;

PREPARE stmtGB_d FROM @sGB_d;
EXECUTE stmtGB_d;

PREPARE stmtGB_e FROM @sGB_e;
EXECUTE stmtGB_e;

PREPARE stmtGB_f FROM @sGB_f;
EXECUTE stmtGB_f;

PREPARE stmtGB_g FROM @sGB_g;
EXECUTE stmtGB_g;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GB_4SET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GB_4SET`(IN s_id VARCHAR(64))
BEGIN


SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);
SET @plist3 = CONCAT('protlist3_',s_id);
SET @plist4 = CONCAT('protlist4_',s_id);

SET @GB_hijklmno = CONCAT('GB_hijklmno_',s_id);
SET @GB_defglmno = CONCAT('GB_defglmno_',s_id);
SET @GB_bcfgjkno = CONCAT('GB_bcfgjkno_',s_id);
SET @GB_acegikmo = CONCAT('GB_acegikmo_',s_id);

SET @GB_lmno = CONCAT('GB_lmno_',s_id);
SET @GB_jkno = CONCAT('GB_jkno_',s_id);
SET @GB_ikmo = CONCAT('GB_ikmo_',s_id);
SET @GB_fgno = CONCAT('GB_fgno_',s_id);
SET @GB_eGBo = CONCAT('GB_eGBo_',s_id);
SET @GB_cgko = CONCAT('GB_cgko_',s_id);

SET @GB_no = CONCAT('GB_no_',s_id);
SET @GB_mo = CONCAT('GB_mo_',s_id);
SET @GB_ko = CONCAT('GB_ko_',s_id);
SET @GB_go = CONCAT('GB_go_',s_id);

SET @GB_o = CONCAT('GB_o_',s_id);
SET @GB_n = CONCAT('GB_n_',s_id);
SET @GB_m = CONCAT('GB_m_',s_id);
SET @GB_k = CONCAT('GB_k_',s_id);
SET @GB_g = CONCAT('GB_g_',s_id);

SET @GB_l = CONCAT('GB_l_',s_ID);
SET @GB_j = CONCAT('GB_j_',s_ID);
SET @GB_i = CONCAT('GB_i_',s_ID);
SET @GB_f = CONCAT('GB_f_',s_ID);
SET @GB_e = CONCAT('GB_e_',s_ID);
SET @GB_c = CONCAT('GB_c_',s_ID);


SET @GB_lm = CONCAT('GB_lm_',s_ID);
SET @GB_jk = CONCAT('GB_jk_',s_ID);
SET @GB_ik = CONCAT('GB_ik_',s_ID);
SET @GB_fg = CONCAT('GB_fg_',s_ID);
SET @GB_eg = CONCAT('GB_eg_',s_ID);
SET @GB_cg = CONCAT('GB_cg_',s_ID);

SET @GB_cegikmo = CONCAT('GB_cegikmo_',s_ID);
SET @GB_cfgjkno = CONCAT('GB_cfgjkno_',s_ID);
SET @GB_efglmno = CONCAT('GB_efglmno_',s_ID);
SET @GB_ijklmno = CONCAT('GB_ijklmno_',s_ID);


SET @GB_a = CONCAT('GB_a_',s_ID);
SET @GB_b = CONCAT('GB_b_',s_ID);
SET @GB_d = CONCAT('GB_d_',s_ID);
SET @GB_h = CONCAT('GB_h_',s_ID);


SET @sGB_hijklmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_hijklmno,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ONTOLOGY,ACCESSION from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=1 AND ACCESSION IN (select ACCESSION from ',@plist1,');');
SET @sGB_defglmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_defglmno,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ONTOLOGY,ACCESSION from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=1 AND ACCESSION IN (select ACCESSION from ',@plist2,');');
SET @sGB_bcfgjkno = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_bcfgjkno,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ONTOLOGY,ACCESSION from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=1 AND ACCESSION IN (select ACCESSION from ',@plist3,');');
SET @sGB_acegikmo = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_acegikmo,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ONTOLOGY,ACCESSION from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=1 AND ACCESSION IN (select ACCESSION from ',@plist4,');');

SET @sGB_lmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_lmno,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_hijklmno,'.ONTOLOGY, ',@GB_hijklmno,'.ACCESSION from ',@GB_hijklmno,' join ',@GB_defglmno,' on ',@GB_hijklmno,'.ONTOLOGY=',@GB_defglmno,'.ONTOLOGY;');
SET @sGB_jkno = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_jkno,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_hijklmno,'.ONTOLOGY, ',@GB_hijklmno,'.ACCESSION from ',@GB_hijklmno,' join ',@GB_bcfgjkno,' on ',@GB_hijklmno,'.ONTOLOGY=',@GB_bcfgjkno,'.ONTOLOGY;');
SET @sGB_ikmo = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_ikmo,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_hijklmno,'.ONTOLOGY, ',@GB_hijklmno,'.ACCESSION from ',@GB_hijklmno,' join ',@GB_acegikmo,' on ',@GB_hijklmno,'.ONTOLOGY=',@GB_acegikmo,'.ONTOLOGY;');
SET @sGB_fgno = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_fgno,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_defglmno,'.ONTOLOGY, ',@GB_defglmno,'.ACCESSION from ',@GB_defglmno,' join ',@GB_bcfgjkno,' on ',@GB_defglmno,'.ONTOLOGY=',@GB_bcfgjkno,'.ONTOLOGY;');
SET @sGB_eGBo = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_eGBo,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_defglmno,'.ONTOLOGY, ',@GB_defglmno,'.ACCESSION from ',@GB_defglmno,' join ',@GB_acegikmo,' on ',@GB_defglmno,'.ONTOLOGY=',@GB_acegikmo,'.ONTOLOGY;');
SET @sGB_cgko = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_cgko,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_bcfgjkno,'.ONTOLOGY, ',@GB_bcfgjkno,'.ACCESSION from ',@GB_bcfgjkno,' join ',@GB_acegikmo,' on ',@GB_bcfgjkno,'.ONTOLOGY=',@GB_acegikmo,'.ONTOLOGY;');

SET @sGB_no = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_no,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_hijklmno,'.ONTOLOGY, ',@GB_hijklmno,'.ACCESSION from ',@GB_hijklmno,' join ',@GB_fgno,' on ',@GB_hijklmno,'.ONTOLOGY=',@GB_fgno,'.ONTOLOGY;');
SET @sGB_mo = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_mo,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_hijklmno,'.ONTOLOGY, ',@GB_hijklmno,'.ACCESSION from ',@GB_hijklmno,' join ',@GB_eGBo,' on ',@GB_hijklmno,'.ONTOLOGY=',@GB_eGBo,'.ONTOLOGY;');
SET @sGB_ko = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_ko,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_hijklmno,'.ONTOLOGY, ',@GB_hijklmno,'.ACCESSION from ',@GB_hijklmno,' join ',@GB_cgko,' on ',@GB_hijklmno,'.ONTOLOGY=',@GB_cgko,'.ONTOLOGY;');
SET @sGB_go = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_go,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_defglmno,'.ONTOLOGY, ',@GB_defglmno,'.ACCESSION from ',@GB_defglmno,' join ',@GB_cgko,' on ',@GB_defglmno,'.ONTOLOGY=',@GB_cgko,'.ONTOLOGY;');

SET @sGB_o = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_o,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_hijklmno,'.ONTOLOGY, ',@GB_hijklmno,'.ACCESSION from ',@GB_hijklmno,' join ',@GB_go,' on ',@GB_hijklmno,'.ONTOLOGY=',@GB_go,'.ONTOLOGY;');


SET @sGB_n = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_n,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_no,'.ONTOLOGY, ',@GB_no,'.ACCESSION from ',@GB_no,' left outer join ',@GB_o,' on ',@GB_no,'.ONTOLOGY=',@GB_o,'.ONTOLOGY where ',@GB_o,'.ONTOLOGY is null;');
SET @sGB_m = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_m,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_mo,'.ONTOLOGY, ',@GB_mo,'.ACCESSION from ',@GB_mo,' left outer join ',@GB_o,' on ',@GB_mo,'.ONTOLOGY=',@GB_o,'.ONTOLOGY where ',@GB_o,'.ONTOLOGY is null;');
SET @sGB_k = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_k,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_ko,'.ONTOLOGY, ',@GB_ko,'.ACCESSION from ',@GB_ko,' left outer join ',@GB_o,' on ',@GB_ko,'.ONTOLOGY=',@GB_o,'.ONTOLOGY where ',@GB_o,'.ONTOLOGY is null;');
SET @sGB_g = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_g,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_go,'.ONTOLOGY, ',@GB_go,'.ACCESSION from ',@GB_go,' left outer join ',@GB_o,' on ',@GB_go,'.ONTOLOGY=',@GB_o,'.ONTOLOGY where ',@GB_o,'.ONTOLOGY is null;');


SET @sGB_lm = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_lm,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_lmno,'.ONTOLOGY, ',@GB_lmno,'.ACCESSION from ',@GB_lmno,' left outer join ',@GB_no,' on ',@GB_lmno,'.ONTOLOGY=',@GB_no,'.ONTOLOGY where ',@GB_no,'.ONTOLOGY is null;');
SET @sGB_jk = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_jk,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_jkno,'.ONTOLOGY, ',@GB_jkno,'.ACCESSION from ',@GB_jkno,' left outer join ',@GB_no,' on ',@GB_jkno,'.ONTOLOGY=',@GB_no,'.ONTOLOGY where ',@GB_no,'.ONTOLOGY is null;');
SET @sGB_ik = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_ik,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_ikmo,'.ONTOLOGY, ',@GB_ikmo,'.ACCESSION from ',@GB_ikmo,' left outer join ',@GB_mo,' on ',@GB_ikmo,'.ONTOLOGY=',@GB_mo,'.ONTOLOGY where ',@GB_mo,'.ONTOLOGY is null;');
SET @sGB_fg = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_fg,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_fgno,'.ONTOLOGY, ',@GB_fgno,'.ACCESSION from ',@GB_fgno,' left outer join ',@GB_no,' on ',@GB_fgno,'.ONTOLOGY=',@GB_no,'.ONTOLOGY where ',@GB_no,'.ONTOLOGY is null;');
SET @sGB_eg = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_eg,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_eGBo,'.ONTOLOGY, ',@GB_eGBo,'.ACCESSION from ',@GB_eGBo,' left outer join ',@GB_mo,' on ',@GB_eGBo,'.ONTOLOGY=',@GB_mo,'.ONTOLOGY where ',@GB_mo,'.ONTOLOGY is null;');
SET @sGB_cg = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_cg,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_cgko,'.ONTOLOGY, ',@GB_cgko,'.ACCESSION from ',@GB_cgko,' left outer join ',@GB_ko,' on ',@GB_cgko,'.ONTOLOGY=',@GB_ko,'.ONTOLOGY where ',@GB_ko,'.ONTOLOGY is null;');


SET @sGB_l = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_l,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_lm,'.ONTOLOGY, ',@GB_lm,'.ACCESSION from ',@GB_lm,' left outer join ',@GB_m,' on ',@GB_lm,'.ONTOLOGY=',@GB_m,'.ONTOLOGY where ',@GB_m,'.ONTOLOGY is null;');
SET @sGB_j = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_j,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_jk,'.ONTOLOGY, ',@GB_jk,'.ACCESSION from ',@GB_jk,' left outer join ',@GB_k,' on ',@GB_jk,'.ONTOLOGY=',@GB_k,'.ONTOLOGY where ',@GB_k,'.ONTOLOGY is null;');
SET @sGB_i = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_i,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_ik,'.ONTOLOGY, ',@GB_ik,'.ACCESSION from ',@GB_ik,' left outer join ',@GB_k,' on ',@GB_ik,'.ONTOLOGY=',@GB_k,'.ONTOLOGY where ',@GB_k,'.ONTOLOGY is null;');
SET @sGB_f = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_f,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_fg,'.ONTOLOGY, ',@GB_fg,'.ACCESSION from ',@GB_fg,' left outer join ',@GB_g,' on ',@GB_fg,'.ONTOLOGY=',@GB_g,'.ONTOLOGY where ',@GB_g,'.ONTOLOGY is null;');
SET @sGB_e = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_e,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_eg,'.ONTOLOGY, ',@GB_eg,'.ACCESSION from ',@GB_eg,' left outer join ',@GB_g,' on ',@GB_eg,'.ONTOLOGY=',@GB_g,'.ONTOLOGY where ',@GB_g,'.ONTOLOGY is null;');
SET @sGB_c = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_c,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_cg,'.ONTOLOGY, ',@GB_cg,'.ACCESSION from ',@GB_cg,' left outer join ',@GB_g,' on ',@GB_cg,'.ONTOLOGY=',@GB_g,'.ONTOLOGY where ',@GB_g,'.ONTOLOGY is null;');


SET @sGB_cegikmo = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_cegikmo,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_eGBo,'.ONTOLOGY, ',@GB_eGBo,'.ACCESSION from ',@GB_eGBo,', ',@GB_ik,', ',@GB_c,' where ',@GB_eGBo,'.ONTOLOGY=',@GB_ik,'.ONTOLOGY and ',@GB_ik,'.ONTOLOGY=',@GB_c,'.ONTOLOGY;');
SET @sGB_cfgjkno = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_cfgjkno,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_fgno,'.ONTOLOGY, ',@GB_fgno,'.ACCESSION from ',@GB_fgno,', ',@GB_jk,', ',@GB_c,' where ',@GB_fgno,'.ONTOLOGY=',@GB_jk,'.ONTOLOGY and ',@GB_jk,'.ONTOLOGY=',@GB_c,'.ONTOLOGY;');
SET @sGB_ijklmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_ijklmno,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_lmno,'.ONTOLOGY, ',@GB_lmno,'.ACCESSION from ',@GB_lmno,', ',@GB_jk,', ',@GB_i,' where ',@GB_lmno,'.ONTOLOGY=',@GB_jk,'.ONTOLOGY and ',@GB_jk,'.ONTOLOGY=',@GB_i,'.ONTOLOGY;');
SET @sGB_efglmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_efglmno,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_lmno,'.ONTOLOGY, ',@GB_lmno,'.ACCESSION from ',@GB_lmno,', ',@GB_fg,', ',@GB_e,' where ',@GB_lmno,'.ONTOLOGY=',@GB_fg,'.ONTOLOGY and ',@GB_fg,'.ONTOLOGY=',@GB_e,'.ONTOLOGY;');


SET @sGB_a = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_a,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_acegikmo,'.ONTOLOGY, ',@GB_acegikmo,'.ACCESSION from ',@GB_acegikmo,' left outer join ',@GB_cegikmo,' on ',@GB_acegikmo,'.ONTOLOGY=',@GB_cegikmo,'.ONTOLOGY where ',@GB_cegikmo,'.ONTOLOGY is null;');
SET @sGB_b = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_b,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_bcfgjkno,'.ONTOLOGY, ',@GB_bcfgjkno,'.ACCESSION from ',@GB_bcfgjkno,' left outer join ',@GB_cfgjkno,' on ',@GB_bcfgjkno,'.ONTOLOGY=',@GB_cfgjkno,'.ONTOLOGY where ',@GB_cfgjkno,'.ONTOLOGY is null;');
SET @sGB_d = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_d,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_defglmno,'.ONTOLOGY, ',@GB_defglmno,'.ACCESSION from ',@GB_defglmno,' left outer join ',@GB_efglmno,' on ',@GB_defglmno,'.ONTOLOGY=',@GB_efglmno,'.ONTOLOGY where ',@GB_efglmno,'.ONTOLOGY is null;');
SET @sGB_h = CONCAT('CREATE TABLE IF NOT EXISTS ',@GB_h,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GB_hijklmno,'.ONTOLOGY, ',@GB_hijklmno,'.ACCESSION from ',@GB_hijklmno,' left outer join ',@GB_ijklmno,' on ',@GB_hijklmno,'.ONTOLOGY=',@GB_ijklmno,'.ONTOLOGY where ',@GB_ijklmno,'.ONTOLOGY is null;');


PREPARE stmtGB_hijklmno FROM @sGB_hijklmno;
EXECUTE stmtGB_hijklmno;

PREPARE stmtGB_defglmno FROM @sGB_defglmno;
EXECUTE stmtGB_defglmno;

PREPARE stmtGB_bcfgjkno FROM @sGB_bcfgjkno;
EXECUTE stmtGB_bcfgjkno;

PREPARE stmtGB_acegikmo FROM @sGB_acegikmo;
EXECUTE stmtGB_acegikmo;

PREPARE stmtGB_lmno FROM @sGB_lmno;
EXECUTE stmtGB_lmno;

PREPARE stmtGB_jkno FROM @sGB_jkno;
EXECUTE stmtGB_jkno;

PREPARE stmtGB_ikmo FROM @sGB_ikmo;
EXECUTE stmtGB_ikmo;

PREPARE stmtGB_fgno FROM @sGB_fgno;
EXECUTE stmtGB_fgno;

PREPARE stmtGB_eGBo FROM @sGB_eGBo;
EXECUTE stmtGB_eGBo;

PREPARE stmtGB_cgko FROM @sGB_cgko;
EXECUTE stmtGB_cgko;

PREPARE stmtGB_no FROM @sGB_no;
EXECUTE stmtGB_no;

PREPARE stmtGB_mo FROM @sGB_mo;
EXECUTE stmtGB_mo;

PREPARE stmtGB_ko FROM @sGB_ko;
EXECUTE stmtGB_ko;

PREPARE stmtGB_go FROM @sGB_go;
EXECUTE stmtGB_go;

PREPARE stmtGB_o FROM @sGB_o;
EXECUTE stmtGB_o;

PREPARE stmtGB_n FROM @sGB_n;
EXECUTE stmtGB_n;

PREPARE stmtGB_m FROM @sGB_m;
EXECUTE stmtGB_m;

PREPARE stmtGB_k FROM @sGB_k;
EXECUTE stmtGB_k;

PREPARE stmtGB_g FROM @sGB_g;
EXECUTE stmtGB_g;

PREPARE stmtGB_lm FROM @sGB_lm;
EXECUTE stmtGB_lm;

PREPARE stmtGB_l FROM @sGB_l;
EXECUTE stmtGB_l;

PREPARE stmtGB_jk FROM @sGB_jk;
EXECUTE stmtGB_jk;

PREPARE stmtGB_j FROM @sGB_j;
EXECUTE stmtGB_j;

PREPARE stmtGB_ik FROM @sGB_ik;
EXECUTE stmtGB_ik;

PREPARE stmtGB_i FROM @sGB_i;
EXECUTE stmtGB_i;

PREPARE stmtGB_fg FROM @sGB_fg;
EXECUTE stmtGB_fg;

PREPARE stmtGB_f FROM @sGB_f;
EXECUTE stmtGB_f;

PREPARE stmtGB_eg FROM @sGB_eg;
EXECUTE stmtGB_eg;

PREPARE stmtGB_e FROM @sGB_e;
EXECUTE stmtGB_e;

PREPARE stmtGB_cg FROM @sGB_cg;
EXECUTE stmtGB_cg;

PREPARE stmtGB_c FROM @sGB_c;
EXECUTE stmtGB_c;


PREPARE stmtGB_cegikmo FROM @sGB_cegikmo;
EXECUTE stmtGB_cegikmo;

PREPARE stmtGB_cfgjkno FROM @sGB_cfgjkno;
EXECUTE stmtGB_cfgjkno;

PREPARE stmtGB_ijklmno FROM @sGB_ijklmno;
EXECUTE stmtGB_ijklmno;

PREPARE stmtGB_efglmno FROM @sGB_efglmno;
EXECUTE stmtGB_efglmno;


PREPARE stmtGB_a FROM @sGB_a;
EXECUTE stmtGB_a;

PREPARE stmtGB_b FROM @sGB_b;
EXECUTE stmtGB_b;

PREPARE stmtGB_d FROM @sGB_d;
EXECUTE stmtGB_d;

PREPARE stmtGB_h FROM @sGB_h;
EXECUTE stmtGB_h;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GM_1SET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GM_1SET`(IN s_id VARCHAR(64))
BEGIN

SET @GM = CONCAT('GM_a_',s_id);
SET @plist = CONCAT('protlist1_',s_id);
SET @sGM = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ONTOLOGY,ACCESSION from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=1 AND ACCESSION IN (select ACCESSION from ', @plist,');');

PREPARE stmtGM FROM @sGM;
EXECUTE stmtGM;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GM_2SET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GM_2SET`(IN s_id VARCHAR(64))
BEGIN

SET @GM_b = CONCAT('GM_b_',s_id);
SET @GM_c = CONCAT('GM_c_',s_id);
SET @GM_a = CONCAT('GM_a_',s_id);
SET @GM_bc = CONCAT('GM_bc_',s_id);
SET @GM_ac = CONCAT('GM_ac_',s_id);

SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);

SET @sGM_bc = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_bc,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT PROTEIN_ONTOLOGY.ONTOLOGY,PROTEIN_ONTOLOGY.ACCESSION  from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=1 AND ACCESSION IN (select ACCESSION from ',@plist1,');');
SET @sGM_ac = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_ac,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT PROTEIN_ONTOLOGY.ONTOLOGY,PROTEIN_ONTOLOGY.ACCESSION  from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=1 AND ACCESSION IN (select ACCESSION from ',@plist2,');');

SET @sGM_c = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_c,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_bc,'.ONTOLOGY,',@GM_bc,'.ACCESSION  from ',@GM_bc,' join ',@GM_ac,' on ',@GM_bc,'.ONTOLOGY=',@GM_ac,'.ONTOLOGY;');
SET @sGM_b = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_b,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_bc,'.ONTOLOGY,',@GM_bc,'.ACCESSION  from ',@GM_bc,' left outer join ',@GM_ac,' on ',@GM_bc,'.ONTOLOGY=',@GM_ac,'.ONTOLOGY where ',@GM_ac,'.ONTOLOGY is null;');
SET @sGM_a = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_a,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_ac,'.ONTOLOGY,',@GM_ac,'.ACCESSION  from ',@GM_ac,' left outer join ',@GM_bc,' on ',@GM_bc,'.ONTOLOGY=',@GM_ac,'.ONTOLOGY where ',@GM_bc,'.ONTOLOGY is null;');

PREPARE stmtGM_bc FROM @sGM_bc;
EXECUTE stmtGM_bc;

PREPARE stmtGM_ac FROM @sGM_ac;
EXECUTE stmtGM_ac;

PREPARE stmtGM_a FROM @sGM_a;
EXECUTE stmtGM_a;

PREPARE stmtGM_b FROM @sGM_b;
EXECUTE stmtGM_b;

PREPARE stmtGM_c FROM @sGM_c;
EXECUTE stmtGM_c;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GM_3SET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GM_3SET`(IN s_id VARCHAR(64))
BEGIN

SET @GM_a = CONCAT('GM_a_',s_id);
SET @GM_b = CONCAT('GM_b_',s_id);
SET @GM_c = CONCAT('GM_c_',s_id);
SET @GM_d = CONCAT('GM_d_',s_id);
SET @GM_e = CONCAT('GM_e_',s_id);
SET @GM_f = CONCAT('GM_f_',s_id);
SET @GM_g = CONCAT('GM_g_',s_id);

SET @GM_fg = CONCAT('GM_fg_',s_id);
SET @GM_eg = CONCAT('GM_eg_',s_id);
SET @GM_cg = CONCAT('GM_cg_',s_id);

SET @GM_defg = CONCAT('GM_defg_',s_id);
SET @GM_bcfg = CONCAT('GM_bcfg_',s_id);
SET @GM_aceg = CONCAT('GM_aceg_',s_id);

SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);
SET @plist3 = CONCAT('protlist3_',s_id);

SET @sGM_defg = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_defg,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ONTOLOGY,ACCESSION from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=1 AND ACCESSION IN (select ACCESSION from ',@plist1,');');
SET @sGM_bcfg = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_bcfg,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ONTOLOGY,ACCESSION from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=1 AND ACCESSION IN (select ACCESSION from ',@plist2,');');
SET @sGM_aceg = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_aceg,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ONTOLOGY,ACCESSION from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=1 AND ACCESSION IN (select ACCESSION from ',@plist3,');');

SET @sGM_fg = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_fg,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_defg,'.ONTOLOGY, ',@GM_defg,'.ACCESSION from ',@GM_defg,' join ',@GM_bcfg,' on ',@GM_defg,'.ONTOLOGY=',@GM_bcfg,'.ONTOLOGY;');
SET @sGM_eg = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_eg,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_defg,'.ONTOLOGY, ',@GM_defg,'.ACCESSION from ',@GM_defg,' join ',@GM_aceg,' on ',@GM_defg,'.ONTOLOGY=',@GM_aceg,'.ONTOLOGY;');
SET @sGM_cg = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_cg,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_bcfg,'.ONTOLOGY, ',@GM_bcfg,'.ACCESSION from ',@GM_bcfg,' join ',@GM_aceg,' on ',@GM_bcfg,'.ONTOLOGY=',@GM_aceg,'.ONTOLOGY;');

SET @sGM_g = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_g,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_fg,'.ONTOLOGY, ',@GM_fg,'.ACCESSION from ',@GM_fg,' join ',@GM_eg,' on ',@GM_fg,'.ONTOLOGY=',@GM_eg,'.ONTOLOGY and ',@GM_fg,'.ONTOLOGY IN ( select ONTOLOGY from ',@GM_cg,');');

SET @sGM_f = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_f,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_fg,'.ONTOLOGY, ',@GM_fg,'.ACCESSION from ',@GM_fg,' left outer join ',@GM_aceg,' on ',@GM_fg,'.ONTOLOGY=',@GM_aceg,'.ONTOLOGY where ',@GM_aceg,'.ONTOLOGY is null;');
SET @sGM_e = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_e,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_eg,'.ONTOLOGY, ',@GM_eg,'.ACCESSION from ',@GM_eg,' left outer join ',@GM_bcfg,' on ',@GM_eg,'.ONTOLOGY=',@GM_bcfg,'.ONTOLOGY where ',@GM_bcfg,'.ONTOLOGY is null;');
SET @sGM_c = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_c,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_cg,'.ONTOLOGY, ',@GM_cg,'.ACCESSION from ',@GM_cg,' left outer join ',@GM_defg,' on ',@GM_cg,'.ONTOLOGY=',@GM_defg,'.ONTOLOGY where ',@GM_defg,'.ONTOLOGY is null;');

SET @sGM_d = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_d,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_defg,'.ONTOLOGY, ',@GM_defg,'.ACCESSION from ',@GM_defg,' where ',@GM_defg,'.ONTOLOGY NOT IN (select ONTOLOGY from ',@GM_fg,' union select ONTOLOGY from ',@GM_eg,');');
SET @sGM_b = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_b,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_bcfg,'.ONTOLOGY, ',@GM_bcfg,'.ACCESSION from ',@GM_bcfg,' where ',@GM_bcfg,'.ONTOLOGY NOT IN (select ONTOLOGY from ',@GM_fg,' union select ONTOLOGY from ',@GM_cg,');');
SET @sGM_a = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_a,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_aceg,'.ONTOLOGY, ',@GM_aceg,'.ACCESSION from ',@GM_aceg,' where ',@GM_aceg,'.ONTOLOGY NOT IN (select ONTOLOGY from ',@GM_eg,' union select ONTOLOGY from ',@GM_cg,');');


PREPARE stmtGM_defg FROM @sGM_defg;
EXECUTE stmtGM_defg;

PREPARE stmtGM_bcfg FROM @sGM_bcfg;
EXECUTE stmtGM_bcfg;

PREPARE stmtGM_aceg FROM @sGM_aceg;
EXECUTE stmtGM_aceg;

PREPARE stmtGM_fg FROM @sGM_fg;
EXECUTE stmtGM_fg;

PREPARE stmtGM_eg FROM @sGM_eg; 
EXECUTE stmtGM_eg; 

PREPARE stmtGM_cg FROM @sGM_cg;
EXECUTE stmtGM_cg;

PREPARE stmtGM_a FROM @sGM_a;
EXECUTE stmtGM_a;

PREPARE stmtGM_b FROM @sGM_b;
EXECUTE stmtGM_b;

PREPARE stmtGM_c FROM @sGM_c;
EXECUTE stmtGM_c;

PREPARE stmtGM_d FROM @sGM_d;
EXECUTE stmtGM_d;

PREPARE stmtGM_e FROM @sGM_e;
EXECUTE stmtGM_e;

PREPARE stmtGM_f FROM @sGM_f;
EXECUTE stmtGM_f;

PREPARE stmtGM_g FROM @sGM_g;
EXECUTE stmtGM_g;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GM_4SET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GM_4SET`(IN s_id VARCHAR(64))
BEGIN


SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);
SET @plist3 = CONCAT('protlist3_',s_id);
SET @plist4 = CONCAT('protlist4_',s_id);

SET @GM_hijklmno = CONCAT('GM_hijklmno_',s_id);
SET @GM_defglmno = CONCAT('GM_defglmno_',s_id);
SET @GM_bcfgjkno = CONCAT('GM_bcfgjkno_',s_id);
SET @GM_acegikmo = CONCAT('GM_acegikmo_',s_id);

SET @GM_lmno = CONCAT('GM_lmno_',s_id);
SET @GM_jkno = CONCAT('GM_jkno_',s_id);
SET @GM_ikmo = CONCAT('GM_ikmo_',s_id);
SET @GM_fgno = CONCAT('GM_fgno_',s_id);
SET @GM_egmo = CONCAT('GM_egmo_',s_id);
SET @GM_cgko = CONCAT('GM_cgko_',s_id);

SET @GM_no = CONCAT('GM_no_',s_id);
SET @GM_mo = CONCAT('GM_mo_',s_id);
SET @GM_ko = CONCAT('GM_ko_',s_id);
SET @GM_go = CONCAT('GM_go_',s_id);

SET @GM_o = CONCAT('GM_o_',s_id);
SET @GM_n = CONCAT('GM_n_',s_id);
SET @GM_m = CONCAT('GM_m_',s_id);
SET @GM_k = CONCAT('GM_k_',s_id);
SET @GM_g = CONCAT('GM_g_',s_id);

SET @GM_l = CONCAT('GM_l_',s_ID);
SET @GM_j = CONCAT('GM_j_',s_ID);
SET @GM_i = CONCAT('GM_i_',s_ID);
SET @GM_f = CONCAT('GM_f_',s_ID);
SET @GM_e = CONCAT('GM_e_',s_ID);
SET @GM_c = CONCAT('GM_c_',s_ID);


SET @GM_lm = CONCAT('GM_lm_',s_ID);
SET @GM_jk = CONCAT('GM_jk_',s_ID);
SET @GM_ik = CONCAT('GM_ik_',s_ID);
SET @GM_fg = CONCAT('GM_fg_',s_ID);
SET @GM_eg = CONCAT('GM_eg_',s_ID);
SET @GM_cg = CONCAT('GM_cg_',s_ID);

SET @GM_cegikmo = CONCAT('GM_cegikmo_',s_ID);
SET @GM_cfgjkno = CONCAT('GM_cfgjkno_',s_ID);
SET @GM_efglmno = CONCAT('GM_efglmno_',s_ID);
SET @GM_ijklmno = CONCAT('GM_ijklmno_',s_ID);


SET @GM_a = CONCAT('GM_a_',s_ID);
SET @GM_b = CONCAT('GM_b_',s_ID);
SET @GM_d = CONCAT('GM_d_',s_ID);
SET @GM_h = CONCAT('GM_h_',s_ID);


SET @sGM_hijklmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_hijklmno,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ONTOLOGY,ACCESSION from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=1 AND ACCESSION IN (select ACCESSION from ',@plist1,');');
SET @sGM_defglmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_defglmno,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ONTOLOGY,ACCESSION from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=1 AND ACCESSION IN (select ACCESSION from ',@plist2,');');
SET @sGM_bcfgjkno = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_bcfgjkno,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ONTOLOGY,ACCESSION from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=1 AND ACCESSION IN (select ACCESSION from ',@plist3,');');
SET @sGM_acegikmo = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_acegikmo,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ONTOLOGY,ACCESSION from PROTEIN_ONTOLOGY, GO_TERMS where PROTEIN_ONTOLOGY.ONTOLOGY=GO_TERMS.TERM_ID AND GO_TERMS.NAMESPACE=1 AND ACCESSION IN (select ACCESSION from ',@plist4,');');

SET @sGM_lmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_lmno,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_hijklmno,'.ONTOLOGY, ',@GM_hijklmno,'.ACCESSION from ',@GM_hijklmno,' join ',@GM_defglmno,' on ',@GM_hijklmno,'.ONTOLOGY=',@GM_defglmno,'.ONTOLOGY;');
SET @sGM_jkno = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_jkno,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_hijklmno,'.ONTOLOGY, ',@GM_hijklmno,'.ACCESSION from ',@GM_hijklmno,' join ',@GM_bcfgjkno,' on ',@GM_hijklmno,'.ONTOLOGY=',@GM_bcfgjkno,'.ONTOLOGY;');
SET @sGM_ikmo = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_ikmo,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_hijklmno,'.ONTOLOGY, ',@GM_hijklmno,'.ACCESSION from ',@GM_hijklmno,' join ',@GM_acegikmo,' on ',@GM_hijklmno,'.ONTOLOGY=',@GM_acegikmo,'.ONTOLOGY;');
SET @sGM_fgno = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_fgno,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_defglmno,'.ONTOLOGY, ',@GM_defglmno,'.ACCESSION from ',@GM_defglmno,' join ',@GM_bcfgjkno,' on ',@GM_defglmno,'.ONTOLOGY=',@GM_bcfgjkno,'.ONTOLOGY;');
SET @sGM_egmo = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_egmo,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_defglmno,'.ONTOLOGY, ',@GM_defglmno,'.ACCESSION from ',@GM_defglmno,' join ',@GM_acegikmo,' on ',@GM_defglmno,'.ONTOLOGY=',@GM_acegikmo,'.ONTOLOGY;');
SET @sGM_cgko = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_cgko,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_bcfgjkno,'.ONTOLOGY, ',@GM_bcfgjkno,'.ACCESSION from ',@GM_bcfgjkno,' join ',@GM_acegikmo,' on ',@GM_bcfgjkno,'.ONTOLOGY=',@GM_acegikmo,'.ONTOLOGY;');

SET @sGM_no = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_no,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_hijklmno,'.ONTOLOGY, ',@GM_hijklmno,'.ACCESSION from ',@GM_hijklmno,' join ',@GM_fgno,' on ',@GM_hijklmno,'.ONTOLOGY=',@GM_fgno,'.ONTOLOGY;');
SET @sGM_mo = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_mo,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_hijklmno,'.ONTOLOGY, ',@GM_hijklmno,'.ACCESSION from ',@GM_hijklmno,' join ',@GM_egmo,' on ',@GM_hijklmno,'.ONTOLOGY=',@GM_egmo,'.ONTOLOGY;');
SET @sGM_ko = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_ko,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_hijklmno,'.ONTOLOGY, ',@GM_hijklmno,'.ACCESSION from ',@GM_hijklmno,' join ',@GM_cgko,' on ',@GM_hijklmno,'.ONTOLOGY=',@GM_cgko,'.ONTOLOGY;');
SET @sGM_go = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_go,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_defglmno,'.ONTOLOGY, ',@GM_defglmno,'.ACCESSION from ',@GM_defglmno,' join ',@GM_cgko,' on ',@GM_defglmno,'.ONTOLOGY=',@GM_cgko,'.ONTOLOGY;');

SET @sGM_o = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_o,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_hijklmno,'.ONTOLOGY, ',@GM_hijklmno,'.ACCESSION from ',@GM_hijklmno,' join ',@GM_go,' on ',@GM_hijklmno,'.ONTOLOGY=',@GM_go,'.ONTOLOGY;');


SET @sGM_n = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_n,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_no,'.ONTOLOGY, ',@GM_no,'.ACCESSION from ',@GM_no,' left outer join ',@GM_o,' on ',@GM_no,'.ONTOLOGY=',@GM_o,'.ONTOLOGY where ',@GM_o,'.ONTOLOGY is null;');
SET @sGM_m = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_m,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_mo,'.ONTOLOGY, ',@GM_mo,'.ACCESSION from ',@GM_mo,' left outer join ',@GM_o,' on ',@GM_mo,'.ONTOLOGY=',@GM_o,'.ONTOLOGY where ',@GM_o,'.ONTOLOGY is null;');
SET @sGM_k = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_k,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_ko,'.ONTOLOGY, ',@GM_ko,'.ACCESSION from ',@GM_ko,' left outer join ',@GM_o,' on ',@GM_ko,'.ONTOLOGY=',@GM_o,'.ONTOLOGY where ',@GM_o,'.ONTOLOGY is null;');
SET @sGM_g = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_g,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_go,'.ONTOLOGY, ',@GM_go,'.ACCESSION from ',@GM_go,' left outer join ',@GM_o,' on ',@GM_go,'.ONTOLOGY=',@GM_o,'.ONTOLOGY where ',@GM_o,'.ONTOLOGY is null;');


SET @sGM_lm = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_lm,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_lmno,'.ONTOLOGY, ',@GM_lmno,'.ACCESSION from ',@GM_lmno,' left outer join ',@GM_no,' on ',@GM_lmno,'.ONTOLOGY=',@GM_no,'.ONTOLOGY where ',@GM_no,'.ONTOLOGY is null;');
SET @sGM_jk = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_jk,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_jkno,'.ONTOLOGY, ',@GM_jkno,'.ACCESSION from ',@GM_jkno,' left outer join ',@GM_no,' on ',@GM_jkno,'.ONTOLOGY=',@GM_no,'.ONTOLOGY where ',@GM_no,'.ONTOLOGY is null;');
SET @sGM_ik = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_ik,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_ikmo,'.ONTOLOGY, ',@GM_ikmo,'.ACCESSION from ',@GM_ikmo,' left outer join ',@GM_mo,' on ',@GM_ikmo,'.ONTOLOGY=',@GM_mo,'.ONTOLOGY where ',@GM_mo,'.ONTOLOGY is null;');
SET @sGM_fg = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_fg,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_fgno,'.ONTOLOGY, ',@GM_fgno,'.ACCESSION from ',@GM_fgno,' left outer join ',@GM_no,' on ',@GM_fgno,'.ONTOLOGY=',@GM_no,'.ONTOLOGY where ',@GM_no,'.ONTOLOGY is null;');
SET @sGM_eg = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_eg,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_egmo,'.ONTOLOGY, ',@GM_egmo,'.ACCESSION from ',@GM_egmo,' left outer join ',@GM_mo,' on ',@GM_egmo,'.ONTOLOGY=',@GM_mo,'.ONTOLOGY where ',@GM_mo,'.ONTOLOGY is null;');
SET @sGM_cg = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_cg,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_cgko,'.ONTOLOGY, ',@GM_cgko,'.ACCESSION from ',@GM_cgko,' left outer join ',@GM_ko,' on ',@GM_cgko,'.ONTOLOGY=',@GM_ko,'.ONTOLOGY where ',@GM_ko,'.ONTOLOGY is null;');


SET @sGM_l = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_l,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_lm,'.ONTOLOGY, ',@GM_lm,'.ACCESSION from ',@GM_lm,' left outer join ',@GM_m,' on ',@GM_lm,'.ONTOLOGY=',@GM_m,'.ONTOLOGY where ',@GM_m,'.ONTOLOGY is null;');
SET @sGM_j = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_j,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_jk,'.ONTOLOGY, ',@GM_jk,'.ACCESSION from ',@GM_jk,' left outer join ',@GM_k,' on ',@GM_jk,'.ONTOLOGY=',@GM_k,'.ONTOLOGY where ',@GM_k,'.ONTOLOGY is null;');
SET @sGM_i = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_i,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_ik,'.ONTOLOGY, ',@GM_ik,'.ACCESSION from ',@GM_ik,' left outer join ',@GM_k,' on ',@GM_ik,'.ONTOLOGY=',@GM_k,'.ONTOLOGY where ',@GM_k,'.ONTOLOGY is null;');
SET @sGM_f = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_f,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_fg,'.ONTOLOGY, ',@GM_fg,'.ACCESSION from ',@GM_fg,' left outer join ',@GM_g,' on ',@GM_fg,'.ONTOLOGY=',@GM_g,'.ONTOLOGY where ',@GM_g,'.ONTOLOGY is null;');
SET @sGM_e = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_e,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_eg,'.ONTOLOGY, ',@GM_eg,'.ACCESSION from ',@GM_eg,' left outer join ',@GM_g,' on ',@GM_eg,'.ONTOLOGY=',@GM_g,'.ONTOLOGY where ',@GM_g,'.ONTOLOGY is null;');
SET @sGM_c = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_c,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_cg,'.ONTOLOGY, ',@GM_cg,'.ACCESSION from ',@GM_cg,' left outer join ',@GM_g,' on ',@GM_cg,'.ONTOLOGY=',@GM_g,'.ONTOLOGY where ',@GM_g,'.ONTOLOGY is null;');


SET @sGM_cegikmo = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_cegikmo,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_egmo,'.ONTOLOGY, ',@GM_egmo,'.ACCESSION from ',@GM_egmo,', ',@GM_ik,', ',@GM_c,' where ',@GM_egmo,'.ONTOLOGY=',@GM_ik,'.ONTOLOGY and ',@GM_ik,'.ONTOLOGY=',@GM_c,'.ONTOLOGY;');
SET @sGM_cfgjkno = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_cfgjkno,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_fgno,'.ONTOLOGY, ',@GM_fgno,'.ACCESSION from ',@GM_fgno,', ',@GM_jk,', ',@GM_c,' where ',@GM_fgno,'.ONTOLOGY=',@GM_jk,'.ONTOLOGY and ',@GM_jk,'.ONTOLOGY=',@GM_c,'.ONTOLOGY;');
SET @sGM_ijklmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_ijklmno,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_lmno,'.ONTOLOGY, ',@GM_lmno,'.ACCESSION from ',@GM_lmno,', ',@GM_jk,', ',@GM_i,' where ',@GM_lmno,'.ONTOLOGY=',@GM_jk,'.ONTOLOGY and ',@GM_jk,'.ONTOLOGY=',@GM_i,'.ONTOLOGY;');
SET @sGM_efglmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_efglmno,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_lmno,'.ONTOLOGY, ',@GM_lmno,'.ACCESSION from ',@GM_lmno,', ',@GM_fg,', ',@GM_e,' where ',@GM_lmno,'.ONTOLOGY=',@GM_fg,'.ONTOLOGY and ',@GM_fg,'.ONTOLOGY=',@GM_e,'.ONTOLOGY;');


SET @sGM_a = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_a,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_acegikmo,'.ONTOLOGY, ',@GM_acegikmo,'.ACCESSION from ',@GM_acegikmo,' left outer join ',@GM_cegikmo,' on ',@GM_acegikmo,'.ONTOLOGY=',@GM_cegikmo,'.ONTOLOGY where ',@GM_cegikmo,'.ONTOLOGY is null;');
SET @sGM_b = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_b,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_bcfgjkno,'.ONTOLOGY, ',@GM_bcfgjkno,'.ACCESSION from ',@GM_bcfgjkno,' left outer join ',@GM_cfgjkno,' on ',@GM_bcfgjkno,'.ONTOLOGY=',@GM_cfgjkno,'.ONTOLOGY where ',@GM_cfgjkno,'.ONTOLOGY is null;');
SET @sGM_d = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_d,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_defglmno,'.ONTOLOGY, ',@GM_defglmno,'.ACCESSION from ',@GM_defglmno,' left outer join ',@GM_efglmno,' on ',@GM_defglmno,'.ONTOLOGY=',@GM_efglmno,'.ONTOLOGY where ',@GM_efglmno,'.ONTOLOGY is null;');
SET @sGM_h = CONCAT('CREATE TABLE IF NOT EXISTS ',@GM_h,' (PRIMARY KEY my_pkey (ONTOLOGY,ACCESSION)) select DISTINCT ',@GM_hijklmno,'.ONTOLOGY, ',@GM_hijklmno,'.ACCESSION from ',@GM_hijklmno,' left outer join ',@GM_ijklmno,' on ',@GM_hijklmno,'.ONTOLOGY=',@GM_ijklmno,'.ONTOLOGY where ',@GM_ijklmno,'.ONTOLOGY is null;');


PREPARE stmtGM_hijklmno FROM @sGM_hijklmno;
EXECUTE stmtGM_hijklmno;

PREPARE stmtGM_defglmno FROM @sGM_defglmno;
EXECUTE stmtGM_defglmno;

PREPARE stmtGM_bcfgjkno FROM @sGM_bcfgjkno;
EXECUTE stmtGM_bcfgjkno;

PREPARE stmtGM_acegikmo FROM @sGM_acegikmo;
EXECUTE stmtGM_acegikmo;

PREPARE stmtGM_lmno FROM @sGM_lmno;
EXECUTE stmtGM_lmno;

PREPARE stmtGM_jkno FROM @sGM_jkno;
EXECUTE stmtGM_jkno;

PREPARE stmtGM_ikmo FROM @sGM_ikmo;
EXECUTE stmtGM_ikmo;

PREPARE stmtGM_fgno FROM @sGM_fgno;
EXECUTE stmtGM_fgno;

PREPARE stmtGM_egmo FROM @sGM_egmo;
EXECUTE stmtGM_egmo;

PREPARE stmtGM_cgko FROM @sGM_cgko;
EXECUTE stmtGM_cgko;

PREPARE stmtGM_no FROM @sGM_no;
EXECUTE stmtGM_no;

PREPARE stmtGM_mo FROM @sGM_mo;
EXECUTE stmtGM_mo;

PREPARE stmtGM_ko FROM @sGM_ko;
EXECUTE stmtGM_ko;

PREPARE stmtGM_go FROM @sGM_go;
EXECUTE stmtGM_go;

PREPARE stmtGM_o FROM @sGM_o;
EXECUTE stmtGM_o;

PREPARE stmtGM_n FROM @sGM_n;
EXECUTE stmtGM_n;

PREPARE stmtGM_m FROM @sGM_m;
EXECUTE stmtGM_m;

PREPARE stmtGM_k FROM @sGM_k;
EXECUTE stmtGM_k;

PREPARE stmtGM_g FROM @sGM_g;
EXECUTE stmtGM_g;

PREPARE stmtGM_lm FROM @sGM_lm;
EXECUTE stmtGM_lm;

PREPARE stmtGM_l FROM @sGM_l;
EXECUTE stmtGM_l;

PREPARE stmtGM_jk FROM @sGM_jk;
EXECUTE stmtGM_jk;

PREPARE stmtGM_j FROM @sGM_j;
EXECUTE stmtGM_j;

PREPARE stmtGM_ik FROM @sGM_ik;
EXECUTE stmtGM_ik;

PREPARE stmtGM_i FROM @sGM_i;
EXECUTE stmtGM_i;

PREPARE stmtGM_fg FROM @sGM_fg;
EXECUTE stmtGM_fg;

PREPARE stmtGM_f FROM @sGM_f;
EXECUTE stmtGM_f;

PREPARE stmtGM_eg FROM @sGM_eg;
EXECUTE stmtGM_eg;

PREPARE stmtGM_e FROM @sGM_e;
EXECUTE stmtGM_e;

PREPARE stmtGM_cg FROM @sGM_cg;
EXECUTE stmtGM_cg;

PREPARE stmtGM_c FROM @sGM_c;
EXECUTE stmtGM_c;


PREPARE stmtGM_cegikmo FROM @sGM_cegikmo;
EXECUTE stmtGM_cegikmo;

PREPARE stmtGM_cfgjkno FROM @sGM_cfgjkno;
EXECUTE stmtGM_cfgjkno;

PREPARE stmtGM_ijklmno FROM @sGM_ijklmno;
EXECUTE stmtGM_ijklmno;

PREPARE stmtGM_efglmno FROM @sGM_efglmno;
EXECUTE stmtGM_efglmno;


PREPARE stmtGM_a FROM @sGM_a;
EXECUTE stmtGM_a;

PREPARE stmtGM_b FROM @sGM_b;
EXECUTE stmtGM_b;

PREPARE stmtGM_d FROM @sGM_d;
EXECUTE stmtGM_d;

PREPARE stmtGM_h FROM @sGM_h;
EXECUTE stmtGM_h;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PROT_1SET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROT_1SET`(IN s_id VARCHAR(64))
BEGIN

SET @P_a = CONCAT('P_a_',s_id);
SET @plist1 = CONCAT('protlist1_',s_id);

SET @sP_a = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_a,' (PRIMARY KEY my_pkey (ACCESSION)) select DISTINCT ACCESSION from ',@plist1,';');

PREPARE stmtP_a FROM @sP_a;
EXECUTE stmtP_a;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PROT_2SET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROT_2SET`(IN s_id VARCHAR(64))
BEGIN

SET @P_b = CONCAT('P_b_',s_id);
SET @P_c = CONCAT('P_c_',s_id);
SET @P_a = CONCAT('P_a_',s_id);
SET @P_bc = CONCAT('P_bc_',s_id);
SET @P_ac = CONCAT('P_ac_',s_id);

SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);

SET @sP_bc = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_bc,' (PRIMARY KEY my_pkey (ACCESSION)) select DISTINCT ACCESSION from ',@plist1,';');
SET @sP_ac = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_ac,' (PRIMARY KEY my_pkey (ACCESSION)) select DISTINCT ACCESSION from ',@plist2,';');

SET @sP_c = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_c,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_bc,'.ACCESSION from ',@P_bc,' join ',@P_ac,' on ',@P_bc,'.ACCESSION=',@P_ac,'.ACCESSION;');
SET @sP_b = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_b,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_bc,'.ACCESSION from ',@P_bc,' left outer join ',@P_ac,' on ',@P_bc,'.ACCESSION=',@P_ac,'.ACCESSION where ',@P_ac,'.ACCESSION is null;');
SET @sP_a = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_a,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_ac,'.ACCESSION from ',@P_ac,' left outer join ',@P_bc,' on ',@P_bc,'.ACCESSION=',@P_ac,'.ACCESSION where ',@P_bc,'.ACCESSION is null;');

PREPARE stmtP_bc FROM @sP_bc;
EXECUTE stmtP_bc;

PREPARE stmtP_ac FROM @sP_ac;
EXECUTE stmtP_ac;

PREPARE stmtP_a FROM @sP_a;
EXECUTE stmtP_a;

PREPARE stmtP_b FROM @sP_b;
EXECUTE stmtP_b;

PREPARE stmtP_c FROM @sP_c;
EXECUTE stmtP_c;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PROT_3SET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROT_3SET`(IN s_id VARCHAR(64))
BEGIN

SET @P_a = CONCAT('P_a_',s_id);
SET @P_b = CONCAT('P_b_',s_id);
SET @P_c = CONCAT('P_c_',s_id);
SET @P_d = CONCAT('P_d_',s_id);
SET @P_e = CONCAT('P_e_',s_id);
SET @P_f = CONCAT('P_f_',s_id);
SET @P_g = CONCAT('P_g_',s_id);

SET @P_fg = CONCAT('P_fg_',s_id);
SET @P_eg = CONCAT('P_eg_',s_id);
SET @P_cg = CONCAT('P_cg_',s_id);

SET @P_defg = CONCAT('P_defg_',s_id);
SET @P_bcfg = CONCAT('P_bcfg_',s_id);
SET @P_aceg = CONCAT('P_aceg_',s_id);

SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);
SET @plist3 = CONCAT('protlist3_',s_id);

SET @sP_defg = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_defg,' (PRIMARY KEY my_pkey (ACCESSION)) select DISTINCT ACCESSION from ',@plist1,';');
SET @sP_bcfg = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_bcfg,' (PRIMARY KEY my_pkey (ACCESSION)) select DISTINCT ACCESSION from ',@plist2,';');
SET @sP_aceg = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_aceg,' (PRIMARY KEY my_pkey (ACCESSION)) select DISTINCT ACCESSION from ',@plist3,';');

SET @sP_fg = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_fg,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_defg,'.ACCESSION from ',@P_defg,' join ',@P_bcfg,' on ',@P_defg,'.ACCESSION=',@P_bcfg,'.ACCESSION;');
SET @sP_eg = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_eg,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_defg,'.ACCESSION from ',@P_defg,' join ',@P_aceg,' on ',@P_defg,'.ACCESSION=',@P_aceg,'.ACCESSION;');
SET @sP_cg = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_cg,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_bcfg,'.ACCESSION from ',@P_bcfg,' join ',@P_aceg,' on ',@P_bcfg,'.ACCESSION=',@P_aceg,'.ACCESSION;');

SET @sP_g = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_g,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_fg,'.ACCESSION from ',@P_fg,' join ',@P_eg,' on ',@P_fg,'.ACCESSION=',@P_eg,'.ACCESSION and ',@P_fg,'.ACCESSION IN ( select ACCESSION from ',@P_cg,');');

SET @sP_f = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_f,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_fg,'.ACCESSION from ',@P_fg,' left outer join ',@P_aceg,' on ',@P_fg,'.ACCESSION=',@P_aceg,'.ACCESSION where ',@P_aceg,'.ACCESSION is null;');
SET @sP_e = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_e,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_eg,'.ACCESSION from ',@P_eg,' left outer join ',@P_bcfg,' on ',@P_eg,'.ACCESSION=',@P_bcfg,'.ACCESSION where ',@P_bcfg,'.ACCESSION is null;');
SET @sP_c = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_c,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_cg,'.ACCESSION from ',@P_cg,' left outer join ',@P_defg,' on ',@P_cg,'.ACCESSION=',@P_defg,'.ACCESSION where ',@P_defg,'.ACCESSION is null;');

SET @sP_d = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_d,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_defg,'.ACCESSION from ',@P_defg,' where ',@P_defg,'.ACCESSION NOT IN (select ACCESSION from ',@P_fg,' union select ACCESSION from ',@P_eg,');');
SET @sP_b = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_b,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_bcfg,'.ACCESSION from ',@P_bcfg,' where ',@P_bcfg,'.ACCESSION NOT IN (select ACCESSION from ',@P_fg,' union select ACCESSION from ',@P_cg,');');
SET @sP_a = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_a,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_aceg,'.ACCESSION from ',@P_aceg,' where ',@P_aceg,'.ACCESSION NOT IN (select ACCESSION from ',@P_eg,' union select ACCESSION from ',@P_cg,');');


PREPARE stmtP_defg FROM @sP_defg;
EXECUTE stmtP_defg;

PREPARE stmtP_bcfg FROM @sP_bcfg;
EXECUTE stmtP_bcfg;

PREPARE stmtP_aceg FROM @sP_aceg;
EXECUTE stmtP_aceg;

PREPARE stmtP_fg FROM @sP_fg;
EXECUTE stmtP_fg;

PREPARE stmtP_eg FROM @sP_eg; 
EXECUTE stmtP_eg; 

PREPARE stmtP_cg FROM @sP_cg;
EXECUTE stmtP_cg;

PREPARE stmtP_a FROM @sP_a;
EXECUTE stmtP_a;

PREPARE stmtP_b FROM @sP_b;
EXECUTE stmtP_b;

PREPARE stmtP_c FROM @sP_c;
EXECUTE stmtP_c;

PREPARE stmtP_d FROM @sP_d;
EXECUTE stmtP_d;

PREPARE stmtP_e FROM @sP_e;
EXECUTE stmtP_e;

PREPARE stmtP_f FROM @sP_f;
EXECUTE stmtP_f;

PREPARE stmtP_g FROM @sP_g;
EXECUTE stmtP_g;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PROT_4SET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROT_4SET`(IN s_id VARCHAR(64))
BEGIN

SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);
SET @plist3 = CONCAT('protlist3_',s_id);
SET @plist4 = CONCAT('protlist4_',s_id);

SET @P_hijklmno = CONCAT('P_hijklmno_',s_id);
SET @P_defglmno = CONCAT('P_defglmno_',s_id);
SET @P_bcfgjkno = CONCAT('P_bcfgjkno_',s_id);
SET @P_acegikmo = CONCAT('P_acegikmo_',s_id);

SET @P_lmno = CONCAT('P_lmno_',s_id);
SET @P_jkno = CONCAT('P_jkno_',s_id);
SET @P_ikmo = CONCAT('P_ikmo_',s_id);
SET @P_fgno = CONCAT('P_fgno_',s_id);
SET @P_egmo = CONCAT('P_egmo_',s_id);
SET @P_cgko = CONCAT('P_cgko_',s_id);

SET @P_no = CONCAT('P_no_',s_id);
SET @P_mo = CONCAT('P_mo_',s_id);
SET @P_ko = CONCAT('P_ko_',s_id);
SET @P_go = CONCAT('P_go_',s_id);

SET @P_o = CONCAT('P_o_',s_id);
SET @P_n = CONCAT('P_n_',s_id);
SET @P_m = CONCAT('P_m_',s_id);
SET @P_k = CONCAT('P_k_',s_id);
SET @P_g = CONCAT('P_g_',s_id);

SET @P_l = CONCAT('P_l_',s_ID);
SET @P_j = CONCAT('P_j_',s_ID);
SET @P_i = CONCAT('P_i_',s_ID);
SET @P_f = CONCAT('P_f_',s_ID);
SET @P_e = CONCAT('P_e_',s_ID);
SET @P_c = CONCAT('P_c_',s_ID);


SET @P_lm = CONCAT('P_lm_',s_ID);
SET @P_jk = CONCAT('P_jk_',s_ID);
SET @P_ik = CONCAT('P_ik_',s_ID);
SET @P_fg = CONCAT('P_fg_',s_ID);
SET @P_eg = CONCAT('P_eg_',s_ID);
SET @P_cg = CONCAT('P_cg_',s_ID);

SET @P_cegikmo = CONCAT('P_cegikmo_',s_ID);
SET @P_cfgjkno = CONCAT('P_cfgjkno_',s_ID);
SET @P_efglmno = CONCAT('P_efglmno_',s_ID);
SET @P_ijklmno = CONCAT('P_ijklmno_',s_ID);


SET @P_a = CONCAT('P_a_',s_ID);
SET @P_b = CONCAT('P_b_',s_ID);
SET @P_d = CONCAT('P_d_',s_ID);
SET @P_h = CONCAT('P_h_',s_ID);

SET @sP_hijklmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_hijklmno,' (PRIMARY KEY my_pkey (ACCESSION)) select DISTINCT ACCESSION from ',@plist1,';');
SET @sP_defglmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_defglmno,' (PRIMARY KEY my_pkey (ACCESSION)) select DISTINCT ACCESSION from ',@plist2,';');
SET @sP_bcfgjkno = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_bcfgjkno,' (PRIMARY KEY my_pkey (ACCESSION)) select DISTINCT ACCESSION from ',@plist3,';');
SET @sP_acegikmo = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_acegikmo,' (PRIMARY KEY my_pkey (ACCESSION)) select DISTINCT ACCESSION from ',@plist4,';');


SET @sP_lmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_lmno,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_hijklmno,'.ACCESSION from ',@P_hijklmno,' join ',@P_defglmno,' on ',@P_hijklmno,'.ACCESSION=',@P_defglmno,'.ACCESSION;');
SET @sP_jkno = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_jkno,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_hijklmno,'.ACCESSION from ',@P_hijklmno,' join ',@P_bcfgjkno,' on ',@P_hijklmno,'.ACCESSION=',@P_bcfgjkno,'.ACCESSION;');
SET @sP_ikmo = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_ikmo,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_hijklmno,'.ACCESSION from ',@P_hijklmno,' join ',@P_acegikmo,' on ',@P_hijklmno,'.ACCESSION=',@P_acegikmo,'.ACCESSION;');
SET @sP_fgno = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_fgno,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_defglmno,'.ACCESSION from ',@P_defglmno,' join ',@P_bcfgjkno,' on ',@P_defglmno,'.ACCESSION=',@P_bcfgjkno,'.ACCESSION;');
SET @sP_egmo = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_egmo,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_defglmno,'.ACCESSION from ',@P_defglmno,' join ',@P_acegikmo,' on ',@P_defglmno,'.ACCESSION=',@P_acegikmo,'.ACCESSION;');
SET @sP_cgko = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_cgko,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_bcfgjkno,'.ACCESSION from ',@P_bcfgjkno,' join ',@P_acegikmo,' on ',@P_bcfgjkno,'.ACCESSION=',@P_acegikmo,'.ACCESSION;');

SET @sP_no = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_no,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_hijklmno,'.ACCESSION from ',@P_hijklmno,' join ',@P_fgno,' on ',@P_hijklmno,'.ACCESSION=',@P_fgno,'.ACCESSION;');
SET @sP_mo = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_mo,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_hijklmno,'.ACCESSION from ',@P_hijklmno,' join ',@P_egmo,' on ',@P_hijklmno,'.ACCESSION=',@P_egmo,'.ACCESSION;');
SET @sP_ko = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_ko,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_hijklmno,'.ACCESSION from ',@P_hijklmno,' join ',@P_cgko,' on ',@P_hijklmno,'.ACCESSION=',@P_cgko,'.ACCESSION;');
SET @sP_go = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_go,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_defglmno,'.ACCESSION from ',@P_defglmno,' join ',@P_cgko,' on ',@P_defglmno,'.ACCESSION=',@P_cgko,'.ACCESSION;');

SET @sP_o = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_o,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_hijklmno,'.ACCESSION from ',@P_hijklmno,' join ',@P_go,' on ',@P_hijklmno,'.ACCESSION=',@P_go,'.ACCESSION;');


SET @sP_n = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_n,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_no,'.ACCESSION from ',@P_no,' left outer join ',@P_o,' on ',@P_no,'.ACCESSION=',@P_o,'.ACCESSION where ',@P_o,'.ACCESSION is null;');
SET @sP_m = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_m,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_mo,'.ACCESSION from ',@P_mo,' left outer join ',@P_o,' on ',@P_mo,'.ACCESSION=',@P_o,'.ACCESSION where ',@P_o,'.ACCESSION is null;');
SET @sP_k = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_k,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_ko,'.ACCESSION from ',@P_ko,' left outer join ',@P_o,' on ',@P_ko,'.ACCESSION=',@P_o,'.ACCESSION where ',@P_o,'.ACCESSION is null;');
SET @sP_g = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_g,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_go,'.ACCESSION from ',@P_go,' left outer join ',@P_o,' on ',@P_go,'.ACCESSION=',@P_o,'.ACCESSION where ',@P_o,'.ACCESSION is null;');


SET @sP_lm = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_lm,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_lmno,'.ACCESSION from ',@P_lmno,' left outer join ',@P_no,' on ',@P_lmno,'.ACCESSION=',@P_no,'.ACCESSION where ',@P_no,'.ACCESSION is null;');
SET @sP_jk = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_jk,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_jkno,'.ACCESSION from ',@P_jkno,' left outer join ',@P_no,' on ',@P_jkno,'.ACCESSION=',@P_no,'.ACCESSION where ',@P_no,'.ACCESSION is null;');
SET @sP_ik = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_ik,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_ikmo,'.ACCESSION from ',@P_ikmo,' left outer join ',@P_mo,' on ',@P_ikmo,'.ACCESSION=',@P_mo,'.ACCESSION where ',@P_mo,'.ACCESSION is null;');
SET @sP_fg = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_fg,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_fgno,'.ACCESSION from ',@P_fgno,' left outer join ',@P_no,' on ',@P_fgno,'.ACCESSION=',@P_no,'.ACCESSION where ',@P_no,'.ACCESSION is null;');
SET @sP_eg = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_eg,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_egmo,'.ACCESSION from ',@P_egmo,' left outer join ',@P_mo,' on ',@P_egmo,'.ACCESSION=',@P_mo,'.ACCESSION where ',@P_mo,'.ACCESSION is null;');
SET @sP_cg = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_cg,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_cgko,'.ACCESSION from ',@P_cgko,' left outer join ',@P_ko,' on ',@P_cgko,'.ACCESSION=',@P_ko,'.ACCESSION where ',@P_ko,'.ACCESSION is null;');


SET @sP_l = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_l,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_lm,'.ACCESSION from ',@P_lm,' left outer join ',@P_m,' on ',@P_lm,'.ACCESSION=',@P_m,'.ACCESSION where ',@P_m,'.ACCESSION is null;');
SET @sP_j = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_j,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_jk,'.ACCESSION from ',@P_jk,' left outer join ',@P_k,' on ',@P_jk,'.ACCESSION=',@P_k,'.ACCESSION where ',@P_k,'.ACCESSION is null;');
SET @sP_i = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_i,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_ik,'.ACCESSION from ',@P_ik,' left outer join ',@P_k,' on ',@P_ik,'.ACCESSION=',@P_k,'.ACCESSION where ',@P_k,'.ACCESSION is null;');
SET @sP_f = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_f,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_fg,'.ACCESSION from ',@P_fg,' left outer join ',@P_g,' on ',@P_fg,'.ACCESSION=',@P_g,'.ACCESSION where ',@P_g,'.ACCESSION is null;');
SET @sP_e = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_e,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_eg,'.ACCESSION from ',@P_eg,' left outer join ',@P_g,' on ',@P_eg,'.ACCESSION=',@P_g,'.ACCESSION where ',@P_g,'.ACCESSION is null;');
SET @sP_c = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_c,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_cg,'.ACCESSION from ',@P_cg,' left outer join ',@P_g,' on ',@P_cg,'.ACCESSION=',@P_g,'.ACCESSION where ',@P_g,'.ACCESSION is null;');


SET @sP_cegikmo = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_cegikmo,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_egmo,'.ACCESSION from ',@P_egmo,', ',@P_ik,', ',@P_c,' where ',@P_egmo,'.ACCESSION=',@P_ik,'.ACCESSION and ',@P_ik,'.ACCESSION=',@P_c,'.ACCESSION;');
SET @sP_cfgjkno = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_cfgjkno,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_fgno,'.ACCESSION from ',@P_fgno,', ',@P_jk,', ',@P_c,' where ',@P_fgno,'.ACCESSION=',@P_jk,'.ACCESSION and ',@P_jk,'.ACCESSION=',@P_c,'.ACCESSION;');
SET @sP_ijklmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_ijklmno,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_lmno,'.ACCESSION from ',@P_lmno,', ',@P_jk,', ',@P_i,' where ',@P_lmno,'.ACCESSION=',@P_jk,'.ACCESSION and ',@P_jk,'.ACCESSION=',@P_i,'.ACCESSION;');
SET @sP_efglmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_efglmno,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_lmno,'.ACCESSION from ',@P_lmno,', ',@P_fg,', ',@P_e,' where ',@P_lmno,'.ACCESSION=',@P_fg,'.ACCESSION and ',@P_fg,'.ACCESSION=',@P_e,'.ACCESSION;');


SET @sP_a = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_a,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_acegikmo,'.ACCESSION from ',@P_acegikmo,' left outer join ',@P_cegikmo,' on ',@P_acegikmo,'.ACCESSION=',@P_cegikmo,'.ACCESSION where ',@P_cegikmo,'.ACCESSION is null;');
SET @sP_b = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_b,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_bcfgjkno,'.ACCESSION from ',@P_bcfgjkno,' left outer join ',@P_cfgjkno,' on ',@P_bcfgjkno,'.ACCESSION=',@P_cfgjkno,'.ACCESSION where ',@P_cfgjkno,'.ACCESSION is null;');
SET @sP_d = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_d,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_defglmno,'.ACCESSION from ',@P_defglmno,' left outer join ',@P_efglmno,' on ',@P_defglmno,'.ACCESSION=',@P_efglmno,'.ACCESSION where ',@P_efglmno,'.ACCESSION is null;');
SET @sP_h = CONCAT('CREATE TABLE IF NOT EXISTS ',@P_h,' (PRIMARY KEY my_pkey (ACCESSION)) select ',@P_hijklmno,'.ACCESSION from ',@P_hijklmno,' left outer join ',@P_ijklmno,' on ',@P_hijklmno,'.ACCESSION=',@P_ijklmno,'.ACCESSION where ',@P_ijklmno,'.ACCESSION is null;');


PREPARE stmtP_hijklmno FROM @sP_hijklmno;
EXECUTE stmtP_hijklmno;

PREPARE stmtP_defglmno FROM @sP_defglmno;
EXECUTE stmtP_defglmno;

PREPARE stmtP_bcfgjkno FROM @sP_bcfgjkno;
EXECUTE stmtP_bcfgjkno;

PREPARE stmtP_acegikmo FROM @sP_acegikmo;
EXECUTE stmtP_acegikmo;

PREPARE stmtP_lmno FROM @sP_lmno;
EXECUTE stmtP_lmno;

PREPARE stmtP_jkno FROM @sP_jkno;
EXECUTE stmtP_jkno;

PREPARE stmtP_ikmo FROM @sP_ikmo;
EXECUTE stmtP_ikmo;

PREPARE stmtP_fgno FROM @sP_fgno;
EXECUTE stmtP_fgno;

PREPARE stmtP_egmo FROM @sP_egmo;
EXECUTE stmtP_egmo;

PREPARE stmtP_cgko FROM @sP_cgko;
EXECUTE stmtP_cgko;

PREPARE stmtP_no FROM @sP_no;
EXECUTE stmtP_no;

PREPARE stmtP_mo FROM @sP_mo;
EXECUTE stmtP_mo;

PREPARE stmtP_ko FROM @sP_ko;
EXECUTE stmtP_ko;

PREPARE stmtP_go FROM @sP_go;
EXECUTE stmtP_go;

PREPARE stmtP_o FROM @sP_o;
EXECUTE stmtP_o;

PREPARE stmtP_n FROM @sP_n;
EXECUTE stmtP_n;

PREPARE stmtP_m FROM @sP_m;
EXECUTE stmtP_m;

PREPARE stmtP_k FROM @sP_k;
EXECUTE stmtP_k;

PREPARE stmtP_g FROM @sP_g;
EXECUTE stmtP_g;

PREPARE stmtP_lm FROM @sP_lm;
EXECUTE stmtP_lm;

PREPARE stmtP_l FROM @sP_l;
EXECUTE stmtP_l;

PREPARE stmtP_jk FROM @sP_jk;
EXECUTE stmtP_jk;

PREPARE stmtP_j FROM @sP_j;
EXECUTE stmtP_j;

PREPARE stmtP_ik FROM @sP_ik;
EXECUTE stmtP_ik;

PREPARE stmtP_i FROM @sP_i;
EXECUTE stmtP_i;

PREPARE stmtP_fg FROM @sP_fg;
EXECUTE stmtP_fg;

PREPARE stmtP_f FROM @sP_f;
EXECUTE stmtP_f;

PREPARE stmtP_eg FROM @sP_eg;
EXECUTE stmtP_eg;

PREPARE stmtP_e FROM @sP_e;
EXECUTE stmtP_e;

PREPARE stmtP_cg FROM @sP_cg;
EXECUTE stmtP_cg;

PREPARE stmtP_c FROM @sP_c;
EXECUTE stmtP_c;


PREPARE stmtP_cegikmo FROM @sP_cegikmo;
EXECUTE stmtP_cegikmo;

PREPARE stmtP_cfgjkno FROM @sP_cfgjkno;
EXECUTE stmtP_cfgjkno;

PREPARE stmtP_ijklmno FROM @sP_ijklmno;
EXECUTE stmtP_ijklmno;

PREPARE stmtP_efglmno FROM @sP_efglmno;
EXECUTE stmtP_efglmno;


PREPARE stmtP_a FROM @sP_a;
EXECUTE stmtP_a;

PREPARE stmtP_b FROM @sP_b;
EXECUTE stmtP_b;

PREPARE stmtP_d FROM @sP_d;
EXECUTE stmtP_d;

PREPARE stmtP_h FROM @sP_h;
EXECUTE stmtP_h;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PW_1SET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PW_1SET`(IN s_id VARCHAR(64))
BEGIN


SET @PW = CONCAT('PW_a_',s_id);
SET @plist = CONCAT('protlist1_',s_id);
SET @sPW = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT PATHWAY,SPEC,ACCESSION from PROTEIN_PATHWAY, PATHWAY where PROTEIN_PATHWAY.PATHWAY=PATHWAY.ID AND PROTEIN_PATHWAY.SPEC=PATHWAY.SPECIES AND ACCESSION IN (select ACCESSION from ',@plist,');');

PREPARE stmtPW FROM @sPW;
EXECUTE stmtPW;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PW_2SET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PW_2SET`(IN s_id VARCHAR(64))
BEGIN

SET @PW_a = CONCAT('PW_a_',s_id);
SET @PW_b = CONCAT('PW_b_',s_id);
SET @PW_c = CONCAT('PW_c_',s_id);
SET @PW_bc = CONCAT('PW_bc_',s_id);
SET @PW_ac = CONCAT('PW_ac_',s_id);

SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);

SET @sPW_bc = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_bc,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT PATHWAY,SPEC,ACCESSION from PROTEIN_PATHWAY, PATHWAY where PROTEIN_PATHWAY.PATHWAY=PATHWAY.ID AND PROTEIN_PATHWAY.SPEC=PATHWAY.SPECIES AND ACCESSION IN (select ACCESSION from ',@plist1,');');
SET @sPW_ac = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_ac,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT PATHWAY,SPEC,ACCESSION from PROTEIN_PATHWAY, PATHWAY where PROTEIN_PATHWAY.PATHWAY=PATHWAY.ID AND PROTEIN_PATHWAY.SPEC=PATHWAY.SPECIES AND ACCESSION IN (select ACCESSION from ',@plist2,');');

SET @sPW_c = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_c,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_bc,'.PATHWAY, ',@PW_bc,'.SPEC, ',@PW_bc,'.ACCESSION from ',@PW_bc,' join ',@PW_ac,' on ',@PW_bc,'.PATHWAY=',@PW_ac,'.PATHWAY WHERE ',@PW_bc,'.SPEC=',@PW_ac,'.SPEC;');
SET @sPW_b = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_b,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_bc,'.PATHWAY, ',@PW_bc,'.SPEC, ',@PW_bc,'.ACCESSION from ',@PW_bc,' left outer join ',@PW_ac,' on ',@PW_bc,'.PATHWAY=',@PW_ac,'.PATHWAY AND ',@PW_bc,'.SPEC=',@PW_ac,'.SPEC where ',@PW_ac,'.PATHWAY is null;');
SET @sPW_a = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_a,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_ac,'.PATHWAY, ',@PW_ac,'.SPEC, ',@PW_ac,'.ACCESSION from ',@PW_ac,' left outer join ',@PW_bc,' on ',@PW_bc,'.PATHWAY=',@PW_ac,'.PATHWAY AND ',@PW_bc,'.SPEC=',@PW_ac,'.SPEC where ',@PW_bc,'.PATHWAY is null;');
 
PREPARE stmtPW_bc FROM @sPW_bc;
EXECUTE stmtPW_bc;

PREPARE stmtPW_ac FROM @sPW_ac;
EXECUTE stmtPW_ac;

PREPARE stmtPW_a FROM @sPW_a;
EXECUTE stmtPW_a;

PREPARE stmtPW_b FROM @sPW_b;
EXECUTE stmtPW_b;

PREPARE stmtPW_c FROM @sPW_c;
EXECUTE stmtPW_c;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PW_3SET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PW_3SET`(IN s_id VARCHAR(64))
BEGIN

SET @PW_a = CONCAT('PW_a_',s_id);
SET @PW_b = CONCAT('PW_b_',s_id);
SET @PW_c = CONCAT('PW_c_',s_id);
SET @PW_d = CONCAT('PW_d_',s_id);
SET @PW_e = CONCAT('PW_e_',s_id);
SET @PW_f = CONCAT('PW_f_',s_id);
SET @PW_g = CONCAT('PW_g_',s_id);

SET @PW_fg = CONCAT('PW_fg_',s_id);
SET @PW_eg = CONCAT('PW_eg_',s_id);
SET @PW_cg = CONCAT('PW_cg_',s_id);

SET @PW_defg = CONCAT('PW_defg_',s_id);
SET @PW_bcfg = CONCAT('PW_bcfg_',s_id);
SET @PW_aceg = CONCAT('PW_aceg_',s_id);

SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);
SET @plist3 = CONCAT('protlist3_',s_id);

SET @sPW_defg = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_defg,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT PATHWAY,SPEC,ACCESSION from PROTEIN_PATHWAY, PATHWAY where PROTEIN_PATHWAY.PATHWAY=PATHWAY.ID AND PROTEIN_PATHWAY.SPEC=PATHWAY.SPECIES AND ACCESSION IN (select ACCESSION from ',@plist1,');');
SET @sPW_bcfg = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_bcfg,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT PATHWAY,SPEC,ACCESSION from PROTEIN_PATHWAY, PATHWAY where PROTEIN_PATHWAY.PATHWAY=PATHWAY.ID AND PROTEIN_PATHWAY.SPEC=PATHWAY.SPECIES AND ACCESSION IN (select ACCESSION from ',@plist2,');');
SET @sPW_aceg = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_aceg,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT PATHWAY,SPEC,ACCESSION from PROTEIN_PATHWAY, PATHWAY where PROTEIN_PATHWAY.PATHWAY=PATHWAY.ID AND PROTEIN_PATHWAY.SPEC=PATHWAY.SPECIES AND ACCESSION IN (select ACCESSION from ',@plist3,');');

SET @sPW_fg = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_fg,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_defg,'.PATHWAY,',@PW_defg,'.SPEC, ',@PW_defg,'.ACCESSION from ',@PW_defg,' join ',@PW_bcfg,' on ',@PW_defg,'.PATHWAY=',@PW_bcfg,'.PATHWAY  WHERE ',@PW_defg,'.SPEC=',@PW_bcfg,'.SPEC;');
SET @sPW_eg = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_eg,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_defg,'.PATHWAY,',@PW_defg,'.SPEC, ',@PW_defg,'.ACCESSION from ',@PW_defg,' join ',@PW_aceg,' on ',@PW_defg,'.PATHWAY=',@PW_aceg,'.PATHWAY  WHERE ',@PW_defg,'.SPEC=',@PW_aceg,'.SPEC;');
SET @sPW_cg = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_cg,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_bcfg,'.PATHWAY,',@PW_bcfg,'.SPEC, ',@PW_bcfg,'.ACCESSION from ',@PW_bcfg,' join ',@PW_aceg,' on ',@PW_bcfg,'.PATHWAY=',@PW_aceg,'.PATHWAY  WHERE ',@PW_bcfg,'.SPEC=',@PW_aceg,'.SPEC;');

SET @sPW_g = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_g,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_fg,'.PATHWAY,',@PW_fg,'.SPEC, ',@PW_fg,'.ACCESSION  from ',@PW_fg,' join ',@PW_eg,' on ',@PW_fg,'.PATHWAY=',@PW_eg,'.PATHWAY AND ',@PW_fg,'.SPEC=',@PW_eg,'.SPEC WHERE ',@PW_fg,'.PATHWAY IN ( select PATHWAY from ',@PW_cg,');');

SET @sPW_f = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_f,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_fg,'.PATHWAY,',@PW_fg,'.SPEC, ',@PW_fg,'.ACCESSION from ',@PW_fg,' left outer join ',@PW_aceg,' on ',@PW_fg,'.PATHWAY=',@PW_aceg,'.PATHWAY AND ',@PW_aceg,'.SPEC=',@PW_fg,'.SPEC  where ',@PW_aceg,'.PATHWAY is null;');
SET @sPW_e = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_e,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_eg,'.PATHWAY,',@PW_eg,'.SPEC, ',@PW_eg,'.ACCESSION from ',@PW_eg,' left outer join ',@PW_bcfg,' on ',@PW_eg,'.PATHWAY=',@PW_bcfg,'.PATHWAY AND ',@PW_bcfg,'.SPEC=',@PW_eg,'.SPEC  where ',@PW_bcfg,'.PATHWAY is null;');
SET @sPW_c = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_c,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_cg,'.PATHWAY,',@PW_cg,'.SPEC, ',@PW_cg,'.ACCESSION from ',@PW_cg,' left outer join ',@PW_defg,' on ',@PW_cg,'.PATHWAY=',@PW_defg,'.PATHWAY AND ',@PW_defg,'.SPEC=',@PW_cg,'.SPEC  where ',@PW_defg,'.PATHWAY is null;');

SET @sPW_d = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_d,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_defg,'.PATHWAY,',@PW_defg,'.SPEC, ',@PW_defg,'.ACCESSION from ',@PW_defg,' where ',@PW_defg,'.PATHWAY NOT IN (select PATHWAY from ',@PW_fg,' union select PATHWAY from ',@PW_eg,');');
SET @sPW_b = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_b,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_bcfg,'.PATHWAY,',@PW_bcfg,'.SPEC, ',@PW_bcfg,'.ACCESSION from ',@PW_bcfg,' where ',@PW_bcfg,'.PATHWAY NOT IN (select PATHWAY from ',@PW_fg,' union select PATHWAY from ',@PW_cg,');');
SET @sPW_a = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_a,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_aceg,'.PATHWAY,',@PW_aceg,'.SPEC, ',@PW_aceg,'.ACCESSION from ',@PW_aceg,' where ',@PW_aceg,'.PATHWAY NOT IN (select PATHWAY from ',@PW_eg,' union select PATHWAY from ',@PW_cg,');');

PREPARE stmtPW_defg FROM @sPW_defg;
EXECUTE stmtPW_defg;

PREPARE stmtPW_bcfg FROM @sPW_bcfg;
EXECUTE stmtPW_bcfg;

PREPARE stmtPW_aceg FROM @sPW_aceg;
EXECUTE stmtPW_aceg;

PREPARE stmtPW_fg FROM @sPW_fg;
EXECUTE stmtPW_fg;

PREPARE stmtPW_eg FROM @sPW_eg;
EXECUTE stmtPW_eg;

PREPARE stmtPW_cg FROM @sPW_cg;
EXECUTE stmtPW_cg;

PREPARE stmtPW_a FROM @sPW_a;
EXECUTE stmtPW_a;

PREPARE stmtPW_b FROM @sPW_b;
EXECUTE stmtPW_b;

PREPARE stmtPW_c FROM @sPW_c;
EXECUTE stmtPW_c;

PREPARE stmtPW_d FROM @sPW_d;
EXECUTE stmtPW_d;

PREPARE stmtPW_e FROM @sPW_e;
EXECUTE stmtPW_e;

PREPARE stmtPW_f FROM @sPW_f;
EXECUTE stmtPW_f;

PREPARE stmtPW_g FROM @sPW_g;
EXECUTE stmtPW_g;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PW_4SET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PW_4SET`(IN s_id VARCHAR(64))
BEGIN


SET @plist1 = CONCAT('protlist1_',s_id);
SET @plist2 = CONCAT('protlist2_',s_id);
SET @plist3 = CONCAT('protlist3_',s_id);
SET @plist4 = CONCAT('protlist4_',s_id);

SET @PW_hijklmno = CONCAT('PW_hijklmno_',s_id);
SET @PW_defglmno = CONCAT('PW_defglmno_',s_id);
SET @PW_bcfgjkno = CONCAT('PW_bcfgjkno_',s_id);
SET @PW_acegikmo = CONCAT('PW_acegikmo_',s_id);

SET @PW_lmno = CONCAT('PW_lmno_',s_id);
SET @PW_jkno = CONCAT('PW_jkno_',s_id);
SET @PW_ikmo = CONCAT('PW_ikmo_',s_id);
SET @PW_fgno = CONCAT('PW_fgno_',s_id);
SET @PW_egmo = CONCAT('PW_egmo_',s_id);
SET @PW_cgko = CONCAT('PW_cgko_',s_id);

SET @PW_no = CONCAT('PW_no_',s_id);
SET @PW_mo = CONCAT('PW_mo_',s_id);
SET @PW_ko = CONCAT('PW_ko_',s_id);
SET @PW_go = CONCAT('PW_go_',s_id);

SET @PW_o = CONCAT('PW_o_',s_id);
SET @PW_n = CONCAT('PW_n_',s_id);
SET @PW_m = CONCAT('PW_m_',s_id);
SET @PW_k = CONCAT('PW_k_',s_id);
SET @PW_g = CONCAT('PW_g_',s_id);

SET @PW_l = CONCAT('PW_l_',s_ID);
SET @PW_j = CONCAT('PW_j_',s_ID);
SET @PW_i = CONCAT('PW_i_',s_ID);
SET @PW_f = CONCAT('PW_f_',s_ID);
SET @PW_e = CONCAT('PW_e_',s_ID);
SET @PW_c = CONCAT('PW_c_',s_ID);


SET @PW_lm = CONCAT('PW_lm_',s_ID);
SET @PW_jk = CONCAT('PW_jk_',s_ID);
SET @PW_ik = CONCAT('PW_ik_',s_ID);
SET @PW_fg = CONCAT('PW_fg_',s_ID);
SET @PW_eg = CONCAT('PW_eg_',s_ID);
SET @PW_cg = CONCAT('PW_cg_',s_ID);

SET @PW_cegikmo = CONCAT('PW_cegikmo_',s_ID);
SET @PW_cfgjkno = CONCAT('PW_cfgjkno_',s_ID);
SET @PW_efglmno = CONCAT('PW_efglmno_',s_ID);
SET @PW_ijklmno = CONCAT('PW_ijklmno_',s_ID);


SET @PW_a = CONCAT('PW_a_',s_ID);
SET @PW_b = CONCAT('PW_b_',s_ID);
SET @PW_d = CONCAT('PW_d_',s_ID);
SET @PW_h = CONCAT('PW_h_',s_ID);

SET @sPW_hijklmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_hijklmno,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT PATHWAY,SPEC,ACCESSION from PROTEIN_PATHWAY, PATHWAY where PROTEIN_PATHWAY.PATHWAY=PATHWAY.ID AND PROTEIN_PATHWAY.SPEC=PATHWAY.SPECIES AND ACCESSION  IN (select ACCESSION from ',@plist1,');');
SET @sPW_defglmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_defglmno,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT PATHWAY,SPEC,ACCESSION from PROTEIN_PATHWAY, PATHWAY where PROTEIN_PATHWAY.PATHWAY=PATHWAY.ID AND PROTEIN_PATHWAY.SPEC=PATHWAY.SPECIES AND ACCESSION  IN (select ACCESSION from ',@plist2,');');
SET @sPW_bcfgjkno = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_bcfgjkno,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT PATHWAY,SPEC,ACCESSION from PROTEIN_PATHWAY, PATHWAY where PROTEIN_PATHWAY.PATHWAY=PATHWAY.ID AND PROTEIN_PATHWAY.SPEC=PATHWAY.SPECIES AND ACCESSION  IN (select ACCESSION from ',@plist3,');');
SET @sPW_acegikmo = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_acegikmo,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT PATHWAY,SPEC,ACCESSION from PROTEIN_PATHWAY, PATHWAY where PROTEIN_PATHWAY.PATHWAY=PATHWAY.ID AND PROTEIN_PATHWAY.SPEC=PATHWAY.SPECIES AND ACCESSION  IN (select ACCESSION from ',@plist4,');');


SET @sPW_lmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_lmno,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_hijklmno,'.PATHWAY, ',@PW_hijklmno,'.SPEC, ',@PW_hijklmno,'.ACCESSION from ',@PW_hijklmno,' join ',@PW_defglmno,' on ',@PW_hijklmno,'.PATHWAY=',@PW_defglmno,'.PATHWAY  WHERE ',@PW_hijklmno,'.SPEC=',@PW_defglmno,'.SPEC;;');
SET @sPW_jkno = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_jkno,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_hijklmno,'.PATHWAY, ',@PW_hijklmno,'.SPEC, ',@PW_hijklmno,'.ACCESSION from ',@PW_hijklmno,' join ',@PW_bcfgjkno,' on ',@PW_hijklmno,'.PATHWAY=',@PW_bcfgjkno,'.PATHWAY  WHERE ',@PW_hijklmno,'.SPEC=',@PW_bcfgjkno,'.SPEC;;');
SET @sPW_ikmo = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_ikmo,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_hijklmno,'.PATHWAY, ',@PW_hijklmno,'.SPEC, ',@PW_hijklmno,'.ACCESSION from ',@PW_hijklmno,' join ',@PW_acegikmo,' on ',@PW_hijklmno,'.PATHWAY=',@PW_acegikmo,'.PATHWAY  WHERE ',@PW_hijklmno,'.SPEC=',@PW_acegikmo,'.SPEC;;');
SET @sPW_fgno = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_fgno,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_defglmno,'.PATHWAY, ',@PW_defglmno,'.SPEC, ',@PW_defglmno,'.ACCESSION from ',@PW_defglmno,' join ',@PW_bcfgjkno,' on ',@PW_defglmno,'.PATHWAY=',@PW_bcfgjkno,'.PATHWAY  WHERE ',@PW_defglmno,'.SPEC=',@PW_bcfgjkno,'.SPEC;;');
SET @sPW_egmo = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_egmo,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_defglmno,'.PATHWAY, ',@PW_defglmno,'.SPEC, ',@PW_defglmno,'.ACCESSION from ',@PW_defglmno,' join ',@PW_acegikmo,' on ',@PW_defglmno,'.PATHWAY=',@PW_acegikmo,'.PATHWAY  WHERE ',@PW_defglmno,'.SPEC=',@PW_acegikmo,'.SPEC;;');
SET @sPW_cgko = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_cgko,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_bcfgjkno,'.PATHWAY, ',@PW_bcfgjkno,'.SPEC, ',@PW_bcfgjkno,'.ACCESSION from ',@PW_bcfgjkno,' join ',@PW_acegikmo,' on ',@PW_bcfgjkno,'.PATHWAY=',@PW_acegikmo,'.PATHWAY  WHERE ',@PW_bcfgjkno,'.SPEC=',@PW_acegikmo,'.SPEC;;');


SET @sPW_no = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_no,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_hijklmno,'.PATHWAY, ',@PW_hijklmno,'.SPEC, ',@PW_hijklmno,'.ACCESSION from ',@PW_hijklmno,' join ',@PW_fgno,' on ',@PW_hijklmno,'.PATHWAY=',@PW_fgno,'.PATHWAY  WHERE ',@PW_hijklmno,'.SPEC=',@PW_fgno,'.SPEC;;');
SET @sPW_mo = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_mo,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_hijklmno,'.PATHWAY, ',@PW_hijklmno,'.SPEC, ',@PW_hijklmno,'.ACCESSION from ',@PW_hijklmno,' join ',@PW_egmo,' on ',@PW_hijklmno,'.PATHWAY=',@PW_egmo,'.PATHWAY  WHERE ',@PW_hijklmno,'.SPEC=',@PW_egmo,'.SPEC;;');
SET @sPW_ko = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_ko,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_hijklmno,'.PATHWAY, ',@PW_hijklmno,'.SPEC, ',@PW_hijklmno,'.ACCESSION from ',@PW_hijklmno,' join ',@PW_cgko,' on ',@PW_hijklmno,'.PATHWAY=',@PW_cgko,'.PATHWAY  WHERE ',@PW_hijklmno,'.SPEC=',@PW_cgko,'.SPEC;;');
SET @sPW_go = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_go,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_defglmno,'.PATHWAY, ',@PW_defglmno,'.SPEC, ',@PW_defglmno,'.ACCESSION from ',@PW_defglmno,' join ',@PW_cgko,' on ',@PW_defglmno,'.PATHWAY=',@PW_cgko,'.PATHWAY  WHERE ',@PW_defglmno,'.SPEC=',@PW_cgko,'.SPEC;;');

SET @sPW_o = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_o,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_hijklmno,'.PATHWAY, ',@PW_hijklmno,'.SPEC, ',@PW_hijklmno,'.ACCESSION from ',@PW_hijklmno,' join ',@PW_go,' on ',@PW_hijklmno,'.PATHWAY=',@PW_go,'.PATHWAY  WHERE ',@PW_hijklmno,'.SPEC=',@PW_go,'.SPEC;;');


SET @sPW_n = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_n,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_no,'.PATHWAY, ',@PW_no,'.SPEC, ',@PW_no,'.ACCESSION from ',@PW_no,' left outer join ',@PW_o,' on ',@PW_no,'.PATHWAY=',@PW_o,'.PATHWAY AND ',@PW_no,'.SPEC=',@PW_o,'.SPEC   where ',@PW_o,'.PATHWAY is null;');
SET @sPW_m = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_m,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_mo,'.PATHWAY, ',@PW_mo,'.SPEC, ',@PW_mo,'.ACCESSION from ',@PW_mo,' left outer join ',@PW_o,' on ',@PW_mo,'.PATHWAY=',@PW_o,'.PATHWAY AND ',@PW_mo,'.SPEC=',@PW_o,'.SPEC   where ',@PW_o,'.PATHWAY is null;');
SET @sPW_k = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_k,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_ko,'.PATHWAY, ',@PW_ko,'.SPEC, ',@PW_ko,'.ACCESSION from ',@PW_ko,' left outer join ',@PW_o,' on ',@PW_ko,'.PATHWAY=',@PW_o,'.PATHWAY AND ',@PW_ko,'.SPEC=',@PW_o,'.SPEC   where ',@PW_o,'.PATHWAY is null;');
SET @sPW_g = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_g,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_go,'.PATHWAY, ',@PW_go,'.SPEC, ',@PW_go,'.ACCESSION from ',@PW_go,' left outer join ',@PW_o,' on ',@PW_go,'.PATHWAY=',@PW_o,'.PATHWAY AND ',@PW_go,'.SPEC=',@PW_o,'.SPEC   where ',@PW_o,'.PATHWAY is null;');

SET @sPW_lm = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_lm,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_lmno,'.PATHWAY, ',@PW_lmno,'.SPEC, ',@PW_lmno,'.ACCESSION from ',@PW_lmno,' left outer join ',@PW_no,' on ',@PW_lmno,'.PATHWAY=',@PW_no,'.PATHWAY AND ',@PW_lmno,'.SPEC=',@PW_no,'.SPEC   where ',@PW_no,'.PATHWAY is null;');
SET @sPW_jk = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_jk,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_jkno,'.PATHWAY, ',@PW_jkno,'.SPEC, ',@PW_jkno,'.ACCESSION from ',@PW_jkno,' left outer join ',@PW_no,' on ',@PW_jkno,'.PATHWAY=',@PW_no,'.PATHWAY AND ',@PW_jkno,'.SPEC=',@PW_no,'.SPEC   where ',@PW_no,'.PATHWAY is null;');
SET @sPW_ik = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_ik,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_ikmo,'.PATHWAY, ',@PW_ikmo,'.SPEC, ',@PW_ikmo,'.ACCESSION from ',@PW_ikmo,' left outer join ',@PW_mo,' on ',@PW_ikmo,'.PATHWAY=',@PW_mo,'.PATHWAY AND ',@PW_ikmo,'.SPEC=',@PW_mo,'.SPEC   where ',@PW_mo,'.PATHWAY is null;');
SET @sPW_fg = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_fg,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_fgno,'.PATHWAY, ',@PW_fgno,'.SPEC, ',@PW_fgno,'.ACCESSION from ',@PW_fgno,' left outer join ',@PW_no,' on ',@PW_fgno,'.PATHWAY=',@PW_no,'.PATHWAY AND ',@PW_fgno,'.SPEC=',@PW_no,'.SPEC   where ',@PW_no,'.PATHWAY is null;');
SET @sPW_eg = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_eg,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_egmo,'.PATHWAY, ',@PW_egmo,'.SPEC, ',@PW_egmo,'.ACCESSION from ',@PW_egmo,' left outer join ',@PW_mo,' on ',@PW_egmo,'.PATHWAY=',@PW_mo,'.PATHWAY AND ',@PW_egmo,'.SPEC=',@PW_mo,'.SPEC   where ',@PW_mo,'.PATHWAY is null;');
SET @sPW_cg = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_cg,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_cgko,'.PATHWAY, ',@PW_cgko,'.SPEC, ',@PW_cgko,'.ACCESSION from ',@PW_cgko,' left outer join ',@PW_ko,' on ',@PW_cgko,'.PATHWAY=',@PW_ko,'.PATHWAY AND ',@PW_cgko,'.SPEC=',@PW_ko,'.SPEC   where ',@PW_ko,'.PATHWAY is null;');


SET @sPW_l = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_l,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_lm,'.PATHWAY, ',@PW_lm,'.SPEC, ',@PW_lm,'.ACCESSION from ',@PW_lm,' left outer join ',@PW_m,' on ',@PW_lm,'.PATHWAY=',@PW_m,'.PATHWAY AND ',@PW_lm,'.SPEC=',@PW_m,'.SPEC   where ',@PW_m,'.PATHWAY is null;');
SET @sPW_j = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_j,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_jk,'.PATHWAY, ',@PW_jk,'.SPEC, ',@PW_jk,'.ACCESSION from ',@PW_jk,' left outer join ',@PW_k,' on ',@PW_jk,'.PATHWAY=',@PW_k,'.PATHWAY AND ',@PW_jk,'.SPEC=',@PW_k,'.SPEC   where ',@PW_k,'.PATHWAY is null;');
SET @sPW_i = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_i,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_ik,'.PATHWAY, ',@PW_ik,'.SPEC, ',@PW_ik,'.ACCESSION from ',@PW_ik,' left outer join ',@PW_k,' on ',@PW_ik,'.PATHWAY=',@PW_k,'.PATHWAY AND ',@PW_ik,'.SPEC=',@PW_k,'.SPEC   where ',@PW_k,'.PATHWAY is null;');
SET @sPW_f = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_f,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_fg,'.PATHWAY, ',@PW_fg,'.SPEC, ',@PW_fg,'.ACCESSION from ',@PW_fg,' left outer join ',@PW_g,' on ',@PW_fg,'.PATHWAY=',@PW_g,'.PATHWAY AND ',@PW_fg,'.SPEC=',@PW_g,'.SPEC   where ',@PW_g,'.PATHWAY is null;');
SET @sPW_e = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_e,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_eg,'.PATHWAY, ',@PW_eg,'.SPEC, ',@PW_eg,'.ACCESSION from ',@PW_eg,' left outer join ',@PW_g,' on ',@PW_eg,'.PATHWAY=',@PW_g,'.PATHWAY AND ',@PW_eg,'.SPEC=',@PW_g,'.SPEC   where ',@PW_g,'.PATHWAY is null;');
SET @sPW_c = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_c,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_cg,'.PATHWAY, ',@PW_cg,'.SPEC, ',@PW_cg,'.ACCESSION from ',@PW_cg,' left outer join ',@PW_g,' on ',@PW_cg,'.PATHWAY=',@PW_g,'.PATHWAY AND ',@PW_cg,'.SPEC=',@PW_g,'.SPEC   where ',@PW_g,'.PATHWAY is null;');

SET @sPW_cegikmo = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_cegikmo,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_egmo,'.PATHWAY, ',@PW_egmo,'.SPEC, ',@PW_egmo,'.ACCESSION from ',@PW_egmo,', ',@PW_ik,', ',@PW_c,' where ',@PW_egmo,'.PATHWAY=',@PW_ik,'.PATHWAY and ',@PW_ik,'.PATHWAY=',@PW_c,'.PATHWAY AND ',@PW_egmo,'.SPEC=',@PW_ik,'.SPEC  AND ',@PW_ik,'.SPEC=',@PW_c,'.SPEC ;');
SET @sPW_cfgjkno = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_cfgjkno,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_fgno,'.PATHWAY, ',@PW_fgno,'.SPEC, ',@PW_fgno,'.ACCESSION from ',@PW_fgno,', ',@PW_jk,', ',@PW_c,' where ',@PW_fgno,'.PATHWAY=',@PW_jk,'.PATHWAY and ',@PW_jk,'.PATHWAY=',@PW_c,'.PATHWAY AND ',@PW_fgno,'.SPEC=',@PW_jk,'.SPEC  AND ',@PW_jk,'.SPEC=',@PW_c,'.SPEC ;');
SET @sPW_ijklmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_ijklmno,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_lmno,'.PATHWAY, ',@PW_lmno,'.SPEC, ',@PW_lmno,'.ACCESSION from ',@PW_lmno,', ',@PW_jk,', ',@PW_i,' where ',@PW_lmno,'.PATHWAY=',@PW_jk,'.PATHWAY and ',@PW_jk,'.PATHWAY=',@PW_i,'.PATHWAY AND ',@PW_lmno,'.SPEC=',@PW_jk,'.SPEC  AND ',@PW_jk,'.SPEC=',@PW_i,'.SPEC ;');
SET @sPW_efglmno = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_efglmno,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_lmno,'.PATHWAY, ',@PW_lmno,'.SPEC, ',@PW_lmno,'.ACCESSION from ',@PW_lmno,', ',@PW_fg,', ',@PW_e,' where ',@PW_lmno,'.PATHWAY=',@PW_fg,'.PATHWAY and ',@PW_fg,'.PATHWAY=',@PW_e,'.PATHWAY AND ',@PW_lmno,'.SPEC=',@PW_fg,'.SPEC  AND ',@PW_fg,'.SPEC=',@PW_e,'.SPEC ;');


SET @sPW_a = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_a,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_acegikmo,'.PATHWAY, ',@PW_acegikmo,'.SPEC, ',@PW_acegikmo,'.ACCESSION from ',@PW_acegikmo,' left outer join ',@PW_cegikmo,' on ',@PW_acegikmo,'.PATHWAY=',@PW_cegikmo,'.PATHWAY AND ',@PW_acegikmo,'.SPEC=',@PW_cegikmo,'.SPEC   where ',@PW_cegikmo,'.PATHWAY is null;');
SET @sPW_b = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_b,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_bcfgjkno,'.PATHWAY, ',@PW_bcfgjkno,'.SPEC, ',@PW_bcfgjkno,'.ACCESSION from ',@PW_bcfgjkno,' left outer join ',@PW_cfgjkno,' on ',@PW_bcfgjkno,'.PATHWAY=',@PW_cfgjkno,'.PATHWAY AND ',@PW_bcfgjkno,'.SPEC=',@PW_cfgjkno,'.SPEC   where ',@PW_cfgjkno,'.PATHWAY is null;');
SET @sPW_d = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_d,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_defglmno,'.PATHWAY, ',@PW_defglmno,'.SPEC, ',@PW_defglmno,'.ACCESSION from ',@PW_defglmno,' left outer join ',@PW_efglmno,' on ',@PW_defglmno,'.PATHWAY=',@PW_efglmno,'.PATHWAY AND ',@PW_defglmno,'.SPEC=',@PW_efglmno,'.SPEC   where ',@PW_efglmno,'.PATHWAY is null;');
SET @sPW_h = CONCAT('CREATE TABLE IF NOT EXISTS ',@PW_h,' (PRIMARY KEY my_pkey (PATHWAY,SPEC,ACCESSION)) select DISTINCT ',@PW_hijklmno,'.PATHWAY, ',@PW_hijklmno,'.SPEC, ',@PW_hijklmno,'.ACCESSION from ',@PW_hijklmno,' left outer join ',@PW_ijklmno,' on ',@PW_hijklmno,'.PATHWAY=',@PW_ijklmno,'.PATHWAY AND ',@PW_hijklmno,'.SPEC=',@PW_ijklmno,'.SPEC   where ',@PW_ijklmno,'.PATHWAY is null;');


PREPARE stmtPW_hijklmno FROM @sPW_hijklmno;
EXECUTE stmtPW_hijklmno;

PREPARE stmtPW_defglmno FROM @sPW_defglmno;
EXECUTE stmtPW_defglmno;

PREPARE stmtPW_bcfgjkno FROM @sPW_bcfgjkno;
EXECUTE stmtPW_bcfgjkno;

PREPARE stmtPW_acegikmo FROM @sPW_acegikmo;
EXECUTE stmtPW_acegikmo;

PREPARE stmtPW_lmno FROM @sPW_lmno;
EXECUTE stmtPW_lmno;

PREPARE stmtPW_jkno FROM @sPW_jkno;
EXECUTE stmtPW_jkno;

PREPARE stmtPW_ikmo FROM @sPW_ikmo;
EXECUTE stmtPW_ikmo;

PREPARE stmtPW_fgno FROM @sPW_fgno;
EXECUTE stmtPW_fgno;

PREPARE stmtPW_egmo FROM @sPW_egmo;
EXECUTE stmtPW_egmo;

PREPARE stmtPW_cgko FROM @sPW_cgko;
EXECUTE stmtPW_cgko;

PREPARE stmtPW_no FROM @sPW_no;
EXECUTE stmtPW_no;

PREPARE stmtPW_mo FROM @sPW_mo;
EXECUTE stmtPW_mo;

PREPARE stmtPW_ko FROM @sPW_ko;
EXECUTE stmtPW_ko;

PREPARE stmtPW_go FROM @sPW_go;
EXECUTE stmtPW_go;

PREPARE stmtPW_o FROM @sPW_o;
EXECUTE stmtPW_o;

PREPARE stmtPW_n FROM @sPW_n;
EXECUTE stmtPW_n;

PREPARE stmtPW_m FROM @sPW_m;
EXECUTE stmtPW_m;

PREPARE stmtPW_k FROM @sPW_k;
EXECUTE stmtPW_k;

PREPARE stmtPW_g FROM @sPW_g;
EXECUTE stmtPW_g;

PREPARE stmtPW_lm FROM @sPW_lm;
EXECUTE stmtPW_lm;

PREPARE stmtPW_l FROM @sPW_l;
EXECUTE stmtPW_l;

PREPARE stmtPW_jk FROM @sPW_jk;
EXECUTE stmtPW_jk;

PREPARE stmtPW_j FROM @sPW_j;
EXECUTE stmtPW_j;

PREPARE stmtPW_ik FROM @sPW_ik;
EXECUTE stmtPW_ik;

PREPARE stmtPW_i FROM @sPW_i;
EXECUTE stmtPW_i;

PREPARE stmtPW_fg FROM @sPW_fg;
EXECUTE stmtPW_fg;

PREPARE stmtPW_f FROM @sPW_f;
EXECUTE stmtPW_f;

PREPARE stmtPW_eg FROM @sPW_eg;
EXECUTE stmtPW_eg;

PREPARE stmtPW_e FROM @sPW_e;
EXECUTE stmtPW_e;

PREPARE stmtPW_cg FROM @sPW_cg;
EXECUTE stmtPW_cg;

PREPARE stmtPW_c FROM @sPW_c;
EXECUTE stmtPW_c;


PREPARE stmtPW_cegikmo FROM @sPW_cegikmo;
EXECUTE stmtPW_cegikmo;

PREPARE stmtPW_cfgjkno FROM @sPW_cfgjkno;
EXECUTE stmtPW_cfgjkno;

PREPARE stmtPW_ijklmno FROM @sPW_ijklmno;
EXECUTE stmtPW_ijklmno;

PREPARE stmtPW_efglmno FROM @sPW_efglmno;
EXECUTE stmtPW_efglmno;


PREPARE stmtPW_a FROM @sPW_a;
EXECUTE stmtPW_a;

PREPARE stmtPW_b FROM @sPW_b;
EXECUTE stmtPW_b;

PREPARE stmtPW_d FROM @sPW_d;
EXECUTE stmtPW_d;

PREPARE stmtPW_h FROM @sPW_h;
EXECUTE stmtPW_h;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Stt` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Stt`(IN X VARCHAR(10))
BEGIN

SET @table = CONCAT('DOM',X);
SET @s = CONCAT('SELECT count(*) FROM ', @table);
PREPARE stmt3 FROM @s;
EXECUTE stmt3;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `truncateOldTables` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `truncateOldTables`(db varchar(50), lastUpdateTime timestamp)
BEGIN
drop table if exists oldTables;
create temporary table oldTables as (
	select table_name
    from information_schema.tables
    where table_type = 'BASE TABLE'
		and table_schema = db
        and create_time > lastUpdateTime
        and (table_name like 'DBank\_%' or table_name like 'DM\_%' or table_name like 'GB\_%' or table_name like 'GM\_%' or table_name like 'PW\_%' or table_name like 'P\_%' or table_name like 'protlist%')
    order by create_time desc
);

set @total = 0;
set @cnt = 0;
set @size = 1;

select * from oldTables;
select count(*) from oldTables into @total;

while @cnt <= @total do
	prepare fooStmt from "select table_name from oldTables order by table_name limit ?, ? into @t";
	execute fooStmt using @cnt, @size;
	deallocate prepare fooStmt; 

	set @query = concat('TRUNCATE TABLE ', @t , ';');
	select @query;
	prepare stmt from @query;
	execute stmt;
	deallocate prepare stmt; 

	set @cnt = @cnt + 1;
end while;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-13 19:18:58
