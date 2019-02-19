# Insert external ids redundantly into default graph, because
# WD have no access zu named graphs
#
PREFIX gndo: <http://d-nb.info/standards/elementset/gnd#>
PREFIX zbwext: <http://zbw.eu/namespaces/zbw-extensions/>
#
insert {
  ?s gndo:gndIdentifier ?gndId .
  ?s zbwext:geoIdentifier ?geoId .
}
where {
  graph ?g {
    {
      ?s gndo:gndIdentifier ?gndId .
    } union {
      ?s zbwext:geoIdentifier ?geoId .
    }
  }
}
