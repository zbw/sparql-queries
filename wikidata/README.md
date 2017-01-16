## Queries for Wikidata

Uses the Wikidata SPARQL endpoint at
`https://query.wikidata.org/bigdata/namespace/wdq/sparql`. Due to its current
limitations, queries can be sent via GET only.

Query | Description
------|------------
[lookup_by_gnd](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/bigdata/namespace/wdq/sparql&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/lookup_by_gnd.rq) | Lookup wikidata URI by GND id, show label, language-specific wikipedia site link and link to the SQUID browser 
[lookup_by_repec](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/bigdata/namespace/wdq/sparql&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/lookup_by_repec.rq) | Look up the wikidata URI, label and en+de wikipedia site links by RePEc ID
[all_repec](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/bigdata/namespace/wdq/sparql&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/all_repec.rq) | Look up the wikidata URI, label and en wikipedia site links by RePEc ID for all defined mappings
[prominent_economists](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/bigdata/namespace/wdq/sparql&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/prominent_economists.rq) | Internationally prominent economists (with entries in three or more Wikipedias)
[count_economists_with_gnd](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/bigdata/namespace/wdq/sparql&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/count_economists_with_gnd.rq) | Count wikidata economists and those having gnd ids
[geographic_entities](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/bigdata/namespace/wdq/sparql&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/geographic_entities.rq) | Autosuggest geographic entities
[geographic_entities_codelist](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/bigdata/namespace/wdq/sparql&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/geographic_entities_codelist.rq) | Geographic entities code list (for import into SowiDataNet repository) 
[iso3166_codelist](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/bigdata/namespace/wdq/sparql&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/iso3166_codelist.rq) | ISO 3166-1/2 code list for countries and German states
[missing_property](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/bigdata/namespace/wdq/sparql&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/missing_property.rq) | Prominent economists, as indicated by a certain property, lacking another propery (e.g., TED speakers without a GND ID) - with links for looking up the names in GND 


### "Power queries"

Due to limitations of the public Wikidata endpoint (in particular timeouts,
and the preclusion of the "service" clause for federated queries), the
following queries do not work there and require a "private" endpoint.
Therefore, links to __cached result files__ has been added.

