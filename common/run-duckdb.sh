#!/bin/bash

# create file
CREATE=$1
QUERIES=$2
SWEEP_CORES=$3  #  multi, single, available
RESULT_FILE=$4
TRIES=5
QUERY_NUM=1

echo "Using ${CREATE}, appending results to ${RESULT_FILE}"

# clean out old database
rm -f *.duckdb*

cat ${CREATE} | ../common/create-view-duckdb.py

function drop_cache(){
  if [ `uname` = "Darwin" ]; then
    sudo purge
  else
     echo 3 | sudo tee /proc/sys/vm/drop_caches >/dev/null
  fi
}

cat ${QUERIES} | while read query; do
    sync
    drop_cache
    # echo 3 | sudo tee /proc/sys/vm/drop_caches >/dev/null
    sync

    echo "qnum: $QUERY_NUM"
    ../common/run-query-duckdb.py $QUERY_NUM $SWEEP_CORES ${RESULT_FILE} <<< "${query}" | tee /tmp/duckdb.log

    QUERY_NUM=$((QUERY_NUM + 1))
done
