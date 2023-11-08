WITH cte_students AS (
    SELECT
        "id" AS "students_id"
    FROM 
    airbytedb.students
),

cte_opportunities AS (
    SELECT
        "id" AS "opportunities_id",
        "role_or_designation" AS "opportunities_role_or_designation",
        "number_of_opportunities" AS "opportunities_number_of_opportunities",
        "department_or_team" AS "opportunities_department_or_team",
        "role_description" AS "opportunities_role_description",
        "salary" AS "opportunities_salary",
        "assigned_to" AS "opportunities_assigned_to",
        "employer" AS "opportunities_employer",
        "type" AS "opportunities_type",
        "status" AS "opportunities_status",
        "compensation_type" AS "opportunities_compensation_type",
        "skills_required" AS "opportunities_skills_required",
        "address" AS "opportunities_address",
        "city" AS "opportunities_city",
        "state" AS "opportunities_state",
        "pin_code" AS "opportunities_pin_code",
        "medha_area" AS "opportunities_medha_area",
        "district" AS "opportunities_district",
        "id_in_current_sis" AS "opportunities_id_in_current_sis",
        "created_by_frontend" AS "opportunities_created_by_frontend",
        "updated_by_frontend" AS "opportunities_updated_by_frontend",
        "created_by" AS "opportunities_created_by",
        "updated_by" AS "opportunities_updated_by",
        "created_at" AS "opportunities_created_at",
        "updated_at" AS "opportunities_updated_at"
    FROM 
    airbytedb.opportunities
),

cte_employment_connections AS (
    SELECT
        "id" AS "id",
        "student" AS "student",
        "opportunity" AS "opportunity",
        "status" AS "status",
        "source" AS "source",
        "start_date" AS "start_date",
        "end_date" AS "end_date",
        "reason_if_rejected" AS "reason_if_rejected",
        "salary_offered" AS "salary_offered",
        "id_in_current_sis" AS "id_in_current_sis",
        "created_by_frontend" AS "created_by_frontend",
        "updated_by_frontend" AS "updated_by_frontend",
        "created_by" AS "created_by",
        "updated_by" AS "updated_by",
        "created_at" AS "created_at",
        "updated_at" AS "updated_at",
        "assigned_to" AS "assigned_to",
        "work_engagement" AS "work_engagement",
        "number_of_internship_hours" AS "number_of_internship_hours",
        "reason_if_rejected_other" AS "reason_if_rejected_other",
        'SIS' AS "Source"
    FROM 
    airbytedb.employment_connections
)


SELECT *
FROM cte_employment_connections AS ec
LEFT JOIN cte_students AS s ON ec.student = s.students_id
LEFT JOIN cte_opportunities AS o ON ec.opportunity = o.opportunities_id
order by s.students_id