Query | Description
------|------------
[count_persons_by_wp_language](http://zbw.eu/beta/sparql-lab/?endpoint=http://172.16.10.102:3030/wikidata/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/count_persons_by_wp_language.rq) | Count wikipedia articles about persons and specifically economists in different languages ([result](http://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/results/count_persons_by_wp_language.wikidata_2016-11-07.json))
[count_ebds_pers](http://zbw.eu/beta/sparql-lab/?endpoint=http://172.16.10.102:3030/wikidata/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/count_ebds_pers.rq) | Statistics about economics-related gnd persons (from a prototype of the econbiz research dataset) and how many of them are in wikidata ([result](http://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/results/count_ebds_pers.wikidata_2016-11-07.ebds_2016-11-18.json))
[count_ebds_pub_pers](http://zbw.eu/beta/sparql-lab/?endpoint=http://172.16.10.102:3030/wikidata/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/count_ebds_pub_pers.rq) | Statistics about how many EBDS persons are missing a GND link in Wikidata and how many enriched publications could be gained by fixing this ([result](http://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/results/count_ebds_pub_pers.wikidata_2016-11-07.ebds_2016-11-18.json))
[count_ebds_pers_by_authority](http://zbw.eu/beta/sparql-lab/?endpoint=http://172.16.10.102:3030/wikidata/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/count_ebds_pers_by_authority.rq) | Count economics-related gnd persons (from a prototype of the econbiz research dataset) by properties used for authority control ([result](http://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/results/count_ebds_pers_by_authority.wikidata_2016-11-07.ebds_2016-11-18.gnd_2016-09.json))
[ebds_persons_by_publication_count](http://zbw.eu/beta/sparql-lab/?endpoint=http://172.16.10.102:3030/wikidata/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/ebds_persons_by_publication_count.rq) | Search a person by all preferred and variant names from gnd (rank by calculated total score) ([result](http://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/results/ebds_persons_by_publication_count.wikidata_2016-11-07.ebds_2016-11-18.gnd_2016-09.json))
[search_person_by_gnd_names](http://zbw.eu/beta/sparql-lab/?endpoint=http://172.16.10.102:3030/wikidata/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/search_person_by_gnd_names.rq) | Search a person by all preferred and variant names from gnd (rank by calculated total score) ([result](http://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/results/search_person_by_gnd_names.wikidata_2016-11-07.json))
[count_econ_pers](http://zbw.eu/beta/sparql-lab/?endpoint=http://172.16.10.102:3030/wikidata/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/count_econ_pers.rq) | Statistics about economics-related gnd persons (from econ_pers dataset) and how many of them are in wikidata ([result](http://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/results/count_econ_pers.wikidata_2016-11-07.econ_pers_2015-07.json))
[frequent_econ_pers_occupations](http://zbw.eu/beta/sparql-lab/?endpoint=http://172.16.10.102:3030/wikidata/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/frequent_econ_pers_occupations.rq) | Occupations of economics-related gnd persons (from econ_pers dataset) ([result](http://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/results/frequent_econ_pers_occupations.wikidata_2016-11-07.econ_pers_2015-07.json))
[count_economists_by_authority](http://zbw.eu/beta/sparql-lab/?endpoint=http://172.16.10.102:3030/wikidata/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/count_economists_by_authority.rq) | Count economists by properties used for authority control ([result](http://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/results/count_economists_by_authority.wikidata_2016-11-07.json))
[count_by_authority_for_persons](http://zbw.eu/beta/sparql-lab/?endpoint=http://172.16.10.102:3030/wikidata/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/count_by_authority_for_persons.rq) |Count persons with authority control properties for people ([result](http://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/wikidata/results/count_by_authority_for_persons.wikidata_2016-11-07.json))



### Documentation

- https://www.mediawiki.org/wiki/Wikibase/Indexing/SPARQL_Query_Examples
- https://www.mediawiki.org/wiki/Wikidata_query_service/User_Manual
- https://www.mediawiki.org/wiki/Wikibase/Indexing/RDF_Dump_Format
- https://www.wikidata.org/wiki/Wikidata:WikiProject_Authority_control
- https://www.wikidata.org/wiki/User:TweetsFactsAndQueries/A_Guide_To_WDQS

### Applications

- https://tools.wmflabs.org/scholia

### Example queries from WD

- [Interesting items near you](https://query.wikidata.org/#%23defaultView%3AMap%0ASELECT%20%3Fitem%20%3FitemLabel%20%3Fcoords%20%3FstatementCount%20WHERE%20%7B%0A%20%20BIND%28wd%3AQ6451%20AS%20%3Flocation%29.%20%23%20WMDE%20office%3B%20insert%20your%20location%20here%21%0A%20%20%3Flocation%20wdt%3AP625%20%3FlocationCoords.%0A%20%20SERVICE%20wikibase%3Aaround%20%7B%0A%20%20%20%20%3Fitem%20wdt%3AP625%20%3Fcoords.%0A%20%20%20%20bd%3AserviceParam%20wikibase%3Acenter%20%3FlocationCoords%3B%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20wikibase%3Aradius%2050.%0A%20%20%7D%0A%20%20MINUS%20%7B%20%3Fitem%20wdt%3AP31%2Fwdt%3AP279%2a%20wd%3AQ1496967.%20%7D%20%23%20territorial%20entities%20%28cities%2C%20%E2%80%A6%29%20are%20boring%0A%20%20%3Fitem%20%5Eschema%3Aabout%3F%2Fwikibase%3Astatements%20%3FstatementCount.%0A%20%20FILTER%28%3FstatementCount%20%3E%3D%2015%29.%0A%20%20SERVICE%20wikibase%3Alabel%20%7B%20bd%3AserviceParam%20wikibase%3Alanguage%20%22en%22%2C%20%22de%22.%20%7D%0A%7D)
