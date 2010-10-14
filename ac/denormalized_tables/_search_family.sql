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

WHERE `genus` IS NULL AND `subgenus` IS NULL AND `species` IS NULL AND `infraspecies` IS NULL

GROUP BY `kingdom`, `phylum`, `class`, `order`, `superfamily`, `family`

;