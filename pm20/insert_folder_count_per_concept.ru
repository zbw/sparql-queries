# Insert a count of folders per concept
#
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX zbwext: <http://zbw.eu/namespaces/zbw-extensions/>
#
insert {
  graph ?g {
    ?concept ?countProperty ?folderCount ;
      skos:note ?note .
  }
}
where {
  {
    select ?concept (count(distinct ?pm20) as ?folderCount ) ?countProperty ?g
    where {
      values ( ?g ?class ?property ?countProperty ) {
        ( <http://zbw.eu/beta/je/ng> zbwext:SubjectFolder zbwext:subject zbwext:folderCount )
        ( <http://zbw.eu/beta/ag/ng> zbwext:SubjectFolder zbwext:country zbwext:jeFolderCount )
        ( <http://zbw.eu/beta/ip/ng> zbwext:WareFolder zbwext:ware zbwext:folderCount )
        ( <http://zbw.eu/beta/ag/ng> zbwext:WareFolder zbwext:country zbwext:ipFolderCount )
      }
      ?pm20 a ?class ;
            ?property ?concept .
    }
    group by ?concept ?countProperty ?g
  }
  bind(concat(strafter(str(?countProperty), str(zbwext:)), ': ', str(?folderCount)) as ?note)
}
