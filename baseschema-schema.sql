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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `citation` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citation` (`citation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `common_name`
--

DROP TABLE IF EXISTS `common_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_name` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taxon_id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `language_iso` char(3) DEFAULT NULL,
  `country_iso` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `taxon_id` (`taxon_id`),
  KEY `language_iso` (`language_iso`),
  KEY `country_iso` (`country_iso`),
  KEY `name` (`name`),
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
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`iso`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `distribution`
--

DROP TABLE IF EXISTS `distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distribution` (
  `taxon_id` int(10) unsigned NOT NULL,
  `region_id` smallint(5) unsigned NOT NULL,
  `distribution_status_id` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`taxon_id`,`region_id`),
  KEY `distribution_status_id` (`distribution_status_id`),
  KEY `region_id` (`region_id`),
  CONSTRAINT `distribution_ibfk_1` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `distribution_ibfk_3` FOREIGN KEY (`distribution_status_id`) REFERENCES `distribution_status` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `distribution_ibfk_4` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `distribution_free_text`
--

DROP TABLE IF EXISTS `distribution_free_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distribution_free_text` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taxon_id` int(10) unsigned NOT NULL,
  `free_text` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taxon_id` (`taxon_id`),
  CONSTRAINT `distribution_free_text_ibfk_1` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `distribution_status`
--

DROP TABLE IF EXISTS `distribution_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distribution_status` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `habitat`
--

