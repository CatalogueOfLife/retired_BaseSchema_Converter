-- MySQL dump 10.13  Distrib 5.1.37, for apple-darwin8.11.0 (powerpc)
--
-- Host: localhost    Database: 4d4life
-- ------------------------------------------------------
-- Server version	5.1.37

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
-- Table structure for table `author_citation`
--

DROP TABLE IF EXISTS `author_citation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_citation` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `author_citation` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `author_citation` (`author_citation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `common_name`
--

DROP TABLE IF EXISTS `common_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_name` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `taxon_id` int(10) NOT NULL,
  `common_name` varchar(255) NOT NULL,
  `language_iso` char(3) DEFAULT NULL,
  `country_iso` char(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `taxon_id` (`taxon_id`),
  KEY `language_iso` (`language_iso`),
  KEY `country_iso` (`country_iso`),
  CONSTRAINT `common_name_ibfk_10` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `common_name_ibfk_8` FOREIGN KEY (`language_iso`) REFERENCES `language` (`iso`) ON UPDATE CASCADE,
  CONSTRAINT `common_name_ibfk_9` FOREIGN KEY (`country_iso`) REFERENCES `country` (`iso`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `iso` char(2) NOT NULL,
  `country` varchar(100) NOT NULL,
  PRIMARY KEY (`iso`),
  KEY `country` (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `distribution`
--

DROP TABLE IF EXISTS `distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distribution` (
  `taxon_id` int(10) NOT NULL,
  `region_id` int(10) NOT NULL,
  `distribution_status_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`taxon_id`,`region_id`),
  KEY `distribution_status_id` (`distribution_status_id`),
  KEY `region_id` (`region_id`),
  CONSTRAINT `distribution_ibfk_1` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `distribution_ibfk_3` FOREIGN KEY (`distribution_status_id`) REFERENCES `distribution_status` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `distribution_ibfk_4` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `distribution_status`
--

DROP TABLE IF EXISTS `distribution_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distribution_status` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `distribution_status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `distribution_status` (`distribution_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `habitat`
--

DROP TABLE IF EXISTS `habitat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habitat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `habitat_standard_id` int(11) NOT NULL,
  `original_code` varchar(25) DEFAULT NULL,
  `habitat` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `standard_id` (`habitat_standard_id`),
  KEY `original_code` (`original_code`),
  CONSTRAINT `habitat_ibfk_1` FOREIGN KEY (`habitat_standard_id`) REFERENCES `habitat_standard` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `habitat_standard`
--

DROP TABLE IF EXISTS `habitat_standard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habitat_standard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `habitat_standard` varchar(50) NOT NULL,
  `version` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `habitat_to_taxon`
--

