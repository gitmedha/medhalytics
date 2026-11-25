{{ config(materialized='table') }}

WITH users_permissions_user_cte AS (
    SELECT
        "id" AS "id",
        "username" AS "username",
        "email" AS "email",
        "provider" AS "provider",
        "password" AS "password",
        "resetPasswordToken" AS "resetPasswordToken",
        "confirmationToken" AS "confirmationToken",
        "confirmed" AS "confirmed",
        "blocked" AS "blocked",
        "role" AS "role",
        "reports_to" AS "reports_to",
        "state" AS "state",
        "area" AS "area",
        "department_in_zoho_people" AS "department_in_zoho_people",
        "id_in_current_sis" AS "id_in_current_sis",
        "employee_id_in_zoho_people" AS "employee_id_in_zoho_people",
        "created_by" AS "created_by",
        "updated_by" AS "updated_by",
        "created_at" AS "created_at",
        "updated_at" AS "updated_at",
        "designation" AS "designation",
        "access_department" AS "access_department"
    FROM
        airbytedb."users-permissions_user"
)

SELECT *
FROM users_permissions_user_cte
ORDER BY id