DROP TABLE IF EXISTS `habitat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habitat` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `habitat_standard_id` tinyint(3) unsigned NOT NULL,
  `original_code` varchar(25) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `original_code` (`original_code`),
  KEY `name` (`name`),
  KEY `habitat_standard_id` (`habitat_standard_id`),
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
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `standard` varchar(50) NOT NULL,
  `version` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `standard` (`standard`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `habitat_to_taxon`
--

DROP TABLE IF EXISTS `habitat_to_taxon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habitat_to_taxon` (
  `habitat_id` smallint(5) unsigned NOT NULL,
  `taxon_id` int(10) unsigned NOT NULL,
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
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`iso`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reference`
--

DROP TABLE IF EXISTS `reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `authors` varchar(255) NOT NULL,
  `year` varchar(25) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `details` text NOT NULL,
  `uri_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uri_id` (`uri_id`),
  KEY `authors` (`authors`),
  KEY `year` (`year`),
  CONSTRAINT `reference_ibfk_1` FOREIGN KEY (`uri_id`) REFERENCES `uri` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reference_to_common_name`
--

DROP TABLE IF EXISTS `reference_to_common_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference_to_common_name` (
  `reference_id` int(10) unsigned NOT NULL,
  `common_name_id` int(10) unsigned NOT NULL,
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
  `reference_id` int(10) unsigned NOT NULL,
  `synonym_detail_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`reference_id`,`synonym_detail_id`),
  KEY `synonym_detail_id` (`synonym_detail_id`),
  CONSTRAINT `reference_to_synonym_ibfk_6` FOREIGN KEY (`synonym_detail_id`) REFERENCES `synonym_detail` (`id`),
  CONSTRAINT `reference_to_synonym_ibfk_5` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reference_to_taxon`
--

DROP TABLE IF EXISTS `reference_to_taxon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference_to_taxon` (
  `reference_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taxon_id` int(10) unsigned NOT NULL,
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
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `region_standard_id` tinyint(3) unsigned NOT NULL,
  `original_code` varchar(25) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `region_standard_id` (`region_standard_id`),
  KEY `original_code` (`original_code`),
  KEY `name` (`name`),
  CONSTRAINT `region_ibfk_1` FOREIGN KEY (`region_standard_id`) REFERENCES `region_standard` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=943 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `region_standard`
--

DROP TABLE IF EXISTS `region_standard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region_standard` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `standard` varchar(50) NOT NULL,
  `version` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `standard` (`standard`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scientific_name_element`
--

DROP TABLE IF EXISTS `scientific_name_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scientific_name_element` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_element` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name_element` (`name_element`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scrutiny`
--

DROP TABLE IF EXISTS `scrutiny`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scrutiny` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scrutiny_date` date DEFAULT NULL,
  `specialist_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `specialist_id` (`specialist_id`),
  KEY `scrutiny_date` (`scrutiny_date`),
  CONSTRAINT `scrutiny_ibfk_1` FOREIGN KEY (`specialist_id`) REFERENCES `specialist` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `source_database`
--

DROP TABLE IF EXISTS `source_database`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source_database` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `abbreviated_name` varchar(50) DEFAULT NULL,
  `group_name_in_english` varchar(255) DEFAULT NULL,
  `authors_and_editors` varchar(255) DEFAULT NULL,
  `organisation` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `version` varchar(25) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `abstract` text,
  PRIMARY KEY (`id`),
  KEY `name` (`name`,`abbreviated_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `specialist`
--

DROP TABLE IF EXISTS `specialist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `synonym`
--

DROP TABLE IF EXISTS `synonym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `synonym` (
  `taxonomic_rank_id` tinyint(3) unsigned NOT NULL,
  `scientific_name_element_id` int(10) unsigned NOT NULL,
  `synonym_details_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`taxonomic_rank_id`,`scientific_name_element_id`,`synonym_details_id`),
  KEY `scientific_name_element_id` (`scientific_name_element_id`),
  KEY `synonym_details_id` (`synonym_details_id`),
  CONSTRAINT `synonym_ibfk_10` FOREIGN KEY (`taxonomic_rank_id`) REFERENCES `taxonomic_rank` (`id`) ON UPDATE CASCADE,
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taxon_id` int(10) unsigned NOT NULL,
  `author_citation_id` int(10) unsigned DEFAULT NULL,
  `synonym_name_status_id` tinyint(2) unsigned NOT NULL,
  `additional_data` text,
  PRIMARY KEY (`id`),
  KEY `taxon_id` (`taxon_id`),
  KEY `author_citation_id` (`author_citation_id`),
  KEY `synonym_name_status_id` (`synonym_name_status_id`),
  CONSTRAINT `synonym_detail_ibfk_10` FOREIGN KEY (`author_citation_id`) REFERENCES `author_citation` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `synonym_detail_ibfk_7` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`) ON UPDATE CASCADE,
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
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `name_status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name_status` (`name_status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxon`
--

DROP TABLE IF EXISTS `taxon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taxonomic_rank_id` tinyint(3) unsigned NOT NULL,
  `scientific_name_element_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `source_database_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `taxonomic_rank_id` (`taxonomic_rank_id`),
  KEY `scientific_name_element_id` (`scientific_name_element_id`),
  KEY `source_database_id` (`source_database_id`),
  CONSTRAINT `taxon_ibfk_24` FOREIGN KEY (`taxonomic_rank_id`) REFERENCES `taxonomic_rank` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `taxon_ibfk_16` FOREIGN KEY (`scientific_name_element_id`) REFERENCES `scientific_name_element` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `taxon_ibfk_21` FOREIGN KEY (`source_database_id`) REFERENCES `source_database` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `taxon_ibfk_23` FOREIGN KEY (`parent_id`) REFERENCES `taxon` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxon_detail`
--

DROP TABLE IF EXISTS `taxon_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_detail` (
  `taxon_id` int(10) unsigned NOT NULL,
  `author_citation_id` int(10) unsigned NOT NULL,
  `taxon_name_status_id` tinyint(2) unsigned NOT NULL,
  `scrutiny_id` int(10) unsigned NOT NULL,
  `additional_data` text,
  PRIMARY KEY (`taxon_id`),
  KEY `author_citation_id` (`author_citation_id`),
  KEY `taxon_name_status_id` (`taxon_name_status_id`),
  KEY `scrutiny_id` (`scrutiny_id`),
  CONSTRAINT `taxon_detail_ibfk_1` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `taxon_detail_ibfk_5` FOREIGN KEY (`taxon_name_status_id`) REFERENCES `taxon_name_status` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `taxon_detail_ibfk_6` FOREIGN KEY (`author_citation_id`) REFERENCES `author_citation` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `taxon_detail_ibfk_7` FOREIGN KEY (`scrutiny_id`) REFERENCES `scrutiny` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxon_name_status`
--

DROP TABLE IF EXISTS `taxon_name_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_name_status` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `name_status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name_status` (`name_status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxonomic_rank`
--

DROP TABLE IF EXISTS `taxonomic_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomic_rank` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rank` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `rank` (`rank`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uri`
--

DROP TABLE IF EXISTS `uri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uri` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource_identifier` text NOT NULL,
  `description` text,
  `uri_scheme_id` tinyint(2) unsigned NOT NULL,
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
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `scheme` varchar(25) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `scheme` (`scheme`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uri_to_source_database`
--

DROP TABLE IF EXISTS `uri_to_source_database`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uri_to_source_database` (
  `uri_id` int(10) unsigned NOT NULL,
  `source_database_id` int(10) unsigned NOT NULL,
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
  `uri_id` int(10) unsigned NOT NULL,
  `taxon_id` int(10) unsigned NOT NULL,
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

-- Dump completed on 2010-03-16 13:26:53
