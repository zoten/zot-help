# SQL Tricks

## Recursive ordered parent trasversal

Given a simple recursive table (1 parent, root parent = null), give an ordered list of parents

```
WITH RECURSIVE domain_tree(n) AS (
  SELECT *, 1 as lvl
  FROM rec
  WHERE rec.id = 6
  UNION ALL (
    SELECT d.*, lvl+1 as lvl
    FROM rec d
    INNER JOIN
    domain_tree dt ON
    dt.parent = d.id )
   )
SELECT * FROM domain_tree ORDER by lvl DESC;
```

This returns from a table like

```
id | parent 
----+--------
  1 |       
  2 |      1
  3 |      1
  4 |      1
  5 |      2
  6 |      2
```

searching for e.g. id = 6 a result like

```
 n | parent | lvl 
---+--------+-----
 1 |        |   3
 2 |      1 |   2
 6 |      2 |   1
```
