# Insert Wikidata mapping into the vocabulary graphs and into the default graph
#
PREFIX gn: <http://www.geonames.org/ontology#>
PREFIX schema: <http://schema.org/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX zbwext: <http://zbw.eu/namespaces/zbw-extensions/>
#
insert {
  ?category skos:exactMatch ?wd .
  graph ?g {
    ?category skos:exactMatch ?wd ;
              gn:wikipediaArticle ?page .
  }
}
where {
  graph <http://zbw.eu/beta/wikidata/ng> {
    values ( ?vocab ?g ) {
      ( 'geo' <http://zbw.eu/beta/geo/ng> )
      ( 'ware' <http://zbw.eu/beta/ware/ng> )
      ( 'subject' <http://zbw.eu/beta/subject/ng> )
    }
    ?wd skos:exactMatch ?category .
    optional {
      ?page schema:about ?wd .
    }
    filter(contains(str(?category), concat('/category/', ?vocab)))
  }
}

