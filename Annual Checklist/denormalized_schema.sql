DROP TABLE IF EXISTS `_search_scientific`;
DROP TABLE IF EXISTS `_search_distribution`;
DROP TABLE IF EXISTS `_source_database_details`;
DROP TABLE IF EXISTS `_species_details`;
DROP TABLE IF EXISTS `_search_all`;
DROP TABLE IF EXISTS `_taxon_tree`;
DROP TABLE IF EXISTS `_totals`;

CREATE TABLE `_search_scientific` (
  `id` int(10) NOT NULL,
  `kingdom` varchar(255) NULL,
  `phylum` varchar(255) NULL,
  `class` varchar(255) NULL,
  `order` varchar(255) NULL,
  `superfamily` varchar(255) NULL,
  `family` varchar(255) NULL,
  `genus` varchar(255) NULL,
  `subgenus` varchar(255) NULL,
  `species` varchar(255) NULL,
  `infraspecies` varchar(255) NULL,
  `author` varchar(255) NULL,
  `status` varchar(255) NULL,
  `accepted_species_id` int(10) NULL,
  `accepted_species_name` varchar(255) NULL,
  `accepted_species_author` varchar(255) NULL,
  `source_database_id` int(10) NULL,
  `source_database_name` varchar(255) NULL
) ENGINE = MyISAM DEFAULT CHARSET=utf8

;

CREATE TABLE `_search_distribution` (
  `distribution` varchar(255) NULL,
  `accepted_species_id` int(10) NULL,
  `name` varchar(255) NULL,
  `author` varchar(255) NULL,
  `rank` int(11) NULL,
  `kingdom` varchar(255) NULL,
  `source_database_id` int(10) NULL,
  `db_name` varchar(255) NULL
) ENGINE = MyISAM DEFAULT CHARSET=utf8

;

CREATE TABLE `_source_database_details` (
`id` INT( 10 ) NULL ,
`full_name` VARCHAR( 255 ) NULL ,
`short_name` VARCHAR( 255 ) NULL ,
`version` VARCHAR( 255 ) NULL ,
`release_date` DATE NULL ,
`authors_editors` VARCHAR( 255 ) NULL ,
`english_name` VARCHAR( 255 ) NULL ,
`number_of_species` INT( 10 ) NULL ,
`number_of_infraspecific_taxon` INT( 10 ) NULL ,
`number_of_synonyms` INT( 10 ) NULL ,
`number_of_common_names` INT( 10 ) NULL ,
`total_number` INT( 10 ) NULL ,
`abstract` LONGTEXT NULL ,
`organization` VARCHAR( 255 ) NULL,
`is_new` BOOL NULL DEFAULT '0'
) ENGINE = MyISAM CHARACTER SET utf8 ;

;

CREATE TABLE `_species_details` (
  `taxon_id` int(11) NULL,
  `kingdom_id` int(11) NULL,
  `kingdom_lsid` varchar(255) NULL,
  `kingdom_name` varchar(255) NULL,
  `phylum_id` int(11) NULL,
  `phylum_lsid` varchar(255) NULL,
  `phylum_name` varchar(255) NULL,
  `class_id` int(11) NULL,
  `class_lsid` varchar(255) NULL,
  `class_name` varchar(255) NULL,
  `order_id` int(11) NULL,
  `order_lsid` varchar(255) NULL,
  `order_name` varchar(255) NULL,
  `superfamily_id` int(11) NULL,
  `superfamily_lsid` varchar(255) NULL,
  `superfamily_name` varchar(255) NULL,
  `family_id` int(11) NULL,
  `family_lsid` varchar(255) NULL,
  `family_name` varchar(255) NULL,
  `genus_id` int(11) NULL,
  `genus_lsid` varchar(255) NULL,
  `genus_name` varchar(255) NULL,
  `subgenus_id` int(11) NULL,
  `subgenus_lsid` varchar(255) NULL,
  `subgenus_name` varchar(255) NULL,
  `species_id` int(11) NULL,
  `species_lsid` varchar(255) NULL,
  `species_name` varchar(255) NULL,
  `infraspecies_id` int(11) NULL,
  `infraspecies_lsid` varchar(255) NULL,
  `infraspecies_name` varchar(255) NULL,
  `infraspecific_marker` varchar(255) NULL,
  `author` varchar(255) NULL,
  `status` varchar(255) NULL,
  `additional_data` longtext NULL,
  `source_database_id` int(11) NULL,
  `source_database_short_name` varchar(255) NULL,
  `source_database_release_date` date NULL,
  `scrutiny_date` date NULL,
  `specialist` varchar(255) NULL
) ENGINE = MyISAM DEFAULT CHARSET=utf8

;

CREATE TABLE `_search_all` (
  `id` int(10) NULL,
  `name_element` varchar(255) NULL,
  `name` varchar(255) NULL,
  `name_suffix` varchar(255) DEFAULT NULL,
  `rank` varchar(255) NULL,
  `name_status` varchar(255) NULL,
  `name_status_suffix` varchar(255) NULL,
  `name_status_suffix_suffix` varchar(255) DEFAULT NULL,
  `group` varchar(255) NULL,
  `source_database` varchar(255) NULL,
  `source_database_id` int(10) NULL,
  `accepted_taxon_id` int(10) DEFAULT NULL
) ENGINE = MyISAM DEFAULT CHARSET=utf8

;

CREATE TABLE IF NOT EXISTS `_taxon_tree` (
  `taxon_id` int(10) NULL,
  `name` varchar(255) NULL,
  `rank` varchar(255) NULL,
  `parent_id` int(10) NULL,
  `lsid` varchar(255) NULL,
  `number_of_children` int(10) NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8

;

CREATE TABLE IF NOT EXISTS `_totals` (
  `description` varchar(255) NULL DEFAULT NULL,
  `total` int(10) DEFAULT NULL,
  PRIMARY KEY (`description`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8

;