#!/usr/bin/env python3

import os
import sys
import timeit


from datafusion import SessionContext, SessionConfig, RuntimeConfig


# Thread Count
target_partitions = 1

config = SessionConfig().with_target_partitions(target_partitions)
ctx = SessionContext(config, RuntimeConfig())

# Create Table
create_query = "CREATE EXTERNAL TABLE hits STORED AS PARQUET LOCATION 'hits_multi';"
result = ctx.sql(create_query).collect()

print("Running query...")

# Run query
query = """SELECT DATE_TRUNC('minute', to_timestamp_seconds("EventTime")) AS M, COUNT(*) AS PageViews FROM hits WHERE "CounterID" = 62 AND "EventDate"::INT::DATE >= '2013-07-14' AND "EventDate"::INT::DATE <= '2013-07-15' AND "IsRefresh" = 0 AND "DontCountHits" = 0 GROUP BY DATE_TRUNC('minute', to_timestamp_seconds("EventTime")) ORDER BY DATE_TRUNC('minute', M) LIMIT 10 OFFSET 1000;"""

start = timeit.default_timer()
result = ctx.sql(query).collect()
end = timeit.default_timer()
print("Results");
print(result)
print("Done in: {}".format(end - start))
