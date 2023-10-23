WITH cte_students AS (
    SELECT
        "id" AS "Students_id",
    FROM airbytedb.students
),

cte_opportunities AS (
    SELECT
        "id" AS "Opportunities_id",
        "role_or_designation" AS "Opportunities_role_or_designation",
        "number_of_opportunities" AS "Opportunities_number_of_opportunities",
        "department_or_team" AS "Opportunities_department_or_team",
        "role_description" AS "Opportunities_role_description",
        "salary" AS "Opportunities_salary",
        "assigned_to" AS "Opportunities_assigned_to",
        "employer" AS "Opportunities_employer",
        "type" AS "Opportunities_type",
        "status" AS "Opportunities_status",
        "compensation_type" AS "Opportunities_compensation_type",
        "skills_required" AS "Opportunities_skills_required",
        "address" AS "Opportunities_address",
        "city" AS "Opportunities_city",
        "state" AS "Opportunities_state",
        "pin_code" AS "Opportunities_pin_code",
        "medha_area" AS "Opportunities_medha_area",
        "district" AS "Opportunities_district",
        "id_in_current_sis" AS "Opportunities_id_in_current_sis",
        "created_by_frontend" AS "Opportunities_created_by_frontend",
        "updated_by_frontend" AS "Opportunities_updated_by_frontend",
        "created_by" AS "Opportunities_created_by",
        "updated_by" AS "Opportunities_updated_by",
        "created_at" AS "Opportunities_created_at",
        "updated_at" AS "Opportunities_updated_at"
    FROM airbytedb.opportunities
),

cte_employment_connections AS (
    SELECT
        "id" AS "employment_connections_id",
        "student" AS "employment_connections_student",
        "opportunity" AS "employment_connections_opportunity",
        "status" AS "employment_connections_status",
        "source" AS "employment_connections_source",
        "start_date" AS "employment_connections_start_date",
        "end_date" AS "employment_connections_end_date",
        "reason_if_rejected" AS "employment_connections_reason_if_rejected",
        "salary_offered" AS "employment_connections_salary_offered",
        "id_in_current_sis" AS "employment_connections_id_in_current_sis",
        "created_by_frontend" AS "employment_connections_created_by_frontend",
        "updated_by_frontend" AS "employment_connections_updated_by_frontend",
        "created_by" AS "employment_connections_created_by",
        "updated_by" AS "employment_connections_updated_by",
        "created_at" AS "employment_connections_created_at",
        "updated_at" AS "employment_connections_updated_at",
        "assigned_to" AS "employment_connections_assigned_to",
        "work_engagement" AS "employment_connections_work_engagement",
        "number_of_internship_hours" AS "employment_connections_number_of_internship_hours",
        "reason_if_rejected_other" AS "employment_connections_reason_if_rejected_other"
    FROM airbyte.employment_connections
)


SELECT *
FROM cte_employment_connections AS ec
LEFT JOIN cte_students AS s ON ec.employment_connections_student = s.Students_id
LEFT JOIN cte_opportunities AS o ON ec.employment_connections_opportunity = o.Opportunities_id

