SET SESSION sql_mode = '';

UPDATE _taxon_tree
SET total_species = number_of_children
WHERE rank = 'genus';

UPDATE _taxon_tree
SET total_species = getTotalSpeciesFromChildren(taxon_id)
WHERE rank = 'family';

UPDATE _taxon_tree
SET total_species = getTotalSpeciesFromChildren(taxon_id)
WHERE rank = 'superfamily';

UPDATE _taxon_tree
SET total_species = getTotalSpeciesFromChildren(taxon_id)
WHERE rank = 'order';

UPDATE _taxon_tree
SET total_species = getTotalSpeciesFromChildren(taxon_id)
WHERE rank = 'class';

UPDATE _taxon_tree
SET total_species = getTotalSpeciesFromChildren(taxon_id)
WHERE rank = 'phylum';

UPDATE _taxon_tree
SET total_species = getTotalSpeciesFromChildren(taxon_id)
WHERE rank = 'kingdom';

DROP FUNCTION IF EXISTS getTotalSpeciesFromChildren;