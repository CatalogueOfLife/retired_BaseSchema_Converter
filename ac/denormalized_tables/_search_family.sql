SET SESSION sql_mode = '';

INSERT INTO `_search_family` (`id`,`kingdom`,`phylum`,`class`,`order`,`superfamily`,`family`)

SELECT
    `id`,
    `kingdom`,
    `phylum`,
    `class`,
    `order`,
    `superfamily`,
    `family`
FROM `_search_scientific`

WHERE `genus`= "" AND `subgenus` = "" AND `species` = "" AND `infraspecies` = "" 

GROUP BY `kingdom`, `phylum`, `class`, `order`, `superfamily`, `family`

;

UPDATE `_search_family` SET

`kingdom` = TRIM(`kingdom`),
`phylum` = TRIM(`phylum`),
`class` = TRIM(`class`),
`order` = TRIM(`order`),
`superfamily` = TRIM(`superfamily`),
`family` = TRIM(`family`);

ALTER TABLE `_search_family` ADD INDEX ( `kingdom` );
ALTER TABLE `_search_family` ADD INDEX ( `phylum` );
ALTER TABLE `_search_family` ADD INDEX ( `class` );
ALTER TABLE `_search_family` ADD INDEX ( `order` );
ALTER TABLE `_search_family` ADD INDEX ( `superfamily` );
ALTER TABLE `_search_family` ADD INDEX ( `family` );
