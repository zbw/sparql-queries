# Insert links to WD into vocab (derived from GND or GeoNames)
#
PREFIX gndo: <https://d-nb.info/standards/elementset/gnd#>
PREFIX zbwext: <http://zbw.eu/namespaces/zbw-extensions/>
PREFIX wdt: <http://www.wikidata.org/prop/direct/>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
#
insert {
  graph ?g {
    ?s skos:exactMatch ?wd .
    ?wd skos:exactMatch ?s .
  }
}
where {
  values ( ?prop ?pm20Property ?wdProperty ) {
    ( "gnd" gndo:gndIdentifier wdt:P227 )
    ( "geo" zbwext:geoIdentifier wdt:P1566 )
  }
  graph ?g {
    ?s skos:prefLabel ?sLabelLang .
    filter(lang(?sLabelLang) = 'de')
    bind(str(?sLabelLang) as ?sLabel)
    ?s ?pm20Property ?id .
    bind(strbefore(strafter(str(?g), 'http://zbw.eu/beta/'), 'ng') as ?voc)
  }
  optional {
    graph <http://zbw.eu/beta/wikidata/ng> {
      ?wd ?wdProperty ?id .
      #      ?wd rdfs:label ?wdLabelLang .
      #      filter(lang(?wdLabelLang) = 'de')
      #      bind(str(?wdLabelLang) as ?wdLabel)
    }
  }
  filter(bound(?wd))
  filter(str(?graph) != "http://zbw.eu/beta/pm20ag/ng")

