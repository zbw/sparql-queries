## Queries for the German Integrated Autority File (GND)

Query | Description
------|------------
[search_person](https://zbw.eu/beta/sparql-lab/?endpoint=https://zbw.eu/beta/sparql/gnd/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/gnd/search_person.rq) | Text search for persons, with additional data for identification
[search_corporate_body_pretty](https://zbw.eu/beta/sparql-lab/?endpoint=https://zbw.eu/beta/sparql/gnd/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/gnd/search_corporate_body_pretty.rq) | Search a corporate body by text input (pretty output)
[search_corporate_body](https://zbw.eu/beta/sparql-lab/?endpoint=https://zbw.eu/beta/sparql/gnd/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/gnd/search_corporate_body.rq) | Search a corporate body by text input (debug output)
[search_subject](https://zbw.eu/beta/sparql-lab/?endpoint=https://zbw.eu/beta/sparql/gnd/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/gnd/search_subject.rq) | Text search for subject headings (query uses lots of synonyms)
[count_concepts_by_category](https://zbw.eu/beta/sparql-lab/?endpoint=https://zbw.eu/beta/sparql/gnd/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/gnd/count_concepts_by_category.rq) | Count concepts by GND subject category _(only subject headings - without restriction, this query may time out)_
[count_persons_by_profession](https://zbw.eu/beta/sparql-lab/?endpoint=https://zbw.eu/beta/sparql/gnd/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/gnd/count_persons_by_profession.rq) | Persons by profession or occupation
[count_economists_by_area](https://zbw.eu/beta/sparql-lab/?endpoint=https://zbw.eu/beta/sparql/gnd/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/gnd/count_economists_by_area.rq) | Geographical distribution of economists (in GND)
[all_orcid](https://zbw.eu/beta/sparql-lab/?endpoint=https://zbw.eu/beta/sparql/gnd/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/gnd/all_orcid.rq) | All GND persons linked to ORCID
[institutions_employing_economists](https://zbw.eu/beta/sparql-lab/?endpoint=https://zbw.eu/beta/sparql/gnd/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/gnd/institutions_employing_economists.rq) | Institutions employing economists
[institutions_within_superior](https://zbw.eu/beta/sparql-lab/?endpoint=https://zbw.eu/beta/sparql/gnd/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/gnd/institutions_within_superior.rq) | Economics institutions within superior institutions
[persons_affiliated_to_institutions](https://zbw.eu/beta/sparql-lab/?endpoint=https://zbw.eu/beta/sparql/gnd/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/gnd/persons_affiliated_to_institutions.rq) | Persons affiliated to institutions
[search_n_link_person](https://zbw.eu/beta/sparql-lab/?endpoint=https://zbw.eu/beta/sparql/gnd/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/gnd/search_n_link_person.rq) | Text search for persons, with additional data for identification
[construct_person_info](https://zbw.eu/beta/sparql-lab/?endpoint=https://zbw.eu/beta/sparql/gnd/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/gnd/construct_person_info.rq) | Information about persons
[construct_as_skos](https://zbw.eu/beta/sparql-lab/?endpoint=https://zbw.eu/beta/sparql/gnd/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/gnd/construct_as_skos.rq) | Extract core SWD as skos thesaurus (with dumped down relations)
[construct_gndsc_suppl](https://zbw.eu/beta/sparql-lab/?endpoint=https://zbw.eu/beta/sparql/gnd/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/gnd/construct_gndsc_suppl.rq) | Enhance [GND subject categories](http://d-nb.info/standards/vocab/gnd/gnd-sc#) by notation and explicit class
[old_to_new_id](https://zbw.eu/beta/sparql-lab/?endpoint=https://zbw.eu/beta/sparql/gnd/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/gnd/old_to_new_id.rq) | Map old PND/GKD/SWD/GND IDs to valid GND IDs _(without limit, this query may time out)_

### Queries related to Wikidata

Query | Description
------|------------
[count_wd_by_gnd_class](count_wd_by_gnd_class.rq) (non-exec) | EXPENSIVE - runs for more than 1,5 h! Count Wikidata items linked to GND by GND class ([results](https://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/gnd/results/count_wd_by_gnd_class.gnd_2018-10.json))
[search_pm20_corp](https://zbw.eu/beta/sparql-lab/?endpoint=https://zbw.eu/beta/sparql/gnd/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/gnd/search_pm20_corp.rq) | Text search for organizations from PM20, looking up all available labels, with additional data for identification and link to add a GND ID to an Wikidata item via QuickStatements2 link 
[persons_missing_in_wikidata](https://zbw.eu/beta/sparql-lab/?endpoint=htts://zbw.eu/beta/sparql/gnd/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/gnd/persons_missing_in_wikidata.rq) | Extract information for creating missing person items in Wikidata
[persons_missing_in_wikidata](https://zbw.eu/beta/sparql-lab/?endpoint=https://zbw.eu/beta/sparql/gnd/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/gnd/persons_missing_in_wikidata.rq) | Extract information for creating missing person items in Wikidata


### Queries for building subject specific subsets for persons and corporate bodies

Query | Description
------|------------
[construct_corp_by_affiliated_professions](https://zbw.eu/beta/sparql-lab/?endpoint=https://zbw.eu/beta/sparql/gnd/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/gnd/construct_corp_by_affiliated_professions.rq) | Corporate bodies which employ people with a profession relevant to economics or social sciences
[construct_corp_by_categories](https://zbw.eu/beta/sparql-lab/?endpoint=https://zbw.eu/beta/sparql/gnd/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/gnd/construct_corp_by_categories.rq) | Corporate bodies by GND subject categories classification
[construct_pers_by_categories](https://zbw.eu/beta/sparql-lab/?endpoint=https://zbw.eu/beta/sparql/gnd/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/gnd/construct_pers_by_categories.rq) | Persons by GND subject categories classification
[construct_corp_data](https://zbw.eu/beta/sparql-lab/?endpoint=https://zbw.eu/beta/sparql/gnd/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/gnd/construct_corp_data.rq) | Get all attributes for URIs from econ_corp and get preferred names for this attributes (if these are URIs)

