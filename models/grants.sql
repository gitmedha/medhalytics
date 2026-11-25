WITH grants_cte AS (
    SELECT
        "id" AS "id",
        "name" AS "name",
        "status" AS "status",
        "start_date" AS "start_date",
        "end_date" AS "end_date",
        "donor" AS "donor",
        "contributon_type" AS "contributon_type",
        "cost_center_in_tally" AS "cost_center_in_tally",
        "created_by" AS "created_by",
        "updated_by" AS "updated_by",
        "created_at" AS "created_at",
        "updated_at" AS "updated_at"
    FROM
        airbytedb.grants
)