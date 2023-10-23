
{{
config(
    materialized='table',
        )
    }}

WITH cte_students AS (
    SELECT
        "id" AS "id",
        "student_id" AS "student_id",
        "full_name" AS "full_name",
        "email" AS "email",
        "phone" AS "phone",
        "name_of_parent_or_guardian" AS "name_of_parent_or_guardian",
        "old_sis_id" AS "old_sis_id",
        "date_of_birth" AS "date_of_birth",
        "status" AS "status",
        "category" AS "category",
        "gender" AS "gender",
        "income_level" AS "income_level",
        "medha_champion" AS "medha_champion",
        "interested_in_employment_opportunities" AS "interested_in_employment_opportunities",
        "assigned_to" AS "assigned_to",
        "address" AS "address",
        "city" AS "city",
        "state" AS "state",
        "pin_code" AS "pin_code",
        "medha_area" AS "medha_area",
        "district" AS "district",
        "created_by_frontend" AS "created_by_frontend",
        "updated_by_frontend" AS "updated_by_frontend",
        "created_by" AS "created_by",
        "updated_by" AS "updated_by",
        "created_at" AS "created_at",
        "updated_at" AS "updated_at",
        "alternate_phone" AS "alternate_phone",
        "registered_by" AS "registered_by",
        "how_did_you_hear_about_us" AS "how_did_you_hear_about_us",
        "how_did_you_hear_about_us_other" AS "how_did_you_hear_about_us_other",
        "family_annual_income" AS "family_annual_income"
        FROM
    airbytedb.students
)

SELECT *, 'SIS' AS "Source"
FROM cte_students;




