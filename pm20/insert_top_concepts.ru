# Insert top concepts
#
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
#
insert {
  graph ?graph {
    ?scheme skos:hasTopConcept ?s .
    ?s skos:topConceptOf ?scheme .
  }
}
where {
  graph ?graph {
    ?s a skos:Concept ;
       skos:inScheme ?scheme ;
       skos:prefLabel ?prefLabel .
    filter(not exists {
        ?s skos:broader [] .
      })
  }
}
