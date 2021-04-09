## Queries for 20th Century Press Archives (PM20)

Uses ZBW's `http://zbw.eu/beta/sparql/pm20/query` or the Wikidata SPARQL endpoint at `https://query.wikidata.org/sparql` - check `endpoint=` param. 

Query | Description
------|------------
[dummy](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/dummy.rq) | ([results](http://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/results/dummy.json))
[search_folders_by_text](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/search_folders_by_text.rq) | Search folders by text
[count_folder_type](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/count_folder_type.rq) | Count pm20 ids in total, with docs and with link in WD, by folder type ([results](results/count_folder_type.tsv))
[folder_names_qs](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/folder_names_qs.rq) | Folder names qs input for folders connected to WD items
**Persons** |
[persons](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/persons.rq) | All persons
**Organizations** |
[companies](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/companies.rq) | List companies/organizations with most relevant infos and count of documents and business reports ([results](http://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/results/companies.json))
[companies_with_reports](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/companies_with_reports.rq) | List companies_with_reports/organizations with most relevant infos and count of documents and business reports ([results](http://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/results/companies_with_reports.json))
[companies_unmapped_to_gnd](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/companies_unmapped_to_gnd.rq) | Organizations which are not linked to GND, with search links
[companies_unmapped_to_wd](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/companies_unmapped_to_wd.rq) | Organizations which are not linked to Wikidata, with search links
[companies_missing_in_wikidata](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/companies_missing_in_wikidata.rq) | Extract information for creating missing company items in Wikidata
**Subjects / wares** |
[subject_folders](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/subject_folders.rq) | Full list of subject folders
[count_by_country](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/count_by_country.rq) | Subject and ware folder count by country
[count_by_ware](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/count_by_ware.rq) | Folder count by ware
[count_by_subject](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/count_by_subject.rq) | Folder count by subject
**Colonial affairs** |
[persons_colonial](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/persons_colonial.rq) | Persons active in colonial affairs
[companies_colonial](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/companies_colonial.rq) | Companies active in colonial affairs
[subjects_colonial_german](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/subjects_colonial_german.rq) | Subject folders from former German colonial empire
[wares_colonial_german](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/wares_colonial_german.rq) | Ware folders from former German colonial empire
**Vocabs** |
[ag_for_openrefine](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/ag_for_openrefine.rq) | PM20 country category system prepared for CSV ouput and matching in OpenRefine
[je_for_openrefine](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/je_for_openrefine.rq) | PM20 subject category system prepared for CSV ouput and matching in OpenRefine
[ip_for_openrefine](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/ip_for_openrefine.rq) | PM20 ware category system prepared for CSV ouput and matching in OpenRefine
[geo_by_signature](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/geo_by_signature.rq) | Systematic list of geo categories
[subject_by_signature](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/subject_by_signature.rq) | Systematic list of subject categories
[ware_by_signature](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/ware_by_signature.rq) | Systematic list of ware categories
[voc_wd_mapping](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/voc_wd_mapping.rq) | Mapping of countries category system to WD
[add_category_code](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/add_category_code.rq) | Statements for adding missing category codes to Wikidata
[add_category_doc_counts](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/add_category_doc_counts.rq) | Get aggregated document counts (free and total) for folders connected to WD items by category for adding to Wikidata

### Controlled vocabularies (parameterized queries)

All links are restricted to folders for which online documents are accessible.

#### Person folders

List | Description
-----|------------
[nationality](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/count_value.rq&property=schema:nationality) | Nationality
[activity/about](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/count_value_sub.rq&sub=zbwext:activity&property=schema:about) | Field of activity
[activity/location](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/count_value_sub.rq&sub=zbwext:activity&property=schema:location) | Country of activity

#### Organization folders

List | Description
-----|------------
[type](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/count_value.rq&property=dc:type) | Type of the organization
[industry](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/count_value.rq&property=schema:industry) | Industry / sector
[location](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/count_value.rq&property=schema:location) | Location
[broaderLocation](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/count_value.rq&property=zbwext:broaderLocation) | Broader location
[countryCode](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/count_country_code.rq) | Country code
[member/roleName](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/count_value_sub.rq&sub=schema:member&property=schema:roleName) | Roles of organization members

