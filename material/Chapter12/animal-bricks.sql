\c lego

set schema 'lego';

EXPLAIN VERBOSE -- use VERBOSE to see column projections
SELECT b.piece, b.name
FROM   bricks AS b, categories AS c
WHERE  c.name LIKE '%Animal%'
AND    b.cat = c.cat;
