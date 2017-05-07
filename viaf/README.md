## Queries for VIAF

Uses ZBW's internal VIAF enpoint. Therefore the queries do not execute in SPARQL LAB when triggered from outside. Instead, result files are provided.

Query | Description
------|------------
[missing_gnd_id_for_viaf](http://zbw.eu/beta/sparql-lab/?endpoint=http://172.16.10.102:3030/viaf/query&queryRef=https://api.github.com/repos/zbw/sparql-queries/contents/viaf/missing_gnd_id_for_viaf.rq) | Get GND ids for Wikidata items without GND id, but having VIAF id, making use of VIAF sameAs data ([result](http://zbw.eu/beta/sparql-lab/result?resultRef=https://api.github.com/repos/zbw/sparql-queries/contents/viaf/results/missing_gnd_id_for_viaf.viaf_2017-04-01.json))
