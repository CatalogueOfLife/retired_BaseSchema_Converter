<?php

$key = '';
$match = 0;
$order = 'name';
$direction = 'asc';

(isset($_REQUEST['key']) ? $key = $_REQUEST['key'] : '');
(isset($_REQUEST['match']) ? $match = $_REQUEST['match'] : '');
(isset($_REQUEST['order']) ? $order = $_REQUEST['order'] : '');
(isset($_REQUEST['direction']) ? $direction = $_REQUEST['direction'] : '');
?>
<form name="thingy" method="post" action="">
<p>Search for: <input type="text" name="key" value="<?php echo $key; ?>" /></p>
<p>Match whole words: <input type="checkbox" name="match" value="1"<?php echo ($match == 1 ? ' checked' : ''); ?> /></p>
<p>Ordering: <select name="order">
    <option value="name"<?php echo ($order == 'name' ? ' selected' : ''); ?>>Name</option>
    <option value="rank"<?php echo ($order == 'rank' ? ' selected' : ''); ?>>Rank</option>
    <option value="scientificName"<?php echo ($order == 'scientificName' ? ' selected' : ''); ?>>Scientificname</option>
    <option value="status"<?php echo ($order == 'status' ? ' selected' : ''); ?>>Status</option>
    <option value="group"<?php echo ($order == 'group' ? ' selected' : ''); ?>>Group</option>
    <option value="db"<?php echo ($order == 'db' ? ' selected' : ''); ?>>Source database</option>
</select></p>
<p>Direction: <select name="direction">
    <option value="asc"<?php echo ($order == 'asc' ? ' selected' : ''); ?>>Ascending</option>
    <option value="desc"<?php echo ($order == 'desc' ? ' selected' : ''); ?>>Descending</option>
</select></p>
<p><input type="submit" value="get Query" /></p>
</form>
<?php
$query = '
SELECT
    `common_name_id`
FROM
    `temp_search_common_name`
';
switch($order)
{
    case 'rank':
        $query .= 'RIGHT JOIN `taxonomic_rank` AS `rank` ON `temp_search_common_name`.`rank_id` = rank.`id`';
        break;
    case 'scientificName':
    case 'status':
        $query .= 'RIGHT JOIN `temp_search_taxon` AS `accepted_name` ON `temp_search_common_name`.`taxon_id` = accepted_name.`taxon_id`';
        break;
    case 'group':
        $query .= 'RIGHT JOIN `temp_search_taxon` AS `kingdom` ON `temp_search_common_name`.`kingdom_taxon_id` = kingdom.`taxon_id`';
        break;
    case 'db':
        $query .= 'RIGHT JOIN `source_database` AS `db` ON `temp_search_common_name`.`source_database_id` = db.`id`';
        break;
    case 'name':
    default:
        break;
}
$query .= ' WHERE ';
switch($match)
{
    case 0:
        $query .= '`temp_search_common_name`.`name` LIKE "%'.$key.'%"';
        break;
    case 1:
    default:
        $query .= '`temp_search_common_name`.`name` = "'.$key.'" OR
            `temp_search_common_name`.`name` LIKE "%&#32;'.$key.'" OR
            `temp_search_common_name`.`name` LIKE "'.$key.'&#32;%" OR
            `temp_search_common_name`.`name` LIKE "%&#32;'.$key.'&#32;%" OR
            `temp_search_common_name`.`name` REGEXP "[[:>:]]'.$key.'[[:<:]]"';
        break;
}

$query .= ' GROUP BY
    `temp_search_common_name`.`name`,
    `temp_search_common_name`.`language_iso`,
    `temp_search_common_name`.`taxon_id`,
    `temp_search_common_name`.`source_database_id`';

$query .= ' ORDER BY ';
switch($order)
{
    case 'rank':
        $query .= 'rank.`rank`,';
        break;
    case 'scientificName':
    case 'status':
        $query .= 'accepted_name.`name`,';
        break;
    case 'group':
        $query .= 'kingdom.`name`,';
        break;
    case 'db':
        $query .= 'db.`abbreviated_name`,';
        break;
}
$query .= '`temp_search_common_name`.`name` ';
switch($direction)
{
    case 'desc':
        $query .= 'DESC';
        break;
    case 'asc':
    default:
        $query .= 'ASC';
        break;
}

echo '<hr /><h3>Count the results</h3><p>SELECT COUNT(1) AS `zend_paginator_row_count` FROM ('.$query.') AS `t`</p><hr />';

echo '<h3>Retrieving the common_name_id\'s</h3><p>'.$query.'</p><hr />';

