# Insert pm20 application links for concepts where folders exist
#
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX zbwext: <http://zbw.eu/namespaces/zbw-extensions/>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
#
insert {
  graph ?g {
    ?concept rdfs:seeAlso ?appLink .
  }
}
where {
  graph ?g {
    bind('http://webopac.hwwa.de/PresseMappe20/Digiview_MENU.cfm?T=' as ?linksub1)
    values ( ?vocab ?countProperty ?linksub2 )
    {
      ( 'ag' zbwext:jeFolderCount 'S&G=' )
      ( 'je' zbwext:folderCount 'S&S=' )
      ( 'ag' zbwext:ipFolderCount 'W&G=' )
      ( 'ip' zbwext:folderCount 'W&W=' )
    }
    ?concept ?countProperty ?value .
    filter(?value > 0)
    #
    # only if we are in the according graph
    bind(concat('http://zbw.eu/beta/', ?vocab, '/ng') as ?graphName)
    bind(str(?g) as ?graphNameDerived)
    filter(?graphNameDerived = ?graphName)
    #
    # create app link
    bind(strafter(str(?concept), concat('http://zbw.eu/beta/pm20voc/', ?vocab, '/')) as ?id)
    bind(concat('http://zbw.eu/beta/pm20voc/', ?vocab, '/') as ?temp)
    bind(uri(concat(?linksub1, ?linksub2, ?id)) as ?appLink)
  }
}

