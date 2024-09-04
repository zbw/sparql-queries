## Queries for STW Thesaurus for Economics

Query | Description
------|------------
[search_concepts_by_text](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/search_concepts_by_text.rq) | Search concepts by text
[descriptor_list](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/descriptor_list.rq) | List of descriptors, with synonyms and broader descriptor ids (can be used for downloading a simplified version of STW - monolingual and w/o categories - as CSV file)
[construct_combined1](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/construct_combined1.rq) | Descriptors, with related and narrower descriptors, and their synonyms, searched via text query (as used for the /combined1 econ-ws service)
[count_concept_types](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/count_concept_types.rq) | Count STW concept types (descriptor/thsys) 
[count_altlabels](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/count_altlabels.rq) | Count skos:altLabels of STW descriptors 
[count_descriptors_by_category](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/count_descriptors_by_category.rq) | Count the descriptors attached to the subthesauri and the second level thsys branches
[count_descriptors_by_thsys](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/count_descriptors_by_thsys.rq) | Number of descriptors by thys (only thsys end nodes)
[count_subthes_intersect](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/count_subthes_intersect.rq) | Count the descriptors which are part of two subthesauri of STW (e.g., Business Economics (b) and General Economics (v))
[count_categories_per_descriptor](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/count_categories_per_descriptor.rq) | Number of descriptors by number of categories they are attached to

### STW mapping to Wikidata

see also [Queries on Wikidata](../wikidata#re-concepts)

Query | Description
------|------------
[stw_wikidata_authorities](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/stw_wikidata_authorities.rq) | All STW descriptors mapped to Wikidata, with selected authorities
[stw_wikidata_wikipedia](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/stw_wikidata_wikipedia.rq) | All STW descriptors mapped to Wikidata, with Wikipedia pages
[wikidata_mapping_candidates_via_gnd](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/wikidata_mapping_candidates_via_gnd.rq) | Get all mapping candidates from wikidata (with labels in German language) to STW, derived from existing GND (P227) properties and the STW-GND mapping, supplemented with Wikipedia site links ([result](http://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/results/wikidata_mapping_candidates_via_gnd.json), [test set](http://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/results/wikidata_mapping_candidates_via_gnd.testset.json))
[wikidata_mapping](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/wikidata_mapping.rq) |  Get all mappings from Wikidata to STW (with labels in German and English)
[inexact_wikidata_mapping](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/inexact_wikidata_mapping.rq) | Get all in-exact mappings from Wikidata to STW (with link for search in Wikidata)
[single_exact_violations](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/single_exact_violations.rq) | Single value constraint violations (multiple exact matches from an item)
[distinct_exact_violations](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/distinct_exact_violations.rq) | Distinct values constraint violations (multiple exact matches to different items)
[multiple_id_values](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/multiple_id_values.rq) | Multiple ID values per item
[same_id_value](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/same_id_value.rq) | Same ID value in different items
[wd_mapping_missing_labels](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/wd_mapping_missing_labels.rq) | Missing label in WD (in a certain language) for items mapped to STW
[stw_mnm](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/stw_mnm.rq) | Create input for Wikidata Mix-n-match for STW descriptors
[stw_mnm_synonyms](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/stw_mnm_synonyms.rq) | Plain list of synonyms by id for Mix-n-match (with language)
[stw_openrefine](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/stw_openrefine.rq) | Create input for Openrefine for STW descriptors
[overlay_wd_hierarchy](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/overlay_wd_hierarchy.rq) | "Overlay" Wikidata with STW skos:brodaer hierarchy
[construct_wd_mapping](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/construct_wd_mapping.rq) | Construct SKOS mapping from Wikidata (plus linked Wikipedia pages)
[indirect_mapping_via_wd](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/indirect_mapping_via_wd.rq) | Indirect mapping from STW to another vocabulary (default: UNESCO thesaurus) via Wikidata, for now restricted to exact matches
[wikidata_item_candidate](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/wikidata_item_candidate.rq) | Possibly missing Wikidata items - extract STW data for creation
[unmapped_to_wd](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/unmapped_to_wd.rq) | List of unmapped descriptors in the sequence of the mix-n-match file

### STW mappings to other vocabularies

Query | Description
------|------------
[count_mappings_by_target](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/count_mappings_by_target.rq) | Count mappings to STW descriptors to other vocabularies by mapping target
[count_mappings_by_relation](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/count_mappings_by_relation.rq) | Count mappings of STW descriptors by SKOS mapping relation
[count_synonyms](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/count_synonyms.rq) | Number of different (lowercased) synonymous terms from STW with optional complementation from exact matching concepts of other vocabularies
[count_mapped_descriptors_by_category](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/count_mapped_descriptors_by_category.rq) | Count the descriptors attached to the subthesauri and the second level thsys branches, and links to a per-category list
[count_mapped_descriptors_by_category_gnd](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/count_mapped_descriptors_by_category_gnd.rq) | Same, parameterized for GND
[mapped_descriptors_for_a_category](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/mapped_descriptors_for_a_category.rq) | Show all descriptors for a certain category, plus the exactly mapped ones in another vocabulary
[multi_mappings_concepts](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/multi_mappings_concepts.rq) | Select STW concepts with mappings to at least 4 other datasets
[multi_exact_matches](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/multi_exact_matches.rq) | Mapped concepts with multiple exact matching STW concepts
[mapping_cardinalities](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/mapping_cardinalities.rq) | Cardinalities of a mapping
[mapping_cardinality_concepts](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/mapping_cardinality_concepts.rq) | Concepts with a certain number of mapping relations to another dataset (default 0)
[wd_dbpedia_mapping](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/wd_dbpedia_mapping.rq) | Create a STW - DBpedia mapping from Wikidata

### STW version differences

Queries working on multiple versions of STW are available within the [skos-history](https://github.com/zbw/skos-history) project ([here](https://github.com/zbw/skos-history/tree/master/sparql) and [here](https://github.com/zbw/skos-history/tree/master/sparql/stw))

### STW misc

Query | Description
------|------------
[thsys_tree_d3sparql](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/thsys_tree_d3sparql.rq) | Creates output for the visualization of a STW sub-thesaurus tree with http://biohackathon.org/d3sparql/
[categories_by_descriptors](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/categories_by_descriptors.rq) | Returns for a set of stw descriptors, e.g. from one work, the according economics categories with their frequency
[synonyms_with_provenance](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/synonyms_with_provenance.rq) | Synonyms of a search term, with provenance information
[synonyms_provenance_id-extension](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/synonyms_provenance_id-extension.rq) | Synonyms of a search term with provenance information and item-id
[synonyms](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/synonyms.rq) | List of synonyms for STW concepts (for use in RePEc/Ideas and maybe other applications)
[synonyms_by_stw_id](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/synonyms_by_stw_id.rq) | List of grouped synonyms for STW concepts (for use in EconBiz)
[synonyms_by_gnd_id](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/synonyms_by_gnd_id.rq) | List of grouped synonyms for GND concepts (via STW mapping, for use in EconBiz)
[deprecated_concepts_replacements](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/deprecated_concepts_replacements.rq)| List deprecated concepts and (optionally) their replacements
