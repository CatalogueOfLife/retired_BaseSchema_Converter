SET SESSION sql_mode = '';

ALTER TABLE `_search_distribution` DISABLE KEYS;

INSERT INTO `_search_distribution` (`distribution`,`has_preholocene`, `has_modern`, `is_extinct`, `accepted_species_id`,`name`,`author`,`rank`,`kingdom`,`source_database_id`,`source_database_name`)

SELECT

rg.name AS `distribution`,
td.`has_preholocene` as `has_preholocene`,
td.`has_modern` as `has_modern`,
td.`is_extinct` as `is_extinct`,
ds.taxon_detail_id AS `accepted_species_id`,
"" AS `name`,
aus.string AS `author`,
t1.`taxonomic_rank_id` AS `rank`,
"" AS `kingdom`,
t1.source_database_id AS `source_database_id`,
sd.abbreviated_name AS `source_database_name`

FROM `distribution` AS ds

LEFT JOIN `region` AS rg ON
ds.region_id = rg.id

LEFT JOIN `taxon_detail` AS td ON
ds.taxon_detail_id = td.taxon_id

LEFT JOIN `author_string` AS aus ON
td.author_string_id = aus.id

LEFT JOIN `taxon` AS t1 ON
td.taxon_id = t1.id

LEFT JOIN `source_database` AS sd ON
t1.source_database_id = sd.id

;

INSERT INTO `_search_distribution` (`distribution`,`has_preholocene`, `has_modern`, `is_extinct`, `accepted_species_id`, `name`, `author`,`rank`,`kingdom`,`source_database_id`,`source_database_name`)

SELECT

rft.free_text AS distribution,
td.`has_preholocene` as `has_preholocene`,
td.`has_modern` as `has_modern`,
td.`is_extinct` as `is_extinct`,
ds.taxon_detail_id AS accepted_species_id,
"" AS name,
aus.string AS author,
t1.`taxonomic_rank_id` AS rank,
"" AS kingdom,
t1.source_database_id AS source_database_id,
sd.abbreviated_name AS source_database_name

FROM `distribution_free_text` AS ds

RIGHT JOIN `region_free_text` AS rft ON
ds.`region_free_text_id` = rft.`id`

LEFT JOIN `taxon_detail` AS td ON
ds.taxon_detail_id = td.taxon_id

LEFT JOIN `author_string` AS aus ON
td.author_string_id = aus.id

LEFT JOIN `taxon` AS t1 ON
td.taxon_id = t1.id

LEFT JOIN `source_database` AS sd ON
t1.source_database_id = sd.id

;

UPDATE `_search_distribution` SET

`distribution` = TRIM(`distribution`),
`name` = TRIM(`name`),
`author` = TRIM(`author`),
`kingdom` = TRIM(`kingdom`),
`source_database_name` = TRIM(`source_database_name`);

ALTER TABLE `_search_distribution` ENABLE KEYS;


