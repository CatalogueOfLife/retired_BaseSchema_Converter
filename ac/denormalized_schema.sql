DROP TABLE IF EXISTS `_search_scientific`;
DROP TABLE IF EXISTS `_search_distribution`;
DROP TABLE IF EXISTS `_source_database_details`;
DROP TABLE IF EXISTS `_source_database_taxonomic_coverage`;
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
`source_database_name` varchar(255) NULL,

PRIMARY KEY ( `id` ),  
INDEX (`kingdom`),
INDEX (`phylum`),
INDEX (`class`),
INDEX (`order`),
INDEX (`superfamily`),
INDEX (`family`),
INDEX (`genus`),
INDEX (`subgenus`),
INDEX (`species`),
INDEX (`infraspecies`),
INDEX (`author`),
INDEX (`status`),
INDEX (`accepted_species_id`),
INDEX (`accepted_species_name`),
INDEX (`accepted_species_author`),
INDEX (`source_database_id`),
INDEX (`source_database_name`)

) ENGINE = MyISAM DEFAULT CHARSET=utf8

;

CREATE TABLE `_search_distribution` (
`distribution` varchar(255) NOT NULL,
`accepted_species_id` int(10) NOT NULL,
`name` varchar(255) NOT NULL,
`author` varchar(255) NOT NULL,
`rank` int(11) NOT NULL,
`kingdom` varchar(255) NOT NULL,
`source_database_id` int(10) NOT NULL,
`db_name` varchar(255) NOT NULL,

INDEX (`distribution`),
INDEX (`accepted_species_id`),
INDEX (`name`),
INDEX (`author`),
INDEX (`rank`),
INDEX (`kingdom`),
INDEX (`source_database_id`),
INDEX (`db_name`)

) ENGINE = MyISAM DEFAULT CHARSET=utf8

;

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
`number_of_synonyms` INT( 10 ) NOT NULL ,
`number_of_common_names` INT( 10 ) NOT NULL ,
`total_number` INT( 10 ) NOT NULL ,
`abstract` TEXT NOT NULL ,
`organization` VARCHAR( 255 ) NOT NULL,
`is_new` BOOL NOT NULL DEFAULT '0',

PRIMARY KEY ( `id` ),  
INDEX (`full_name`),
INDEX (`short_name`),
INDEX (`version`),
INDEX (`release_date`),
INDEX (`authors_editors`),
INDEX (`english_name`),
INDEX (`number_of_species`),
INDEX (`number_of_infraspecific_taxon`),
INDEX (`number_of_synonyms`),
INDEX (`number_of_common_names`),
INDEX (`total_number`),
INDEX (`organization`),
INDEX (`is_new`)

) ENGINE = MyISAM CHARACTER SET utf8 

;

CREATE TABLE `_source_database_taxonomic_coverage` (
`source_database_id` INT( 10 ) NOT NULL ,
`kingdom` VARCHAR( 255 ) NOT NULL ,
`phylum` VARCHAR( 255 ) NOT NULL ,
`class` VARCHAR( 255 ) NOT NULL ,
`order` VARCHAR( 255 ) NOT NULL ,
`kingdom_id` INT( 10 ) NOT NULL ,
`phylum_id` INT( 10 ) NOT NULL ,
`class_id` INT( 10 ) NOT NULL ,
`order_id` INT( 10 ) NOT NULL,

INDEX (`source_database_id`),
INDEX (`kingdom`),
INDEX (`phylum`),
INDEX (`class`),
INDEX (`order`),
INDEX (`kingdom_id`),
INDEX (`phylum_id`),
INDEX (`class_id`),
INDEX (`order_id`)

) ENGINE = MyISAM CHARACTER SET utf8

;

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
`status` varchar(255) NOT NULL,
`additional_data` text NOT NULL,
`source_database_id` int(11) NOT NULL,
`source_database_short_name` varchar(255) NOT NULL,
`source_database_release_date` date NOT NULL,
`scrutiny_date` date NOT NULL,
`specialist` varchar(255) NOT NULL,

PRIMARY KEY ( `taxon_id` ),  
INDEX (`kingdom_id`),
INDEX (`kingdom_lsid`),
INDEX (`kingdom_name`),
INDEX (`phylum_id`),
INDEX (`phylum_lsid`),
INDEX (`phylum_name`),
INDEX (`class_id`),
INDEX (`class_lsid`),
INDEX (`class_name`),
INDEX (`order_id`),
INDEX (`order_lsid`),
INDEX (`order_name`),
INDEX (`superfamily_id`),
INDEX (`superfamily_lsid`),
INDEX (`superfamily_name`),
INDEX (`family_id`),
INDEX (`family_lsid`),
INDEX (`family_name`),
INDEX (`genus_id`),
INDEX (`genus_lsid`),
INDEX (`genus_name`),
INDEX (`subgenus_id`),
INDEX (`subgenus_lsid`),
INDEX (`subgenus_name`),
INDEX (`species_id`),
INDEX (`species_lsid`),
INDEX (`species_name`),
INDEX (`infraspecies_id`),
INDEX (`infraspecies_lsid`),
INDEX (`infraspecies_name`),
INDEX (`infraspecific_marker`),
INDEX (`author`),
INDEX (`status`),
INDEX ( `source_database_id`),
INDEX (`source_database_short_name`),
INDEX (`source_database_release_date`),
INDEX (`scrutiny_date`),
INDEX (`specialist`)

) ENGINE = MyISAM DEFAULT CHARSET=utf8

;

CREATE TABLE `_search_all` (
`id` int(10) NOT NULL,
`name_element` varchar(255) NOT NULL,
`name` varchar(255) NOT NULL,
`name_suffix` varchar(255) DEFAULT NULL,
`rank` varchar(255) NOT NULL,
`name_status` varchar(255) NOT NULL,
`name_status_suffix` varchar(255) NOT NULL,
`name_status_suffix_suffix` varchar(255) DEFAULT NULL,
`group` varchar(255) NOT NULL,
`source_database` varchar(255) NOT NULL,
`source_database_id` int(10) NOT NULL,
`accepted_taxon_id` int(10) DEFAULT NULL,

INDEX (`id`),
INDEX (`name_element`),
INDEX (`name`),
INDEX (`name_suffix`),
INDEX (`rank`),
INDEX (`name_status`),
INDEX (`name_status_suffix`),
INDEX (`name_status_suffix_suffix`),
INDEX (`group`),
INDEX (`source_database`),
INDEX (`source_database_id`),
INDEX (`accepted_taxon_id`)

) ENGINE = MyISAM DEFAULT CHARSET=utf8

;

CREATE TABLE `_taxon_tree` (
`taxon_id` int(10) NOT NULL,
`name` varchar(255) NOT NULL,
`rank` varchar(255) NOT NULL,
`parent_id` int(10) NOT NULL,
`lsid` varchar(255) NOT NULL,
`number_of_children` int(10) NOT NULL,

PRIMARY KEY ( `taxon_id` ),  
INDEX (`name`),
INDEX (`rank`),
INDEX (`parent_id`),
INDEX (`lsid`),
INDEX (`number_of_children`)

) ENGINE=MyISAM DEFAULT CHARSET=utf8

;

CREATE TABLE `_totals` (
`description` varchar(255) NOT NULL DEFAULT '',
`total` int(10) DEFAULT NULL,

PRIMARY KEY (`description`)

) ENGINE=MyISAM DEFAULT CHARSET=utf8

;