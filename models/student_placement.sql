-- CTE for Employment connection - Created by user
WITH users_cte1 AS (
    SELECT
        "id" AS "user_id1",
        "username" AS "Created_by_user"
    FROM 
        airbytedb.users_permissions_user
),

-- CTE for Employment connection - updated by user

users_cte2 AS (
    SELECT
        "id" AS "user_id2",
        "username" AS "updated_by_user"
    FROM 
        airbytedb.users_permissions_user
),

-- CTE for Employment connection - assigned to user 
users_cte3 AS (
    SELECT
        "id" AS "user_id3",
        "username" AS "employer_connection_assigned_to_user"
    FROM 
        airbytedb.users_permissions_user
),

-- CTE for Employment connection - Opportunity assigned to user 

users_cte4 AS (
    SELECT
        "id" AS "user_id4",
        "username" AS "opportunity_assigned_to_user"
    FROM 
        airbytedb.users_permissions_user
),


cte_students AS (
    SELECT
        "id" AS "students_id",
        "student_id" AS "student_sis_id",
        "full_name" AS "student_name"
    FROM 
    airbytedb.students
),




employers_CTE AS (
    SELECT
        "id" AS "emp_id",
        "name" AS "Employer_name",
        "industry" AS "Emp_Industry"
    FROM 
	airbytedb.employers
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

SELECT
    ec."id",
    u4."opportunity_assigned_to_user",
    u3."employer_connection_assigned_to_user",
    u1."Created_by_user",
    u2."updated_by_user",
    s."student_name",
    e."Employer_name" AS "employer_name",
    e."Emp_Industry" AS "employer_industry",
    s."student_sis_id",
    ec."created_by",
    ec."updated_by",
    ec."status",
    ec."source",
    ec."start_date",
    ec."end_date",
    ec."reason_if_rejected",
    ec."salary_offered",
    ec."created_at" AS "employment_created_at",
    ec."updated_at" AS "employment_updated_at",
    ec."assigned_to",
    o."opportunities_assigned_to",
    o."opportunities_employer",
    ec."work_engagement",
    ec."number_of_internship_hours",
    ec."reason_if_rejected_other",
    ec."Source",
    o."opportunities_role_or_designation",
    o."opportunities_number_of_opportunities",
    o."opportunities_department_or_team",
    o."opportunities_role_description",
    o."opportunities_salary",
    o."opportunities_type",
    o."opportunities_status",
    o."opportunities_compensation_type",
    o."opportunities_skills_required",
    o."opportunities_address",
    o."opportunities_city",
    o."opportunities_state",
    o."opportunities_pin_code",
    o."opportunities_medha_area",
    o."opportunities_district",
    o."opportunities_id_in_current_sis",
    o."opportunities_created_by_frontend",
    o."opportunities_updated_by_frontend",
    o."opportunities_created_by",
    o."opportunities_updated_by",
    o."opportunities_created_at" AS "opportunities_created_at",
    o."opportunities_updated_at" AS "opportunities_updated_at"
FROM
    cte_employment_connections AS ec
LEFT JOIN cte_students AS s ON ec."student" = s."students_id"
LEFT JOIN cte_opportunities AS o ON ec."opportunity" = o."opportunities_id"
LEFT JOIN users_cte1 AS u1 ON ec."created_by" = u1."user_id1"
LEFT JOIN users_cte2 AS u2 ON ec."updated_by" = u2."user_id2"
LEFT JOIN users_cte3 AS u3 ON ec."assigned_to" = u3."user_id3"
LEFT JOIN users_cte4 AS u4 ON o."opportunities_assigned_to" = u4."user_id4"
LEFT JOIN employers_CTE AS e ON o."opportunities_employer" = e."emp_id"
ORDER BY ec."id"
