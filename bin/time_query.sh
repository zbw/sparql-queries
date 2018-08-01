#!/bin/bash
# nbt, 25.7.2018

# run queries against various endpoints and get timings

QUERY=ex1

QUERY_DIR="../dcub/litprop"
OPTIONS="plain blank mixed"

for option in $OPTIONS ; do
  query=$QUERY_DIR/${QUERY}_$option.rq

  # restart fuseki and clear OS caches
  /usr/local/bin/fuseki_service.sh stop &> /dev/null ; sudo bash -c "echo 3 > /proc/sys/vm/drop_caches" ; /usr/local/bin/fuseki_service.sh start &> /dev/null


  echo -e "\nQuery ${QUERY}_$option  on dataset eb$option (COLD)"
  time curl --silent -X POST --data "query=`cat $query`" --output /dev/null http://localhost:3030/eb$option/query

  echo -e "\nQuery ${QUERY}_$option on dataset eb$option (WARM)"
  time curl --silent -X POST --data "query=`cat $query`" --output /dev/null http://localhost:3030/eb$option/query

done

echo -e "\n"
