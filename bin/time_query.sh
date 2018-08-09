#!/usr/bin/bash
# nbt, 25.7.2018

# run queries against various endpoints and get timings

QUERY=$1
RUNS=$2 || 1

QUERY_DIR="../dcub/litprop"
OPTIONS="plain blank mixed"

declare -A sum_cold
declare -A sum_warm

cd /opt/sparql-queries/bin

time_query()
{
  local query=$1
  local endpoint=$2
  if [ ! -f $query ]; then
    echo "$query does not exist"
    exit 1
  fi

  # fetches real execution time, see
  # https://serverfault.com/questions/175376/redirect-output-of-time-command-in-unix-into-a-variable-in-bash
  exec 3>&1 4>&2
  time=$(TIMEFORMAT="%R"; { time curl --silent -X POST -H "Content-Type: application/sparql-query" --data-binary @$query $endpoint 1>&3 > /dev/null 2>&4; } 2>&1)
  exec 3>&- 4>&-

  # does not work here
  ##local status=$?
  ##if [ $status -ne 0 ]; then
  ##  echo "\nPOST for query file $query failed with status $status"
  ##  exit $status
  ##fi
}

# initialize result arrays
for option in $OPTIONS ; do
  sum_cold[$option]=0
  sum_warm[$option]=0
done

for i in `seq 1 $RUNS`; do

  echo `date +'%F %T'` Run $i: restart fuseki and clear OS caches
  /usr/local/bin/fuseki_service.sh stop %> /dev/null ; sudo bash -c "echo 3 > /proc/sys/vm/drop_caches" ; /usr/local/bin/fuseki_service.sh start &> /dev/null
  sleep 20

  # query an unrelated endpoint to be sure fuseki is ready
  query='../stw/search_concepts_by_text.rq'
  time_query $query http://localhost:3030/stw/query
  status=$?
  if [ $status -ne 0 ]; then
    echo "\nPOST for query file $query failed with status $status"
    exit $status
  fi
  sleep 2

  for option in $OPTIONS ; do
    query=$QUERY_DIR/${QUERY}_$option.rq
    endpoint=http://localhost:3030/eb$option/query

    echo -e "\nQuery ${QUERY}_$option  on dataset eb$option (COLD)"
    time_query $query $endpoint
    echo $time
    sum_cold[$option]=`echo ${sum_cold[$option]} + $time | bc `

    echo -e "\nQuery ${QUERY}_$option on dataset eb$option (WARM)"
    time_query $query $endpoint
    echo $time
    sum_warm[$option]=`echo ${sum_warm[$option]} + $time | bc`

  done

  echo -e "\n"

done

for option in $OPTIONS ; do
  echo $option: avg cold: `echo ${sum_cold[$option]} / $RUNS | bc -l`, avg warm: `echo ${sum_warm[$option]} / $RUNS | bc -l`
done
