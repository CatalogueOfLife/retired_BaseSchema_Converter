ALTER TABLE `_source_database_details` DISABLE KEYS;

INSERT INTO `_source_database_details`
(`id`, `full_name`, `short_name`, `version`, `release_date`, `authors_editors`,
`english_name`, `number_of_species`, `number_of_infraspecific_taxon`,
`number_of_synonyms`, `number_of_common_names`, `abstract`, `organization`, `taxonomic_coverage`)

SELECT
    sd.`id` AS id,
    sd.`name` AS full_name,
    sd.`abbreviated_name` AS short_name,
    sd.`version` AS version,
    sd.`release_date` AS release_date,
    sd.`authors_and_editors` AS authors_editors,
    sd.`group_name_in_english` AS english_name,
    (SELECT COUNT(*) AS `total` FROM `source_database` AS sd2 RIGHT JOIN `taxon` AS `t` ON sd2.id = t.source_database_id WHERE (sd2.id = sd.id AND t.taxonomic_rank_id = 83)) AS number_of_species,
    (SELECT COUNT(*) AS `total` FROM `source_database` AS sd3 RIGHT JOIN `taxon` AS `t` ON sd3.id = t.source_database_id WHERE (sd3.id = sd.id AND t.taxonomic_rank_id NOT IN (54,76,6,72,112,17,20,96,83))) AS number_of_infraspecific_taxon,
    (SELECT COUNT(*) AS `total` FROM `source_database` RIGHT JOIN `taxon` AS `t` ON source_database.id = t.source_database_id RIGHT JOIN `synonym` AS `s` ON t.id = s.taxon_id WHERE source_database.id = sd.id) AS number_of_synonyms,
    (SELECT COUNT(*) AS `total` FROM `source_database` AS sd4 RIGHT JOIN `taxon` AS `t` ON sd4.id = t.source_database_id RIGHT JOIN `common_name` AS `cn` ON t.id = cn.taxon_id WHERE (sd4.id = sd.id)) AS number_of_common_names,
    sd.`abstract` AS abstract,
    sd.`organisation` AS organization,
    sd.`taxonomic_coverage` AS taxonomic_coverage
 
FROM
    `source_database` AS sd
;

UPDATE `_source_database_details` SET `total_number` = 
`number_of_species` + `number_of_infraspecific_taxon` + `number_of_synonyms` +
`number_of_common_names`

;

INSERT INTO `_source_database_taxonomic_coverage`
(`source_database_id`, `kingdom`, `phylum`, `class`, `order`, `kingdom_id`,
`phylum_id`, `class_id`, `order_id`)

SELECT
`source_database`.`id` AS `source_database_id`,
IF(t7.taxonomic_rank_id = 54, CONCAT(UCASE(SUBSTRING(sne_7.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_7.`name_element`, 2))),
 IF(t8.taxonomic_rank_id = 54, CONCAT(UCASE(SUBSTRING(sne_8.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_8.`name_element`, 2))),
  IF(t9.taxonomic_rank_id = 54, CONCAT(UCASE(SUBSTRING(sne_9.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_9.`name_element`, 2))),""
))) AS `kingdom`,
IF(t6.taxonomic_rank_id = 76, CONCAT(UCASE(SUBSTRING(sne_6.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_6.`name_element`, 2))),
 IF(t7.taxonomic_rank_id = 76, CONCAT(UCASE(SUBSTRING(sne_7.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_7.`name_element`, 2))),
  IF(t8.taxonomic_rank_id = 76, CONCAT(UCASE(SUBSTRING(sne_8.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_8.`name_element`, 2))),""
))) AS `phylum`,
IF(t5.taxonomic_rank_id = 6, CONCAT(UCASE(SUBSTRING(sne_5.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_5.`name_element`, 2))),
 IF(t6.taxonomic_rank_id = 6, CONCAT(UCASE(SUBSTRING(sne_6.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_6.`name_element`, 2))),
  IF(t7.taxonomic_rank_id = 6, CONCAT(UCASE(SUBSTRING(sne_7.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_7.`name_element`, 2))),""
))) AS `class`,
IF(t4.taxonomic_rank_id = 72, CONCAT(UCASE(SUBSTRING(sne_4.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_4.`name_element`, 2))),
 IF(t5.taxonomic_rank_id = 72, CONCAT(UCASE(SUBSTRING(sne_5.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_5.`name_element`, 2))),
  IF(t6.taxonomic_rank_id = 72, CONCAT(UCASE(SUBSTRING(sne_6.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_6.`name_element`, 2))),""
))) AS `order`,
IF(t7.taxonomic_rank_id = 54, t7.`id`,
 IF(t8.taxonomic_rank_id = 54, t8.`id`,
  IF(t9.taxonomic_rank_id = 54, t9.`id`,""
))) AS `kingdom_id`,
IF(t6.taxonomic_rank_id = 76, t6.`id`,
 IF(t7.taxonomic_rank_id = 76, t7.`id`,
  IF(t8.taxonomic_rank_id = 76, t8.`id`,""
))) AS `phylum_id`,
IF(t5.taxonomic_rank_id = 6, t5.`id`,
 IF(t6.taxonomic_rank_id = 6, t6.`id`,
  IF(t7.taxonomic_rank_id = 6, t7.`id`,""
))) AS `class_id`,
IF(t4.taxonomic_rank_id = 72, t4.`id`,
 IF(t5.taxonomic_rank_id = 72, t5.`id`,
  IF(t6.taxonomic_rank_id = 72, t6.`id`,""
))) AS `order_id`

