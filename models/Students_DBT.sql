
{{
config(
    materialized='table',
    schema='medhalytics'
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
),
cte_program_enrollments AS (
    SELECT
        "id" AS "Program_Enrollments_id",
        "student" AS "Program_Enrollments_student",
        "batch" AS "Program_Enrollments_batch",
        "institution" AS "Program_Enrollments_institution",
        "status" AS "Program_Enrollments_status",
        "registration_date" AS "Program_Enrollments_registration_date",
        "fee_status" AS "Program_Enrollments_fee_status",
        "fee_payment_date" AS "Program_Enrollments_fee_payment_date",
        "fee_amount" AS "Program_Enrollments_fee_amount",
        "fee_transaction_id" AS "Program_Enrollments_fee_transaction_id",
        "fee_refund_status" AS "Program_Enrollments_fee_refund_status",
        "fee_refund_date" AS "Program_Enrollments_fee_refund_date",
        "course_type" AS "Program_Enrollments_course_type",
        "course_level" AS "Program_Enrollments_course_level",
        "course_year" AS "Program_Enrollments_course_year",
        "year_of_course_completion" AS "Program_Enrollments_year_of_course_completion",
        "certification_date" AS "Program_Enrollments_certification_date",
        "institution_name_entered_by_student" AS "Program_Enrollments_institution_name_entered_by_student",
        "course_name_in_current_sis" AS "Program_Enrollments_course_name_in_current_sis",
        "id_in_current_sis" AS "Program_Enrollments_id_in_current_sis",
        "created_by_frontend" AS "Program_Enrollments_created_by_frontend",
        "updated_by_frontend" AS "Program_Enrollments_updated_by_frontend",
        "created_by" AS "Program_Enrollments_created_by",
        "updated_by" AS "Program_Enrollments_updated_by",
        "created_at" AS "Program_Enrollments_created_at",
        "updated_at" AS "Program_Enrollments_updated_at",
        "program_selected_by_student" AS "Program_Enrollments_program_selected_by_student",
        "discount_code_id" AS "Program_Enrollments_discount_code_id",
        "medha_program_certificate_status" AS "Program_Enrollments_medha_program_certificate_status",
        "higher_education_course_name" AS "Program_Enrollments_higher_education_course_name",
        "higher_education_year_of_course_completion" AS "Program_Enrollments_higher_education_year_of_course_completion",
        "course_name_other" AS "Program_Enrollments_course_name_other"
    FROM 
    airbytedb.program_enrollments
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
    FROM 
    airbytedb.batches
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
    FROM 
    airbytedb.institutes
)

SELECT *
FROM cte_students
LEFT JOIN cte_program_enrollments ON cte_students."id" = cte_program_enrollments."Program_Enrollments_student"
LEFT JOIN cte_batches ON cte_program_enrollments."Program_Enrollments_batch" = cte_batches."Batches_id"
LEFT JOIN cte_institutions ON cte_program_enrollments."Program_Enrollments_institution" = cte_institutions."Institutions_id"




