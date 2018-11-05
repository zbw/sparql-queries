# Instantiate skos:pref/alt/hiddenLabel as rdfs:label
#
# Introduced because Jena Text requires a seperate property for an additional
# text index of the same content (e.g., fulltext and phrase/keyword).
# Semantically correct because skos labels are rdfs:subPropertyOf rdfs:label.
#
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX zbwext: <http://zbw.eu/namespaces/zbw-extensions/>
#
insert {
  graph ?g {
    ?subject rdfs:label ?label .
  }
}
WHERE {
  graph ?g {
    ?subject skos:prefLabel|skos:altLabel|skos:hiddenLabel ?label .
  }
}

