## Queries for STW Thesaurus for Economics

Query | Description
------|------------
[search_concepts_by_text](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/stw/search_concepts_by_text.rq) | Search concepts by text
[count_concept_types](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/stw/count_concept_types.rq) | Count STW concept types (descriptor/thsys) 
[count_altlabels](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/stw/count_altlabels.rq) | Count skos:altLabels of STW descriptors 
[count_descriptors_by_category](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/stw/count_descriptors_by_category.rq) | Count the descriptors attached to the subthesauri and the second level thsys branches
[count_subthes_intersect](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/stw/count_subthes_intersect.rq) | Count the descriptors which are part of two subthesauri of STW (e.g., Business Economics (b) and General Economics (v))
[count_categories_per_descriptor](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/stw/count_categories_per_descriptor.rq) | Number of descriptors by number of categories they are attached to

### STW mappings to other vocabularies

Query | Description
------|------------
[count_mappings_by_target](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/stw/count_mappings_by_target.rq) | Count mappings to STW descriptors to other vocabularies by mapping target
[count_mappings_by_relation](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/stw/count_mappings_by_relation.rq) | Count mappings of STW descriptors by SKOS mapping relation
[count_synonyms](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/stw/count_synonyms.rq) | Number of different (lowercased) synonymous terms from STW with optional complementation from exact matching concepts of other vocabularies
[multi_mappings_concepts](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/stw/multi_mappings_concepts.rq) | Select STW concepts with mappings to at least 4 other datasets
[multi_exact_matches](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/stw/multi_exact_matches.rq) | Mapped concepts with multiple exact matching STW concepts

### STW version differences

Queries working on multiple versions of STW are available within the [skos-history](https://github.com/jneubert/skos-history) project ([here](https://github.com/jneubert/skos-history/tree/master/sparql) and [here](https://github.com/jneubert/skos-history/tree/master/sparql/stw))

### STW misc

Query | Description
------|------------
[thsys_tree_d3sparql](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/stw/thsys_tree_d3sparql.rq) | Creates output for the visualization of a STW sub-thesaurus tree with http://biohackathon.org/d3sparql/
[categories_by_descriptors](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/stw/categories_by_descriptors.rq) | Returns for a set of stw descriptors, e.g. from one work, the according economics categories with their frequency
[synonyms](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/stw/synonyms.rq) | List of synonyms for STW concepts (for use in applications)
[synonym_by_gnd_id](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/stw/synonym_by_gnd_id.rq) | List of synonyms for GND concepts (via STWmapping)

