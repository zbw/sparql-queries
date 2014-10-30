sparql-queries
==============

The queries in this repository has been tested against the ZBW Labs SPARQL endpoint, running on Fuseki. They can be executed via the links below. The default endpoint is `http://zbw.eu/beta/sparql/stwv/query`, holding multiple versions of <a href="http://zbw.eu/stw">STW Thesaurus for Econocmis</a>. A different endpoint can be selected via URI (e.g., `&endpoint=http://data.nobelprize.org/sparql`).


General queries for exploring a SPARQL endpoint
-----------------------------------------------

(Should work with all SPARQL 1.1 compliant services, but particularly the first query may time out for large datasets.)

Query | Description
------|------------
[graph_overview](http://zbw.eu/beta/sparql-gui/?queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/graph_overview.rq) | Count the triples, distinct subjects, distinct classes and distinct properties of the default graph and all named graphs of a SPARQL service
[class_overview](http://zbw.eu/beta/sparql-gui/?queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/class_overview.rq) | Count the occurences of RDF classes (in the default graph graph of a SPARQL service - uncomment graph statement and insert graph name for counting in a named graph)
[property_overview](http://zbw.eu/beta/sparql-gui/?queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/property_overview.rq) | Count the occurences of RDF properties (in the default graph graph of a SPARQL service - uncomment graph statement and insert graph name for counting in a named graph)

