SET SESSION sql_mode = '';

ALTER TABLE `_search_all` DISABLE KEYS;

INSERT INTO `_search_all` (`id`, `has_preholocene`, `has_modern`, `is_extinct`, `name_element`, `name`, `rank`, `name_status`, `name_suffix`, `group`, `source_database_name`,`source_database_id`,`accepted_taxon_id`)
-- Filling taxa

    SELECT -- select all the names from genus and higher
        t1.`id` AS `id`,
        0,
        1,
        0,
        sne_1.`name_element` AS `name_element`,
        CONCAT(UCASE(SUBSTRING(sne_1.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_1.`name_element`, 2))) AS `name`,
        rank.`rank` AS `rank`,
        "" AS `name_status`,
        "" AS `name_status_suffix`,
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
        "" AS accepted_taxon_id

    FROM
        `taxon` AS `t1`

    -- mandatory join on ranks
    RIGHT JOIN `taxonomic_rank` AS `rank` ON
        t1.`taxonomic_rank_id` = rank.`id`

    -- optional join on source databases
    LEFT JOIN `source_database` AS `db` ON
        t1.`source_database_id` = db.`id`

    -- mandatory join on name elements
    RIGHT JOIN `taxon_name_element` AS `tne_1` ON
        t1.`id` = tne_1.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_1` ON
        tne_1.`scientific_name_element_id` = sne_1.`id`

    -- optional joins on name elements to get group
    LEFT JOIN `taxon_name_element` AS `tne_2` ON
        tne_1.`parent_id` = tne_2.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_2` ON
        tne_2.`scientific_name_element_id` = sne_2.`id`

    LEFT JOIN `taxon_name_element` AS `tne_3` ON
        tne_2.`parent_id` = tne_3.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_3` ON
        tne_3.`scientific_name_element_id` = sne_3.`id`

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

    -- selecting only from genus and higher
    WHERE
        `taxonomic_rank_id` IN (54,76,6,72,17,112,20)

    -- taxonomic rank ids
    -- 54  kingdom
    -- 76  phylum
    -- 6   class
    -- 72  order
    -- 17  family
    -- 112 superfamily
    -- 20  genus
    -- 83  species
    -- 19  form
    -- 104 subspecies
    -- 49  infraspecies
    -- 129 variety

;

INSERT INTO `_search_all` (`id`, `has_preholocene`, `has_modern`, `is_extinct`, `name_element`, `name`, `rank`, `name_status`, `name_suffix`, `group`, `source_database_name`,`source_database_id`,`accepted_taxon_id`)
-- Filling taxa

    SELECT -- select all the subgenus from subgenus
        t1.`id` AS `id`,
        0,
        1,
        0,
        sne_1.`name_element` AS `name_element`,
        CONCAT(
        	UCASE(SUBSTRING(sne_2.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_2.`name_element`, 2)),
        	" (",UCASE(SUBSTRING(sne_1.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_1.`name_element`, 2)),")"
        ) AS `name`,
        rank.`rank` AS `rank`,
        "" AS `name_status`,
        "" AS `name_status_suffix`,
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
        "" AS accepted_taxon_id

    FROM
        `taxon` AS `t1`

    -- mandatory join on ranks
    RIGHT JOIN `taxonomic_rank` AS `rank` ON
        t1.`taxonomic_rank_id` = rank.`id`

    -- optional join on source databases
    LEFT JOIN `source_database` AS `db` ON
        t1.`source_database_id` = db.`id`

    -- mandatory join on name elements
    RIGHT JOIN `taxon_name_element` AS `tne_1` ON
        t1.`id` = tne_1.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_1` ON
        tne_1.`scientific_name_element_id` = sne_1.`id`

    -- optional joins on name elements to get group
    LEFT JOIN `taxon_name_element` AS `tne_2` ON
        tne_1.`parent_id` = tne_2.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_2` ON
        tne_2.`scientific_name_element_id` = sne_2.`id`

    LEFT JOIN `taxon_name_element` AS `tne_3` ON
        tne_2.`parent_id` = tne_3.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_3` ON
        tne_3.`scientific_name_element_id` = sne_3.`id`

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

    -- selecting only from genus and higher
    WHERE
        `taxonomic_rank_id` = 96
;

INSERT INTO `_search_all` (`id`, `has_preholocene`, `has_modern`, `is_extinct`, `name_element`, `name`, `rank`, `name_status`, `name_suffix`, `group`, `source_database_name`,`source_database_id`,`accepted_taxon_id`)
-- Filling taxa

    SELECT -- select all the genus from subgenus
        t1.`id` AS `id`,
        0,
        1,
        0,
        sne_2.`name_element` AS `name_element`,
        CONCAT(
        	UCASE(SUBSTRING(sne_2.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_2.`name_element`, 2)),
        	" (",UCASE(SUBSTRING(sne_1.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_1.`name_element`, 2)),")"
        ) AS `name`,
        rank.`rank` AS `rank`,
        "" AS `name_status`,
        "" AS `name_status_suffix`,
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
        "" AS accepted_taxon_id

    FROM
        `taxon` AS `t1`

    -- mandatory join on ranks
    RIGHT JOIN `taxonomic_rank` AS `rank` ON
        t1.`taxonomic_rank_id` = rank.`id`

    -- optional join on source databases
    LEFT JOIN `source_database` AS `db` ON
        t1.`source_database_id` = db.`id`

    -- mandatory join on name elements
    RIGHT JOIN `taxon_name_element` AS `tne_1` ON
        t1.`id` = tne_1.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_1` ON
        tne_1.`scientific_name_element_id` = sne_1.`id`

    -- optional joins on name elements to get group
    LEFT JOIN `taxon_name_element` AS `tne_2` ON
        tne_1.`parent_id` = tne_2.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_2` ON
        tne_2.`scientific_name_element_id` = sne_2.`id`

    LEFT JOIN `taxon_name_element` AS `tne_3` ON
        tne_2.`parent_id` = tne_3.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_3` ON
        tne_3.`scientific_name_element_id` = sne_3.`id`

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

    -- selecting only from genus and higher
    WHERE
        `taxonomic_rank_id` = 96
;


INSERT INTO `_search_all` (`id`, `has_preholocene`, `has_modern`, `is_extinct`, `name_element`, `name`, `rank`, `name_status`, `name_suffix`, `group`, `source_database_name`,`source_database_id`,`accepted_taxon_id`)
-- Filling taxa

    SELECT -- select all the subgenus from subgenus
        t1.`id` AS `id`,
        td1.`has_preholocene` as `has_preholocene`,
        td1.`has_modern` as `has_modern`,
        td1.`is_extinct` as `is_extinct`,
        sne_2.`name_element` AS `name_element`,
        CONCAT_WS(
        	" ",
    		CONCAT(
        		UCASE(
        			SUBSTRING(sne_2.`name_element`, 1, 1)
        		),LOWER(
        			SUBSTRING(sne_2.`name_element`, 2)
        		),
        		" (",
        		UCASE(
        			SUBSTRING(sne_1.`name_element`, 1, 1)
        		),LOWER(
        			SUBSTRING(sne_1.`name_element`, 2)
        		),
        		")"
        	)
        ) AS `name`,
        rank.`rank` AS `rank`,
        sns1.`id` AS `name_status`,
        aus.`string` AS `name_suffix`,
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
        "" AS accepted_taxon_id

    FROM
        `taxon` AS `t1`

    -- mandatory join on ranks
    RIGHT JOIN `taxonomic_rank` AS `rank` ON
        t1.`taxonomic_rank_id` = rank.`id`

    -- mandatory join on source databases
    RIGHT JOIN `source_database` AS `db` ON
        t1.`source_database_id` = db.`id`

    -- mandatory join on name elements for species epitet
    RIGHT JOIN `taxon_name_element` AS `tne_1` ON
        t1.`id` = tne_1.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_1` ON
        tne_1.`scientific_name_element_id` = sne_1.`id`

    -- mandatory join on name elements for genus
    RIGHT JOIN `taxon_name_element` AS `tne_2` ON
        tne_1.`parent_id` = tne_2.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_2` ON
        tne_2.`scientific_name_element_id` = sne_2.`id`

    -- mandatory join on taxon for genus or subgenus
    RIGHT JOIN `taxon` AS `t2` ON
        tne_2.`taxon_id` = t2.`id`

        -- optional joins on name elements to get group
    LEFT JOIN `taxon_name_element` AS `tne_3` ON
        tne_2.`parent_id` = tne_3.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_3` ON
        tne_3.`scientific_name_element_id` = sne_3.`id`

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

    -- mandatory join on taxon detail for taxon
    RIGHT JOIN `taxon_detail` AS `td1` ON
        t1.`id` = td1.`taxon_id`
    -- mandatory join on scientific name status for taxon detail
    RIGHT JOIN `scientific_name_status` AS `sns1` ON
        td1.`scientific_name_status_id` = sns1.`id`
    LEFT JOIN `author_string` AS `aus` ON
        td1.`author_string_id` = aus.`id`

    -- selecting only from subgenus
    WHERE
        t1.`taxonomic_rank_id` = 96

