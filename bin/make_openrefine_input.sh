#!/bin/sh
# nbt, 6.7.2021

if [ "$#" -ne 4 ] ; then
  echo "usage: $0 {dataset} {query} {search-string} {replace-string}"
  exit 2
fi

DATASET=$1
QUERY=$2
SEARCH=$3
REPLACE=$4

DIR=/opt/sparql-queries/$DATASET

# main mnm file
query=$DIR/${QUERY}.rq
output=$DIR/results/${QUERY}_${REPLACE}.tsv
if [ -f $output ]; then
  echo ERROR: $output exists
  exit
fi
if [ ! -f $query ]; then
  echo ERROR: $query missing
  exit
fi
cat $query | sed "s/$SEARCH/$REPLACE/g" > /tmp/tmp_query.rq
##cat $query

curl -X POST \
  -H "Content-type: application/sparql-query" \
  -H "Accept: text/tab-separated-values; charset=utf-8" \
  --data-binary @/tmp/tmp_query.rq \
  https://zbw.eu/beta/sparql/$DATASET/query \
  > $output

echo $output created
