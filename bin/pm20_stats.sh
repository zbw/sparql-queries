#!/bin/sh

ENDPOINT=http://zbw.eu/beta/sparql/pm20/query
QUERY=count_folder_type.rq

cd /opt/sparql-queries/pm20
curl --silent -X POST -H "Content-type: application/sparql-query" -H "Accept: application/sparql-results+json" --data-binary @$QUERY $ENDPOINT > results/count_folder_type.json
curl --silent -X POST -H "Content-type: application/sparql-query" -H "Accept: text/tab-separated-values" --data-binary @$QUERY $ENDPOINT > results/count_folder_type.tsv