;

INSERT INTO `_search_all` (`id`, `has_preholocene`, `has_modern`, `is_extinct`, `name_element`, `name`, `rank`, `name_status`, `name_suffix`, `group`, `source_database_name`,`source_database_id`,`accepted_taxon_id`)
-- Filling taxa

    SELECT -- select all the specific epitets from species
        t1.`id` AS `id`,
        td1.`has_preholocene` as `has_preholocene`,
        td1.`has_modern` as `has_modern`,
        td1.`is_extinct` as `is_extinct`,
        sne_1.`name_element` AS `name_element`,
        CONCAT_WS(
        	" ",
        	IF(t2.taxonomic_rank_id = 96,
        		CONCAT(
	        		UCASE(
	        			SUBSTRING(sne_3.`name_element`, 1, 1)
	        		),LOWER(
	        			SUBSTRING(sne_3.`name_element`, 2)
	        		),
	        		" (",
	        		UCASE(
	        			SUBSTRING(sne_2.`name_element`, 1, 1)
	        		),LOWER(
	        			SUBSTRING(sne_2.`name_element`, 2)
	        		),
	        		")"
	        	)
        		,
	        	CONCAT(
	        		UCASE(
	        			SUBSTRING(sne_2.`name_element`, 1, 1)
	        		),LOWER(
	        			SUBSTRING(sne_2.`name_element`, 2)
	        		)
	        	)
	        ),sne_1.`name_element`
        ) AS `name`,
        rank.`rank` AS `rank`,
        sns1.`id` AS `name_status`,
        aus.`string` AS `name_suffix`,
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
        "" AS accepted_taxon_id

    FROM
        `taxon` AS `t1`

    -- mandatory join on ranks
    RIGHT JOIN `taxonomic_rank` AS `rank` ON
        t1.`taxonomic_rank_id` = rank.`id`

    -- mandatory join on source databases
    RIGHT JOIN `source_database` AS `db` ON
        t1.`source_database_id` = db.`id`

    -- mandatory join on name elements for species epitet
    RIGHT JOIN `taxon_name_element` AS `tne_1` ON
        t1.`id` = tne_1.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_1` ON
        tne_1.`scientific_name_element_id` = sne_1.`id`

    -- mandatory join on name elements for genus
    RIGHT JOIN `taxon_name_element` AS `tne_2` ON
        tne_1.`parent_id` = tne_2.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_2` ON
        tne_2.`scientific_name_element_id` = sne_2.`id`

    -- mandatory join on taxon for genus or subgenus
    RIGHT JOIN `taxon` AS `t2` ON
        tne_2.`taxon_id` = t2.`id`

        -- optional joins on name elements to get group
    LEFT JOIN `taxon_name_element` AS `tne_3` ON
        tne_2.`parent_id` = tne_3.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_3` ON
        tne_3.`scientific_name_element_id` = sne_3.`id`

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

    -- mandatory join on taxon detail for taxon
    RIGHT JOIN `taxon_detail` AS `td1` ON
        t1.`id` = td1.`taxon_id`
    -- mandatory join on scientific name status for taxon detail
    RIGHT JOIN `scientific_name_status` AS `sns1` ON
        td1.`scientific_name_status_id` = sns1.`id`
    LEFT JOIN `author_string` AS `aus` ON
        td1.`author_string_id` = aus.`id`

    -- selecting only from genus and higher
    WHERE
        t1.`taxonomic_rank_id` = 83

;

INSERT INTO `_search_all` (`id`, `has_preholocene`, `has_modern`, `is_extinct`, `name_element`, `name`, `rank`, `name_status`, `name_suffix`, `group`, `source_database_name`,`source_database_id`,`accepted_taxon_id`)
-- Filling taxa

    SELECT -- select all the genus from species
        t1.`id` AS `id`,
        td1.`has_preholocene` as `has_preholocene`,
        td1.`has_modern` as `has_modern`,
        td1.`is_extinct` as `is_extinct`,
        sne_2.`name_element` AS `name_element`,
        CONCAT_WS(" ",CONCAT(UCASE(SUBSTRING(sne_2.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_2.`name_element`, 2))),sne_1.`name_element`) AS `name`,
        rank.`rank` AS `rank`,
        sns1.`id` AS `name_status`,
        aus.`string` AS `name_suffix`,
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
        "" AS accepted_taxon_id

    FROM
        `taxon` AS `t1`

    -- mandatory join on ranks
    RIGHT JOIN `taxonomic_rank` AS `rank` ON
        t1.`taxonomic_rank_id` = rank.`id`

    -- mandatory join on source databases
    RIGHT JOIN `source_database` AS `db` ON
        t1.`source_database_id` = db.`id`

    -- mandatory join on name elements for species epitet
    RIGHT JOIN `taxon_name_element` AS `tne_1` ON
        t1.`id` = tne_1.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_1` ON
        tne_1.`scientific_name_element_id` = sne_1.`id`

    -- mandatory join on name elements for genus
    RIGHT JOIN `taxon_name_element` AS `tne_2` ON
        tne_1.`parent_id` = tne_2.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_2` ON
        tne_2.`scientific_name_element_id` = sne_2.`id`

    -- mandatory join on taxon for genus or subgenus
    RIGHT JOIN `taxon` AS `t2` ON
        tne_2.`taxon_id` = t2.`id`

    -- optional joins on name elements to get group
    LEFT JOIN `taxon_name_element` AS `tne_3` ON
        tne_2.`parent_id` = tne_3.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_3` ON
        tne_3.`scientific_name_element_id` = sne_3.`id`

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

    -- mandatory join on taxon detail for taxon
    RIGHT JOIN `taxon_detail` AS `td1` ON
        t1.`id` = td1.`taxon_id`
    -- mandatory join on scientific name status for taxon detail
    RIGHT JOIN `scientific_name_status` AS `sns1` ON
        td1.`scientific_name_status_id` = sns1.`id`
    LEFT JOIN `author_string` AS `aus` ON
        td1.`author_string_id` = aus.`id`

    -- selecting only from genus and higher
    WHERE
        t1.`taxonomic_rank_id` = 83 AND
        t2.`taxonomic_rank_id` = 20

