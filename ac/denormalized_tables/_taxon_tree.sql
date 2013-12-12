SET SESSION sql_mode = '';

ALTER TABLE `_taxon_tree` DISABLE KEYS;

INSERT INTO `_taxon_tree` (`taxon_id`, `rank`, `lsid`, `number_of_children`)
SELECT
    t_1.`id` AS `taxon_id`,
    rank.`rank` AS `rank`,
    IF(MAX(uri.`resource_identifier`) LIKE 'urn:lsid:%',MAX(uri.`resource_identifier`),NULL)AS `lsid`,
    COUNT(children.`parent_id`) AS `number_of_children`
FROM
    `taxon` AS `t_1`

RIGHT JOIN `taxonomic_rank` AS `rank` ON
    t_1.`taxonomic_rank_id` = rank.`id`

LEFT JOIN `taxon_name_element` AS `children` ON
    t_1.`id` = children.`parent_id`

LEFT JOIN `uri_to_taxon` AS `utt` ON
    t_1.`id` = utt.`taxon_id`
LEFT JOIN `uri` AS `uri` ON
    utt.`uri_id` = uri.`id`

WHERE t_1.`id` IS NOT NULL
GROUP BY t_1.`id`

;

UPDATE _taxon_tree AS ttt SET name=(
    SELECT
        tsa.name
    FROM
        _search_all AS tsa

    WHERE
        tsa.id = ttt.taxon_id AND
        (
            tsa.name_status = 1 OR
            tsa.name_status = 4 OR
            tsa.name_status = 0
        )
    LIMIT 0,1
);

UPDATE _taxon_tree AS ttt SET parent_id=(
    SELECT
        tne_1.`parent_id` AS `parent_id`
    FROM
        taxon_name_element AS tne_1

    WHERE
        tne_1.taxon_id = ttt.taxon_id
);

UPDATE `_taxon_tree` SET

`name` = TRIM(`name`),
`rank` = TRIM(`rank`),
`lsid` = TRIM(`lsid`);

ALTER TABLE `_taxon_tree` ENABLE KEYS;


ALTER TABLE `_taxon_tree` DISABLE KEYS;

INSERT INTO `_taxon_tree` (`taxon_id`, `rank`, `lsid`, `number_of_children`)
SELECT
    t_1.`id` AS `taxon_id`,
    rank.`rank` AS `rank`,
    IF(MAX(uri.`resource_identifier`) LIKE 'urn:lsid:%',MAX(uri.`resource_identifier`),NULL)AS `lsid`,
    COUNT(children.`parent_id`) AS `number_of_children`
FROM
    `taxon` AS `t_1`

RIGHT JOIN `taxonomic_rank` AS `rank` ON
    t_1.`taxonomic_rank_id` = rank.`id`

LEFT JOIN `taxon_name_element` AS `children` ON
    t_1.`id` = children.`parent_id`

LEFT JOIN `uri_to_taxon` AS `utt` ON
    t_1.`id` = utt.`taxon_id`
LEFT JOIN `uri` AS `uri` ON
    utt.`uri_id` = uri.`id`

WHERE t_1.`id` IS NOT NULL
GROUP BY t_1.`id`

;

UPDATE _taxon_tree AS ttt SET name=(
    SELECT
        tsa.name
    FROM
        _search_all AS tsa

    WHERE
        tsa.id = ttt.taxon_id AND
        (
            tsa.name_status = 1 OR
            tsa.name_status = 4 OR
            tsa.name_status = 0
        )
    LIMIT 0,1
);

UPDATE _taxon_tree AS ttt SET parent_id=(
    SELECT
        tne_1.`parent_id` AS `parent_id`
    FROM
        taxon_name_element AS tne_1

    WHERE
        tne_1.taxon_id = ttt.taxon_id
);

UPDATE `_taxon_tree` SET

`name` = TRIM(`name`),
`rank` = TRIM(`rank`),
`lsid` = TRIM(`lsid`);

ALTER TABLE `_taxon_tree` ENABLE KEYS;

