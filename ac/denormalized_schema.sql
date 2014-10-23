DROP TABLE IF EXISTS `_image_resource`;
DROP TABLE IF EXISTS `_natural_keys`;
DROP TABLE IF EXISTS `_search_all`;
DROP TABLE IF EXISTS `_search_distribution`;
DROP TABLE IF EXISTS `_search_family`;
DROP TABLE IF EXISTS `_search_scientific`;
DROP TABLE IF EXISTS `_source_database_details`;
DROP TABLE IF EXISTS `_source_database_to_taxon_tree_branch`;
DROP TABLE IF EXISTS `_species_details`;
DROP TABLE IF EXISTS `_taxon_tree`;
DROP TABLE IF EXISTS `_totals`;
DROP TABLE IF EXISTS `__import_image_resource`;
DROP TABLE IF EXISTS `__import_source_database_qualifiers`;
DROP TABLE IF EXISTS `__import_species_estimate`;


CREATE TABLE `_search_scientific` (
	`id` int(10) NOT NULL,
	`kingdom` varchar(255) NOT NULL,
	`phylum` varchar(255) NOT NULL,
	`class` varchar(255) NOT NULL,
	`order` varchar(255) NOT NULL,
	`superfamily` varchar(255) NOT NULL,
	`family` varchar(255) NOT NULL,
	`genus` varchar(255) NOT NULL,
	`subgenus` varchar(255) NOT NULL,
	`species` varchar(255) NOT NULL,
	`infraspecific_marker` varchar(255) NOT NULL,
	`infraspecies` varchar(255) NOT NULL,
	`author` varchar(255) NOT NULL,
	`status` tinyint(1) NOT NULL,
	`accepted_species_id` int(10) NOT NULL,
	`accepted_species_name` varchar(255) NOT NULL,
	`accepted_species_author` varchar(255) NOT NULL,
	`source_database_id` int(10) NOT NULL,
	`source_database_name` varchar(255) NOT NULL,
	`has_preholocene` smallint(1) NOT NULL DEFAULT '0',
	`has_modern` smallint(1) NOT NULL DEFAULT '1',
	`is_extinct` smallint(1) NOT NULL DEFAULT '0',
	KEY `id` (`id`,`status`))
ENGINE = MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `_search_distribution` (
	`distribution` TEXT NOT NULL,
	`accepted_species_id` int(10) NOT NULL,
	`name` varchar(255) NOT NULL,
	`author` varchar(255) NOT NULL,
	`rank` int(11) NOT NULL,
	`kingdom` varchar(255) NOT NULL,
	`source_database_id` int(10) NOT NULL,
	`source_database_name` varchar(255) NOT NULL,
	`has_preholocene` smallint(1) NOT NULL DEFAULT '0',
	`has_modern` smallint(1) NOT NULL DEFAULT '1',
	`is_extinct` smallint(1) NOT NULL DEFAULT '0'
) ENGINE = MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `_source_database_details` (
	`id` INT( 10 ) NOT NULL ,
	`full_name` VARCHAR( 255 ) NOT NULL ,
	`short_name` VARCHAR( 255 ) NOT NULL ,
	`version` VARCHAR( 255 ) NOT NULL ,
	`release_date` DATE NOT NULL ,
	`authors_editors` VARCHAR( 255 ) NOT NULL ,
	`english_name` VARCHAR( 255 ) NOT NULL ,
	`number_of_species` INT( 10 ) NOT NULL ,
	`number_of_infraspecific_taxon` INT( 10 ) NOT NULL ,
	`number_of_extinct_species` INT( 10 ) NOT NULL ,
	`number_of_extinct_infraspecific_taxon` INT( 10 ) NOT NULL ,
	`number_of_synonyms` INT( 10 ) NOT NULL ,
	`number_of_common_names` INT( 10 ) NOT NULL ,
	`total_number` INT( 10 ) NOT NULL ,
	`abstract` TEXT NOT NULL ,
	`organization` VARCHAR( 255 ) NOT NULL,
	`is_new` BOOL NOT NULL DEFAULT '0',
	`taxonomic_coverage` text NOT NULL,
	`coverage` varchar(255) NOT NULL,
	`completeness` varchar(10) NOT NULL,
	`confidence` tinyint(1) NOT NULL
) ENGINE = MyISAM CHARACTER SET utf8;