;

INSERT INTO `_search_all` (`id`, `has_preholocene`, `has_modern`, `is_extinct`, `name_element`, `name`, `rank`, `name_status`, `name_suffix`, `group`, `source_database_name`,`source_database_id`,`accepted_taxon_id`)
-- Filling taxa

    SELECT -- select all the subgenus from species with subgenus
        t1.`id` AS `id`,
        td1.`has_preholocene` as `has_preholocene`,
        td1.`has_modern` as `has_modern`,
        td1.`is_extinct` as `is_extinct`,
        sne_2.`name_element` AS `name_element`,
        CONCAT_WS(
        	" ",CONCAT(UCASE(SUBSTRING(sne_3.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_3.`name_element`, 2)),
        	" (",UCASE(SUBSTRING(sne_2.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_2.`name_element`, 2)),")"
        	),sne_1.`name_element`
        ) AS `name`,
        rank.`rank` AS `rank`,
        sns1.`id` AS `name_status`,
        aus.`string` AS `name_suffix`,
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
        "" AS accepted_taxon_id

    FROM
        `taxon` AS `t1`

    -- mandatory join on ranks
    RIGHT JOIN `taxonomic_rank` AS `rank` ON
        t1.`taxonomic_rank_id` = rank.`id`

    -- mandatory join on source databases
    RIGHT JOIN `source_database` AS `db` ON
        t1.`source_database_id` = db.`id`

    -- mandatory join on name elements for species epitet
    RIGHT JOIN `taxon_name_element` AS `tne_1` ON
        t1.`id` = tne_1.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_1` ON
        tne_1.`scientific_name_element_id` = sne_1.`id`

    -- mandatory join on name elements for genus
    RIGHT JOIN `taxon_name_element` AS `tne_2` ON
        tne_1.`parent_id` = tne_2.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_2` ON
        tne_2.`scientific_name_element_id` = sne_2.`id`

    -- mandatory join on taxon for genus or subgenus
    RIGHT JOIN `taxon` AS `t2` ON
        tne_2.`taxon_id` = t2.`id`

    -- optional joins on name elements to get group
    LEFT JOIN `taxon_name_element` AS `tne_3` ON
        tne_2.`parent_id` = tne_3.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_3` ON
        tne_3.`scientific_name_element_id` = sne_3.`id`

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

    -- mandatory join on taxon detail for taxon
    RIGHT JOIN `taxon_detail` AS `td1` ON
        t1.`id` = td1.`taxon_id`
    -- mandatory join on scientific name status for taxon detail
    RIGHT JOIN `scientific_name_status` AS `sns1` ON
        td1.`scientific_name_status_id` = sns1.`id`
    LEFT JOIN `author_string` AS `aus` ON
        td1.`author_string_id` = aus.`id`

    -- selecting only from genus and higher
    WHERE
        t1.`taxonomic_rank_id` = 83 AND
        t2.`taxonomic_rank_id` = 96

;


INSERT INTO `_search_all` (`id`, `has_preholocene`, `has_modern`, `is_extinct`, `name_element`, `name`, `rank`, `name_status`, `name_suffix`, `group`, `source_database_name`,`source_database_id`,`accepted_taxon_id`)
-- Filling taxa

    SELECT -- select all the genus from species with subgenus
        t1.`id` AS `id`,
        td1.`has_preholocene` as `has_preholocene`,
        td1.`has_modern` as `has_modern`,
        td1.`is_extinct` as `is_extinct`,
        sne_3.`name_element` AS `name_element`,
        CONCAT_WS(
        	" ",CONCAT(UCASE(SUBSTRING(sne_3.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_3.`name_element`, 2)),
        	" (",UCASE(SUBSTRING(sne_2.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_2.`name_element`, 2)),")"
        	),sne_1.`name_element`
        ) AS `name`,
        rank.`rank` AS `rank`,
        sns1.`id` AS `name_status`,
        aus.`string` AS `name_suffix`,
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
        "" AS accepted_taxon_id

    FROM
        `taxon` AS `t1`

    -- mandatory join on ranks
    RIGHT JOIN `taxonomic_rank` AS `rank` ON
        t1.`taxonomic_rank_id` = rank.`id`

    -- mandatory join on source databases
    RIGHT JOIN `source_database` AS `db` ON
        t1.`source_database_id` = db.`id`

    -- mandatory join on name elements for species epitet
    RIGHT JOIN `taxon_name_element` AS `tne_1` ON
        t1.`id` = tne_1.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_1` ON
        tne_1.`scientific_name_element_id` = sne_1.`id`

    -- mandatory join on name elements for genus
    RIGHT JOIN `taxon_name_element` AS `tne_2` ON
        tne_1.`parent_id` = tne_2.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_2` ON
        tne_2.`scientific_name_element_id` = sne_2.`id`

    -- mandatory join on taxon for genus or subgenus
    RIGHT JOIN `taxon` AS `t2` ON
        tne_2.`taxon_id` = t2.`id`

    -- optional joins on name elements to get group
    LEFT JOIN `taxon_name_element` AS `tne_3` ON
        tne_2.`parent_id` = tne_3.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_3` ON
        tne_3.`scientific_name_element_id` = sne_3.`id`

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

    -- mandatory join on taxon detail for taxon
    RIGHT JOIN `taxon_detail` AS `td1` ON
        t1.`id` = td1.`taxon_id`
    -- mandatory join on scientific name status for taxon detail
    RIGHT JOIN `scientific_name_status` AS `sns1` ON
        td1.`scientific_name_status_id` = sns1.`id`
    LEFT JOIN `author_string` AS `aus` ON
        td1.`author_string_id` = aus.`id`

    -- selecting only from genus and higher
    WHERE
        t1.`taxonomic_rank_id` = 83 AND
        t2.`taxonomic_rank_id` = 96

