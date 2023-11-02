#!/usr/bin/env python3

import duckdb
import timeit
import psutil
import sys




# Thread Count
num_threads = 1

duckdb.sql("PRAGMA threads={}".format(num_threads))

# Create the view
create_query = """CREATE VIEW hits AS
SELECT *
	REPLACE
	(epoch_ms(EventTime * 1000) AS EventTime,
	 DATE '1970-01-01' + INTERVAL (EventDate) DAYS AS EventDate)
FROM read_parquet('hits_multi/hits_*.parquet', binary_as_string=True);
"""

duckdb.sql(create_query)

# Run query

query = """SELECT WindowClientWidth, WindowClientHeight, COUNT(*) AS PageViews FROM hits WHERE CounterID = 62 AND EventDate >= '2013-07-01' AND EventDate <= '2013-07-31' AND IsRefresh = 0 AND DontCountHits = 0 AND URLHash = 2868770270353813622 GROUP BY WindowClientWidth, WindowClientHeight ORDER BY PageViews DESC LIMIT 10 OFFSET 10000;"""

print("Running query...")
start = timeit.default_timer()
result = duckdb.sql(query)
print("Results");

print(result) # have to use the results otherwise query doesn't run
end = timeit.default_timer()
print("Done in: {}".format(end - start))
