WITH cte_students AS (
    SELECT
        "student_id" AS "student_id",
		'SIS' AS "Source"
    FROM 
    airbytedb.students
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
        "institution_name_entered_by_student" AS "institution_name_entered_by_student",
        "course_name_in_current_sis" AS "course_name_in_current_sis",
        "id_in_current_sis" AS "id_in_current_sis",
        "created_by_frontend" AS "created_by_frontend",
        "updated_by_frontend" AS "updated_by_frontend",
        "created_by" AS "created_by",
        "updated_by" AS "updated_by",
        "created_at" AS "created_at",
        "updated_at" AS "updated_at",
        "program_selected_by_student" AS "program_selected_by_student",
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
        "name_in_current_sis" AS "batches_name_in_current_sis",
        "institution" AS "batches_institution",
        "grant" AS "batches_grant",
        "include_institution_logo_in_certificates" AS "batches_include_institution_logo_in_certificates",
        "seats_available" AS "batches_seats_available",
        "state" AS "batches_state",
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
        "description" AS "institutions_description",
        "type" AS "institutions_type",
        "status" AS "institutions_status",
        "id_in_current_sis" AS "institutions_id_in_current_sis",
        "address" AS "institutions_address",
        "city" AS "institutions_city",
        "state" AS "institutions_state",
        "pin_code" AS "institutions_pin_code",
        "medha_area" AS "institutions_medha_area",
        "district" AS "institutions_district",
        "created_by_frontend" AS "institutions_created_by_frontend",
        "updated_by_frontend" AS "institutions_updated_by_frontend",
        "created_by" AS "institutions_created_by",
        "updated_by" AS "institutions_updated_by",
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
		"contributon_type" AS "grants_contributon_type",
		"cost_center_in_tally" AS "grants_cost_center_in_tally", 
		"created_by" AS "grants_created_by", 
		"updated_by" AS "grants_updated_by", 
		"created_at" AS "grants_created_at", 
		"updated_at" AS "grants_updated_at"
        
    FROM 
    airbytedb.grants
),

-- CTE for the 'programs' table
programs_cte AS (
    SELECT
        "id" AS "Programs_id",
        "name" AS "Programs_name",
        "status" AS "Programs_status", 
		"program_type" AS "Programs_program_type",
		"start_date" AS "Programs_start_date",
		"end_date" AS "Programs_end_date", 
		"show_on_student_signup_form" AS "Programs_show_on_student_signup_form", 
		"default_enrollment_batch" AS "Programs_default_enrollment_batch", 
		"created_by" AS "Programs_created_by",
		"updated_by" AS "Programs_updated_by", 
		"created_at" AS "Programs_created_at", 
		"updated_at" AS "Programs_updated_at",
		"certificate" AS "Programs_certificate"
		
    FROM 
	airbytedb.programs
)

-- Main query combining the CTEs
SELECT *
FROM cte_students
LEFT JOIN cte_program_enrollments ON cte_students.id = cte_program_enrollments.student
LEFT JOIN batches_cte ON cte_program_enrollments.batch = batches_cte.batches_id
LEFT JOIN institutions_cte ON cte_program_enrollments.institution = institutions_cte.institutions_id
LEFT JOIN grants_cte ON batches_cte.batches_grant = grants_cte.grants_id
LEFT JOIN programs_cte ON batches_cte.batches_program = programs_cte.id
Order by programs_cte.id