;

INSERT INTO `_search_all` (`id`, `has_preholocene`, `has_modern`, `is_extinct`, `name_element`, `name`, `rank`, `name_status`, `name_suffix`, `group`, `source_database_name`,`source_database_id`,`accepted_taxon_id`)
-- Filling taxa

    SELECT -- select all infraspecific epitets from infaspecies with subgenus
        t1.`id` AS `id`,
        td1.`has_preholocene` as `has_preholocene`,
        td1.`has_modern` as `has_modern`,
        td1.`is_extinct` as `is_extinct`,
        sne_1.`name_element` AS `name_element`,
        CONCAT_WS(
        	" ",
        	CONCAT(
        		UCASE(
        			SUBSTRING(sne_4.`name_element`, 1, 1)
        		),LOWER(
        			SUBSTRING(sne_4.`name_element`, 2)
        		),
        		" (",
        		UCASE(
        			SUBSTRING(sne_3.`name_element`, 1, 1)
        		),LOWER(
        			SUBSTRING(sne_3.`name_element`, 2)
        		),
        		")"
        	),
        	sne_2.`name_element`,
            IF(
                sne_1.`name_element` = "animalia" OR sne_2.`name_element` = "animalia" OR sne_3.`name_element` = "animalia" OR
                sne_4.`name_element` = "animalia" OR sne_5.`name_element` = "animalia" OR sne_6.`name_element` = "animalia" OR
                sne_7.`name_element` = "animalia" OR sne_8.`name_element` = "animalia" OR sne_9.`name_element` = "animalia" OR
                sne_10.`name_element` = "animalia",
                "",rank.`marker_displayed`
            )
        ,sne_1.`name_element`) AS `name`,
        rank.`rank` AS `rank`,
        sns1.`id` AS `name_status`,
        aus.`string` AS `name_suffix`,
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
        "" AS accepted_taxon_id

    FROM
        `taxon` AS `t1`

    -- mandatory join on ranks
    RIGHT JOIN `taxonomic_rank` AS `rank` ON
        t1.`taxonomic_rank_id` = rank.`id`

    -- mandatory join on source databases
    RIGHT JOIN `source_database` AS `db` ON
        t1.`source_database_id` = db.`id`

    -- mandatory join on name elements for species epitet
    RIGHT JOIN `taxon_name_element` AS `tne_1` ON
        t1.`id` = tne_1.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_1` ON
        tne_1.`scientific_name_element_id` = sne_1.`id`

    -- mandatory join on name elements for species
    RIGHT JOIN `taxon_name_element` AS `tne_2` ON
        tne_1.`parent_id` = tne_2.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_2` ON
        tne_2.`scientific_name_element_id` = sne_2.`id`

    -- mandatory join on name elements for genus
    RIGHT JOIN `taxon_name_element` AS `tne_3` ON
        tne_2.`parent_id` = tne_3.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_3` ON
        tne_3.`scientific_name_element_id` = sne_3.`id`

    -- mandatory join on taxon for genus or subgenus
    RIGHT JOIN `taxon` AS t3 ON
    	tne_3.`taxon_id` = t3.`id`

    -- optional joins on name elements to get group
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

    LEFT JOIN `taxon_name_element` AS `tne_10` ON
        tne_9.`parent_id` = tne_10.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_10` ON
        tne_10.`scientific_name_element_id` = sne_10.`id`

    -- mandatory join on taxon detail for taxon
    RIGHT JOIN `taxon_detail` AS `td1` ON
        t1.`id` = td1.`taxon_id`
    -- mandatory join on scientific name status for taxon detail
    RIGHT JOIN `scientific_name_status` AS `sns1` ON
        td1.`scientific_name_status_id` = sns1.`id`
    LEFT JOIN `author_string` AS `aus` ON
        td1.`author_string_id` = aus.`id`

    -- selecting only from genus and higher
    WHERE
        t1.`taxonomic_rank_id` NOT IN (54,76,6,72,17,112,20,96,83) AND
        t3.`taxonomic_rank_id` = 96

;

INSERT INTO `_search_all` (`id`, `has_preholocene`, `has_modern`, `is_extinct`, `name_element`, `name`, `rank`, `name_status`, `name_suffix`, `group`, `source_database_name`,`source_database_id`,`accepted_taxon_id`)
-- Filling taxa

    SELECT -- select all infaspecific epitets from infraspecies
        t1.`id` AS `id`,
        td1.`has_preholocene` as `has_preholocene`,
        td1.`has_modern` as `has_modern`,
        td1.`is_extinct` as `is_extinct`,
        sne_1.`name_element` AS `name_element`,
        CONCAT_WS(
        	" ",
        	CONCAT(
        		UCASE(
        			SUBSTRING(sne_3.`name_element`, 1, 1)
        		),LOWER(
        			SUBSTRING(sne_3.`name_element`, 2)
        		)
        	),
        	sne_2.`name_element`,
            IF(
                sne_1.`name_element` = "animalia" OR sne_2.`name_element` = "animalia" OR sne_3.`name_element` = "animalia" OR
                sne_4.`name_element` = "animalia" OR sne_5.`name_element` = "animalia" OR sne_6.`name_element` = "animalia" OR
                sne_7.`name_element` = "animalia" OR sne_8.`name_element` = "animalia" OR sne_9.`name_element` = "animalia" OR
                sne_10.`name_element` = "animalia",
                "",rank.`marker_displayed`
            )
        ,sne_1.`name_element`) AS `name`,
        rank.`rank` AS `rank`,
        sns1.`id` AS `name_status`,
        aus.`string` AS `name_suffix`,
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
        "" AS accepted_taxon_id

    FROM
        `taxon` AS `t1`

    -- mandatory join on ranks
    RIGHT JOIN `taxonomic_rank` AS `rank` ON
        t1.`taxonomic_rank_id` = rank.`id`

    -- mandatory join on source databases
    RIGHT JOIN `source_database` AS `db` ON
        t1.`source_database_id` = db.`id`

    -- mandatory join on name elements for species epitet
    RIGHT JOIN `taxon_name_element` AS `tne_1` ON
        t1.`id` = tne_1.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_1` ON
        tne_1.`scientific_name_element_id` = sne_1.`id`

    -- mandatory join on name elements for species
    RIGHT JOIN `taxon_name_element` AS `tne_2` ON
        tne_1.`parent_id` = tne_2.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_2` ON
        tne_2.`scientific_name_element_id` = sne_2.`id`

    -- mandatory join on name elements for genus
    RIGHT JOIN `taxon_name_element` AS `tne_3` ON
        tne_2.`parent_id` = tne_3.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_3` ON
        tne_3.`scientific_name_element_id` = sne_3.`id`

    -- mandatory join on taxon for genus or subgenus
    RIGHT JOIN `taxon` AS t3 ON
    	tne_3.`taxon_id` = t3.`id`

    -- optional joins on name elements to get group
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

    LEFT JOIN `taxon_name_element` AS `tne_10` ON
        tne_9.`parent_id` = tne_10.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_10` ON
        tne_10.`scientific_name_element_id` = sne_10.`id`

    -- mandatory join on taxon detail for taxon
    RIGHT JOIN `taxon_detail` AS `td1` ON
        t1.`id` = td1.`taxon_id`
    -- mandatory join on scientific name status for taxon detail
    RIGHT JOIN `scientific_name_status` AS `sns1` ON
        td1.`scientific_name_status_id` = sns1.`id`
    LEFT JOIN `author_string` AS `aus` ON
        td1.`author_string_id` = aus.`id`

    -- selecting only from genus and higher
    WHERE
        t1.`taxonomic_rank_id` NOT IN (54,76,6,72,17,112,20,96,83) AND
        t3.`taxonomic_rank_id` = 20

