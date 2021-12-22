#!/bin/sh
# nbt, 6.7.2021

if [ "$#" -ne 2 ]; then
  echo "usage: $0 {dataset} {query}"
  exit 2
fi

DATASET=$1
QUERY=$2

DIR=../$DATASET

# main mnm file
query=$DIR/${QUERY}.rq
output=$DIR/results/${QUERY}.tsv
if [ -f $output ]; then
  echo ERROR: $output exists
  exit
fi
if [ ! -f $query ]; then
  echo ERROR: $query missing
  exit
fi
##cat $query

curl -X POST \
  -H "Content-type: application/sparql-query" \
  -H "Accept: text/tab-separated-values; charset=utf-8" \
  --data-binary @$query \
  https://zbw.eu/beta/sparql/$DATASET/query \
  > $output

echo $output created
