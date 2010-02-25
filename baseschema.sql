-- phpMyAdmin SQL Dump
-- version 3.2.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 25, 2010 at 10:19 AM
-- Server version: 5.1.37
-- PHP Version: 5.2.10-2ubuntu6.4
--
--Baseschema v0.6, 18-11-2009

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `baseschema`
--

-- --------------------------------------------------------

--
-- Table structure for table `authorities`
--

CREATE TABLE IF NOT EXISTS `authorities` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `authority` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `common_names`
--

CREATE TABLE IF NOT EXISTS `common_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `classification_id` int(10) NOT NULL,
  `common_name` varchar(255) NOT NULL,
  `language_iso` char(3) DEFAULT NULL,
  `country_iso` char(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `INDEX_CLASSIFICATION_ID` (`classification_id`),
  KEY `INDEX_LANGUAGE_ISO` (`language_iso`),
  KEY `INDEX_COUNTRY_ISO` (`country_iso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `iso` char(3) NOT NULL,
  `country` varchar(100) NOT NULL,
  PRIMARY KEY (`iso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `distribution`
--

CREATE TABLE IF NOT EXISTS `distribution` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `region_code` varchar(10) NOT NULL DEFAULT '',
  `distribution_status_id` int(10) DEFAULT NULL,
  `locality` text,
  PRIMARY KEY (`id`),
  KEY `REGION_CODE` (`region_code`),
  KEY `DISTRIBUTION_STATUS_ID` (`distribution_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `distribution_statuses`
--

CREATE TABLE IF NOT EXISTS `distribution_statuses` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `distribution_status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE IF NOT EXISTS `languages` (
  `iso` char(3) NOT NULL,
  `language` varchar(100) NOT NULL,
  PRIMARY KEY (`iso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `name_statuses`
--

CREATE TABLE IF NOT EXISTS `name_statuses` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `name_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `references`
--

CREATE TABLE IF NOT EXISTS `references` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `authors` varchar(255) NOT NULL,
  `year` varchar(25) NOT NULL,
  `details` text NOT NULL,
  `resource_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `INDEX_RESOURCE_ID` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `references_to_common_names`
--

CREATE TABLE IF NOT EXISTS `references_to_common_names` (
  `reference_id` int(10) NOT NULL,
  `common_name_id` int(10) NOT NULL,
  PRIMARY KEY (`reference_id`,`common_name_id`),
  KEY `common_name_id` (`common_name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `references_to_synonyms`
--

CREATE TABLE IF NOT EXISTS `references_to_synonyms` (
  `reference_id` int(10) NOT NULL,
  `synonym_id` int(10) NOT NULL,
  PRIMARY KEY (`reference_id`,`synonym_id`),
  KEY `synonym_id` (`synonym_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reference_to_taxa`
--

CREATE TABLE IF NOT EXISTS `reference_to_taxa` (
  `reference_id` int(10) NOT NULL AUTO_INCREMENT,
  `taxon_id` int(10) NOT NULL,
  `taxascientific_name_element_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`reference_id`),
  KEY `INDEX_TAXON_ID` (`taxon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE IF NOT EXISTS `regions` (
  `region_code` varchar(10) NOT NULL,
  `region` int(10) NOT NULL,
  PRIMARY KEY (`region_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE IF NOT EXISTS `resources` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `link_text` varchar(255) DEFAULT NULL,
  `protocol` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `scientific_name_elements`
--

CREATE TABLE IF NOT EXISTS `scientific_name_elements` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `source_databases`
--

CREATE TABLE IF NOT EXISTS `source_databases` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `abbreviated_name` varchar(50) DEFAULT NULL,
  `organisation` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `abstract` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `specialists`
--

CREATE TABLE IF NOT EXISTS `specialists` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `database_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `INDEX_DATABASE_ID` (`database_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `synonyms`
--

CREATE TABLE IF NOT EXISTS `synonyms` (
  `taxonomic_rank_id` int(10) NOT NULL,
  `scientific_name_element_id` int(10) NOT NULL,
  `synonym_details_id` int(10) NOT NULL,
  PRIMARY KEY (`taxonomic_rank_id`,`scientific_name_element_id`,`synonym_details_id`),
  KEY `scientific_name_element_id` (`scientific_name_element_id`),
  KEY `synonym_details_id` (`synonym_details_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `synonym_details`
--

CREATE TABLE IF NOT EXISTS `synonym_details` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `taxon_id` int(10) NOT NULL,
  `authority_id` int(10) DEFAULT NULL,
  `name_status_id` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `INDEX_TAXON_ID` (`taxon_id`),
  KEY `AUTHORITY_ID` (`authority_id`),
  KEY `NAME_STATUS_ID` (`name_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `taxa`
--

CREATE TABLE IF NOT EXISTS `taxa` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `lsid` varchar(100) DEFAULT NULL,
  `taxonomic_rank_id` int(10) NOT NULL,
  `scientific_name_element_id` int(10) NOT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `authority_id` int(10) NOT NULL,
  `name_status_id` int(1) NOT NULL,
  `specialist_id` int(10) DEFAULT NULL,
  `source_database_id` int(10) NOT NULL,
  `url` int(10) DEFAULT NULL,
  `latest_taxonomic_scrutiny` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `INDEX_PARENT_ID` (`parent_id`),
  KEY `INDEX_TAXANOMIC_RANK_ID` (`taxonomic_rank_id`),
  KEY `INDEX_SCIENTIFIC_NAME_ELEMENT_ID` (`scientific_name_element_id`),
  KEY `INDEX__AUTHORITY_ID` (`authority_id`),
  KEY `INDEX_NAME_STATUS_ID` (`name_status_id`),
  KEY `INDEX_SPECIALIST_ID` (`specialist_id`),
  KEY `INDEX_SOURCE_DATABASE_ID` (`source_database_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `taxononimc_ranks`
--

CREATE TABLE IF NOT EXISTS `taxononimc_ranks` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rank` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Table structure for table `web_links_to_source_databases`
--

CREATE TABLE IF NOT EXISTS `web_links_to_source_databases` (
  `source_database_id` int(10) NOT NULL,
  `resource_id` int(10) NOT NULL,
  PRIMARY KEY (`source_database_id`,`resource_id`),
  KEY `resource_id` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;