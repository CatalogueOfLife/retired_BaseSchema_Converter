<?php
include 'settings.php';
include 'classes/class.database.php';
include 'classes/class.table.php';

set_time_limit (120);

echo 'begin<br />';
flush();

//Connect to databases
$input_database = new database(INPUT_DB_NAME, INPUT_DB_USERNAME, INPUT_DB_PASSWORD, INPUT_DB_ADRES);
$output_database = new database(OUTPUT_DB_NAME, OUTPUT_DB_USERNAME, OUTPUT_DB_PASSWORD, OUTPUT_DB_ADRES);


$databases = new table($output_database, 'source_databases');
$resources = new table($output_database, 'resources');
$specialists = new table($output_database, 'specialists');
//$specialist_colums = $specialists->getColums();

//Getting Databases
$databases_input = $input_database->getMultipleSelectQuery('
    SELECT
        `record_id` AS \'id\',
        `database_full_name` AS \'name\',
        `database_name` AS \'abbreviated_name\',
        `organization` AS \'organisation\',
        `contact_person` AS \'contact_person\',
        `version` AS \'version\',
        `release_date` AS \'release_date\',
        `abstract` AS \'abstract\',
        `web_site` AS \'url\'
    FROM
        `databases`
');
//Add specialist in propper colums
$resources_to_source_databases = '';
foreach($databases_input as $key => $value)
{
    $websites = explode('#',$value['web_site']);
    foreach($websites as $website)
    {
        if($website != '')
        {
            $resources_to_source_databases[$value['id']] = $website;
            $resources->addContent(array('url', $website));
        }
    }
    unset($value['url']);
    $databases->addContent($value);
}
//Write Databases
$output_database->setSingleQuery($databases->getInsertQuery());
$output_database->setSingleQuery($resources->getInsertQuery());

$resources_input = $input_database->getMultipleSelectQuery('
    SELECT
        `id` AS \'id\',
        `url` AS \'url\'
    FROM
        `resources`
');
foreach($resources_input as $value)
{
    var_dump($value);
    echo '<br />';
}

//Getting Specialists
$specialists_input = $input_database->getMultipleSelectQuery('
    SELECT
        CAST(`record_id` AS SIGNED) AS \'id\',
        `specialist_name` AS \'name\',
        `database_id` AS \'database_id\'
    FROM
        `specialists`
');
//Add specialist in propper colums
foreach($specialists_input as $value)
{
    $specialists->addContent($value);
}
echo $specialists->countContent();
//Write Specialists
$output_database->setSingleQuery($specialists->getInsertQuery());
exit();

/*
//Fetching name_elements
$names = $input_database->getMultipleSelectQuery('
    SELECT
        `name`
    FROM
        `taxa`
');
foreach ($names as $name)
{
    $temp = explode(' ',$name['name']);
    if (isset($temp[2]))
    {
        $taxanomic_rank[] = $temp[2];
        unset($temp[2]);
    }
    foreach ($temp as $name_element)
    {
        $name_elements[] = $name_element;
    }
}
echo count($taxanomic_rank) . '<br />';
flush();
$unique_taxanomic_rank = array_unique($taxanomic_rank);
echo count($unique_taxanomic_rank) . '<br />';
flush();
var_dump($unique_taxanomic_rank);
exit();
echo '.';
flush();
$unique_name_elements = array_unique($name_elements);
echo '.';
flush();

$insert = '
    INSERT INTO
        `scientific_name_elements`
    (
        `name`
    )
    VALUES';
echo '<br />number of unique name elements: ' . count($unique_name_elements) . '<br />';
$first = true;
$limit =   100000;
$current = 0;
$query = '';
foreach ($unique_name_elements as $unique_name_element)
{
    if($current >= $limit)
    {
        $output_database->setSingleQuery($insert.$query);
        $counter = $output_database->getSingleSelectQuery('SELECT COUNT(`id`) AS "count" FROM `scientific_name_elements`');
        $query = '';
        $first = true;
        $current = 0;
        echo '100k rows inserted..., currently holding ' . $counter['count'] . ' records.<br />';
        flush();
    }
    $current ++;
    if ($first == true)
    {
        $first = false;
    }
    else
    {
        $query .= ',';
    }
    $query .= '
    (
        "' . mysql_real_escape_string($unique_name_element) . '"
    )';
}

$output_database->setSingleQuery($insert.$query);
$counter = $output_database->getSingleSelectQuery('SELECT COUNT(`id`) AS "count" FROM `scientific_name_elements`');
echo 'last rows inserted..., currently holding ' . $counter['count'] . ' records.<br />';
//$output_database->setDebug(true);

            exit('<br />done');
*/


//Fetching databases vs source_database
$databases = $input_database->getMultipleSelectQuery('
    SELECT
        `record_id`
            AS "id",
        `database_full_name`
            AS "name",
        `database_name`
            AS "abbreviated_name",
        `organization`
            AS "organisation",
        `contact_person`
            AS "contact_person",
        `version`
            AS "version",
        `release_date`
            AS "release_date",
        `abstract`
            AS "abstract",
        `web_site`
            AS "urls",
        `database_name_displayed`
            AS "database_name_displayed",
        `taxa`
            AS "taxa",
        `taxonomic_coverage`
            AS "taxonomic_coverage",
        `SpeciesCount`
            AS "SpeciesCount",
        `authors_editors`
            AS "authors_editors",
        `accepted_species_names`
            AS "accepted_species_names",
        `species_synonyms`
            AS "species_synonyms",
        `infraspecies_synonyms`
            AS "infraspecies_synonyms",
        `common_names`
            AS "common_name",
        `total_names`
            AS "total_names"
    FROM
        `databases`
');

//Processing Databases
foreach ($databases as $row => $database)
{
    $databases[$row]['url'] = explode(';',$database['urls']);
    foreach ($databases[$row]['url'] as $url)
    {
        if ($url != '')
        {
            $urls[] = $url;
        }
    }
}

//Filling new Databases
$query = '
    INSERT INTO
        `source_databases`
    (
        `id`,
        `name`,
        `abbreviated_name`,
        `organisation`,
        `contact_person`,
        `version`,
        `release_date`,
        `abstract`
    )
    VALUES';
$first = true;
foreach ($databases as $database)
{
    if ($first == true)
    {
        $first = false;
    }
    else
    {
        $query .= ',';
    }
    $query .= '
    (
        ' . mysql_real_escape_string($database['id']) . ',
        "' . mysql_real_escape_string($database['name']) . '",
        "' . mysql_real_escape_string($database['abbreviated_name']) . '",
        "' . mysql_real_escape_string($database['organisation']) . '",
        "' . mysql_real_escape_string($database['contact_person']) . '",
        "' . mysql_real_escape_string($database['version']) . '",
        "' . mysql_real_escape_string($database['release_date']) . '",
        "' . mysql_real_escape_string($database['abstract']) . '"
    )';
}
$output_database->setSingleQuery($query);
$query = '
    INSERT INTO
        `resources`
    (
        `url`
    )
    VALUES';
$first = true;
foreach (array_unique($urls) as $url)
{
    if ($first == true)
    {
        $first = false;
    }
    else
    {
        $query .= ',';
    }
    $query .= '
    (
        "' . mysql_real_escape_string($url) . '"
    )';
}
$output_database->setSingleQuery($query);

$resources = $output_database->getMultipleSelectQuery('
    SELECT
        `id`,
        `url`
    FROM
        `resources`
');
foreach ($resources as $key => $value)
{
    $temp[$value['id']] = $value['url'];
}
$resources = $temp;

$query = '
    INSERT INTO
        `web_links_to_source_databases`
    (
        `source_database_id`,
        `resource_id`
    )
    VALUES';
$first = true;
foreach ($databases as $database)
{
    foreach ($database['url'] as $url)
    {
        $resource_id = array_search($url,$resources);
        if ($resource_id != '')
        {
            if ($first == true)
            {
                $first = false;
            }
            else
            {
                $query .= ',';
            }
            $query .= '
            (
                ' . mysql_real_escape_string($database['id']) . ',
                ' . mysql_real_escape_string($resource_id) . '
            )';
        }
    }
}
$output_database->setSingleQuery($query);


/*
 **Easy transferable Colums
 * record_id = id
 * database_full_name = name
 * database_name = abbreviated_name
 * organization = organisation
 * contact_person = contact_person
 * version = version
 * release_date = release_date
 * abstract = abstract

 **Harder transferable Colums
 * explode(web_site) = resources.url && resources.url = web_links_to_source_databases.resource_id && source_databases.id = source_database_id

 **Untransfered Colums
 * SpeciesEst = not used

 **Customisted Colums
 * database_name_displayed = database_name_displayed
 * taxa = taxa
 * taxonomic_coverage = taxonomic_coverage
 * SpeciesCount = SpeciesCount
 * authors_editors = authors_editors
 * accepted_species_names = accepted_species_names
 * species_synonyms = species_synonyms
 * infraspecies_synonyms = infraspecies_synonyms
 * common_names = common_name 
 * total_names = total_names
 */

//Fetching references vs references
$references = $input_database->getMultipleSelectQuery('
    SELECT
        `record_id`,
        `author`,
        `year`,
        `title`,
        `source`,
        `database_id`
    FROM
        `references`
');

echo '<br />number of references: ' . count($references) . '<br />';
$first = true;
$limit =   100000;
$current = 0;
$query = '';
$insert = '
    INSERT INTO
        `references`
    (
        `id`,
        `authors`,
        `year`,
        `title`,
        `details`,
        `database_id`
    )
    VALUES';
foreach ($references as $reference)
{
    if($current >= $limit)
    {
        $output_database->setSingleQuery($insert.$query);
        $counter = $output_database->getSingleSelectQuery('SELECT COUNT(`id`) AS "count" FROM `references`');
        $query = '';
        $first = true;
        $current = 0;
        echo $limit . ' rows inserted..., currently holding ' . $counter['count'] . ' records.<br />';
        flush();
    }
    $current ++;
    if ($first == true)
    {
        $first = false;
    }
    else
    {
        $query .= ',';
    }
    $query .= '
    (
        ' . $reference['record_id'] . ',
        "' . mysql_real_escape_string($reference['author']) . '",
        "' . mysql_real_escape_string($reference['year']) . '",
        "' . ($reference['title'] == '' ? 'NULL' : mysql_real_escape_string($reference['title'])) . '",
        "' . mysql_real_escape_string($reference['details']) . '",
        ' . ($reference['database_id'] == '' ? 'NULL' : $reference['database_id']) . '
    )';
}
//$output_database->setDebug(true);
$output_database->setSingleQuery($insert.$query);
//$output_database->setDebug(false);
$counter = $output_database->getSingleSelectQuery('SELECT COUNT(`id`) AS "count" FROM `references`');
echo 'last rows inserted..., currently holding ' . $counter['count'] . ' records.<br />';

/*
 **Easy transferable Colums
 * record_id = id
 * author = authors
 * year = year

 **Harder transferable Colums
 * source = resources.link_text > resources.id = references.resource_id

 **Suggestions
 * title = Could be stored at details to prefent dataloss, but it's not the same.
 * database_id = suggestion to make a relation with source_databases
 */

//Fetching specialist
$specialists = $input_database->getMultipleSelectQuery('
    SELECT
        `record_id`,
        `specialist_name`,
        `database_id`
    FROM
        `specialists`
');
$query = '
    INSERT INTO
        `specialists`
    (
        `id`,
        `name`,
        `database_id`
    )
    VALUES';
$first = true;
foreach ($specialists as $specialist)
{
    if ($first == true)
    {
        $first = false;
    }
    else
    {
        $query .= ',';
    }
    $query .= '
    (
        ' . $specialist['record_id'] . ',
        "' . mysql_real_escape_string($specialist['specialist_name']) . '",
        ' . ($specialist['database_id'] == '' ? 'NULL' : $specialist['database_id']) . '
    )';
}
$output_database->setSingleQuery($query);
/*
 **Easy transferable Colums
 * record_id = id
 * specialist_name = name
 * database_id = database_id
 */

//Fetching taxa vs taxa WHERE taxa.is_acceptedname = 1
/*
 **Easy transferable Colums
 * record_id = id
 * lsid = lsid
 * parent_id = parent_id
 * datbase_id = source_database_id

 **Harder transferable Colums
 * name = scientific_name_elements.name > scientific_name_elements.id = taxa.scientific_name_id
 * taxon = taxonimic_ranks.rank > taxonimic_ranks.id = taxa.taxonomic_rank_id
 * sp2000_status_id = name_statuses.name_statues > name_statuses.id = taxa.name_status_id

 **Untransfered Colums
 * name_with_italics
 * name_code
 * is_accepted_name
 * is_species_or_nonsynonymic_higher_taxon
 */

//Fetching name_elements
/*
$names = $input_database->getMultipleSelectQuery('
    SELECT
        `name`
    FROM
        `taxa`
');
foreach ($names as $name)
{
    foreach (explode(' ',$name) as $name_element)
    $name_elements[] = $name_element;
}
$unique_name_elements = array_unique($name_elements);
var_dump($unique_name_elements);

$query = '
    INSERT INTO
        `scientific_name_elements`
    (
        `name`
    )
    VALUES';
$first = true;
foreach ($unique_name_elements as $unique_name_element)
{
    if ($first == true)
    {
        $first = false;
    }
    else
    {
        $query .= ',';
    }
    $query .= '
    (
        "' . mysql_real_escape_string($unique_name_element) . '"
    )';
}
$output_database->setSingleQuery($query);
*/

//Fetching scientific_names vs taxa WHERE scientific_names.name_code = taxa.name_code && is_accepted_name = 1
/*
 **Easy transferable Colums
 * web_site = url
 * scrutiny_date = latest_taxonomic_scrutiny
 * specialist_id = specialist_id

 **Harder transferable Colums
 * author = authorities.authority > authorities.id = taxa.authority_id

 **Untransfered Colums
 * record_id
 * name_code
 * genus
 * species
 * infraspecies
 * infraspecies_marker
 * accepted_name_code
 * comment
 * sp2000_status_id
 * database_id
 * family_id
 * is_accepted_name
 */

//Fetching taxa vs synonym_details WHERE taxa.is_acceptedname = 0
/*
 **Easy transferable Colums
 * record_id = id
 * lsid = lsid

 **Harder transferable Colums
 * explode(name) = 
 * taxon = taxonimic_ranks.rank > taxonimic_ranks.id = synonyms.taxonomic_rank_id > synonyms.synonym_details_id = synonym_details.id
 * sp2000_status_id = name_statuses.name_statues > name_statuses.id = synonym_details.name_status_id

 **Untransfered Colums
 * parent_id = parent_id
 * name_with_italics
 * name_code
 * is_accepted_name
 * is_species_or_nonsynonymic_higher_taxon
 */

//Fetching scientific_names vs synonym_details WHERE scientific_names.name_code = taxa.name_code && is_accepted_name = 0
/*
 **Harder transferable Colums
 * author = authorities.authority > authorities.id = taxa.authority_id

 **Untransfered Colums
 * record_id
 * name_code
 * specialist_id
 * scrutiny_date
 * web_site
 * genus
 * species
 * infraspecies
 * infraspecies_marker
 * accepted_name_code
 * comment
 * sp2000_status_id
 * database_id
 * family_id
 * is_accepted_name
 */

//Fetching common_names vs common_names
/*
 **Easy transferable Colums
 * record_id = id
 * reference_id = classification_id
 * common_name = common_name

 **Harder transferable Colums
 * language = languages.language > languages.iso = language_iso || false
 * country = countries.country > countries.iso = country_iso || false

 **Untransfered Colums
 * name_code = not used
 * is_infraspecies = not used

 * Suggestions
 * database_id = suggestion for a relation with source_databases
 */

//Fetching distribution vs distribution
/*
$distributions = $input_database->getMultipleSelectQuery('
    SELECT
        `record_id`,
        `name_code`,
        `distribution`
    FROM
        `distribution`
');
$query = '
    INSERT INTO
        `distributions`
    (
        `id`,
        `taxon_id`,
        `region_code`,
        `distribution_status`,
        `locality`
    )
    VALUES';
$first = true;
foreach ($distributions as $distribution)
{
    if ($first == true)
    {
        $first = false;
    }
    else
    {
        $query .= ',';
    }
    $query .= '
    (
        ' . $distribution['record_id'] . ',
        ' . $taxonId //Needs to be implemented!!// . '
        NULL,
        NULL,
        "' . $distribution['distribution'] . '",
    )';
}
$output_database->setSingleQuery($query);
*/
/*
 **Easy transferable Colums
 * record_id = id
 * distribution = locality

 **Untransfered Colums
 * name_code
 */

//Tables that are standard filled
//countries
//languages
//name_statuses
//taxonomic_ranks

//Output database col2009ac
//Input database 4D4Life

//Retrieve information

//Write to other database