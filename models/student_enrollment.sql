-- Define CTE for students
WITH cte_students AS (
    SELECT
        "id" AS "student_id",
        "student_id" AS "student_SIS_id",
		'SIS' AS "Source"
    FROM 
    airbytedb.students
),

-- Define the users_cte CTE
users_cte AS (
    SELECT
        "id" AS "user_id",
        "username" AS "institution_assigned_to_user"
    FROM 
        airbytedb.users_permissions_user
),

-- Define the users_cte CTE
users1_cte AS (
    SELECT
        "id" AS "user_id1",
        "username" AS "program_updated_by_user"
    FROM 
        airbytedb.users_permissions_user
),

-- Define the users_cte CTE
users2_cte AS (
    SELECT
        "id" AS "user_id2",
        "username" AS "program_created_by_user"
    FROM 
        airbytedb.users_permissions_user
),




-- CTE for the 'program_enrollments' table
cte_program_enrollments AS (
    SELECT
        "id" AS "id",
        "student" AS "student",
        "batch" AS "batch",
        "institution" AS "institution",
        "status" AS "status",
        "registration_date" AS "registration_date",
        "fee_status" AS "fee_status",
        "fee_payment_date" AS "fee_payment_date",
        "fee_amount" AS "fee_amount",
        "fee_transaction_id" AS "fee_transaction_id",
        "fee_refund_status" AS "fee_refund_status",
        "fee_refund_date" AS "fee_refund_date",
        "course_type" AS "course_type",
        "course_level" AS "course_level",
        "course_year" AS "course_year",
        "year_of_course_completion" AS "year_of_course_completion",
        "certification_date" AS "certification_date",
        "course_name_in_current_sis" AS "course_name",
        "created_by_frontend" AS "created_by_frontend",
        "updated_by_frontend" AS "updated_by_frontend",
        "created_by" AS "created_by",
        "updated_by" AS "updated_by",
        "created_at" AS "created_at",
        "updated_at" AS "updated_at",
        "program_selected_by_student" AS "program_name",
        "discount_code_id" AS "discount_code_id",
        "medha_program_certificate_status" AS "medha_program_certificate_status",
        "higher_education_course_name" AS "higher_education_course_name",
        "higher_education_year_of_course_completion" AS "higher_education_year_of_course_completion",
        "course_name_other" AS "course_name_other"
    FROM 
    airbytedb.program_enrollments
),



-- CTE for the 'batches' table
batches_cte AS (
    SELECT
        "id" AS "batches_id",
        "name" AS "batches_name",
        "start_date" AS "batches_start_date",
        "end_date" AS "batches_end_date",
        "assigned_to" AS "batches_assigned_to",
        "status" AS "batches_status",
        "certificates_generated_at" AS "batches_certificates_generated_at",
        "certificates_emailed_at" AS "batches_certificates_emailed_at",
        "number_of_sessions_planned" AS "batches_number_of_sessions_planned",
        "program" AS "batches_program",
        "per_student_fees" AS "batches_per_student_fees",
        "mode_of_payment" AS "batches_mode_of_payment",
        "seats_available" AS "batches_seats_available",
        "state" AS "batches_state",
        "grant" AS "batches_grant",
        "medha_area" AS "batches_medha_area",
        "enrollment_type" AS "batches_enrollment_type",
        "id_in_current_sis" AS "batches_id_in_current_sis",
        "created_by_frontend" AS "batches_created_by_frontend",
        "updated_by_frontend" AS "batches_updated_by_frontend",
        "created_by" AS "batches_created_by",
        "updated_by" AS "batches_updated_by",
        "created_at" AS "batches_created_at",
        "updated_at" AS "batches_updated_at",
        "require_assignment_file_for_certification" AS "batches_require_assignment_file_for_certification",
        "link_sent_at" AS "batches_link_sent_at"
    FROM 
    airbytedb.batches
),

-- CTE for the 'institutions' table
institutions_cte AS (
     SELECT
        "id" AS "institutions_id",
        "name" AS "institutions_name",
        "assigned_to" AS "institutions_assigned_to",
        "website" AS "institutions_website",
        "phone" AS "institutions_phone",
        "email" AS "institutions_email",
        "type" AS "institutions_type",
        "status" AS "institutions_status",
        "address" AS "institutions_address",
        "city" AS "institutions_city",
        "state" AS "institutions_state",
        "pin_code" AS "institutions_pin_code",
        "medha_area" AS "institutions_medha_area",
        "district" AS "institutions_district",
        "created_at" AS "institutions_created_at",
        "updated_at" AS "institutions_updated_at"
    FROM 
    airbytedb.institutions
),

-- CTE for the 'grants' table
grants_cte AS (
    SELECT
        "id" AS "grants_id",
        "name" AS "grants_name",
		"status" AS "grants_status",
		"start_date" AS "grants_start_date",
        "end_date" AS "grants_end_date",
		"donor" AS "grants_Donor",
		"contributon_type" AS "grants_contributon_type"        
    FROM 
    airbytedb.grants
),

