# Instantiate skos:pref/alt/hiddenLabel as rdfs:label
#
# Introduced because Jena Text requires a seperate property for an additional
# text index of the same content (e.g., fulltext and phrase/keyword).
# Semantically correct because skos labels are rdfs:subPropertyOf rdfs:label.
#
# Include also special zbw subproperties (does not hurt for general use)
#
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX zbwext: <http://zbw.eu/namespaces/zbw-extensions/>
#
insert {
  ?subject rdfs:label ?label
}
WHERE {
  ?subject skos:prefLabel|skos:altLabel|zbwext:altLabelNarrower|zbwext:altLabelRelated|skos:hiddenLabel ?label .
}