CREATE TABLE `_species_details` (
	`taxon_id` int(11) NOT NULL,
	`kingdom_id` int(11) NOT NULL,
	`kingdom_lsid` varchar(255) NOT NULL,
	`kingdom_name` varchar(255) NOT NULL,
	`phylum_id` int(11) NOT NULL,
	`phylum_lsid` varchar(255) NOT NULL,
	`phylum_name` varchar(255) NOT NULL,
	`class_id` int(11) NOT NULL,
	`class_lsid` varchar(255) NOT NULL,
	`class_name` varchar(255) NOT NULL,
	`order_id` int(11) NOT NULL,
	`order_lsid` varchar(255) NOT NULL,
	`order_name` varchar(255) NOT NULL,
	`superfamily_id` int(11) NOT NULL,
	`superfamily_lsid` varchar(255) NOT NULL,
	`superfamily_name` varchar(255) NOT NULL,
	`family_id` int(11) NOT NULL,
	`family_lsid` varchar(255) NOT NULL,
	`family_name` varchar(255) NOT NULL,
	`genus_id` int(11) NOT NULL,
	`genus_lsid` varchar(255) NOT NULL,
	`genus_name` varchar(255) NOT NULL,
	`subgenus_id` int(11) NOT NULL,
	`subgenus_lsid` varchar(255) NOT NULL,
	`subgenus_name` varchar(255) NOT NULL,
	`species_id` int(11) NOT NULL,
	`species_lsid` varchar(255) NOT NULL,
	`species_name` varchar(255) NOT NULL,
	`infraspecies_id` int(11) NOT NULL,
	`infraspecies_lsid` varchar(255) NOT NULL,
	`infraspecies_name` varchar(255) NOT NULL,
	`infraspecific_marker` varchar(255) NOT NULL,
	`author` varchar(255) NOT NULL,
	`status` tinyint(1) NOT NULL,
	`additional_data` text NOT NULL,
	`source_database_id` int(11) NOT NULL,
	`source_database_short_name` varchar(255) NOT NULL,
	`source_database_release_date` varchar(255) NOT NULL,
	`scrutiny_date` varchar(255) NULL,
	`specialist` varchar(255) NOT NULL,
	`point_of_attachment_id` int(10) unsigned NOT NULL DEFAULT '0',
	`has_preholocene` smallint(1) NOT NULL DEFAULT '0',
	`has_modern` smallint(1) NOT NULL DEFAULT '1',
	`is_extinct` smallint(1) NOT NULL DEFAULT '0'
) ENGINE = MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `_search_all` (
	`id` int(10) NOT NULL,
	`name_element` varchar(255) NOT NULL,
	`name` varchar(255) NOT NULL,
	`name_suffix` varchar(255) DEFAULT NULL,
	`rank` varchar(255) NOT NULL,
	`name_status` tinyint(1) NOT NULL,
	`name_status_suffix` varchar(255) NOT NULL,
	`name_status_suffix_suffix` varchar(255) DEFAULT NULL,
	`group` varchar(255) NOT NULL,
	`source_database_name` varchar(255) NOT NULL,
	`source_database_id` int(10) NOT NULL,
	`accepted_taxon_id` int(10) DEFAULT NULL,
	`has_preholocene` smallint(1) NOT NULL DEFAULT '0',
	`has_modern` smallint(1) NOT NULL DEFAULT '1',
	`is_extinct` smallint(1) NOT NULL DEFAULT '0',
	KEY `id` (`id`,`name_status`)
) ENGINE = MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `_taxon_tree` (
	`taxon_id` int(10) NOT NULL,
	`name` varchar(255) NOT NULL,
	`rank` varchar(255) NOT NULL,
	`parent_id` int(10) NOT NULL,
	`lsid` varchar(255) NOT NULL,
	`number_of_children` int(10) NOT NULL,
	`total_species_estimation` int(7) NOT NULL,
	`total_species` int(7) NOT NULL,
	`estimate_source` text NOT NULL,
	`has_preholocene` smallint(1) NOT NULL DEFAULT '0',
	`has_modern` smallint(1) NOT NULL DEFAULT '1',
	`is_extinct` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `_totals` (
	`description` varchar(255) NOT NULL DEFAULT '',
	`total` int(10) DEFAULT NULL,
	PRIMARY KEY (`description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `_search_family` (
	`id` INT( 10 ) NOT NULL ,
	`kingdom` VARCHAR( 255 ) NOT NULL ,
	`phylum` VARCHAR( 255 ) NOT NULL ,
	`class` VARCHAR( 255 ) NOT NULL ,
	`order` VARCHAR( 255 ) NOT NULL ,
	`superfamily` VARCHAR( 255 ) NOT NULL ,
	`family` VARCHAR( 255 ) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `_source_database_to_taxon_tree_branch` (
  `source_database_id` int(10) NOT NULL,
  `taxon_tree_id` int(10) NOT NULL,
  KEY `taxon_tree_id` (`taxon_tree_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `_natural_keys` (
  `id` int(11) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  `name_code` varchar(500) DEFAULT NULL,
  `accepted` tinyint(1) NOT NULL DEFAULT '1',
  KEY `hash` (`hash`),
  KEY `name` (`name`),
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
