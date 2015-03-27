SPARQL Lab
==============
*A repository of SPARQL queries for ZBW datasets*

The queries in this repository has been tested against the ZBW Labs SPARQL endpoint, running on Fuseki. They can be viewed, edited and executed via the links below. The default endpoint is `http://zbw.eu/beta/sparql/stwv/query`, holding multiple versions of <a href="http://zbw.eu/stw">STW Thesaurus for Econocmis</a>. A different ([CORS](https://en.wikipedia.org/wiki/Cross-origin_resource_sharing) enabled) endpoint can be selected via URI (e.g., `&endpoint=http://data.nobelprize.org/sparql`).


General queries for exploring a SPARQL endpoint
-----------------------------------------------

(Should work with all SPARQL 1.1 compliant services, but particularly the first query may time out for large datasets.)

Query | Description
------|------------
[graph_overview](http://zbw.eu/beta/sparql-lab/?queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/graph_overview.rq) | Count the triples, distinct subjects, distinct classes and distinct properties of the default graph and all named graphs of a SPARQL service
[class_overview](http://zbw.eu/beta/sparql-lab/?queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/class_overview.rq) | Count the occurences of RDF classes (in the default graph graph of a SPARQL service - uncomment graph statement and insert graph name for counting in a named graph)
[property_overview](http://zbw.eu/beta/sparql-lab/?queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/property_overview.rq) | Count the occurences of RDF properties (in the default graph graph of a SPARQL service - uncomment graph statement and insert graph name for counting in a named graph)

Dataset-specific queries
------------------------

### STW Thesaurus for Economics

Query | Description
------|------------
[count_concept_types](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/stw/count_concept_types.rq) | Count STW concept types (descriptor/thsys) 
[count_descriptors_by_category](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/stw/count_descriptors_by_category.rq) | Count the descriptors attached to the subthesauri and the second level thsys branches
[count_subthes_intersect](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/stw/count_subthes_intersect.rq) | Count the descriptors which are part of two subthesauri of STW (e.g., Business Economics (b) and General Economics (v))
[count_categories_per_descriptor](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/stw/count_categories_per_descriptor.rq) | Number of descriptors by number of categories they are attached to

#### STW mappings to other vocabularies

Query | Description
------|------------
[count_mappings_by_target](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/stw/count_mappings_by_target.rq) | Count mappings to STW descriptors to other vocabularies by mapping target
[count_mappings_by_relation](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/stw/count_mappings_by_relation.rq) | Count mappings of STW descriptors by SKOS mapping relation
[multi_mappings_concepts](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/stw/multi_mappings_concepts.rq) | Select STW concepts with mappings to at least 4 other datasets

#### STW version differences

Queries working on multiple versions of STW are available within the [skos-history](https://github.com/jneubert/skos-history) project ([here](https://github.com/jneubert/skos-history/tree/master/sparql) and [here](https://github.com/jneubert/skos-history/tree/master/sparql/stw))

#### STW misc

Query | Description
------|------------
[thsys_tree_d3sparql](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/stw/thsys_tree_d3sparql.rq) | Creates output for the visualization of a STW sub-thesaurus tree with http://biohackathon.org/d3sparql/
[categories_by_descriptors](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/stw/categories_by_descriptors.rq) | Returns for a set of stw descriptors, e.g. from one work, the according economics categories with their frequency

### German Integrated Autority File (GND)

Query | Description
------|------------
[institutions_employing_economists](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/gnd/query&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/gnd/institutions_employing_economists.rq) | Institutions employing economists
[persons_affiliated_to_institutions](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/gnd/query&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/gnd/persons_affiliated_to_institutions.rq) | Persons affiliated to institutions

The runtime environment for the queries is powered by [YASQE](http://yasqe.yasgui.org) and [YASR](http://yasr.yasgui.org); the glue code is  [here](../../../sparql-gui-gh).

Contributing
------------

Contributions to this repository are highly welcome, particularly if they reveal more about the datasets mentioned above. URIs to queries somewhere on GitHub and a short description are all what is needed. A pull request on a amended README.md file would be perfect. Please open an [issue](https://github.com/jneubert/sparql-queries/issues), if something does not work as expected.
