# DataFusion / DuckDB Benchmarking Scripts

Compare DataFusion and DuckDB with
* [ClickBench](https://benchmark.clickhouse.com) - scripts in [clickbench](clickbench)
* [TPC-H](https://www.tpc.org/tpch/default5.asp) - scripts in [tpch](tpch)
  - require `git clone https://github.com/apache/arrow-datafusion.git`
* [H2O.ai](https://h2oai.github.io/db-benchmark/) - scripts in [h2o](h2o)

## Versions
* DataFusion 47.0.0
* DuckDB 1.3.0

## Results
All results are checked in to [results](results)

The scripts in this repository run queries via python bindings for both DataFusion and DuckDB

## Setting up the Environment

```bash

# Setup Python virtual environment and databases
python3 -m venv venv
source venv/bin/activate
pip install pyarrow pandas matplotlib seaborn prettytable

# install DuckDB
pip install duckdb==1.3.0 psutil

# install DataFusion
pip install datafusion==47.0.0
```

or using [uv](https://docs.astral.sh/uv/)
```bash
brew install uv

# nushell
overley use .venv/bin/activate.nu 

# bash
source .venv/bin/activate
```


**Credits**:
* https://github.com/alamb/datafusion-duckdb-benchmark
* https://github.com/ClickHouse/ClickBench/tree/main/duckdb
* https://github.com/ClickHouse/ClickBench/tree/main/datafusion
