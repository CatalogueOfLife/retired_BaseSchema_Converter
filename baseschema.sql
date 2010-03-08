-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 08, 2010 at 05:36 PM
-- Server version: 5.1.37
-- PHP Version: 5.2.11

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `4d4life`
--

-- --------------------------------------------------------

--
-- Table structure for table `authority`
--

CREATE TABLE `authority` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `authority` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=326935 ;

-- --------------------------------------------------------

--
-- Table structure for table `common_name`
--

CREATE TABLE `common_name` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `taxon_id` int(10) NOT NULL,
  `common_name` varchar(255) NOT NULL,
  `language_iso` char(3) DEFAULT NULL,
  `country_iso` char(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `INDEX_CLASSIFICATION_ID` (`taxon_id`),
  KEY `INDEX_LANGUAGE_ISO` (`language_iso`),
  KEY `INDEX_COUNTRY_ISO` (`country_iso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `iso` char(3) NOT NULL,
  `country` varchar(100) NOT NULL,
  PRIMARY KEY (`iso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `distribution`
--

CREATE TABLE `distribution` (
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
-- Table structure for table `distribution_status`
--

CREATE TABLE `distribution_status` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `distribution_status` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `iso` char(3) NOT NULL,
  `language` varchar(100) NOT NULL,
  PRIMARY KEY (`iso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `name_status`
--

CREATE TABLE `name_status` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `name_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `protocol`
--

CREATE TABLE `protocol` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `protocol` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `reference`
--

CREATE TABLE `reference` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `authors` varchar(255) DEFAULT NULL,
  `year` varchar(25) DEFAULT NULL,
  `details` text,
  `resource_id` int(10) DEFAULT NULL,
  `database_id` int(10) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `INDEX_RESOURCE_ID` (`resource_id`),
  KEY `INDEX_DATBASE_ID` (`database_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=492696 ;

-- --------------------------------------------------------

--
-- Table structure for table `reference_to_common_name`
--

CREATE TABLE `reference_to_common_name` (
  `reference_id` int(10) NOT NULL,
  `common_name_id` int(10) NOT NULL,
  PRIMARY KEY (`reference_id`,`common_name_id`),
  KEY `common_name_id` (`common_name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reference_to_synonym`
--

CREATE TABLE `reference_to_synonym` (
  `reference_id` int(10) NOT NULL,
  `synonym_id` int(10) NOT NULL,
  PRIMARY KEY (`reference_id`,`synonym_id`),
  KEY `synonym_id` (`synonym_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reference_to_taxon`
--

CREATE TABLE `reference_to_taxon` (
  `reference_id` int(10) NOT NULL AUTO_INCREMENT,
  `taxon_id` int(10) NOT NULL,
  `taxascientific_name_element_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`reference_id`),
  KEY `INDEX_TAXON_ID` (`taxon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE `region` (
  `region_code` varchar(10) NOT NULL,
  `region` varchar(255) NOT NULL,
  PRIMARY KEY (`region_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `resource`
--

CREATE TABLE `resource` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `link_text` varchar(255) DEFAULT NULL,
  `protocol` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `protocol` (`protocol`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=67 ;

-- --------------------------------------------------------

--
-- Table structure for table `resource_to_source_database`
--

CREATE TABLE `resource_to_source_database` (
  `source_database_id` int(10) NOT NULL,
  `resource_id` int(10) NOT NULL,
  PRIMARY KEY (`source_database_id`,`resource_id`),
  KEY `resource_id` (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `scientific_name_element`
--

CREATE TABLE `scientific_name_element` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=549784 ;

-- --------------------------------------------------------

--
-- Table structure for table `source_database`
--

CREATE TABLE `source_database` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `abbreviated_name` varchar(50) DEFAULT NULL,
  `organisation` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `abstract` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=68 ;

-- --------------------------------------------------------

--
-- Table structure for table `specialist`
--

CREATE TABLE `specialist` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `database_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `INDEX_DATABASE_ID` (`database_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1194 ;

-- --------------------------------------------------------

--
-- Table structure for table `synonym`
--

CREATE TABLE `synonym` (
  `taxonomic_rank_id` int(10) NOT NULL,
  `scientific_name_element_id` int(10) NOT NULL,
  `synonym_details_id` int(10) NOT NULL,
  PRIMARY KEY (`taxonomic_rank_id`,`scientific_name_element_id`,`synonym_details_id`),
  KEY `scientific_name_element_id` (`scientific_name_element_id`),
  KEY `synonym_details_id` (`synonym_details_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `synonym_detail`
--

CREATE TABLE `synonym_detail` (
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
-- Table structure for table `taxon`
--

CREATE TABLE `taxon` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `lsid` varchar(100) DEFAULT NULL,
  `taxonomic_rank_id` int(10) NOT NULL,
  `scientific_name_element_id` int(10) NOT NULL,
  `parent_id` int(10) DEFAULT NULL,
  `authority_id` int(10) DEFAULT NULL,
  `name_status_id` int(1) NOT NULL,
  `specialist_id` int(10) DEFAULT NULL,
  `source_database_id` int(10) DEFAULT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1500001 ;

-- --------------------------------------------------------

--
-- Table structure for table `taxonomic_rank`
--

CREATE TABLE `taxonomic_rank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank` varchar(50) NOT NULL,
  `tdwg_link` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=130 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `common_name`
--
ALTER TABLE `common_name`
  ADD CONSTRAINT `common_name_ibfk_10` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `common_name_ibfk_8` FOREIGN KEY (`language_iso`) REFERENCES `language` (`iso`) ON UPDATE CASCADE,
  ADD CONSTRAINT `common_name_ibfk_9` FOREIGN KEY (`country_iso`) REFERENCES `country` (`iso`) ON UPDATE CASCADE;

--
-- Constraints for table `distribution`
--
ALTER TABLE `distribution`
  ADD CONSTRAINT `distribution_ibfk_5` FOREIGN KEY (`region_code`) REFERENCES `region` (`region_code`) ON UPDATE CASCADE,
  ADD CONSTRAINT `distribution_ibfk_6` FOREIGN KEY (`distribution_status_id`) REFERENCES `distribution_status` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `distribution_status`
--
ALTER TABLE `distribution_status`
  ADD CONSTRAINT `distribution_status_ibfk_1` FOREIGN KEY (`id`) REFERENCES `distribution` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `reference`
--
ALTER TABLE `reference`
  ADD CONSTRAINT `reference_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reference_ibfk_2` FOREIGN KEY (`database_id`) REFERENCES `source_database` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `reference_to_common_name`
--
ALTER TABLE `reference_to_common_name`
  ADD CONSTRAINT `reference_to_common_name_ibfk_5` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reference_to_common_name_ibfk_6` FOREIGN KEY (`common_name_id`) REFERENCES `common_name` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `reference_to_synonym`
--
ALTER TABLE `reference_to_synonym`
  ADD CONSTRAINT `reference_to_synonym_ibfk_5` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reference_to_synonym_ibfk_6` FOREIGN KEY (`synonym_id`) REFERENCES `synonym_detail` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `reference_to_taxon`
--
ALTER TABLE `reference_to_taxon`
  ADD CONSTRAINT `reference_to_taxon_ibfk_5` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reference_to_taxon_ibfk_6` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `region`
--
ALTER TABLE `region`
  ADD CONSTRAINT `region_ibfk_1` FOREIGN KEY (`region_code`) REFERENCES `distribution` (`region_code`) ON UPDATE CASCADE;

--
-- Constraints for table `resource_to_source_database`
--
ALTER TABLE `resource_to_source_database`
  ADD CONSTRAINT `resource_to_source_database_ibfk_1` FOREIGN KEY (`source_database_id`) REFERENCES `source_database` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `resource_to_source_database_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `specialist`
--
ALTER TABLE `specialist`
  ADD CONSTRAINT `specialist_ibfk_1` FOREIGN KEY (`database_id`) REFERENCES `source_database` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `synonym`
--
ALTER TABLE `synonym`
  ADD CONSTRAINT `synonym_ibfk_10` FOREIGN KEY (`taxonomic_rank_id`) REFERENCES `taxon` (`taxonomic_rank_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `synonym_ibfk_8` FOREIGN KEY (`scientific_name_element_id`) REFERENCES `scientific_name_element` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `synonym_ibfk_9` FOREIGN KEY (`synonym_details_id`) REFERENCES `synonym_detail` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `synonym_detail`
--
ALTER TABLE `synonym_detail`
  ADD CONSTRAINT `synonym_detail_ibfk_7` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `synonym_detail_ibfk_8` FOREIGN KEY (`authority_id`) REFERENCES `authority` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `synonym_detail_ibfk_9` FOREIGN KEY (`name_status_id`) REFERENCES `name_status` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `taxon`
--
ALTER TABLE `taxon`
  ADD CONSTRAINT `taxon_ibfk_22` FOREIGN KEY (`taxonomic_rank_id`) REFERENCES `taxon` (`taxonomic_rank_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `taxon_ibfk_16` FOREIGN KEY (`scientific_name_element_id`) REFERENCES `scientific_name_element` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `taxon_ibfk_18` FOREIGN KEY (`authority_id`) REFERENCES `authority` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `taxon_ibfk_19` FOREIGN KEY (`name_status_id`) REFERENCES `name_status` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `taxon_ibfk_20` FOREIGN KEY (`specialist_id`) REFERENCES `specialist` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `taxon_ibfk_21` FOREIGN KEY (`source_database_id`) REFERENCES `source_database` (`id`) ON UPDATE CASCADE;
