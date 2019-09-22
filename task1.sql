SELECT
  SUM(price) AS sum,
  DATE(create_at) AS date
FROM
  orders AS o
  LEFT JOIN products AS p ON o.id_product = p.id
WHERE
  id_user = (
    SELECT
      id
    FROM
      users
    WHERE
      email = 'user@domain'
  )
GROUP BY
  DATE(create_at)
ORDER BY
  DATE(create_at)