# MySQL basics

Basic commands and good-to-know

## Docker

Like for postgres, for docker connections you may choose to either

 * expose the socket file (default `/var/lib/mysql/mysql.sock` )
 * connect via TCP

Unlike postgres, it is not enough to specify `--host=localhost` to define it as a TCP connection despite being local, but also the `--protocol=TCP` flag has to be used
The command is then something like

``` bash
mysql -u <user> --host=localhost --port=<port:3306> --protocol=TCP <databasename>
```

## JSON search

### column->>path

Extraction operator, alias for `JSON_UNQUOTE(JSON_EXTRACT())`. Gives out the parsed and casted value (e.g. `"String"` becomes `String`)
Usable in `SELECT` lists, `WHERE` and `HAVING` clauses, `ORDER BY`, `GROUP BY` clauses and others.

``` bash
mysql> CREATE TABLE tj10 (a JSON, b INT);
Query OK, 0 rows affected (0.26 sec)

mysql> INSERT INTO tj10 VALUES
    ->     ('[3,10,5,"x",44]', 33),
    ->     ('[3,10,5,17,[22,"y",66]]', 0);
Query OK, 2 rows affected (0.04 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT a->"$[3]", a->"$[4][1]" FROM tj10;
+-----------+--------------+
| a->"$[3]" | a->"$[4][1]" |
+-----------+--------------+
| "x"       | NULL         |
| 17        | "y"          |
+-----------+--------------+
2 rows in set (0.00 sec)

mysql> SELECT a->>"$[3]", a->>"$[4][1]" FROM tj10;
+------------+---------------+
| a->>"$[3]" | a->>"$[4][1]" |
+------------+---------------+
| x          | NULL          |
| 17         | y             |
+------------+---------------+
2 rows in set (0.00 sec)
```

### -> (JSON_EXTRACT)

``` bash
# Same output
mysql> SELECT c, JSON_EXTRACT(c, "$.id"), g
     > FROM jemp
     > WHERE JSON_EXTRACT(c, "$.id") > 1
     > ORDER BY JSON_EXTRACT(c, "$.name");
+-------------------------------+-----------+------+
| c                             | c->"$.id" | g    |
+-------------------------------+-----------+------+
| {"id": "3", "name": "Barney"} | "3"       |    3 |
| {"id": "4", "name": "Betty"}  | "4"       |    4 |
| {"id": "2", "name": "Wilma"}  | "2"       |    2 |
+-------------------------------+-----------+------+
3 rows in set (0.00 sec)

mysql> SELECT c, c->"$.id", g
     > FROM jemp
     > WHERE c->"$.id" > 1
     > ORDER BY c->"$.name";
+-------------------------------+-----------+------+
| c                             | c->"$.id" | g    |
+-------------------------------+-----------+------+
| {"id": "3", "name": "Barney"} | "3"       |    3 |
| {"id": "4", "name": "Betty"}  | "4"       |    4 |
| {"id": "2", "name": "Wilma"}  | "2"       |    2 |
+-------------------------------+-----------+------+
3 rows in set (0.00 sec)
```

``` bash
# Array notation
mysql > SELECT a->"$[4]" FROM tj10;
      > SELECT * FROM tj10 WHERE a->"$[0]" = 3;
```



### JSON_CONTAINS

```
JSON_CONTAINS(target, candidate[, path])
```

Return 1 or 0 if *target* JSON contains *candidate* JSON, or if path is given if it contains it at given *path*

``` mysql
SET @j = '{"a": 1, "b": 2, "c": {"d": 4}}';
SET @j2 = '1';
SELECT JSON_CONTAINS(@j, @j2, '$.a');
```

Returns `NULL` if any of the arguments is `NULL`

### JSON_CONTAINS_PATH

```
JSON_CONTAINS_PATH(json_doc, one_or_all, path[, path] ...)
```

Like JSON_CONTAINS but taking a list of paths and a discriminator

 * `one` : 1 if at least one path exists
 * `all` : 1 if all paths exist
