sparql-queries
==============

The queries in this repository has been tested againt the ZBW Labs SPARQL endpoint. They can be executed via the links below. The default endpoint is http://zbw.eu/beta/sparql/stwv/query. A different endpoint can be selected via URI (e.g., &amp;endpoint=http://dbpedia.org/sparql).


General queries for exploring a SPARQL endpoint
-----------------------------------------------

(should work with all datasets)

Query | Description
[count_per_graph](http://zbw.eu/beta/sparql-gui/?queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/count_per_graph.rq) | Count the triples, distinct subjects, distinct classes and distinct properties of the default graph and all named graphs of a SPARQL service
[count_classes](http://zbw.eu/beta/sparql-gui/?queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/count_classes.rq) | Count the occurences of RDF classes (in the default graph graph of a SPARQL service - uncomment graph statement and insert graph name for counting in a named graph)
[count_properties](http://zbw.eu/beta/sparql-gui/?queryRef=https://api.github.com/repos/jneubert/sparql-queries/contents/count_properties.rq) | Count the occurences of RDF properties (in the default graph graph of a SPARQL service - uncomment graph statement and insert graph name for counting in a named graph)

