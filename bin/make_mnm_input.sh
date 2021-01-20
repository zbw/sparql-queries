#!/bin/bash
# nbt, 2019-10-28

# create input files for mix-n-match


PART=p0

DIR=../stw

QUERY=$DIR/stw_mnm.rq
OUTPUT=$DIR/results/stw_${PART}_mnm.tsv
if [ -f $OUTPUT ]; then
  echo ERROR: $OUTPUT exists
  exit
fi

/usr/bin/curl --silent -H "Content-type: application/sparql-query" -H "Accept: text/tab-separated-values; charset=utf-8" --data-binary @$QUERY http://zbw.eu/beta/sparql/stw/query  | tail -n +2 | sed 's/^"//' | sed 's/"$//' | sed 's/"\t"/\t/g' > $OUTPUT

echo "see $OUTPUT"


QUERY=$DIR/stw_mnm_synonyms.rq
OUTPUT=$DIR/results/stw_${PART}_mnm_synonyms.tsv
if [ -f $OUTPUT ]; then
  echo ERROR: $OUTPUT exists
  exit
fi

/usr/bin/curl --silent -H "Content-type: application/sparql-query" -H "Accept: text/tab-separated-values; charset=utf-8" --data-binary @$QUERY http://zbw.eu/beta/sparql/stw/query  | tail -n +2 | sed 's/^"//' | sed 's/"$//' | sed 's/"\t"/\t/g' > $OUTPUT

echo "see $OUTPUT"
