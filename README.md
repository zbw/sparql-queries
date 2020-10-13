SPARQL Lab Queries
==============
*A repository of SPARQL queries for ZBW and related datasets*

The queries in this repository has been tested against the ZBW Labs SPARQL endpoint, running on Fuseki. They can be viewed, edited and executed via the links below. The default endpoint is `http://zbw.eu/beta/sparql/stwv/query`, holding multiple versions of <a href="http://zbw.eu/stw">STW Thesaurus for Econocmis</a>. A different ([CORS](https://en.wikipedia.org/wiki/Cross-origin_resource_sharing) enabled) endpoint can be selected via URI (e.g., `&endpoint=http://semanticweb.cs.vu.nl/dss` about Dutch ships and sailors).


General queries for exploring a SPARQL endpoint
-----------------------------------------------

(Should work with all SPARQL 1.1 compliant services, but particularly the first query may time out for large datasets.)

Query | Description
------|------------
[graph_overview_simple](http://zbw.eu/beta/sparql-lab/?queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/graph_overview_simple.rq) | Count the triples of the default graph and all named graphs of a SPARQL service
[graph_overview_extended](http://zbw.eu/beta/sparql-lab/?queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/graph_overview_extended.rq) | Count the triples, distinct subjects, distinct classes and distinct properties of the default graph and all named graphs of a SPARQL service (may be very slow on large triple stores!)
[class_overview](http://zbw.eu/beta/sparql-lab/?queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/class_overview.rq) | Count the occurences of RDF classes (in the default graph graph of a SPARQL service - uncomment graph statement and insert graph name for counting in a named graph)
[property_overview](http://zbw.eu/beta/sparql-lab/?queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/property_overview.rq) | Count the occurences of RDF properties (in the default graph graph of a SPARQL service - uncomment graph statement and insert graph name for counting in a named graph)
[version_date](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/version_date.rq) | Try to identify the version and/or date of a dataset
[text_search](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/stw/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/text_search.rq) | Search arbitrary subjects by free text and list them with a label


Dataset-specific queries
------------------------

### [STW Thesaurus for Economics](stw)

### [German Integrated Autority File (GND)](gnd)

### [Economists subset of GND](econ_pers)

### [20th Century Press Archives (PM20)](pm20)

### [Wikidata](wikidata)

### [VIAF](viaf)

Contributing
------------

Contributions to this repository are highly welcome, particularly if they reveal more about the datasets mentioned above. URIs to queries somewhere on GitHub and a short description are all what is needed. A pull request on a amended README.md file would be perfect. Please open an [issue](https://github.com/zbw/sparql-queries/issues), if something does not work as expected.