FROM
`source_database`

LEFT JOIN `taxon` AS `t1` ON
source_database.id = t1.source_database_id AND
t1.taxonomic_rank_id = 83

LEFT JOIN `taxon_name_element` AS `tne_1` ON
t1.id = tne_1.taxon_id

LEFT JOIN `taxon_name_element` AS `tne_2` ON
tne_1.parent_id = tne_2.taxon_id

LEFT JOIN `taxon_name_element` AS `tne_3` ON
tne_2.parent_id = tne_3.taxon_id

LEFT JOIN `taxon_name_element` AS `tne_4` ON
tne_3.parent_id = tne_4.taxon_id

LEFT JOIN `scientific_name_element` AS `sne_4` ON
tne_4.scientific_name_element_id = sne_4.id

LEFT JOIN `taxon` AS `t4` ON
tne_4.taxon_id = t4.id

LEFT JOIN `taxon_name_element` AS `tne_5` ON
tne_4.parent_id = tne_5.taxon_id

LEFT JOIN `scientific_name_element` AS `sne_5` ON
tne_5.scientific_name_element_id = sne_5.id

LEFT JOIN `taxon` AS `t5` ON
tne_5.taxon_id = t5.id

LEFT JOIN `taxon_name_element` AS `tne_6` ON
tne_5.parent_id = tne_6.taxon_id

LEFT JOIN `scientific_name_element` AS `sne_6` ON
tne_6.scientific_name_element_id = sne_6.id

LEFT JOIN `taxon` AS `t6` ON
tne_6.taxon_id = t6.id

LEFT JOIN `taxon_name_element` AS `tne_7` ON
tne_6.parent_id = tne_7.taxon_id

LEFT JOIN `scientific_name_element` AS `sne_7` ON
tne_7.scientific_name_element_id = sne_7.id

LEFT JOIN `taxon` AS `t7` ON
tne_7.taxon_id = t7.id

LEFT JOIN `taxon_name_element` AS `tne_8` ON
tne_7.parent_id = tne_8.taxon_id

LEFT JOIN `scientific_name_element` AS `sne_8` ON
tne_8.scientific_name_element_id = sne_8.id

LEFT JOIN `taxon` AS `t8` ON
tne_8.taxon_id = t8.id

LEFT JOIN `taxon_name_element` AS `tne_9` ON
tne_8.parent_id = tne_9.taxon_id

LEFT JOIN `scientific_name_element` AS `sne_9` ON
tne_9.scientific_name_element_id = sne_9.id

LEFT JOIN `taxon` AS `t9` ON
tne_9.taxon_id = t9.id

WHERE `source_database`.`id` IS NOT NULL

GROUP BY `kingdom`, `phylum`, `class`, `order`, `source_database`.`id`
;

UPDATE `_source_database_details` SET

`full_name` = TRIM(`full_name`),
`short_name` = TRIM(`short_name`),
`version` = TRIM(`version`),
`authors_editors` = TRIM(`authors_editors`),
`english_name` = TRIM(`english_name`),
`abstract` = TRIM(`abstract`),
`organization` = TRIM(`organization`);

UPDATE `_source_database_taxonomic_coverage` SET

`kingdom` = TRIM(`kingdom`),
`phylum` = TRIM(`phylum`),
`class` = TRIM(`class`),
`order` = TRIM(`order`);

ALTER TABLE `_source_database_details` ENABLE KEYS;

