ALTER TABLE `_source_database_details` DISABLE KEYS;

INSERT INTO `_source_database_details`
(`id`, `full_name`, `short_name`, `version`, `release_date`, `authors_editors`,
`english_name`, `number_of_species`, `number_of_infraspecific_taxon`,
`number_of_synonyms`, `number_of_common_names`, `abstract`, `organization`, `taxonomic_coverage`,
`is_new`, `coverage`, `completeness`, `confidence`)

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
    sd.`taxonomic_coverage` AS taxonomic_coverage,
    sd.`is_new` AS is_new,
    sd.`coverage` AS coverage,
    sd.`completeness` AS completeness,
    sd.`confidence` AS confidence

FROM
    `source_database` AS sd
;

UPDATE `_source_database_details` SET `total_number` = 
`number_of_species` + `number_of_infraspecific_taxon` + `number_of_synonyms` +
`number_of_common_names`;


UPDATE `_source_database_details` SET

`full_name` = TRIM(`full_name`),
`short_name` = TRIM(`short_name`),
`version` = TRIM(`version`),
`authors_editors` = TRIM(`authors_editors`),
`english_name` = TRIM(`english_name`),
`abstract` = TRIM(`abstract`),
`organization` = TRIM(`organization`);

ALTER TABLE `_source_database_details` ENABLE KEYS;