-- CTE for the 'programs' table
programs_cte AS (
    SELECT
        "id" AS "programs_id",
        "name" AS "programs_name",
        "status" AS "programs_status", 
		"program_type" AS "programs_program_type",
		"start_date" AS "programs_start_date",
		"end_date" AS "programs_end_date", 
		"created_by" AS "programs_created_by",
		"updated_by" AS "programs_updated_by", 
		"created_at" AS "programs_created_at", 
		"updated_at" AS "programs_updated_at",
		"certificate" AS "programs_certificate"
		
    FROM 
	airbytedb.programs
)

-- Main query combining the CTEs
-- Main query combining the CTEs
SELECT
    cte_program_enrollments."id",
    cte_program_enrollments."status",
    cte_program_enrollments."registration_date",
    cte_program_enrollments."fee_status",
    cte_program_enrollments."fee_payment_date",
    cte_program_enrollments."fee_amount",
    cte_program_enrollments."fee_transaction_id",
    cte_program_enrollments."fee_refund_status",
    cte_program_enrollments."fee_refund_date",
    cte_program_enrollments."course_type",
    cte_program_enrollments."course_level",
    cte_program_enrollments."course_year",
    cte_program_enrollments."year_of_course_completion",
    cte_program_enrollments."certification_date",
    cte_program_enrollments."course_name",
    cte_program_enrollments."created_by_frontend",
    cte_program_enrollments."updated_by_frontend",
    cte_program_enrollments."created_by",
    cte_program_enrollments."updated_by",
    cte_program_enrollments."created_at",
    cte_program_enrollments."updated_at",
    cte_program_enrollments."discount_code_id",
    cte_program_enrollments."medha_program_certificate_status",
    cte_program_enrollments."higher_education_course_name",
    cte_program_enrollments."higher_education_year_of_course_completion",
    cte_program_enrollments."course_name_other",
    cte_students."student_SIS_id",
    cte_students."Source",
    batches_cte."batches_name",
    batches_cte."batches_start_date",
    batches_cte."batches_end_date",
    batches_cte."batches_assigned_to",
    batches_cte."batches_status",
    batches_cte."batches_certificates_generated_at",
    batches_cte."batches_certificates_emailed_at",
    batches_cte."batches_number_of_sessions_planned",
    batches_cte."batches_program",
    batches_cte."batches_per_student_fees",
    batches_cte."batches_mode_of_payment",
    batches_cte."batches_seats_available",
    batches_cte."batches_state",
    batches_cte."batches_medha_area",
    batches_cte."batches_enrollment_type",
    batches_cte."batches_created_by_frontend",
    batches_cte."batches_updated_by_frontend",
    batches_cte."batches_created_by",
    batches_cte."batches_updated_by",
    batches_cte."batches_created_at",
    batches_cte."batches_updated_at",
    batches_cte."batches_require_assignment_file_for_certification",
    batches_cte."batches_link_sent_at",
    institutions_cte."institutions_name",
    u1."institution_assigned_to_user",
    institutions_cte."institutions_website",
    institutions_cte."institutions_phone",
    institutions_cte."institutions_email",
    institutions_cte."institutions_type",
    institutions_cte."institutions_status",
    institutions_cte."institutions_address",
    institutions_cte."institutions_city",
    institutions_cte."institutions_state",
    institutions_cte."institutions_pin_code",
    institutions_cte."institutions_medha_area",
    institutions_cte."institutions_district",
    institutions_cte."institutions_created_at",
    institutions_cte."institutions_updated_at",
    grants_cte."grants_name",
    grants_cte."grants_status",
    grants_cte."grants_start_date",
    grants_cte."grants_end_date",
    grants_cte."grants_Donor",
    grants_cte."grants_contributon_type",
    programs_cte."programs_name",
    programs_cte."programs_status",
    programs_cte."programs_program_type",
    programs_cte."programs_start_date",
    programs_cte."programs_end_date",
    u3."program_created_by_user",
    u2."program_updated_by_user",
    programs_cte."programs_created_at",
    programs_cte."programs_updated_at",
    programs_cte."programs_certificate"
FROM
    cte_students
LEFT JOIN cte_program_enrollments ON cte_students.student_id = cte_program_enrollments.student
LEFT JOIN batches_cte ON cte_program_enrollments.batch = batches_cte.batches_id
LEFT JOIN institutions_cte ON cte_program_enrollments.institution = institutions_cte.institutions_id
LEFT JOIN users_cte AS u1 ON institutions_cte.institutions_assigned_to = u1.user_id
LEFT JOIN grants_cte ON batches_cte.batches_grant = grants_cte.grants_id
LEFT JOIN programs_cte ON batches_cte.batches_program = programs_cte.programs_id
LEFT JOIN users1_cte AS u2 ON programs_cte.programs_updated_by = u2.user_id1
LEFT JOIN users2_cte AS u3 ON programs_cte.programs_created_by = u3.user_id2
ORDER BY
    cte_program_enrollments."id"