;

INSERT INTO `_search_all` (`id`, `has_preholocene`, `has_modern`, `is_extinct`, `name_element`, `name`, `rank`, `name_status`, `name_suffix`, `group`, `source_database_name`,`source_database_id`,`accepted_taxon_id`)
-- Filling taxa

    SELECT -- select all specific epitets from infraspecies
        t1.`id` AS `id`,
        td1.`has_preholocene` as `has_preholocene`,
        td1.`has_modern` as `has_modern`,
        td1.`is_extinct` as `is_extinct`,
        sne_2.`name_element` AS `name_element`,
        CONCAT_WS(" ",CONCAT(UCASE(SUBSTRING(sne_3.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_3.`name_element`, 2))),sne_2.`name_element`,
            IF(
                sne_1.`name_element` = "animalia" OR sne_2.`name_element` = "animalia" OR sne_3.`name_element` = "animalia" OR
                sne_4.`name_element` = "animalia" OR sne_5.`name_element` = "animalia" OR sne_6.`name_element` = "animalia" OR
                sne_7.`name_element` = "animalia" OR sne_8.`name_element` = "animalia" OR sne_9.`name_element` = "animalia" OR
                sne_10.`name_element` = "animalia",
                "",rank.`marker_displayed`
            )
        ,sne_1.`name_element`)  AS `name`,
        rank.`rank` AS `rank`,
        sns1.`id` AS `name_status`,
        aus.`string` AS `name_suffix`,
        IF (tne_1.`parent_id` IS NULL,CONCAT(UCASE(SUBSTRING(sne_1.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_1.`name_element`, 2))),
            IF (tne_2.`parent_id` IS NULL,CONCAT(UCASE(SUBSTRING(sne_2.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_2.`name_element`, 2))),
            IF (tne_3.`parent_id` IS NULL,CONCAT(UCASE(SUBSTRING(sne_3.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_3.`name_element`, 2))),
            IF (tne_4.`parent_id` IS NULL,CONCAT(UCASE(SUBSTRING(sne_4.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_4.`name_element`, 2))),
            IF (tne_5.`parent_id` IS NULL,CONCAT(UCASE(SUBSTRING(sne_5.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_5.`name_element`, 2))),
            IF (tne_6.`parent_id` IS NULL,CONCAT(UCASE(SUBSTRING(sne_6.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_6.`name_element`, 2))),
            IF (tne_7.`parent_id` IS NULL,CONCAT(UCASE(SUBSTRING(sne_7.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_7.`name_element`, 2))),
            IF (tne_8.`parent_id` IS NULL,CONCAT(UCASE(SUBSTRING(sne_8.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_8.`name_element`, 2))),
            IF (tne_9.`parent_id` IS NULL,CONCAT(UCASE(SUBSTRING(sne_9.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_9.`name_element`, 2))),
            IF (tne_10.`parent_id` IS NULL,CONCAT(UCASE(SUBSTRING(sne_10.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_10.`name_element`, 2))),
            ""
        )))))))))) AS `kingdom`,
        db.`abbreviated_name` AS `source_database_name`,
        db.`id` AS `source_database_id`,
        "" AS accepted_taxon_id

    FROM
        `taxon` AS `t1`

    -- mandatory join on ranks
    RIGHT JOIN `taxonomic_rank` AS `rank` ON
        t1.`taxonomic_rank_id` = rank.`id`

    -- mandatory join on source databases
    RIGHT JOIN `source_database` AS `db` ON
        t1.`source_database_id` = db.`id`

    -- mandatory join on name elements for species epitet
    RIGHT JOIN `taxon_name_element` AS `tne_1` ON
        t1.`id` = tne_1.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_1` ON
        tne_1.`scientific_name_element_id` = sne_1.`id`

    -- mandatory join on name elements for species
    RIGHT JOIN `taxon_name_element` AS `tne_2` ON
        tne_1.`parent_id` = tne_2.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_2` ON
        tne_2.`scientific_name_element_id` = sne_2.`id`

    -- mandatory join on name elements for genus
    RIGHT JOIN `taxon_name_element` AS `tne_3` ON
        tne_2.`parent_id` = tne_3.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_3` ON
        tne_3.`scientific_name_element_id` = sne_3.`id`

      RIGHT JOIN `taxon` AS t3 ON
      tne_3.`taxon_id` = t3.`id`

    -- optional joins on name elements to get group
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

    LEFT JOIN `taxon_name_element` AS `tne_10` ON
        tne_9.`parent_id` = tne_10.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_10` ON
        tne_10.`scientific_name_element_id` = sne_10.`id`

    -- mandatory join on taxon detail for taxon
    RIGHT JOIN `taxon_detail` AS `td1` ON
        t1.`id` = td1.`taxon_id`
    -- mandatory join on scientific name status for taxon detail
    RIGHT JOIN `scientific_name_status` AS `sns1` ON
        td1.`scientific_name_status_id` = sns1.`id`
    LEFT JOIN `author_string` AS `aus` ON
        td1.`author_string_id` = aus.`id`

    -- selecting infraspecies
    WHERE
        t1.`taxonomic_rank_id` NOT IN (54,76,6,72,17,112,20,96,83) AND
		t3.`taxonomic_rank_id` = 20

;

