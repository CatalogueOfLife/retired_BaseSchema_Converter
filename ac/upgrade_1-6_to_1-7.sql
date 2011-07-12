DROP TABLE IF EXISTS `_source_database_taxonomic_coverage`;

CREATE TABLE `_image_resource` (
  `taxon_id` int(10) unsigned NOT NULL,
  `src` varchar(255) NOT NULL,
  `href` varchar(255) NOT NULL,
  `width` mediumint(4) unsigned NOT NULL,
  `height` mediumint(4) unsigned NOT NULL,
  `source` varchar(255) NOT NULL,
  `photographer` varchar(255) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `taxon_id` (`taxon_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `_source_database_to_taxon_tree_branch` (
  `source_database_id` int(10) NOT NULL,
  `taxon_tree_id` int(10) NOT NULL,
  KEY `taxon_tree_id` (`taxon_tree_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `__import_image_resource` (
  `taxon_id` int(10) unsigned NOT NULL,
  `src` varchar(255) NOT NULL,
  `href` varchar(255) NOT NULL,
  `width` mediumint(8) unsigned NOT NULL,
  `height` mediumint(8) unsigned NOT NULL,
  `source` varchar(255) NOT NULL,
  `photographer` varchar(255) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `taxon_id` (`taxon_id`),
  KEY `src` (`src`),
  KEY `href` (`href`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `__import_source_database_qualifiers` (
  `source_database_name` varchar(255) NOT NULL,
  `coverage` varchar(255) NOT NULL,
  `completeness` int(3) NOT NULL,
  `confidence` int(2) NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `__import_species_estimate` (
  `rank` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `species_estimate` int(7) NOT NULL,
  `last_update` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

ALTER TABLE `_source_database_details` 
ADD `taxonomic_coverage` text NOT NULL,
ADD `coverage` varchar(255) NOT NULL,
ADD `completeness` tinyint(3) NOT NULL,
ADD `confidence` tinyint(1) NOT NULL;

ALTER TABLE `_taxon_tree`
ADD `total_species_estimation` int(7) NOT NULL,
ADD `total_species` int(7) NOT NULL,
ADD `estimate_source` text NOT NULL;

ALTER TABLE `_species_details` 
ADD `point_of_attachment_id` int(10) unsigned NOT NULL DEFAULT '0';
