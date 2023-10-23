WITH cte_students AS (
    SELECT
        "id" AS "Students_id",
		'SIS' AS "Source"
    FROM airbytedb.students
),

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
    FROM airbytedb.program_enrollments
),

cte_institutions AS (
    SELECT
        "id" AS "Institutions_id",
        "name" AS "Institutions_name",
        "assigned_to" AS "Institutions_assigned_to",
        "website" AS "Institutions_website",
        "phone" AS "Institutions_phone",
        "email" AS "Institutions_email",
        "description" AS "Institutions_description",
        "type" AS "Institutions_type",
        "status" AS "Institutions_status",
        "id_in_current_sis" AS "Institutions_id_in_current_sis",
        "address" AS "Institutions_address",
        "city" AS "Institutions_city",
        "state" AS "Institutions_state",
        "pin_code" AS "Institutions_pin_code",
        "medha_area" AS "Institutions_medha_area",
        "district" AS "Institutions_district",
        "created_by_frontend" AS "Institutions_created_by_frontend",
        "updated_by_frontend" AS "Institutions_updated_by_frontend",
        "created_by" AS "Institutions_created_by",
        "updated_by" AS "Institutions_updated_by",
        "created_at" AS "Institutions_created_at",
        "updated_at" AS "Institutions_updated_at"
    FROM airbytedb.institutions
),

cte_batches AS (
    SELECT
        "id" AS "Batches_id",
        "name" AS "Batches_name",
        "start_date" AS "Batches_start_date",
        "end_date" AS "Batches_end_date",
        "assigned_to" AS "Batches_assigned_to",
        "status" AS "Batches_status",
        "certificates_generated_at" AS "Batches_certificates_generated_at",
        "certificates_emailed_at" AS "Batches_certificates_emailed_at",
        "number_of_sessions_planned" AS "Batches_number_of_sessions_planned",
        "program" AS "Batches_program",
        "per_student_fees" AS "Batches_per_student_fees",
        "mode_of_payment" AS "Batches_mode_of_payment",
        "name_in_current_sis" AS "Batches_name_in_current_sis",
        "institution" AS "Batches_institution",
        "grant" AS "Batches_grant",
        "include_institution_logo_in_certificates" AS "Batches_include_institution_logo_in_certificates",
        "seats_available" AS "Batches_seats_available",
        "state" AS "Batches_state",
        "medha_area" AS "Batches_medha_area",
        "enrollment_type" AS "Batches_enrollment_type",
        "id_in_current_sis" AS "Batches_id_in_current_sis",
        "created_by_frontend" AS "Batches_created_by_frontend",
        "updated_by_frontend" AS "Batches_updated_by_frontend",
        "created_by" AS "Batches_created_by",
        "updated_by" AS "Batches_updated_by",
        "created_at" AS "Batches_created_at",
        "updated_at" AS "Batches_updated_at",
        "require_assignment_file_for_certification" AS "Batches_require_assignment_file_for_certification",
        "link_sent_at" AS "Batches_link_sent_at"
    FROM airbytedb.batches
)


SELECT *
FROM cte_program_enrollments AS pe
LEFT JOIN cte_students AS s ON pe.student = s.Students_id
LEFT JOIN cte_institutions AS i ON pe.institution = i.Institutions_id
LEFT JOIN cte_batches AS b ON pe.batch = b.Batches_id

