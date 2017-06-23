## Queries for STW Thesaurus for Economics

Query | Description
------|------------
[search_concepts_by_text](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/search_concepts_by_text.rq) | Search concepts by text
[construct_combined1](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/construct_combined1.rq) | Descriptors, with related and narrower descriptors, and their synonyms, searched via text query (as used for the /combined1 econ-ws service)
[count_concept_types](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/count_concept_types.rq) | Count STW concept types (descriptor/thsys) 
[count_altlabels](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/count_altlabels.rq) | Count skos:altLabels of STW descriptors 
[count_descriptors_by_category](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/count_descriptors_by_category.rq) | Count the descriptors attached to the subthesauri and the second level thsys branches
[count_subthes_intersect](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/count_subthes_intersect.rq) | Count the descriptors which are part of two subthesauri of STW (e.g., Business Economics (b) and General Economics (v))
[count_categories_per_descriptor](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/count_categories_per_descriptor.rq) | Number of descriptors by number of categories they are attached to

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
[wikidata_mapped](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/wikidata_mapped.rq) | Get all mappings from wikidata (with labels in English language) to STW, supplemented with Wikipedia site links and GND properties, if exist
[wikidata_mapping_candidates_via_gnd](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/wikidata_mapping_candidates_via_gnd.rq) | Get all mapping candidates from wikidata (with labels in German language) to STW, derived from existing GND (P227) properties and the STW-GND mapping, supplemented with Wikipedia site links ([result](http://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/results/wikidata_mapping_candidates_via_gnd.json), [test set](http://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/results/wikidata_mapping_candidates_via_gnd.testset.json))
[stw_wikidata_authorities](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/stw_wikidata_authorities.rq) | All STW descriptors mapped to Wikidata, with selected authorities

### STW version differences

Queries working on multiple versions of STW are available within the [skos-history](https://github.com/zbw/skos-history) project ([here](https://github.com/zbw/skos-history/tree/master/sparql) and [here](https://github.com/zbw/skos-history/tree/master/sparql/stw))

### STW misc

Query | Description
------|------------
[thsys_tree_d3sparql](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/thsys_tree_d3sparql.rq) | Creates output for the visualization of a STW sub-thesaurus tree with http://biohackathon.org/d3sparql/
[categories_by_descriptors](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/categories_by_descriptors.rq) | Returns for a set of stw descriptors, e.g. from one work, the according economics categories with their frequency
[synonyms_with_provenance](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/synonyms_with_provenance.rq) | Synonyms of a search term, with provenance information
[synonyms](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/synonyms.rq) | List of synonyms for STW concepts (for use in RePEc/Ideas and maybe other applications)
[synonyms_by_stw_id](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/synonyms_by_stw_id.rq) | List of grouped synonyms for STW concepts (for use in EconBiz)
[synonyms_by_gnd_id](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/stw/synonyms_by_gnd_id.rq) | List of grouped synonyms for GND concepts (via STW mapping, for use in EconBiz)

