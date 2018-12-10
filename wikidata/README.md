## Queries for Wikidata

Uses the Wikidata SPARQL endpoint at
`https://query.wikidata.org/sparql`.

Query | Description
------|------------
[lookup_by_gnd](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/bigdata/namespace/wdq/sparql&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/lookup_by_gnd.rq) | Lookup wikidata URI by GND id, show label, language-specific wikipedia site link and link to the SQUID browser 
[lookup_by_repec](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/bigdata/namespace/wdq/sparql&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/lookup_by_repec.rq) | Look up the wikidata URI, label and en+de wikipedia site links by RePEc ID
[all_repec](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/bigdata/namespace/wdq/sparql&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/all_repec.rq) | Look up the wikidata URI, label and en wikipedia site links by RePEc ID for all defined mappings
[prominent_economists](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/bigdata/namespace/wdq/sparql&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/prominent_economists.rq) | Internationally prominent economists (with entries in three or more Wikipedias)
[econ_pers_with_wikipedia](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/bigdata/namespace/wdq/sparql&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/econ_pers_with_wikipedia.rq) | Wikipedia pages for EconBiz authors
[count_economists_with_gnd](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/bigdata/namespace/wdq/sparql&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/count_economists_with_gnd.rq) | Count wikidata economists and those having gnd ids
[articles_by](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/bigdata/namespace/wdq/sparql&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/articles_by.rq) | Articles by an author (from newspapers and the like)
[geographic_entities](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/bigdata/namespace/wdq/sparql&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/geographic_entities.rq) | Autosuggest geographic entities
[geographic_entities_codelist](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/bigdata/namespace/wdq/sparql&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/geographic_entities_codelist.rq) | Geographic entities code list (for import into SowiDataNet repository) 
[iso3166_codelist](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/bigdata/namespace/wdq/sparql&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/iso3166_codelist.rq) | ISO 3166-1/2 code list for countries and German states
[missing_property](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/bigdata/namespace/wdq/sparql&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/missing_property.rq) | Prominent economists, as indicated by a certain property, lacking another propery (e.g., RePEc authors without a GND ID) - with links for looking up the names in GND 
[mapping_relation_qualifier_qs](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/bigdata/namespace/wdq/sparql&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/mapping_relation_qualifier_qs.rq) | Generate statements for QuickStatements2 for adding a default mapping relation qualifier to external identifiers
[pm20_economists](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/bigdata/namespace/wdq/sparql&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/pm20_economists.rq) | Show pm20 folders for persons of a certain occupation
[all_subclasses](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/bigdata/namespace/wdq/sparql&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/all_subclasses.rq) | Get all subclasses of a Wikidata class


### "Power queries"

Due to limitations of the public Wikidata endpoint (in particular timeouts,
and the preclusion of the "service" clause for federated queries), the
following queries do not work there and require a "private" endpoint.
Therefore, links to __cached result files__ has been added.

#### re. persons/economists

