## Queries for Wikidata

Uses the Wikidata SPARQL endpoint at `https://query.wikidata.org/bigdata/namespace/wdq/sparql`. Due to its current limitations, queries can be sent via GET only.

Query | Description
------|------------
[lookup_by_gnd](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/bigdata/namespace/wdq/sparql&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/wikidata/lookup_by_gnd.rq) | Lookup wikidata URI by GND id, show label, language-specific wikipedia site link and link to the SQUID browser 
[lookup_by_repec](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/bigdata/namespace/wdq/sparql&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/wikidata/lookup_by_repec.rq) | Look up the wikidata URI, label and en+de wikipedia site links by RePEc ID
[all_repec](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/bigdata/namespace/wdq/sparql&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/wikidata/all_repec.rq) | Look up the wikidata URI, label and en wikipedia site links by RePEc ID for all defined mappings
[geographic_entities](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/bigdata/namespace/wdq/sparql&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/wikidata/geographic_entities.rq) | Autosuggest geographic entities
[geographic_entities_codelist](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/bigdata/namespace/wdq/sparql&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/wikidata/geographic_entities_codelist.rq) | Geographic entities code list (for import into SowiDataNet repository) 
[iso3166_codelist](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/bigdata/namespace/wdq/sparql&queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/wikidata/iso3166_codelist.rq) | ISO 3166-1/2 code list for countries and German states

### Documentation

- https://www.mediawiki.org/wiki/Wikibase/Indexing/SPARQL_Query_Examples
- https://www.mediawiki.org/wiki/Wikibase/Indexing/RDF_Dump_Format
- https://www.wikidata.org/wiki/Wikidata:WikiProject_Authority_control
- https://www.wikidata.org/wiki/User:TweetsFactsAndQueries/A_Guide_To_WDQS

### Applications

- https://tools.wmflabs.org/scholia

