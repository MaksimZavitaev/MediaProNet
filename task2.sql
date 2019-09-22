SELECT
  id1 AS 'FROM',
  id3 AS 'TO'
FROM
  (
    SELECT
      t1.id AS id1,
      t2.id AS id2,
      (
        SELECT
          id
        FROM
          test t3
        WHERE
          t3.id > t1.id
        ORDER BY
          id
        LIMIT
          1
      ) AS id3
    FROM
      test t1
      LEFT JOIN test t2 ON t2.id = t1.id + 1
  ) A
WHERE
  id1 IS NOT NULL
  AND id2 IS NULL
  AND id3 IS NOT NULL