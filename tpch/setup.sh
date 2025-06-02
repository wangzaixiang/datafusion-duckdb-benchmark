#!/bin/bash
set -e

pwd=$(pwd)
cd ../arrow-datafusion  # require git clone https://github.com/apache/arrow-datafusion.git
# git checkout 31.0.0

# we only use scale factor 10
# scale_factor  size
# 1     250M
# 3     754M
# 10    2.5G
# 30    7.6G
# 100   26G
# 300   78G

scale_factor=10

rm -rf ./benchmarks/data/tpch_dataset

if [ "$scale_factor" == 1 ]; then
    ./benchmarks/bench.sh data tpch
    mv ./benchmarks/data/tpch_sf1 ./benchmarks/data/tpch_dataset
elif [ "$scale_factor" == 10 ]; then
    ./benchmarks/bench.sh data tpch10
    mv ./benchmarks/data/tpch_sf10 ./benchmarks/data/tpch_dataset
else 
    echo "Invalid scale factor: $scale_factor"
    exit 1
fi