INSERT INTO `_search_all` (`id`, `has_preholocene`, `has_modern`, `is_extinct`, `name_element`, `name`, `rank`, `name_status`, `name_suffix`, `group`, `source_database_name`,`source_database_id`,`accepted_taxon_id`)
-- Filling taxa

    SELECT -- select all specific epitets from infraspecies with subgenus
        t1.`id` AS `id`,
        td1.`has_preholocene` as `has_preholocene`,
        td1.`has_modern` as `has_modern`,
        td1.`is_extinct` as `is_extinct`,
        sne_2.`name_element` AS `name_element`,
        CONCAT_WS(
        	" ",
        	CONCAT(
        		UCASE(
        			SUBSTRING(sne_4.`name_element`, 1, 1)
        		),LOWER(
        			SUBSTRING(sne_4.`name_element`, 2)
        		)
        	),
        	CONCAT(
        		"(",
        		UCASE(
        			SUBSTRING(sne_3.`name_element`, 1, 1)
        		),LOWER(
        			SUBSTRING(sne_3.`name_element`, 2)
        		),
        		")"
        	),
        	sne_2.`name_element`,
            IF(
                sne_1.`name_element` = "animalia" OR sne_2.`name_element` = "animalia" OR sne_3.`name_element` = "animalia" OR
                sne_4.`name_element` = "animalia" OR sne_5.`name_element` = "animalia" OR sne_6.`name_element` = "animalia" OR
                sne_7.`name_element` = "animalia" OR sne_8.`name_element` = "animalia" OR sne_9.`name_element` = "animalia" OR
                sne_10.`name_element` = "animalia",
                "",rank.`marker_displayed`
            )
        ,sne_1.`name_element`)  AS `name`,
        rank.`rank` AS `rank`,
        sns1.`id` AS `name_status`,
        aus.`string` AS `name_suffix`,
        IF (tne_1.`parent_id` IS NULL,CONCAT(UCASE(SUBSTRING(sne_1.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_1.`name_element`, 2))),
            IF (tne_2.`parent_id` IS NULL,CONCAT(UCASE(SUBSTRING(sne_2.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_2.`name_element`, 2))),
            IF (tne_3.`parent_id` IS NULL,CONCAT(UCASE(SUBSTRING(sne_3.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_3.`name_element`, 2))),
            IF (tne_4.`parent_id` IS NULL,CONCAT(UCASE(SUBSTRING(sne_4.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_4.`name_element`, 2))),
            IF (tne_5.`parent_id` IS NULL,CONCAT(UCASE(SUBSTRING(sne_5.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_5.`name_element`, 2))),
            IF (tne_6.`parent_id` IS NULL,CONCAT(UCASE(SUBSTRING(sne_6.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_6.`name_element`, 2))),
            IF (tne_7.`parent_id` IS NULL,CONCAT(UCASE(SUBSTRING(sne_7.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_7.`name_element`, 2))),
            IF (tne_8.`parent_id` IS NULL,CONCAT(UCASE(SUBSTRING(sne_8.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_8.`name_element`, 2))),
            IF (tne_9.`parent_id` IS NULL,CONCAT(UCASE(SUBSTRING(sne_9.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_9.`name_element`, 2))),
            IF (tne_10.`parent_id` IS NULL,CONCAT(UCASE(SUBSTRING(sne_10.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_10.`name_element`, 2))),
            ""
        )))))))))) AS `kingdom`,
        db.`abbreviated_name` AS `source_database_name`,
        db.`id` AS `source_database_id`,
        "" AS accepted_taxon_id

    FROM
        `taxon` AS `t1`

    -- mandatory join on ranks
    RIGHT JOIN `taxonomic_rank` AS `rank` ON
        t1.`taxonomic_rank_id` = rank.`id`

    -- mandatory join on source databases
    RIGHT JOIN `source_database` AS `db` ON
        t1.`source_database_id` = db.`id`

    -- mandatory join on name elements for species epitet
    RIGHT JOIN `taxon_name_element` AS `tne_1` ON
        t1.`id` = tne_1.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_1` ON
        tne_1.`scientific_name_element_id` = sne_1.`id`

    -- mandatory join on name elements for species
    RIGHT JOIN `taxon_name_element` AS `tne_2` ON
        tne_1.`parent_id` = tne_2.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_2` ON
        tne_2.`scientific_name_element_id` = sne_2.`id`

    -- mandatory join on name elements for genus
    RIGHT JOIN `taxon_name_element` AS `tne_3` ON
        tne_2.`parent_id` = tne_3.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_3` ON
        tne_3.`scientific_name_element_id` = sne_3.`id`

      RIGHT JOIN `taxon` AS t3 ON
      tne_3.`taxon_id` = t3.`id`

    -- optional joins on name elements to get group
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

    LEFT JOIN `taxon_name_element` AS `tne_10` ON
        tne_9.`parent_id` = tne_10.`taxon_id`
    LEFT JOIN `scientific_name_element` AS `sne_10` ON
        tne_10.`scientific_name_element_id` = sne_10.`id`

    -- mandatory join on taxon detail for taxon
    RIGHT JOIN `taxon_detail` AS `td1` ON
        t1.`id` = td1.`taxon_id`
    -- mandatory join on scientific name status for taxon detail
    RIGHT JOIN `scientific_name_status` AS `sns1` ON
        td1.`scientific_name_status_id` = sns1.`id`
    LEFT JOIN `author_string` AS `aus` ON
        td1.`author_string_id` = aus.`id`

    -- selecting infraspecies
    WHERE
        t1.`taxonomic_rank_id` NOT IN (54,76,6,72,17,112,20,96,83) AND
		t3.`taxonomic_rank_id` = 96
;

INSERT INTO `_search_all` (`id`, `has_preholocene`, `has_modern`, `is_extinct`, `name_element`, `name`, `rank`, `name_status`, `name_suffix`, `group`, `source_database_name`,`source_database_id`,`accepted_taxon_id`)
-- Filling taxa

    SELECT -- select all genus from infraspecies
        t1.`id` AS `id`,
        td1.`has_preholocene` as `has_preholocene`,
        td1.`has_modern` as `has_modern`,
        td1.`is_extinct` as `is_extinct`,
        sne_3.`name_element` AS `name_element`,
        CONCAT_WS(" ",CONCAT(UCASE(SUBSTRING(sne_3.`name_element`, 1, 1)),LOWER(SUBSTRING(sne_3.`name_element`, 2))),sne_2.`name_element`,
            IF(
                sne_1.`name_element` = "animalia" OR sne_2.`name_element` = "animalia" OR sne_3.`name_element` = "animalia" OR
                sne_4.`name_element` = "animalia" OR sne_5.`name_element` = "animalia" OR sne_6.`name_element` = "animalia" OR
                sne_7.`name_element` = "animalia" OR sne_8.`name_element` = "animalia" OR sne_9.`name_element` = "animalia",
                "",rank.`marker_displayed`
            )
        ,sne_1.`name_element`)  AS `name`,
        rank.`rank` AS `rank`,
        sns1.`id` AS `name_status`,
        aus.`string` AS `name_suffix`,
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
        "" AS accepted_taxon_id

    FROM
        `taxon` AS `t1`

    -- mandatory join on ranks
    RIGHT JOIN `taxonomic_rank` AS `rank` ON
        t1.`taxonomic_rank_id` = rank.`id`

    -- mandatory join on source databases
    RIGHT JOIN `source_database` AS `db` ON
        t1.`source_database_id` = db.`id`

    -- mandatory join on name elements for species epitet
    RIGHT JOIN `taxon_name_element` AS `tne_1` ON
        t1.`id` = tne_1.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_1` ON
        tne_1.`scientific_name_element_id` = sne_1.`id`

    -- mandatory join on name elements for species
    RIGHT JOIN `taxon_name_element` AS `tne_2` ON
        tne_1.`parent_id` = tne_2.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_2` ON
        tne_2.`scientific_name_element_id` = sne_2.`id`

    -- mandatory join on name elements for genus
    RIGHT JOIN `taxon_name_element` AS `tne_3` ON
        tne_2.`parent_id` = tne_3.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_3` ON
        tne_3.`scientific_name_element_id` = sne_3.`id`

        RIGHT JOIN `taxon` AS `t3` ON
        tne_3.`taxon_id` = t3.`id`

    -- optional joins on name elements to get group
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

    -- mandatory join on taxon detail for taxon
    RIGHT JOIN `taxon_detail` AS `td1` ON
        t1.`id` = td1.`taxon_id`
    -- mandatory join on scientific name status for taxon detail
    RIGHT JOIN `scientific_name_status` AS `sns1` ON
        td1.`scientific_name_status_id` = sns1.`id`
    LEFT JOIN `author_string` AS `aus` ON
        td1.`author_string_id` = aus.`id`

    -- selecting only from genus and higher
    WHERE
        t1.`taxonomic_rank_id` NOT IN (54,76,6,72,17,112,20,83) AND
        t3.`taxonomic_rank_id` = 20

