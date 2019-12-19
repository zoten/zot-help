# Postgres hints

## Commands


### Configuration
``` sql
-- Live reload postgres.conf modifications
SELECT pg_reload_conf();
```

### Monitoring

``` sql
-- Check running/waiting queries
SELECT
    datname, usename, pid, client_addr, waiting, query_start, now() - query_start as duration, query, state
FROM pg_stat_activity;

-- version 2 (long running queries and pid)
SELECT
  pid,
  now() - pg_stat_activity.query_start AS duration,
  query,
  state
FROM pg_stat_activity
WHERE (now() - pg_stat_activity.query_start) > interval '5 minutes';

-- Simply list active queries
SELECT * FROM pg_stat_activity WHERE state = 'active';

-- kill long running query
SELECT pg_cancel_backend(__pid__);

-- kill stuck process
SELECT pg_terminate_backend(__pid__);

-- Check last autovacuum/autoanalyze on tables in given schema
SELECT
    relname, last_vacuum, last_autovacuum, last_analyze, last_autoanalyze
FROM
    pg_stat_all_tables
WHERE
    schemaname = 'public';

-- Turn off cost based vacuum
ALTER TABLE table_name  
SET (autovacuum_vacuum_scale_factor = 0.0);

ALTER TABLE table_name  
SET (autovacuum_vacuum_threshold = 5000);

ALTER TABLE table_name  
SET (autovacuum_analyze_scale_factor = 0.0);

ALTER TABLE table_name  
SET (autovacuum_vacuum_threshold = 5000);

-- see big tables
SELECT nspname || '.' || relname AS "relation",
    pg_size_pretty(pg_relation_size(C.oid)) AS "size"
  FROM pg_class C
  LEFT JOIN pg_namespace N ON (N.oid = C.relnamespace)
  WHERE nspname NOT IN ('pg_catalog', 'information_schema')
  ORDER BY pg_relation_size(C.oid) DESC
  LIMIT 20;

-- find relation a pg_toast table refers to
select oid::regclass from pg_class where reltoastrelid='pg_toast.pg_toast_2618'::regclass;

-- Count approx rows for each table(via analyze)
SELECT schemaname,relname,n_live_tup 
  FROM pg_stat_user_tables 
  ORDER BY n_live_tup DESC;
```

## General knowledge

### Idle queries
Each row in `pg_stat_activity` represents an established connection to the server from a client. "idle" means the client is not currently executing a query nor in a transaction.

If query_start_date is 2 days old, that just means the last query to be executed on that connection was two days ago.

Not really a reason for worry, unless you have so many connections open that it's consuming more RAM than you can afford. It's generally desirable for a connection pool to have a few idle connections so queries don't suffer the latency of establishing a new connection.
