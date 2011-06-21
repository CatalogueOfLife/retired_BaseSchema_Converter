-- MySQL dump 10.13  Distrib 5.1.44, for apple-darwin8.11.1 (i386)
--
-- Host: localhost    Database: base_scheme_empty
-- ------------------------------------------------------
-- Server version	5.1.44-log

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
-- Table structure for table `author_string`
--

DROP TABLE IF EXISTS `author_string`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author_string` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `string` varchar(255) NOT NULL COMMENT 'Name of author(s), who described the taxon or published the current combination and the year when appropriate.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `string` (`string`)
) ENGINE=InnoDB AUTO_INCREMENT=79193 DEFAULT CHARSET=utf8 COMMENT='Author citations of taxa and synonyms';
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
  `common_name_element_id` int(10) unsigned NOT NULL,
  `language_iso` char(3) DEFAULT NULL COMMENT 'Optional language code',
  `country_iso` char(2) DEFAULT NULL COMMENT 'Optional country code if usage is restricted to a particular country',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`taxon_id`,`common_name_element_id`,`language_iso`,`country_iso`),
  KEY `taxon_id` (`taxon_id`),
  KEY `common_name_element_id` (`common_name_element_id`),
  KEY `language_iso` (`language_iso`),
  KEY `country_iso` (`country_iso`)
) ENGINE=InnoDB AUTO_INCREMENT=105540 DEFAULT CHARSET=utf8 COMMENT='Common names plus language/country details';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `common_name_element`
--

DROP TABLE IF EXISTS `common_name_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `common_name_element` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `transliteration` varchar(255) DEFAULT NULL COMMENT 'Transcription of name in foreign alphabet into English',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76630 DEFAULT CHARSET=utf8 COMMENT='Common names separated to avoid duplication';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `iso` char(2) NOT NULL COMMENT 'ISO 3166-1-Alpha-2 code',
  `name` varchar(100) NOT NULL COMMENT 'Country',
  PRIMARY KEY (`iso`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Predetermined list of ISO 3166-1-Alpha-2 codes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `distribution`
--

DROP TABLE IF EXISTS `distribution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distribution` (
  `taxon_detail_id` int(10) unsigned NOT NULL,
  `region_id` smallint(5) unsigned NOT NULL,
  `distribution_status_id` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`taxon_detail_id`,`region_id`),
  KEY `region_id` (`region_id`),
  KEY `distribution_status_id` (`distribution_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links combination(s) of region and distribution status to ta';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `distribution_free_text`
--

DROP TABLE IF EXISTS `distribution_free_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distribution_free_text` (
  `taxon_detail_id` int(10) unsigned NOT NULL,
  `region_free_text_id` int(10) unsigned NOT NULL,
  UNIQUE KEY `unique` (`taxon_detail_id`,`region_free_text_id`),
  KEY `taxon_detail_id` (`taxon_detail_id`),
  KEY `region_free_text_id` (`region_free_text_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links text description of distribution to taxon';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `distribution_status`
--

DROP TABLE IF EXISTS `distribution_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `distribution_status` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL COMMENT 'Distribution status (common, rare, etc.)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Predetermined list of distribution statuses';
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
  `original_code` varchar(25) NOT NULL COMMENT 'Original ID or code of the habitat type in the standard referenced in habitat_standard_id',
  `name` varchar(255) NOT NULL COMMENT 'Habitat type',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`habitat_standard_id`,`original_code`,`name`),
  KEY `habitat_standard_id` (`habitat_standard_id`),
  KEY `original_code` (`original_code`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COMMENT='Predetermined list of habitat types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `habitat_standard`
--

DROP TABLE IF EXISTS `habitat_standard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habitat_standard` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `standard` varchar(50) NOT NULL COMMENT 'Standard used to describe the habitat types',
  `version` varchar(10) DEFAULT NULL COMMENT 'Version of the standard used',
  PRIMARY KEY (`id`),
  UNIQUE KEY `standard` (`standard`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='TDWG standard(s) used in habitat table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `habitat_to_taxon_detail`
--

DROP TABLE IF EXISTS `habitat_to_taxon_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `habitat_to_taxon_detail` (
  `habitat_id` smallint(5) unsigned NOT NULL,
  `taxon_detail_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`habitat_id`,`taxon_detail_id`),
  KEY `taxon_detail_id` (`taxon_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links habitat type(s) to taxon';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hybrid`
--

DROP TABLE IF EXISTS `hybrid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hybrid` (
  `taxon_id` int(10) unsigned NOT NULL,
  `parent_taxon_id` int(10) unsigned NOT NULL COMMENT 'References two (or three) parent taxon ids',
  PRIMARY KEY (`taxon_id`,`parent_taxon_id`),
  KEY `parent_taxon_id` (`parent_taxon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links to parent taxa of hybrids';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `iso` char(3) NOT NULL COMMENT 'ISO 639-2 Alpha-3 code',
  `name` varchar(100) NOT NULL COMMENT 'Language',
  PRIMARY KEY (`iso`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Predetermined list of ISO 639-2 Alpha-3 codes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reference`
--

DROP TABLE IF EXISTS `reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `authors` varchar(255) DEFAULT NULL COMMENT 'Complete author string',
  `year` varchar(25) DEFAULT NULL COMMENT 'Year(s) of publication',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title of the publication',
  `text` text COMMENT 'Additional information pertaining to the publication',
  `uri_id` int(10) unsigned DEFAULT NULL COMMENT 'Link to downloadable version',
  PRIMARY KEY (`id`),
  KEY `authors` (`authors`),
  KEY `year` (`year`),
  KEY `uri_id` (`uri_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60462 DEFAULT CHARSET=utf8 COMMENT='References used for taxa, common names and synonyms';
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
  KEY `common_name_id` (`common_name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links references to common names';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reference_to_synonym`
--

DROP TABLE IF EXISTS `reference_to_synonym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference_to_synonym` (
  `reference_id` int(10) unsigned NOT NULL,
  `synonym_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`reference_id`,`synonym_id`),
  KEY `synonym_id` (`synonym_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links references to synonyms';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reference_to_taxon`
--

DROP TABLE IF EXISTS `reference_to_taxon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reference_to_taxon` (
  `reference_id` int(10) unsigned NOT NULL,
  `taxon_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`reference_id`,`taxon_id`),
  KEY `taxon_id` (`taxon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links references to taxa';
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
  `original_code` varchar(25) NOT NULL COMMENT 'Original ID or code of the region in the standard referenced in region_standard_id',
  `name` varchar(255) NOT NULL COMMENT 'Region',
  `parent_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Optional parent region',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`region_standard_id`,`original_code`,`name`),
  KEY `region_standard_id` (`region_standard_id`),
  KEY `original_code` (`original_code`),
  KEY `name` (`name`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=943 DEFAULT CHARSET=utf8 COMMENT='Predetermined list of regions used for distribution';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `region_free_text`
--

DROP TABLE IF EXISTS `region_free_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region_free_text` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `free_text` varchar(12500) COLLATE utf8_bin NOT NULL COMMENT 'Free text description of distribution; provided mainly to store full text descriptions from the Annual Checklist',
  PRIMARY KEY (`id`),
  KEY `free_text` (`free_text`(255))
) ENGINE=InnoDB AUTO_INCREMENT=10144 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `region_standard`
--

DROP TABLE IF EXISTS `region_standard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region_standard` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `standard` varchar(50) NOT NULL COMMENT 'Standard used to describe the region',
  `version` varchar(10) DEFAULT NULL COMMENT 'Version of the standard used',
  PRIMARY KEY (`id`),
  UNIQUE KEY `standard` (`standard`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Standards used for region table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scientific_name_element`
--

DROP TABLE IF EXISTS `scientific_name_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scientific_name_element` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_element` varchar(100) NOT NULL COMMENT 'Basic element of a scientific name; e.g. the epithet argentatus as used in Larus argentatus argenteus',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_element` (`name_element`)
) ENGINE=InnoDB AUTO_INCREMENT=204459 DEFAULT CHARSET=utf8 COMMENT='Individual elements used to generate a scientific name';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scientific_name_status`
--

DROP TABLE IF EXISTS `scientific_name_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scientific_name_status` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `name_status` varchar(50) NOT NULL COMMENT 'Name status of a taxon',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_status` (`name_status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Predetermined list of name statuses';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scrutiny`
--

DROP TABLE IF EXISTS `scrutiny`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scrutiny` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scrutiny_date` date DEFAULT NULL COMMENT 'Most recent date a taxon name was verified; must parse correctly',
  `original_scrutiny_date` varchar(100) DEFAULT NULL COMMENT 'Date as used in the original database; may be incomplete',
  `specialist_id` int(10) unsigned NOT NULL COMMENT 'Link to the specialist who examined the validity of a taxon',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`scrutiny_date`,`specialist_id`,`original_scrutiny_date`),
  KEY `scrutiny_date` (`scrutiny_date`),
  KEY `specialist_id` (`specialist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1271 DEFAULT CHARSET=utf8 COMMENT='Latest scrutiny date of a taxon';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `source_database`
--

DROP TABLE IF EXISTS `source_database`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `source_database` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Full name of the source database',
  `abbreviated_name` varchar(50) DEFAULT NULL COMMENT 'Abbreviated name of the source database',
  `group_name_in_english` varchar(255) DEFAULT NULL COMMENT 'Name in English of the group(s) treated in the database',
  `authors_and_editors` varchar(255) DEFAULT NULL COMMENT 'Optional author(s) and editor(s) of the source database',
  `organisation` varchar(255) DEFAULT NULL COMMENT 'Optional organisation which has compiled or is owning the source database',
  `contact_person` varchar(255) DEFAULT NULL COMMENT 'Optional contact person of the source database',
  `version` varchar(25) DEFAULT NULL COMMENT 'Optional version number of the source database',
  `release_date` date DEFAULT NULL COMMENT 'Optional most recent release date of the source database',
  `abstract` text COMMENT 'Optional free text field describing the source database',
  `taxonomic_coverage` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`abbreviated_name`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='Information about source databases';
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
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=182 DEFAULT CHARSET=utf8 COMMENT='Specialists who have verified the validity of taxa';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `synonym`
--

DROP TABLE IF EXISTS `synonym`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `synonym` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taxon_id` int(10) unsigned NOT NULL COMMENT 'Link to valid taxon to which the synonym relates',
  `author_string_id` int(10) unsigned DEFAULT NULL COMMENT 'Link to author citation of the synonym',
  `scientific_name_status_id` tinyint(2) unsigned NOT NULL COMMENT 'Link to the name status of the synonym',
  `original_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `taxon_id` (`taxon_id`),
  KEY `author_string_id` (`author_string_id`),
  KEY `scientific_name_status_id` (`scientific_name_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7618428 DEFAULT CHARSET=utf8 COMMENT='Synonym details linked to a valid taxon';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `synonym_name_element`
--

DROP TABLE IF EXISTS `synonym_name_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `synonym_name_element` (
  `taxonomic_rank_id` tinyint(3) unsigned NOT NULL,
  `scientific_name_element_id` int(10) unsigned NOT NULL,
  `synonym_id` int(10) unsigned NOT NULL,
  `hybrid_order` tinyint(1) unsigned DEFAULT NULL COMMENT 'Order of parents if synonym is a hybrid; see documentation for details',
  UNIQUE KEY `unique` (`taxonomic_rank_id`,`synonym_id`),
  KEY `taxonomic_rank_id` (`taxonomic_rank_id`),
  KEY `scientific_name_element_id` (`scientific_name_element_id`),
  KEY `synonym_id` (`synonym_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Name elements of a complete synonym';
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
  `source_database_id` int(10) unsigned DEFAULT NULL,
  `original_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `taxonomic_rank_id` (`taxonomic_rank_id`),
  KEY `source_database_id` (`source_database_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7618427 DEFAULT CHARSET=utf8 COMMENT='Scientific name elements and hierarchy of a taxon';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxon_detail`
--

DROP TABLE IF EXISTS `taxon_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_detail` (
  `taxon_id` int(10) unsigned NOT NULL,
  `author_string_id` int(10) unsigned DEFAULT NULL COMMENT 'Link to author citation of the taxon',
  `scientific_name_status_id` tinyint(2) unsigned NOT NULL,
  `scrutiny_id` int(10) unsigned DEFAULT NULL,
  `additional_data` text COMMENT 'Optional free text field describing the taxon',
  PRIMARY KEY (`taxon_id`),
  KEY `author_string_id` (`author_string_id`),
  KEY `taxononomic_status_id` (`scientific_name_status_id`),
  KEY `scrutiny_id` (`scrutiny_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Details pertaining to species and infraspecies';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxon_name_element`
--

DROP TABLE IF EXISTS `taxon_name_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxon_name_element` (
  `taxon_id` int(10) unsigned NOT NULL,
  `scientific_name_element_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`taxon_id`),
  KEY `scientific_name_element_id` (`scientific_name_element_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxonomic_rank`
--

DROP TABLE IF EXISTS `taxonomic_rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomic_rank` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rank` varchar(50) NOT NULL COMMENT 'Taxonomic rank (e.g. family, subspecies)',
  `marker_displayed` varchar(50) DEFAULT NULL,
  `standard` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rank` (`rank`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8 COMMENT='Predetermined list of taxonomic ranks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uri`
--

DROP TABLE IF EXISTS `uri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uri` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource_identifier` varchar(500) NOT NULL COMMENT 'Unique resource identifier (URI; including LSID)',
  `description` text COMMENT 'Short description of the URI',
  `uri_scheme_id` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `resource_identifier` (`resource_identifier`(255)),
  KEY `uri_scheme_id` (`uri_scheme_id`)
) ENGINE=InnoDB AUTO_INCREMENT=356419 DEFAULT CHARSET=utf8 COMMENT='Unique resource identifiers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uri_scheme`
--

DROP TABLE IF EXISTS `uri_scheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uri_scheme` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `scheme` varchar(25) NOT NULL COMMENT 'Abbreviation of URI scheme',
  `name` varchar(255) NOT NULL COMMENT 'Full name of URI scheme',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`scheme`,`name`),
  KEY `scheme` (`scheme`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='Predetermined list of URI schemas';
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
  KEY `source_database_id` (`source_database_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links URIs to source databases';
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
  KEY `taxon_id` (`taxon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links URI(s) (including LSID) to taxon';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2010-12-16 15:47:12

-- Added quick fix for adding non-ISO countries and languages to ISO tables

ALTER TABLE `language` ADD `standard` TINYINT( 1 ) NOT NULL DEFAULT '1';
ALTER TABLE `country` ADD `standard` TINYINT( 1 ) NOT NULL DEFAULT '1';
ALTER TABLE `country` CHANGE `iso` `iso` CHAR( 3 ) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ISO 3166-1-Alpha-2 code';
ALTER TABLE `common_name` CHANGE `country_iso` `country_iso` CHAR( 3 ) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Optional country code if usage is restricted to a particular country' ;