;

INSERT INTO `_search_all` (`id`, `has_preholocene`, `has_modern`, `is_extinct`, `name_element`, `name`, `rank`, `name_status`, `name_suffix`, `group`, `source_database_name`,`source_database_id`,`accepted_taxon_id`)
-- Filling taxa

    SELECT -- select all genus from infraspecies with subgenus
        t1.`id` AS `id`,
        td1.`has_preholocene` as `has_preholocene`,
        td1.`has_modern` as `has_modern`,
        td1.`is_extinct` as `is_extinct`,
        sne_3.`name_element` AS `name_element`,
        CONCAT_WS(
        	" ",
        	CONCAT(
        		UCASE(
        			SUBSTRING(sne_4.`name_element`, 1, 1)
        		),LOWER(
        			SUBSTRING(sne_4.`name_element`, 2)
        		)
        	),
        	CONCAT(
        		"(",
        		UCASE(
        			SUBSTRING(sne_3.`name_element`, 1, 1)
        		),LOWER(
        			SUBSTRING(sne_3.`name_element`, 2)
        		),
        		")"
        	),
        	sne_2.`name_element`,
            IF(
                sne_1.`name_element` = "animalia" OR sne_2.`name_element` = "animalia" OR sne_3.`name_element` = "animalia" OR
                sne_4.`name_element` = "animalia" OR sne_5.`name_element` = "animalia" OR sne_6.`name_element` = "animalia" OR
                sne_7.`name_element` = "animalia" OR sne_8.`name_element` = "animalia" OR sne_9.`name_element` = "animalia",
                "",rank.`marker_displayed`
            )
        ,sne_1.`name_element`)  AS `name`,
        rank.`rank` AS `rank`,
        sns1.`id` AS `name_status`,
        aus.`string` AS `name_suffix`,
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
        "" AS accepted_taxon_id

    FROM
        `taxon` AS `t1`

    -- mandatory join on ranks
    RIGHT JOIN `taxonomic_rank` AS `rank` ON
        t1.`taxonomic_rank_id` = rank.`id`

    -- mandatory join on source databases
    RIGHT JOIN `source_database` AS `db` ON
        t1.`source_database_id` = db.`id`

    -- mandatory join on name elements for species epitet
    RIGHT JOIN `taxon_name_element` AS `tne_1` ON
        t1.`id` = tne_1.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_1` ON
        tne_1.`scientific_name_element_id` = sne_1.`id`

    -- mandatory join on name elements for species
    RIGHT JOIN `taxon_name_element` AS `tne_2` ON
        tne_1.`parent_id` = tne_2.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_2` ON
        tne_2.`scientific_name_element_id` = sne_2.`id`

    -- mandatory join on name elements for genus
    RIGHT JOIN `taxon_name_element` AS `tne_3` ON
        tne_2.`parent_id` = tne_3.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_3` ON
        tne_3.`scientific_name_element_id` = sne_3.`id`

        RIGHT JOIN `taxon` AS `t3` ON
        tne_3.`taxon_id` = t3.`id`

    -- optional joins on name elements to get group
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

    -- mandatory join on taxon detail for taxon
    RIGHT JOIN `taxon_detail` AS `td1` ON
        t1.`id` = td1.`taxon_id`
    -- mandatory join on scientific name status for taxon detail
    RIGHT JOIN `scientific_name_status` AS `sns1` ON
        td1.`scientific_name_status_id` = sns1.`id`
    LEFT JOIN `author_string` AS `aus` ON
        td1.`author_string_id` = aus.`id`

    -- selecting only from genus and higher
    WHERE
        t1.`taxonomic_rank_id` NOT IN (54,76,6,72,17,112,20,83) AND
        t3.`taxonomic_rank_id` = 96

;

INSERT INTO `_search_all` (`id`, `has_preholocene`, `has_modern`, `is_extinct`, `name_element`, `name`, `name_suffix`, `rank`, `name_status`, `name_status_suffix`, `name_status_suffix_suffix`, `group`, `source_database_name`,`source_database_id`,`accepted_taxon_id`)
-- Filling synonyms

    SELECT
        s1.`id` AS `id`,
        td1.`has_preholocene` as `has_preholocene`,
        td1.`has_modern` as `has_modern`,
        td1.`is_extinct` as `is_extinct`,
        sysne_1.`name_element` AS `name_element`,
        (
            SELECT
                CONCAT_WS(" ",CONCAT(UCASE(SUBSTRING(sysne_g.`name_element`, 1, 1)),
              LOWER(SUBSTRING(sysne_g.`name_element`, 2))),
              CONCAT("(",UCASE(SUBSTRING(sysne_sg.`name_element`, 1, 1)),
              LOWER(SUBSTRING(sysne_sg.`name_element`, 2)),")"),
              sysne_s.`name_element`,
                IF(
                    sne_1.`name_element` = "animalia" OR sne_2.`name_element` = "animalia" OR  sne_3.`name_element` = "animalia" OR
                    sne_4.`name_element` = "animalia" OR  sne_5.`name_element` = "animalia" OR  sne_6.`name_element` = "animalia" OR
                    sne_7.`name_element` = "animalia" OR  sne_8.`name_element` = "animalia" OR  sne_9.`name_element` = "animalia",
                    "", trank_ss.`marker_displayed`
                )
            ,sysne_ss.`name_element`)
            FROM `synonym` AS `s2`
            RIGHT JOIN `synonym_name_element` AS `sne_g` ON
                s2.`id` = sne_g.`synonym_id` AND
                sne_g.`taxonomic_rank_id` IN (54,76,6,72,17,112,20)
            RIGHT JOIN `scientific_name_element` AS `sysne_g` ON
                sne_g.`scientific_name_element_id` = sysne_g.`id`
            LEFT JOIN `synonym_name_element` AS `sne_s` ON
                s2.`id` = sne_s.`synonym_id` AND
                sne_s.`taxonomic_rank_id` = 83
            LEFT JOIN `scientific_name_element` AS `sysne_s` ON
                sne_s.`scientific_name_element_id` = sysne_s.`id`
            LEFT JOIN `synonym_name_element` AS `sne_sg` ON
                s2.`id` = sne_sg.`synonym_id` AND
                sne_sg.`taxonomic_rank_id` = 96
            LEFT JOIN `scientific_name_element` AS `sysne_sg` ON
                sne_sg.`scientific_name_element_id` = sysne_sg.`id`
            LEFT JOIN `synonym_name_element` AS `sne_ss` ON
                s2.`id` = sne_ss.`synonym_id` AND
                sne_ss.`taxonomic_rank_id` NOT IN (54,76,6,72,17,112,20,83,96)
            LEFT JOIN `scientific_name_element` AS `sysne_ss` ON
                sne_ss.`scientific_name_element_id` = sysne_ss.`id`
            LEFT JOIN `taxonomic_rank` AS `trank_ss` ON
                sne_ss.`taxonomic_rank_id` = trank_ss.`id`
            WHERE
                s2.`id` = s1.`id`
        ) AS `name`,
        aus.`string` AS `name_suffix`,
        (
            SELECT
                IF(sne_ss.`scientific_name_element_id` IS NOT NULL,
                    rank_ss.`rank`,
                    IF(sne_s.`scientific_name_element_id` IS NOT NULL,
                        rank_s.`rank`,
                        IF(sne_s.`scientific_name_element_id` IS NOT NULL,
	                        rank_sg.`rank`,
    	                    rank_g.`rank`
    	                )
                    )
                )
            FROM `synonym` AS `s2`
            RIGHT JOIN `synonym_name_element` AS `sne_g` ON
                s2.`id` = sne_g.`synonym_id` AND
                sne_g.`taxonomic_rank_id` IN (54,76,6,72,17,112,20)
            RIGHT JOIN `taxonomic_rank` AS `rank_g` ON
                sne_g.`taxonomic_rank_id` = rank_g.`id`
            LEFT JOIN `synonym_name_element` AS `sne_s` ON
                s2.`id` = sne_s.`synonym_id` AND
                sne_s.`taxonomic_rank_id` = 83
            LEFT JOIN `taxonomic_rank` AS `rank_s` ON
                sne_s.`taxonomic_rank_id` = rank_s.`id`
            LEFT JOIN `synonym_name_element` AS `sne_sg` ON
                s2.`id` = sne_sg.`synonym_id` AND
                sne_sg.`taxonomic_rank_id` = 96
            LEFT JOIN `taxonomic_rank` AS `rank_sg` ON
                sne_sg.`taxonomic_rank_id` = rank_sg.`id`
            LEFT JOIN `synonym_name_element` AS `sne_ss` ON
                s2.`id` = sne_ss.`synonym_id` AND
                sne_ss.`taxonomic_rank_id` NOT IN (54,76,6,72,17,112,20,83,96)
            LEFT JOIN `taxonomic_rank` AS `rank_ss` ON
                sne_ss.`taxonomic_rank_id` = rank_ss.`id`
            WHERE
                s2.`id` = s1.`id`
        ) AS `rank`,
        sns1.`id` AS `name_status`,
        CONCAT_WS(" ",
          IF(t_3.`taxonomic_rank_id` = 20,
            CONCAT(
              UCASE(SUBSTRING(sne_3.`name_element`, 1, 1)),
              LOWER(SUBSTRING(sne_3.`name_element`, 2))
            ),
            ""
          ),
          IF(t_2.`taxonomic_rank_id` = 20,
            CONCAT(
              UCASE(SUBSTRING(sne_2.`name_element`, 1, 1)),
              LOWER(SUBSTRING(sne_2.`name_element`, 2))
            ),
            sne_2.`name_element`
          ),
            IF(
                    sne_1.`name_element` = "animalia" OR sne_2.`name_element` = "animalia" OR  sne_3.`name_element` = "animalia" OR
                    sne_4.`name_element` = "animalia" OR  sne_5.`name_element` = "animalia" OR  sne_6.`name_element` = "animalia" OR
                    sne_7.`name_element` = "animalia" OR  sne_8.`name_element` = "animalia" OR  sne_9.`name_element` = "animalia",
                "", rank.`marker_displayed`
            ),

          sne_1.`name_element`) AS `name_status_suffix`,
          /*
           *     -- 54  kingdom
                -- 76  phylum
                -- 6   class
                -- 72  order
                -- 17  family
                -- 112 superfamily
                -- 20  genus
                -- 83  species
                -- 19  form
                -- 104 subspecies
                -- 49  infraspecies
                -- 129 variety
    */
        aus_1.`string` AS `name_status_suffix_suffix`,
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
        ))))))))) AS `group`,
        db.`abbreviated_name` AS `source_database_name`,
        db.`id` AS `source_database_id`,
        t_1.`id` AS accepted_taxon_id
    FROM
        `synonym` AS `s1`

    RIGHT JOIN `synonym_name_element` AS `syne_1` ON
        s1.`id` = syne_1.`synonym_id`

    -- mandatory join on scientific name status
    RIGHT JOIN `scientific_name_status` AS `sns1` ON
        s1.`scientific_name_status_id` = sns1.`id`

    -- mandatory join on taxon
    RIGHT JOIN `taxon` AS `t_1` ON
        s1.`taxon_id` = t_1.`id`
    RIGHT JOIN `taxonomic_rank` AS `rank` ON
        t_1.`taxonomic_rank_id` = rank.`id`
    RIGHT JOIN `taxon_name_element` AS `tne_1` ON
        t_1.`id` = tne_1.`taxon_id`
    RIGHT JOIN `scientific_name_element` AS `sne_1` ON
        tne_1.`scientific_name_element_id` = sne_1.`id`

    -- mandatory join on source database
    RIGHT JOIN `source_database` AS `db` ON
        t_1.`source_database_id` = db.`id`

    -- mandatory join on scientific name elements
    RIGHT JOIN `scientific_name_element` AS `sysne_1` ON
        syne_1.`scientific_name_element_id` = sysne_1.`id`

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

    LEFT JOIN `taxon_detail` AS td_1 ON
        t_1.`id` = td_1.`taxon_id`
    LEFT JOIN `author_string` AS aus_1 ON
        td_1.`author_string_id` = aus_1.`id`
    LEFT JOIN `author_string` AS aus ON
        s1.`author_string_id` = aus.`id`

    WHERE s1.`id` IS NOT NULL

;

UPDATE `_search_all` SET

`name_element` = TRIM(`name_element`),
`name` = REPLACE(TRIM(`name`),'  ',' '),
`name_suffix` = TRIM(`name_suffix`),
`rank` = TRIM(`rank`),
`name_status_suffix` = TRIM(`name_status_suffix`),
`name_status_suffix_suffix` = TRIM(`name_status_suffix_suffix`),
`group` = TRIM(`group`),
`source_database_name` = TRIM(`source_database_name`);

ALTER TABLE `_search_all` ENABLE KEYS;