$query = 'SELECT
    `temp_search_common_name`.`common_name_id`,
    `temp_search_common_name`.`name`,
    `language`.`name`,
    "common name" AS `name_status`,
    `temp_search_taxon`.`name` AS `accepted_scientific_name`,
    `author_string`.`string`,
    kingdom.`name_element`,
    `temp_search_common_name`.`source_database_id`,
    `source_database`.`abbreviated_name`
FROM
    `temp_search_common_name`

LEFT JOIN `language` ON
    `temp_search_common_name`.`language_iso` = `language`.`iso`

LEFT JOIN `temp_search_taxon` ON
    `temp_search_common_name`.`taxon_id` = `temp_search_taxon`.`taxon_id`

LEFT JOIN `author_string` ON
    `temp_search_taxon`.`author_string_id` = `author_string`.`id`

LEFT JOIN `taxon_name_element` ON
    `temp_search_common_name`.`kingdom_taxon_id` = `taxon_name_element`.`taxon_id`

LEFT JOIN `scientific_name_element` AS `kingdom` ON
    `taxon_name_element`.`scientific_name_element_id` = kingdom.`id`

LEFT JOIN `source_database` ON
    `temp_search_common_name`.`source_database_id` = `source_database`.`id`

WHERE `temp_search_common_name`.`common_name_id` IN

('.$query.')';

echo '<h3>Retrieving all the nessescary stuff for the results page</h3><p>'.$query.'</p>';

$query_fill_common_names = 'INSERT INTO `temp_search_common_name`
    (`common_name_id`,`name`,`language_iso`,`rank_id`,`taxon_id`,
    `kingdom_taxon_id`,`source_database_id`)

SELECT
    `common_name`.`id`,
    `common_name_element`.`name`,
    `common_name`.`language_iso`,
    `taxon`.`taxonomic_rank_id`,
    `common_name`.`taxon_id`,
    IF (tne_1.`parent_id` IS NULL,tne_1.`taxon_id`,
        IF (tne_2.`parent_id` IS NULL,tne_2.`taxon_id`,
        IF (tne_3.`parent_id` IS NULL,tne_3.`taxon_id`,
        IF (tne_4.`parent_id` IS NULL,tne_4.`taxon_id`,
        IF (tne_5.`parent_id` IS NULL,tne_5.`taxon_id`,
        IF (tne_6.`parent_id` IS NULL,tne_6.`taxon_id`,
        IF (tne_7.`parent_id` IS NULL,tne_7.`taxon_id`,
        IF (tne_8.`parent_id` IS NULL,tne_8.`taxon_id`,
        IF (tne_9.`parent_id` IS NULL,tne_9.`taxon_id`,
        IF (tne_10.`parent_id` IS NULL,tne_10.`taxon_id`,
        "SOMETHING WENT WRONG SOMEWHERE ;)"
        )))))))))) AS `kingdom_id`,
    `taxon`.`source_database_id`

FROM
    `common_name`

RIGHT JOIN `common_name_element` ON
    `common_name`.`common_name_element_id` = `common_name_element`.`id`
    
RIGHT JOIN `taxon` ON
    `common_name`.`taxon_id` = `taxon`.`id`

RIGHT JOIN `taxon_name_element` AS `tne_1` ON
    `common_name`.`taxon_id` = tne_1.`taxon_id`
    
LEFT JOIN `taxon_name_element` AS `tne_2` ON
    tne_1.`parent_id` = tne_2.`taxon_id`
LEFT JOIN `taxon_name_element` AS `tne_3` ON
    tne_2.`parent_id` = tne_3.`taxon_id`
LEFT JOIN `taxon_name_element` AS `tne_4` ON
    tne_3.`parent_id` = tne_4.`taxon_id`
LEFT JOIN `taxon_name_element` AS `tne_5` ON
    tne_4.`parent_id` = tne_5.`taxon_id`
LEFT JOIN `taxon_name_element` AS `tne_6` ON
    tne_5.`parent_id` = tne_6.`taxon_id`
LEFT JOIN `taxon_name_element` AS `tne_7` ON
    tne_6.`parent_id` = tne_7.`taxon_id`
LEFT JOIN `taxon_name_element` AS `tne_8` ON
    tne_7.`parent_id` = tne_8.`taxon_id`
LEFT JOIN `taxon_name_element` AS `tne_9` ON
    tne_8.`parent_id` = tne_9.`taxon_id`
LEFT JOIN `taxon_name_element` AS `tne_10` ON
    tne_9.`parent_id` = tne_10.`taxon_id`

WHERE `common_name`.`id` IS NOT NULL';

echo '<hr /><h3>Fill the temp_search_common_name with data from the baseschema</h3><p>'.$query_fill_common_names.'</p>';

?>