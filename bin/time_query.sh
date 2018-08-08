#!/bin/bash
# nbt, 25.7.2018

# run queries against various endpoints and get timings

QUERY=$1
RUNS=$2 || 1

QUERY_DIR="../dcub/litprop"
OPTIONS="plain blank mixed"

for i in `seq 1 $RUNS`; do

  echo restart fuseki and clear OS caches
  /usr/local/bin/fuseki_service.sh stop &> /dev/null ; sudo bash -c "echo 3 > /proc/sys/vm/drop_caches" ; /usr/local/bin/fuseki_service.sh start &> /dev/null
  sleep 20

  # query an unrelated endpoint to be sure fuseki is ready
  curl --silent -X POST --data "query=`cat ../stw/search_concepts_by_text.rq`" --output /dev/null http://localhost:3030/stw/query
  sleep 5

  for option in $OPTIONS ; do
    query=$QUERY_DIR/${QUERY}_$option.rq
    endpoint=http://localhost:3030/eb$option/query

    echo -e "\nQuery ${QUERY}_$option  on dataset eb$option (COLD)"
    /usr/bin/time  -f "%e" curl --silent -X POST --data "query=`cat $query`" --output /dev/null $endpoint 

    echo -e "\nQuery ${QUERY}_$option on dataset eb$option (WARM)"
    /usr/bin/time -f "%e" curl -X POST --silent --data "query=`cat $query`" --output /dev/null $endpoint

  done

  echo -e "\n"

done