DROP TABLE IF EXISTS `habitat_to_taxon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habitat_to_taxon` (
  `habitat_id` int(11) NOT NULL,
  `taxon_id` int(11) NOT NULL,
  PRIMARY KEY (`habitat_id`,`taxon_id`),
  KEY `taxon_id` (`taxon_id`),
  CONSTRAINT `habitat_to_taxon_ibfk_1` FOREIGN KEY (`habitat_id`) REFERENCES `habitat` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `habitat_to_taxon_ibfk_2` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `iso` char(3) NOT NULL,
  `language` varchar(100) NOT NULL,
  PRIMARY KEY (`iso`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `latest_taxonomic_scrutiny`
--

DROP TABLE IF EXISTS `latest_taxonomic_scrutiny`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `latest_taxonomic_scrutiny` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `latest_taxonomic_scrutiny` date NOT NULL,
  `specialist_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `specialist_id` (`specialist_id`),
  KEY `latest_taxonomic_scrutiny` (`latest_taxonomic_scrutiny`),
  CONSTRAINT `latest_taxonomic_scrutiny_ibfk_1` FOREIGN KEY (`specialist_id`) REFERENCES `specialist` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reference`
--

DROP TABLE IF EXISTS `reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `authors` varchar(255) NOT NULL,
  `year` varchar(25) NOT NULL,
  `details` text NOT NULL,
  `uri_id` int(10) DEFAULT NULL,
  `source_database_id` int(10) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uri_id` (`uri_id`),
  KEY `source_database_id` (`source_database_id`),
  CONSTRAINT `reference_ibfk_1` FOREIGN KEY (`uri_id`) REFERENCES `uri` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `reference_ibfk_2` FOREIGN KEY (`source_database_id`) REFERENCES `source_database` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reference_to_common_name`
--

DROP TABLE IF EXISTS `reference_to_common_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference_to_common_name` (
  `reference_id` int(10) NOT NULL,
  `common_name_id` int(10) NOT NULL,
  PRIMARY KEY (`reference_id`,`common_name_id`),
  KEY `common_name_id` (`common_name_id`),
  CONSTRAINT `reference_to_common_name_ibfk_5` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `reference_to_common_name_ibfk_6` FOREIGN KEY (`common_name_id`) REFERENCES `common_name` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reference_to_synonym`
--

DROP TABLE IF EXISTS `reference_to_synonym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference_to_synonym` (
  `reference_id` int(10) NOT NULL,
  `synonym_id` int(10) NOT NULL,
  PRIMARY KEY (`reference_id`,`synonym_id`),
  KEY `synonym_id` (`synonym_id`),
  CONSTRAINT `reference_to_synonym_ibfk_5` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `reference_to_synonym_ibfk_6` FOREIGN KEY (`synonym_id`) REFERENCES `synonym_detail` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reference_to_taxon`
--

DROP TABLE IF EXISTS `reference_to_taxon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference_to_taxon` (
  `reference_id` int(10) NOT NULL AUTO_INCREMENT,
  `taxon_id` int(10) NOT NULL,
  PRIMARY KEY (`reference_id`,`taxon_id`),
  KEY `taxon_id` (`taxon_id`),
  CONSTRAINT `reference_to_taxon_ibfk_5` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `reference_to_taxon_ibfk_6` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `standard_id` int(11) DEFAULT NULL,
  `original_code` varchar(25) DEFAULT NULL,
  `region` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `standard_id` (`standard_id`),
  KEY `original_code` (`original_code`),
  CONSTRAINT `region_ibfk_1` FOREIGN KEY (`standard_id`) REFERENCES `region_standard` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=943 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `region_standard`
--

DROP TABLE IF EXISTS `region_standard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region_standard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_standard` varchar(50) NOT NULL,
  `version` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scientific_name_element`
--

DROP TABLE IF EXISTS `scientific_name_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scientific_name_element` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `scientific_name_element` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`scientific_name_element`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `source_database`
--

DROP TABLE IF EXISTS `source_database`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source_database` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `abbreviated_name` varchar(50) DEFAULT NULL,
  `group_name_in_english` varchar(255) DEFAULT NULL,
  `authors_and_editors` varchar(255) DEFAULT NULL,
  `organisation` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `version` varchar(25) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `abstract` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `specialist`
--

DROP TABLE IF EXISTS `specialist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialist` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `synonym`
--

DROP TABLE IF EXISTS `synonym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `synonym` (
  `taxonomic_rank_id` int(10) NOT NULL,
  `scientific_name_element_id` int(10) NOT NULL,
  `synonym_details_id` int(10) NOT NULL,
  PRIMARY KEY (`taxonomic_rank_id`,`scientific_name_element_id`,`synonym_details_id`),
  KEY `scientific_name_element_id` (`scientific_name_element_id`),
  KEY `synonym_details_id` (`synonym_details_id`),
  CONSTRAINT `synonym_ibfk_10` FOREIGN KEY (`taxonomic_rank_id`) REFERENCES `taxon` (`taxonomic_rank_id`) ON UPDATE CASCADE,
  CONSTRAINT `synonym_ibfk_8` FOREIGN KEY (`scientific_name_element_id`) REFERENCES `scientific_name_element` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `synonym_ibfk_9` FOREIGN KEY (`synonym_details_id`) REFERENCES `synonym_detail` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `synonym_detail`
--

DROP TABLE IF EXISTS `synonym_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `synonym_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `taxon_id` int(10) NOT NULL,
  `authority_id` int(10) DEFAULT NULL,
  `synonym_name_status_id` int(1) NOT NULL,
  `additional_data` text,
  PRIMARY KEY (`id`),
  KEY `taxon_id` (`taxon_id`),
  KEY `authority_id` (`authority_id`),
  KEY `synonym_name_status_id` (`synonym_name_status_id`),
  CONSTRAINT `synonym_detail_ibfk_7` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `synonym_detail_ibfk_8` FOREIGN KEY (`authority_id`) REFERENCES `author_citation` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `synonym_detail_ibfk_9` FOREIGN KEY (`synonym_name_status_id`) REFERENCES `synonym_name_status` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `synonym_name_status`
--

DROP TABLE IF EXISTS `synonym_name_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `synonym_name_status` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `synonym_name_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `synonym_name_status` (`synonym_name_status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxon`
--

DROP TABLE IF EXISTS `taxon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `taxonomic_rank_id` int(10) NOT NULL,
  `scientific_name_element_id` int(10) NOT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `source_database_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `taxonomic_rank_id` (`taxonomic_rank_id`),
  KEY `scientific_name_element_id` (`scientific_name_element_id`),
  KEY `source_database_id` (`source_database_id`),
  CONSTRAINT `taxon_ibfk_16` FOREIGN KEY (`scientific_name_element_id`) REFERENCES `scientific_name_element` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `taxon_ibfk_21` FOREIGN KEY (`source_database_id`) REFERENCES `source_database` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `taxon_ibfk_22` FOREIGN KEY (`taxonomic_rank_id`) REFERENCES `taxon` (`taxonomic_rank_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxon_detail`
--

DROP TABLE IF EXISTS `taxon_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_detail` (
  `taxon_id` int(11) NOT NULL,
  `author_citation_id` int(10) NOT NULL,
  `taxon_name_status_id` int(1) NOT NULL,
  `latest_taxonomic_scrutiny_id` int(11) DEFAULT NULL,
  `additional_data` text,
  PRIMARY KEY (`taxon_id`),
  KEY `latest_taxonomic_scrutiny_id` (`latest_taxonomic_scrutiny_id`),
  KEY `authority_id` (`author_citation_id`),
  KEY `taxon_name_status_id` (`taxon_name_status_id`),
  CONSTRAINT `taxon_detail_ibfk_6` FOREIGN KEY (`author_citation_id`) REFERENCES `author_citation` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `taxon_detail_ibfk_1` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `taxon_detail_ibfk_4` FOREIGN KEY (`latest_taxonomic_scrutiny_id`) REFERENCES `latest_taxonomic_scrutiny` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `taxon_detail_ibfk_5` FOREIGN KEY (`taxon_name_status_id`) REFERENCES `taxon_name_status` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxon_name_status`
--

DROP TABLE IF EXISTS `taxon_name_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_name_status` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `taxon_name_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `taxon_name_status` (`taxon_name_status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxonomic_rank`
--

DROP TABLE IF EXISTS `taxonomic_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomic_rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank` varchar(50) NOT NULL,
  `tdwg_link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rank` (`rank`),
  KEY `tdwg_link` (`tdwg_link`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uri`
--

DROP TABLE IF EXISTS `uri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uri` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uri` text NOT NULL,
  `description` text,
  `uri_scheme_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uri_scheme_id` (`uri_scheme_id`),
  CONSTRAINT `uri_ibfk_1` FOREIGN KEY (`uri_scheme_id`) REFERENCES `uri_scheme` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uri_scheme`
--

DROP TABLE IF EXISTS `uri_scheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uri_scheme` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `uri_scheme` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uri_to_source_database`
--

DROP TABLE IF EXISTS `uri_to_source_database`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uri_to_source_database` (
  `uri_id` int(11) NOT NULL,
  `source_database_id` int(10) NOT NULL,
  PRIMARY KEY (`uri_id`,`source_database_id`),
  KEY `source_database_id` (`source_database_id`),
  CONSTRAINT `uri_to_source_database_ibfk_1` FOREIGN KEY (`uri_id`) REFERENCES `uri` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `uri_to_source_database_ibfk_2` FOREIGN KEY (`source_database_id`) REFERENCES `source_database` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uri_to_taxon`
--

DROP TABLE IF EXISTS `uri_to_taxon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uri_to_taxon` (
  `uri_id` int(11) NOT NULL,
  `taxon_id` int(11) NOT NULL,
  PRIMARY KEY (`uri_id`,`taxon_id`),
  KEY `taxon_id` (`taxon_id`),
  CONSTRAINT `uri_to_taxon_ibfk_1` FOREIGN KEY (`uri_id`) REFERENCES `uri` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `uri_to_taxon_ibfk_2` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-03-12 11:49:55
