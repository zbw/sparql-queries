# Insert Wikidata mapping into default graph (with ?pm20 as subject)
# TODO extend to non-exact relations
#
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX zbwext: <http://zbw.eu/namespaces/zbw-extensions/>
#
insert {
  ?pm20 skos:exactMatch ?wd .
}
where {
  graph <http://zbw.eu/beta/wikidata/ng> {
    # ?pm20 may be folder or category
    ?wd skos:exactMatch ?pm20 .
    filter(contains(str(?pm20), '/folder/') || contains(str(?pm20), '/category/'))
  }
}
