ALTER TABLE `_taxon_tree` ADD INDEX `parent_id` ( `parent_id` ); 

UPDATE _taxon_tree AS ttt SET total_species = (
    SELECT COUNT(tne.parent_id) FROM taxon_name_element AS tne
    WHERE ttt.taxon_id = tne.parent_id
)
WHERE ttt.rank = 'genus';

UPDATE _taxon_tree SET total_species = getTotalSpeciesFromChildren(taxon_id)
WHERE rank = 'family';

UPDATE _taxon_tree SET total_species = getTotalSpeciesFromChildren(taxon_id)
WHERE rank = 'superfamily';

UPDATE _taxon_tree SET total_species = getTotalSpeciesFromChildren(taxon_id)
WHERE rank = 'order';

UPDATE _taxon_tree SET total_species = getTotalSpeciesFromChildren(taxon_id)
WHERE rank = 'class';

UPDATE _taxon_tree
SET total_species = getTotalSpeciesFromChildren(taxon_id)
WHERE rank = 'phylum';

UPDATE _taxon_tree SET total_species = getTotalSpeciesFromChildren(taxon_id)
WHERE rank = 'kingdom';

DROP FUNCTION IF EXISTS getTotalSpeciesFromChildren;