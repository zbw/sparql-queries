#!/bin/sh

cd /opt/sparql-queries/pm20
curl --silent -X POST -H "Accept: application/sparql-results+json" --data "query=`cat count_folder_type.rq`"  https://query.wikidata.org/sparql > results/count_folder_type.json
curl --silent -X POST -H "Accept: text/tab-separated-values" --data "query=`cat count_folder_type.rq`"  https://query.wikidata.org/sparql > results/count_folder_type.tsv

