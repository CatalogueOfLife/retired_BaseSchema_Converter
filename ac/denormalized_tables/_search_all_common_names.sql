    SELECT
        cn.`id` AS `id`,
        "" AS `name_element`,
        cne.`name` AS `name`,
        l.`name` AS `name_suffix`,
        rank.`rank` AS `rank`,
        6 AS `name_status`,
        IF (t_1.`taxonomic_rank_id` IN (54,76,6,72,17,112,20),CONCAT(UCASE(SUBSTRING(sne_1.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_1.`name_element`, 2))),
            IF(t_2.`taxonomic_rank_id` = 20,CONCAT(CONCAT(UCASE(SUBSTRING(sne_2.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_2.`name_element`, 2)))," ",sne_1.`name_element`),
            CONCAT(CONCAT(UCASE(SUBSTRING(sne_3.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_3.`name_element`, 2)))," ",sne_2.`name_element`,IF(tr1.`marker_displayed` != "",CONCAT(" ",tr1.`marker_displayed`),"")," ",sne_1.`name_element`)
        )) AS `name_status_suffix`,
        aus.`string` AS `name_status_suffix_suffix`,
        IF (tne_1.`parent_id` IS NULL,CONCAT(UCASE(SUBSTRING(sne_1.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_1.`name_element`, 2))),
            IF (tne_2.`parent_id` IS NULL,CONCAT(UCASE(SUBSTRING(sne_2.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_2.`name_element`, 2))),
            IF (tne_3.`parent_id` IS NULL,CONCAT(UCASE(SUBSTRING(sne_3.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_3.`name_element`, 2))),
            IF (tne_4.`parent_id` IS NULL,CONCAT(UCASE(SUBSTRING(sne_4.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_4.`name_element`, 2))),
            IF (tne_5.`parent_id` IS NULL,CONCAT(UCASE(SUBSTRING(sne_5.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_5.`name_element`, 2))),
            IF (tne_6.`parent_id` IS NULL,CONCAT(UCASE(SUBSTRING(sne_6.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_6.`name_element`, 2))),
            IF (tne_7.`parent_id` IS NULL,CONCAT(UCASE(SUBSTRING(sne_7.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_7.`name_element`, 2))),
            IF (tne_8.`parent_id` IS NULL,CONCAT(UCASE(SUBSTRING(sne_8.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_8.`name_element`, 2))),
            IF (tne_9.`parent_id` IS NULL,CONCAT(UCASE(SUBSTRING(sne_9.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_9.`name_element`, 2))),
            ""
        ))))))))) AS `kingdom`,
        db.`abbreviated_name` AS `source_database_name`,
        db.`id` AS `source_database_id`,
        t_1.`id` AS accepted_taxon_id
    FROM
        `common_name` AS `cn`

    -- mandatory join on common name elements
    RIGHT JOIN `common_name_element` AS `cne` ON
        cn.`common_name_element_id` = cne.`id`

    -- mandatory join on taxon
    RIGHT JOIN `taxon` AS `t_1` ON
        cn.`taxon_id` = t_1.`id`
    RIGHT JOIN `taxon_name_element` AS `tne_1` ON
        t_1.`id` = tne_1.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_1` ON
        tne_1.`scientific_name_element_id` = sne_1.`id`

    -- mandatory join on source database
    RIGHT JOIN `source_database` AS `db` ON
        t_1.`source_database_id` = db.`id`

    -- mandatory join on ranks
    RIGHT JOIN `taxonomic_rank` AS `rank` ON
        t_1.`taxonomic_rank_id` = rank.`id`

    -- optional join for language
    LEFT JOIN `language` AS `l` ON
        cn.`language_iso` = l.`iso`

    -- optional join for accepted name author
    LEFT JOIN `taxon_detail` AS `td_1` ON
        t_1.`id` = td_1.`taxon_id`
    LEFT JOIN `author_string` AS `aus` ON
        td_1.`author_string_id` = aus.`id`

    -- optional joins on name elements to get group
    LEFT JOIN `taxon_name_element` AS `tne_2` ON
        tne_1.`parent_id` = tne_2.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_2` ON
        tne_2.`scientific_name_element_id` = sne_2.`id`
    LEFT JOIN `taxon` AS `t_2` ON
        tne_2.`taxon_id` = t_2.`id`

    LEFT JOIN `taxon_name_element` AS `tne_3` ON
        tne_2.`parent_id` = tne_3.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_3` ON
        tne_3.`scientific_name_element_id` = sne_3.`id`
    LEFT JOIN `taxon` AS `t_3` ON
        tne_3.`taxon_id` = t_3.`id`

    LEFT JOIN `taxon_name_element` AS `tne_4` ON
        tne_3.`parent_id` = tne_4.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_4` ON
        tne_4.`scientific_name_element_id` = sne_4.`id`

    LEFT JOIN `taxon_name_element` AS `tne_5` ON
        tne_4.`parent_id` = tne_5.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_5` ON
        tne_5.`scientific_name_element_id` = sne_5.`id`

    LEFT JOIN `taxon_name_element` AS `tne_6` ON
        tne_5.`parent_id` = tne_6.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_6` ON
        tne_6.`scientific_name_element_id` = sne_6.`id`

    LEFT JOIN `taxon_name_element` AS `tne_7` ON
        tne_6.`parent_id` = tne_7.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_7` ON
        tne_7.`scientific_name_element_id` = sne_7.`id`

    LEFT JOIN `taxon_name_element` AS `tne_8` ON
        tne_7.`parent_id` = tne_8.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_8` ON
        tne_8.`scientific_name_element_id` = sne_8.`id`

    LEFT JOIN `taxon_name_element` AS `tne_9` ON
        tne_8.`parent_id` = tne_9.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_9` ON
        tne_9.`scientific_name_element_id` = sne_9.`id`

    LEFT JOIN `taxonomic_rank` AS `tr1` ON
        t_1.`taxonomic_rank_id` = tr1.`id`
        
    WHERE
        cn.`id` IS NOT NULL
    GROUP BY cn.`common_name_element_id`, cn.`language_iso`

    ;