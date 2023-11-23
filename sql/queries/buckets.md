# SQL for clustering in buckets

## Bucket per hour

**Problem**: I want to have the number of things of a certain type that happened divided in bucket of an hour

Let's suppose we have a table `tbl` with fields:
 * `datetime` -> the date field I'm interested bucketing against
 * `field_type` -> a field I want to filter against

### Postgres

``` sql
SELECT to_char(datetime, 'YYYY-MM-DD HH24:00:00') AS hh, COUNT(*) AS count
FROM public.tbl
WHERE field_type = 'the_value'
GROUP BY hh
order by count desc limit 100
```
