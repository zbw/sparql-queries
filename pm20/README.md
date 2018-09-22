## Queries for PM20 (20th Century Press Archives)

Uses the Wikidata SPARQL endpoint at `https://query.wikidata.org/sparql`. 

Query | Description
------|------------
[dummy](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/dummy.rq) | ([results](http://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/results/dummy.json))
[count_folder_type](http://zbw.eu/beta/sparql-lab/?endpoint=https://query.wikidata.org/sparql&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/count_folder_type.rq) | Count pm20 ids in Wikidata by folder type ([results](results/count_folder_type.tsv))
[folder_doc_counts](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/folder_doc_counts.rq) | Document counts (free and total) for folders connected to WD items

### Controlled vocabularies (paramertized queries)

Query | Description
------|------------
__Person__ |
[count_value](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/count_value.rq&property=schema:nationality) | Nationality (person folders)
[count_value_sub](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/count_value_sub.rq&sub=zbwext:activity&property=schema:about) | Field of activity (person folders)
[count_value_sub](http://zbw.eu/beta/sparql-lab/?endpoint=http://zbw.eu/beta/sparql/pm20/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/pm20/count_value_sub.rq&sub=zbwext:activity&property=schema:location) | Country of activity (person folders)

