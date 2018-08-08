#!/bin/bash
# nbt, 25.7.2018

# run queries against various endpoints and get timings

QUERY=$1
RUNS=$2 || 1

QUERY_DIR="../dcub/litprop"
OPTIONS="plain blank mixed"


time_query()
{
  local query=$1
  local endpoint=$2
  if [ ! -f $query ]; then
    echo "$query does not exist"
    exit 1
  fi
  ## does not work due to https://issues.apache.org/jira/browse/JENA-1589
  ##curl --silent -X POST -H "Content-Type: application/sparql-query" --data @$query $endpoint > /dev/null

  # fetches real execution time, see
  # https://serverfault.com/questions/175376/redirect-output-of-time-command-in-unix-into-a-variable-in-bash
  exec 3>&1 4>&2
  time=$(TIMEFORMAT="%R"; { time curl --silent -X POST -H "Content-Type: application/sparql-query" --data-binary @$query $endpoint 1>&3 > /dev/null 2>&4; } 2>&1)
  exec 3>&- 4>&-

  # does not work
  ##local status=$?
  ##if [ $status -ne 0 ]; then
  ##  echo "\nPOST for query file $query failed with status $status"
  ##  exit $status
  ##fi
}

for i in `seq 1 $RUNS`; do

  echo restart fuseki and clear OS caches
  /usr/local/bin/fuseki_service.sh stop &> /dev/null ; sudo bash -c "echo 3 > /proc/sys/vm/drop_caches" ; /usr/local/bin/fuseki_service.sh start &> /dev/null
  sleep 20

  # query an unrelated endpoint to be sure fuseki is ready
  time_query ../stw/search_concepts_by_text.rq http://localhost:3030/stw/query
  sleep 5

  for option in $OPTIONS ; do
    query=$QUERY_DIR/${QUERY}_$option.rq
    endpoint=http://localhost:3030/eb$option/query

    echo -e "\nQuery ${QUERY}_$option  on dataset eb$option (COLD)"
    time_query $query $endpoint
    echo $time
#    (( sum_${option}_cold += "$time" ))

    echo -e "\nQuery ${QUERY}_$option on dataset eb$option (WARM)"
    time_query $query $endpoint
    echo $time

  done

  echo -e "\n"

done

for option in $OPTIONS ; do
  sum=sum_${option}_cold
#  echo $option: ${$sum}
done
