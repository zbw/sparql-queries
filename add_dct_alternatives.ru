# Instantiate skos:altLabel as dct:alternative
#
# Introduced because Jena Text requires a seperate property for an additional
# text index of the same content (e.g., fulltext and phrase/keyword).
# For Wikidata, rdfs:label cannot be used for that purpose, for it is
# already in place for the preferred labels.
#
PREFIX dct: <http://purl.org/dc/terms/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX zbwext: <http://zbw.eu/namespaces/zbw-extensions/>
#
insert {
  ?subject dct:alternative ?label
}
WHERE {
  ?subject skos:altLabel ?label .
}

