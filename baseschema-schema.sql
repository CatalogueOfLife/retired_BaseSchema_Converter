-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 07, 2012 at 09:29 AM
-- Server version: 5.5.9
-- PHP Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `base_scheme_v19`
--

-- --------------------------------------------------------

--
-- Table structure for table `author_string`
--

CREATE TABLE `author_string` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `string` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Name of author(s), who described the taxon or published the current combination and the year when appropriate.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `string` (`string`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Author citations of taxa and synonyms';

-- --------------------------------------------------------

--
-- Table structure for table `common_name`
--

CREATE TABLE `common_name` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taxon_id` int(10) unsigned NOT NULL,
  `common_name_element_id` int(10) unsigned NOT NULL,
  `language_iso` char(3) DEFAULT NULL COMMENT 'Optional language code',
  `country_iso` char(3) DEFAULT NULL COMMENT 'Optional country code if usage is restricted to a particular country',
  `region_free_text_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`taxon_id`,`common_name_element_id`,`language_iso`,`country_iso`),
  KEY `taxon_id` (`taxon_id`),
  KEY `common_name_element_id` (`common_name_element_id`),
  KEY `language_iso` (`language_iso`),
  KEY `country_iso` (`country_iso`),
  KEY `region_free_text_id` (`region_free_text_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Common names plus language/country details';

-- --------------------------------------------------------

--
-- Table structure for table `common_name_element`
--

CREATE TABLE `common_name_element` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `transliteration` varchar(255) DEFAULT NULL COMMENT 'Transcription of name in foreign alphabet into English',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `transliteration` (`transliteration`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Common names separated to avoid duplication';

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE `country` (
  `iso` char(3) NOT NULL COMMENT 'ISO 3166-1-Alpha-2 code',
  `name` varchar(100) NOT NULL COMMENT 'Country',
  `standard` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`iso`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Predetermined list of ISO 3166-1-Alpha-2 codes';

-- --------------------------------------------------------

--
-- Table structure for table `distribution`
--

CREATE TABLE `distribution` (
  `taxon_detail_id` int(10) unsigned NOT NULL,
  `region_id` smallint(5) unsigned NOT NULL,
  `distribution_status_id` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`taxon_detail_id`,`region_id`),
  KEY `region_id` (`region_id`),
  KEY `distribution_status_id` (`distribution_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links combination(s) of region and distribution status to ta';

-- --------------------------------------------------------

--
-- Table structure for table `distribution_free_text`
--

CREATE TABLE `distribution_free_text` (
  `taxon_detail_id` int(10) unsigned NOT NULL,
  `region_free_text_id` int(10) unsigned NOT NULL,
  `distribution_status_id` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`taxon_detail_id`,`region_free_text_id`),
  KEY `taxon_detail_id` (`taxon_detail_id`),
  KEY `region_free_text_id` (`region_free_text_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links text description of distribution to taxon';

-- --------------------------------------------------------

--
-- Table structure for table `distribution_status`
--

CREATE TABLE `distribution_status` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `status` varchar(100) NOT NULL COMMENT 'Distribution status (common, rare, etc.)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Predetermined list of distribution statuses';

-- --------------------------------------------------------

--
-- Table structure for table `hybrid`
--

CREATE TABLE `hybrid` (
  `taxon_id` int(10) unsigned NOT NULL,
  `parent_taxon_id` int(10) unsigned NOT NULL COMMENT 'References two (or three) parent taxon ids',
  PRIMARY KEY (`taxon_id`,`parent_taxon_id`),
  KEY `parent_taxon_id` (`parent_taxon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links to parent taxa of hybrids';

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `iso` char(3) NOT NULL COMMENT 'ISO 639-2 Alpha-3 code',
  `name` varchar(100) NOT NULL COMMENT 'Language',
  `standard` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`iso`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Predetermined list of ISO 639-2 Alpha-3 codes';

-- --------------------------------------------------------

--
-- Table structure for table `lifezone`
--

CREATE TABLE `lifezone` (
  `id` smallint(1) unsigned NOT NULL AUTO_INCREMENT,
  `lifezone` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `lifezone` (`lifezone`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `lifezone_to_taxon_detail`
--

CREATE TABLE `lifezone_to_taxon_detail` (
  `lifezone_id` smallint(5) unsigned NOT NULL,
  `taxon_detail_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`lifezone_id`,`taxon_detail_id`),
  KEY `taxon_detail_id` (`taxon_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links life zone(s) to taxon';

-- --------------------------------------------------------

--
-- Table structure for table `reference`
--

CREATE TABLE `reference` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `authors` varchar(255) DEFAULT NULL COMMENT 'Complete author string',
  `year` varchar(75) DEFAULT NULL COMMENT 'Year(s) of publication',
  `title` varchar(1500) DEFAULT NULL COMMENT 'Title of the publication',
  `text` varchar(1500) DEFAULT NULL COMMENT 'Additional information pertaining to the publication',
  `uri_id` int(10) unsigned DEFAULT NULL COMMENT 'Link to downloadable version',
  PRIMARY KEY (`id`),
  KEY `authors` (`authors`),
  KEY `year` (`year`),
  KEY `uri_id` (`uri_id`),
  KEY `complete` (`authors`(100),`year`,`title`(50),`text`(50))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='References used for taxa, common names and synonyms';

-- --------------------------------------------------------

--
-- Table structure for table `reference_to_common_name`
--

CREATE TABLE `reference_to_common_name` (
  `reference_id` int(10) unsigned NOT NULL,
  `common_name_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`reference_id`,`common_name_id`),
  KEY `common_name_id` (`common_name_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links references to common names';

-- --------------------------------------------------------

--
-- Table structure for table `reference_to_synonym`
--

CREATE TABLE `reference_to_synonym` (
  `reference_id` int(10) unsigned NOT NULL,
  `synonym_id` int(10) unsigned NOT NULL,
  `reference_type_id` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`reference_id`,`synonym_id`),
  KEY `synonym_id` (`synonym_id`),
  KEY `reference_type_id` (`reference_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links references to synonyms';

-- --------------------------------------------------------

--
-- Table structure for table `reference_to_taxon`
--

CREATE TABLE `reference_to_taxon` (
  `reference_id` int(10) unsigned NOT NULL,
  `taxon_id` int(10) unsigned NOT NULL,
  `reference_type_id` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`reference_id`,`taxon_id`),
  KEY `taxon_id` (`taxon_id`),
  KEY `reference_type_id` (`reference_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links references to taxa';

-- --------------------------------------------------------

--
-- Table structure for table `reference_type`
--

CREATE TABLE `reference_type` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(35) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `region`
--

CREATE TABLE `region` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `region_standard_id` tinyint(3) unsigned NOT NULL,
  `original_code` varchar(25) NOT NULL COMMENT 'Original ID or code of the region in the standard referenced in region_standard_id',
  `name` varchar(255)  CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Region',
  `parent_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Optional parent region',
  `polygon` longtext DEFAULT NULL,
  `polygon_rough` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`region_standard_id`,`original_code`,`name`),
  KEY `region_standard_id` (`region_standard_id`),
  KEY `original_code` (`original_code`),
  KEY `name` (`name`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Predetermined list of regions used for distribution';

-- --------------------------------------------------------

--
-- Table structure for table `region_free_text`
--

CREATE TABLE `region_free_text` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `free_text` TEXT COLLATE utf8_bin NOT NULL COMMENT 'Free text description of distribution; provided mainly to store full text descriptions from the Annual Checklist',
  PRIMARY KEY (`id`),
  KEY `free_text` (`free_text`(255))
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `region_standard`
--

CREATE TABLE `region_standard` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `standard` varchar(50) NOT NULL COMMENT 'Standard used to describe the region',
  `version` varchar(10) DEFAULT NULL COMMENT 'Version of the standard used',
  PRIMARY KEY (`id`),
  UNIQUE KEY `standard` (`standard`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Standards used for region table';

-- --------------------------------------------------------

--
-- Table structure for table `scientific_name_element`
--

CREATE TABLE `scientific_name_element` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_element` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'Basic element of a scientific name; e.g. the epithet argentatus as used in Larus argentatus argenteus',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_element` (`name_element`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Individual elements used to generate a scientific name';

-- --------------------------------------------------------

--
-- Table structure for table `scientific_name_status`
--

CREATE TABLE `scientific_name_status` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `name_status` varchar(50) NOT NULL COMMENT 'Name status of a taxon',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_status` (`name_status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Predetermined list of name statuses';

-- --------------------------------------------------------

--
-- Table structure for table `scrutiny`
--

CREATE TABLE `scrutiny` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `scrutiny_date` date DEFAULT NULL COMMENT 'Most recent date a taxon name was verified; must parse correctly',
  `original_scrutiny_date` varchar(100) DEFAULT NULL COMMENT 'Date as used in the original database; may be incomplete',
  `specialist_id` int(10) unsigned DEFAULT NULL COMMENT 'Link to the specialist who examined the validity of a taxon; may be null',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`specialist_id`,`scrutiny_date`,`original_scrutiny_date`),
  KEY `scrutiny_date` (`scrutiny_date`),
  KEY `specialist_id` (`specialist_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Latest scrutiny date of a taxon';

-- --------------------------------------------------------

--
-- Table structure for table `source_database`
--

CREATE TABLE `source_database` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT 'Full name of the source database',
  `abbreviated_name` varchar(50) DEFAULT NULL COMMENT 'Abbreviated name of the source database',
  `group_name_in_english` varchar(255) DEFAULT NULL COMMENT 'Name in English of the group(s) treated in the database',
  `authors_and_editors` varchar(500) DEFAULT NULL COMMENT 'Optional author(s) and editor(s) of the source database',
  `organisation` varchar(500) DEFAULT NULL COMMENT 'Optional organisation which has compiled or is owning the source database',
  `contact_person` varchar(255) DEFAULT NULL COMMENT 'Optional contact person of the source database',
  `version` varchar(25) DEFAULT NULL COMMENT 'Optional version number of the source database',
  `release_date` date DEFAULT NULL COMMENT 'Optional most recent release date of the source database',
  `abstract` text COMMENT 'Optional free text field describing the source database',
  `taxonomic_coverage` text,
  `is_new` tinyint(1) NOT NULL,
  `coverage` varchar(255) DEFAULT NULL,
  `completeness` varchar(10) DEFAULT NULL,
  `confidence` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`abbreviated_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Information about source databases';

-- --------------------------------------------------------

--
-- Table structure for table `specialist`
--

CREATE TABLE `specialist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Specialists who have verified the validity of taxa';

-- --------------------------------------------------------

--
-- Table structure for table `synonym`
--

CREATE TABLE `synonym` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taxon_id` int(10) unsigned NOT NULL COMMENT 'Link to valid taxon to which the synonym relates',
  `author_string_id` int(10) unsigned DEFAULT NULL COMMENT 'Link to author citation of the synonym',
  `scientific_name_status_id` tinyint(2) unsigned NOT NULL COMMENT 'Link to the name status of the synonym',
  `original_id` varchar(100) DEFAULT NULL COMMENT 'ACEF name code',
  `taxon_guid` varchar(255) DEFAULT NULL,
  `name_guid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `taxon_id` (`taxon_id`),
  KEY `author_string_id` (`author_string_id`),
  KEY `scientific_name_status_id` (`scientific_name_status_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Synonym details linked to a valid taxon';

-- --------------------------------------------------------

--
-- Table structure for table `synonym_name_element`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `taxon`
--

CREATE TABLE `taxon` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `taxonomic_rank_id` tinyint(3) unsigned NOT NULL,
  `source_database_id` int(10) unsigned DEFAULT NULL,
  `original_id` varchar(100) DEFAULT NULL COMMENT 'ACEF name code',
  PRIMARY KEY (`id`),
  KEY `taxonomic_rank_id` (`taxonomic_rank_id`),
  KEY `source_database_id` (`source_database_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Scientific name elements and hierarchy of a taxon';

-- --------------------------------------------------------

--
-- Table structure for table `taxonomic_coverage`
--

CREATE TABLE `taxonomic_coverage` (
  `source_database_id` int(10) NOT NULL,
  `taxon_id` int(10) NOT NULL,
  `sector` tinyint(2) NOT NULL,
  `point_of_attachment` tinyint(1) NOT NULL DEFAULT '0',
  KEY `source_database_id` (`source_database_id`),
  KEY `sector` (`sector`),
  KEY `taxon_id` (`taxon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `taxonomic_rank`
--

CREATE TABLE `taxonomic_rank` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rank` varchar(50) NOT NULL COMMENT 'Taxonomic rank (e.g. family, subspecies)',
  `marker_displayed` varchar(50) DEFAULT NULL,
  `standard` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `rank` (`rank`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Predetermined list of taxonomic ranks';

-- --------------------------------------------------------

--
-- Table structure for table `taxon_detail`
--

CREATE TABLE `taxon_detail` (
  `taxon_id` int(10) unsigned NOT NULL,
  `author_string_id` int(10) unsigned DEFAULT NULL COMMENT 'Link to author citation of the taxon',
  `scientific_name_status_id` tinyint(2) unsigned NOT NULL,
  `scrutiny_id` int(10) unsigned DEFAULT NULL,
  `additional_data` text COMMENT 'Optional free text field describing the taxon',
  `taxon_guid` varchar(255) DEFAULT NULL,
  `name_guid` varchar(255) DEFAULT NULL,
  `has_preholocene` smallint(1) DEFAULT NULL DEFAULT '0',
  `has_modern` smallint(1) DEFAULT NULL DEFAULT '1',
  `is_extinct` smallint(1) DEFAULT NULL DEFAULT '0',
  PRIMARY KEY (`taxon_id`),
  KEY `author_string_id` (`author_string_id`),
  KEY `taxononomic_status_id` (`scientific_name_status_id`),
  KEY `scrutiny_id` (`scrutiny_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Details pertaining to species and infraspecies';

-- --------------------------------------------------------

--
-- Table structure for table `taxon_name_element`
--

CREATE TABLE `taxon_name_element` (
  `taxon_id` int(10) unsigned NOT NULL,
  `scientific_name_element_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`taxon_id`),
  KEY `scientific_name_element_id` (`scientific_name_element_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `uri`
--

CREATE TABLE `uri` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `resource_identifier` varchar(500) NOT NULL COMMENT 'Unique resource identifier (URI; including LSID)',
  `description` text COMMENT 'Short description of the URI',
  `uri_scheme_id` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uri_scheme_id` (`uri_scheme_id`),
  KEY `resource_identifier` (`resource_identifier`(250),`uri_scheme_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Unique resource identifiers';

-- --------------------------------------------------------

--
-- Table structure for table `uri_scheme`
--

CREATE TABLE `uri_scheme` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `scheme` varchar(25) NOT NULL COMMENT 'Abbreviation of URI scheme',
  `name` varchar(255) NOT NULL COMMENT 'Full name of URI scheme',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`scheme`,`name`),
  KEY `scheme` (`scheme`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Predetermined list of URI schemas';

-- --------------------------------------------------------

--
-- Table structure for table `uri_to_source_database`
--

CREATE TABLE `uri_to_source_database` (
  `uri_id` int(10) unsigned NOT NULL,
  `source_database_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`uri_id`,`source_database_id`),
  KEY `source_database_id` (`source_database_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links URIs to source databases';

-- --------------------------------------------------------

--
-- Table structure for table `uri_to_taxon`
--

CREATE TABLE `uri_to_taxon` (
  `uri_id` int(10) unsigned NOT NULL,
  `taxon_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`uri_id`,`taxon_id`),
  KEY `taxon_id` (`taxon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Links URI(s) (including LSID) to taxon';

-- --------------------------------------------------------

--
-- Table structure for table `_conversion_errors`
--

CREATE TABLE `_conversion_errors` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(150) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `message` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `common_name`
--
ALTER TABLE `common_name`
  ADD CONSTRAINT `common_name_ibfk_1` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `common_name_ibfk_2` FOREIGN KEY (`common_name_element_id`) REFERENCES `common_name_element` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `common_name_ibfk_3` FOREIGN KEY (`language_iso`) REFERENCES `language` (`iso`) ON UPDATE CASCADE,
  ADD CONSTRAINT `common_name_ibfk_4` FOREIGN KEY (`country_iso`) REFERENCES `country` (`iso`) ON UPDATE CASCADE,
  ADD CONSTRAINT `common_name_ibfk_5` FOREIGN KEY (`region_free_text_id`) REFERENCES `region_free_text` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `distribution`
--
ALTER TABLE `distribution`
  ADD CONSTRAINT `distribution_ibfk_1` FOREIGN KEY (`taxon_detail_id`) REFERENCES `taxon_detail` (`taxon_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `distribution_ibfk_2` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `distribution_free_text`
--
ALTER TABLE `distribution_free_text`
  ADD CONSTRAINT `distribution_free_text_ibfk_1` FOREIGN KEY (`taxon_detail_id`) REFERENCES `taxon_detail` (`taxon_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `distribution_free_text_ibfk_2` FOREIGN KEY (`region_free_text_id`) REFERENCES `region_free_text` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `hybrid`
--
ALTER TABLE `hybrid`
  ADD CONSTRAINT `hybrid_ibfk_1` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `hybrid_ibfk_2` FOREIGN KEY (`parent_taxon_id`) REFERENCES `taxon` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `lifezone_to_taxon_detail`
--
ALTER TABLE `lifezone_to_taxon_detail`
  ADD CONSTRAINT `lifezone_to_taxon_detail_ibfk_1` FOREIGN KEY (`lifezone_id`) REFERENCES `lifezone` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `lifezone_to_taxon_detail_ibfk_2` FOREIGN KEY (`taxon_detail_id`) REFERENCES `taxon_detail` (`taxon_id`) ON UPDATE CASCADE;

--
-- Constraints for table `reference`
--
ALTER TABLE `reference`
  ADD CONSTRAINT `reference_ibfk_1` FOREIGN KEY (`uri_id`) REFERENCES `uri` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `reference_to_common_name`
--
ALTER TABLE `reference_to_common_name`
  ADD CONSTRAINT `reference_to_common_name_ibfk_1` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reference_to_common_name_ibfk_2` FOREIGN KEY (`common_name_id`) REFERENCES `common_name` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `reference_to_synonym`
--
ALTER TABLE `reference_to_synonym`
  ADD CONSTRAINT `reference_to_synonym_ibfk_1` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reference_to_synonym_ibfk_2` FOREIGN KEY (`synonym_id`) REFERENCES `synonym` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `reference_to_taxon`
--
ALTER TABLE `reference_to_taxon`
  ADD CONSTRAINT `reference_to_taxon_ibfk_1` FOREIGN KEY (`reference_id`) REFERENCES `reference` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reference_to_taxon_ibfk_2` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `region`
--
ALTER TABLE `region`
  ADD CONSTRAINT `region_ibfk_1` FOREIGN KEY (`region_standard_id`) REFERENCES `region_standard` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `region_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `region` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `scrutiny`
--
ALTER TABLE `scrutiny`
  ADD CONSTRAINT `scrutiny_ibfk_1` FOREIGN KEY (`specialist_id`) REFERENCES `specialist` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `synonym`
--
ALTER TABLE `synonym`
  ADD CONSTRAINT `synonym_ibfk_1` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `synonym_ibfk_2` FOREIGN KEY (`author_string_id`) REFERENCES `author_string` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `synonym_ibfk_3` FOREIGN KEY (`scientific_name_status_id`) REFERENCES `scientific_name_status` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `synonym_name_element`
--
ALTER TABLE `synonym_name_element`
  ADD CONSTRAINT `synonym_name_element_ibfk_1` FOREIGN KEY (`taxonomic_rank_id`) REFERENCES `taxonomic_rank` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `synonym_name_element_ibfk_2` FOREIGN KEY (`scientific_name_element_id`) REFERENCES `scientific_name_element` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `synonym_name_element_ibfk_3` FOREIGN KEY (`synonym_id`) REFERENCES `synonym` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `taxon`
--
ALTER TABLE `taxon`
  ADD CONSTRAINT `taxon_ibfk_1` FOREIGN KEY (`taxonomic_rank_id`) REFERENCES `taxonomic_rank` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `taxon_ibfk_2` FOREIGN KEY (`source_database_id`) REFERENCES `source_database` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `taxon_detail`
--
ALTER TABLE `taxon_detail`
  ADD CONSTRAINT `taxon_detail_ibfk_1` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `taxon_detail_ibfk_2` FOREIGN KEY (`author_string_id`) REFERENCES `author_string` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `taxon_detail_ibfk_3` FOREIGN KEY (`scientific_name_status_id`) REFERENCES `scientific_name_status` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `taxon_detail_ibfk_4` FOREIGN KEY (`scrutiny_id`) REFERENCES `scrutiny` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `taxon_name_element`
--
ALTER TABLE `taxon_name_element`
  ADD CONSTRAINT `taxon_name_element_ibfk_1` FOREIGN KEY (`scientific_name_element_id`) REFERENCES `scientific_name_element` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `taxon_name_element_ibfk_2` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `uri`
--
ALTER TABLE `uri`
  ADD CONSTRAINT `uri_ibfk_1` FOREIGN KEY (`uri_scheme_id`) REFERENCES `uri_scheme` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `uri_to_source_database`
--
ALTER TABLE `uri_to_source_database`
  ADD CONSTRAINT `uri_to_source_database_ibfk_1` FOREIGN KEY (`uri_id`) REFERENCES `uri` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `uri_to_source_database_ibfk_2` FOREIGN KEY (`source_database_id`) REFERENCES `source_database` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `uri_to_taxon`
--
ALTER TABLE `uri_to_taxon`
  ADD CONSTRAINT `uri_to_taxon_ibfk_1` FOREIGN KEY (`uri_id`) REFERENCES `uri` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `uri_to_taxon_ibfk_2` FOREIGN KEY (`taxon_id`) REFERENCES `taxon` (`id`) ON UPDATE CASCADE;
