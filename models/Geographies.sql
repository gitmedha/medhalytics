WITH geographies_cte AS (
  SELECT
    "id" AS "id",
    "area" AS "area",
    "district" AS "district",
    "state" AS "state",
    "created_by" AS "created_by",
    "updated_by" AS "updated_by",
    "created_at" AS "created_at",
    "updated_at" AS "updated_at",
    "cluster" AS "cluster",
    "tier" AS "tier",
   "city" AS "city"
  FROM
    airbytedb.geographies
  
)
SELECT *
FROM
  geographies_cte
order by id