see also [Economists in Wikidata](http://zbw.eu/labs/economists-in-wikidata-opportunities-of-authority-linking)

Query | Description
------|------------
[count_persons_by_wp_language](http://zbw.eu/beta/sparql-lab/?endpoint=http://172.16.10.102:3030/wikidata/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/count_persons_by_wp_language.rq) | Count wikipedia articles about persons and specifically economists in different languages ([result](http://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/results/count_persons_by_wp_language.wikidata_2016-11-07.json))
[count_ebds_pers](http://zbw.eu/beta/sparql-lab/?endpoint=http://172.16.10.102:3030/wikidata/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/count_ebds_pers.rq) | Statistics about economics-related gnd persons (from a prototype of the econbiz research dataset) and how many of them are in wikidata ([result](http://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/results/count_ebds_pers.wikidata_2016-11-07.ebds_2016-11-18.json))
[count_ebds_pub_pers](http://zbw.eu/beta/sparql-lab/?endpoint=http://172.16.10.102:3030/wikidata/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/count_ebds_pub_pers.rq) | Statistics about how many EBDS persons are missing a GND link in Wikidata and how many enriched publications could be gained by fixing this ([result](http://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/results/count_ebds_pub_pers.wikidata_2016-11-07.ebds_2016-11-18.json))
[count_ebds_pers_by_authority](http://zbw.eu/beta/sparql-lab/?endpoint=http://172.16.10.102:3030/wikidata/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/count_ebds_pers_by_authority.rq) | Count economics-related gnd persons (from a prototype of the econbiz research dataset) by properties used for authority control ([result](http://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/results/count_ebds_pers_by_authority.wikidata_2016-11-07.ebds_2016-11-18.gnd_2016-09.json))
[ebds_persons_by_publication_count](http://zbw.eu/beta/sparql-lab/?endpoint=http://172.16.10.102:3030/wikidata/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/ebds_persons_by_publication_count.rq) | List the most frequent persons in EconBiz (by GND) and links to Wikidata or to a search for all their names in Wikidata ([result](http://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/results/ebds_persons_by_publication_count.wikidata_2016-11-07.ebds_2016-11-18.gnd_2016-09.json))
[search_person_by_gnd_names](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/wikidata/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/search_person_by_gnd_names.rq) | Search a person by all preferred and variant names from gnd (rank by calculated total score) ([result](http://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/results/search_person_by_gnd_names.wikidata_2016-11-07.gnd_2016-09.json))
[count_econ_pers](http://zbw.eu/beta/sparql-lab/?endpoint=http://172.16.10.102:3030/wikidata/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/count_econ_pers.rq) | Statistics about economics-related gnd persons (from econ_pers dataset) and how many of them are in wikidata ([result](http://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/results/count_econ_pers.wikidata_2016-11-07.econ_pers_2015-07.json))
[frequent_econ_pers_occupations](http://zbw.eu/beta/sparql-lab/?endpoint=http://172.16.10.102:3030/wikidata/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/frequent_econ_pers_occupations.rq) | Occupations of economics-related gnd persons (from econ_pers dataset) ([result](http://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/results/frequent_econ_pers_occupations.wikidata_2016-11-07.econ_pers_2015-07.json))
[count_economists_by_authority](http://zbw.eu/beta/sparql-lab/?endpoint=http://172.16.10.102:3030/wikidata/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/count_economists_by_authority.rq) | Count economists by properties used for authority control ([result](http://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/results/count_economists_by_authority.wikidata_2016-11-07.json))
[count_by_authority_for_persons](http://zbw.eu/beta/sparql-lab/?endpoint=http://172.16.10.102:3030/wikidata/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/count_by_authority_for_persons.rq) |Count persons with authority control properties for people ([result](http://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/results/count_by_authority_for_persons.wikidata_2016-11-07.json))

#### re. concepts

see also [STW mapping to Wikidata](../stw#stw-mapping-to-wikidata)

Query | Description
------|------------
[search_concept_by_stw_labels](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/wikidata/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/search_concept_by_stw_labels.rq) | Search a concept by all preferred and alternate labels from stw and other linked concepts (rank by calculated total score)

#### re. PM20

Query | Description
------|------------
[search_corp_by_pm20_names](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql//wikidata/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/search_corp_by_pm20_names.rq) | Search a PM20 company by all preferred and alternate labels (rank by calculated total score)
[search_person_by_pm20_names](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql//wikidata/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/search_person_by_pm20_names.rq) | Search a PM20 person by all preferred and alternate labels (rank by calculated total score)
[missing_pm20_id_via_gnd](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/sparql&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/missing_pm20_id_via_gnd.rq) | Get missing PM20 IDs for WD items with known GND ID
[missing_class_via_pm20](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/sparql&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/missing_class_via_pm20.rq) | Get missing class for WD items from PM20 organizations
[pm20_references](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/sparql&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/pm20_references.rq) | Properties with reference from PM20


### Documentation

see [Wikidata Links](https://github.com/jneubert/doc/wiki/Wikidata-Links)

