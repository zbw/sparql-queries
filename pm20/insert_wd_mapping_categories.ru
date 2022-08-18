# Insert Wikidata mapping into the vocabulary graphs and into the default graph
#
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX zbwext: <http://zbw.eu/namespaces/zbw-extensions/>
#
insert {
  ?category skos:exactMatch ?wd .
  graph ?g {
    ?category skos:exactMatch ?wd .
  }
}
where {
  graph <http://zbw.eu/beta/wikidata/ng> {
    values ( ?vocab ?graph ) {
      ( 'geo' <http://zbw.eu/beta/geo/ng> )
      ( 'ware' <http://zbw.eu/beta/ware/ng> )
      ( 'subject' <http://zbw.eu/beta/subject/ng> )
    }
    ?wd skos:exactMatch ?category .
    filter(contains(str(?category), concat('/category/', ?vocab)))
  }
}
