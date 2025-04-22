-- Single parquet file

CREATE VIEW customer AS
SELECT * FROM read_parquet('./data/customer.parquet');

CREATE VIEW orders AS
SELECT * FROM read_parquet('./data/orders.parquet');

CREATE VIEW lineitem AS
SELECT * FROM read_parquet('./data/lineitem.parquet');

CREATE VIEW part AS
SELECT * FROM read_parquet('./data/part.parquet');

CREATE VIEW partsupp AS
SELECT * FROM read_parquet('./data/partsupp.parquet');

CREATE VIEW region AS
SELECT * FROM read_parquet('./data/region.parquet');

CREATE VIEW supplier AS
SELECT * FROM read_parquet('./data/supplier.parquet');

CREATE VIEW nation AS
SELECT * FROM read_parquet('./data/nation.parquet');
