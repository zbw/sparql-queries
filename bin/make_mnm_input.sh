#!/bin/bash
# nbt, 2019-10-28

# create input files for mix-n-match


if [ "$#" -ne 2 ]; then
  echo "usage: $0 {dataset} {part}"
  exit 2
fi

DATASET=$1
PART=$2

DIR=../$DATASET

# main mnm file
query=$DIR/${DATASET}_mnm.rq
output=$DIR/results/${DATASET}_${PART}_mnm.tsv
if [ -f $output ]; then
  echo ERROR: $output exists
  exit
fi
if [ ! -f $query ]; then
  echo ERROR: $query missing
  exit
fi

echo "id	name	description" > $output
/usr/bin/curl --silent -H "Content-type: application/sparql-query" -H "Accept: text/tab-separated-values; charset=utf-8" --data-binary @$query http://zbw.eu/beta/sparql/${DATASET}/query  | tail -n +2 | sed 's/^"//' | sed 's/"$//' | sed 's/"\t"/\t/g' |sed 's/\\"/"/g' >> $output

echo "see $output"

# supplemental synonyms file
query=$DIR/${DATASET}_mnm_synonyms.rq
output=$DIR/results/${DATASET}_${PART}_mnm_synonyms.tsv
if [ -f $output ]; then
  echo ERROR: $output exists
  exit
fi
if [ ! -f $query ]; then
  echo ERROR: $query missing
  exit
fi

/usr/bin/curl --silent -H "Content-type: application/sparql-query" -H "Accept: text/tab-separated-values; charset=utf-8" --data-binary @$query http://zbw.eu/beta/sparql/${DATASET}/query  | tail -n +2 | sed 's/^"//' | sed 's/"$//' | sed 's/"\t"/\t/g' > $output

echo "see $output"
