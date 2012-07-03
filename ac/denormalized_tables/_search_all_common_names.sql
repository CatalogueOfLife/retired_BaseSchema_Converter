SELECT
    cn.`id` AS `id`,
    "" AS `name_element`,
    cne.`name` AS `name`,
    IFNULL(l.`name`,"") AS `name_suffix`,
    dsa.`rank` AS `rank`,
    6 AS `name_status`,
    dsa.`name` AS `name_status_suffix`,
    IFNULL(dsa.`name_suffix`,"") AS `name_status_suffix_suffix`,
    dsa.`group` AS `kingdom`,
    dsa.`source_database_name` AS `source_database_name`,
    dsa.`source_database_id` AS `source_database_id`,
    cn.`taxon_id` AS accepted_taxon_id
FROM
    `common_name` AS `cn`

-- mandatory join on common name elements
RIGHT JOIN `common_name_element` AS `cne` ON
    cn.`common_name_element_id` = cne.`id`

-- mandatory join on taxon
RIGHT JOIN `_search_all` AS `dsa` ON
    cn.`taxon_id` = dsa.`id`

-- optional join for language
LEFT JOIN `language` AS `l` ON
    cn.`language_iso` = l.`iso`

WHERE
    cn.`id` IS NOT NULL
GROUP BY  cn.`taxon_id` , cn.`common_name_element_id`

;