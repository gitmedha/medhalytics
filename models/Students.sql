
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
    FROM "public"."students"
),
cte_program_enrollments AS (
    SELECT
        "id" AS "Program Enrollments__id",
        "student" AS "Program Enrollments__student",
        "batch" AS "Program Enrollments__batch",
        "institution" AS "Program Enrollments__institution",
        "status" AS "Program Enrollments__status",
        "registration_date" AS "Program Enrollments__registration_date",
        "fee_status" AS "Program Enrollments__fee_status",
        "fee_payment_date" AS "Program Enrollments__fee_payment_date",
        "fee_amount" AS "Program Enrollments__fee_amount",
        "fee_transaction_id" AS "Program Enrollments__fee_transaction_id",
        "fee_refund_status" AS "Program Enrollments__fee_refund_status",
        "fee_refund_date" AS "Program Enrollments__fee_refund_date",
        "course_type" AS "Program Enrollments__course_type",
        "course_level" AS "Program Enrollments__course_level",
        "course_year" AS "Program Enrollments__course_year",
        "year_of_course_completion" AS "Program Enrollments__year_of_course_completion",
        "certification_date" AS "Program Enrollments__certification_date",
        "institution_name_entered_by_student" AS "Program Enrollments__institution_name_entered_by_student",
        "course_name_in_current_sis" AS "Program Enrollments__course_name_in_current_sis",
        "id_in_current_sis" AS "Program Enrollments__id_in_current_sis",
        "created_by_frontend" AS "Program Enrollments__created_by_frontend",
        "updated_by_frontend" AS "Program Enrollments__updated_by_frontend",
        "created_by" AS "Program Enrollments__created_by",
        "updated_by" AS "Program Enrollments__updated_by",
        "created_at" AS "Program Enrollments__created_at",
        "updated_at" AS "Program Enrollments__updated_at",
        "program_selected_by_student" AS "Program Enrollments__program_selected_by_student",
        "discount_code_id" AS "Program Enrollments__discount_code_id",
        "medha_program_certificate_status" AS "Program Enrollments__medha_program_certificate_status",
        "higher_education_course_name" AS "Program Enrollments__higher_education_course_name",
        "higher_education_year_of_course_completion" AS "Program Enrollments__higher_education_year_of_course_completion",
        "course_name_other" AS "Program Enrollments__course_name_other"
    FROM "public"."program_enrollments" AS "Program Enrollments"
),
cte_batches AS (
    SELECT
        "id" AS "Batches__id",
        "name" AS "Batches__name",
        "start_date" AS "Batches__start_date",
        "end_date" AS "Batches__end_date",
        "assigned_to" AS "Batches__assigned_to",
        "status" AS "Batches__status",
        "certificates_generated_at" AS "Batches__certificates_generated_at",
        "certificates_emailed_at" AS "Batches__certificates_emailed_at",
        "number_of_sessions_planned" AS "Batches__number_of_sessions_planned",
        "program" AS "Batches__program",
        "per_student_fees" AS "Batches__per_student_fees",
        "mode_of_payment" AS "Batches__mode_of_payment",
        "name_in_current_sis" AS "Batches__name_in_current_sis",
        "institution" AS "Batches__institution",
        "grant" AS "Batches__grant",
        "

include_institution_logo_in_certificates" AS "Batches__include_institution_logo_in_certificates",
        "seats_available" AS "Batches__seats_available",
        "state" AS "Batches__state",
        "medha_area" AS "Batches__medha_area",
        "enrollment_type" AS "Batches__enrollment_type",
        "id_in_current_sis" AS "Batches__id_in_current_sis",
        "created_by_frontend" AS "Batches__created_by_frontend",
        "updated_by_frontend" AS "Batches__updated_by_frontend",
        "created_by" AS "Batches__created_by",
        "updated_by" AS "Batches__updated_by",
        "created_at" AS "Batches__created_at",
        "updated_at" AS "Batches__updated_at",
        "require_assignment_file_for_certification" AS "Batches__require_assignment_file_for_certification",
        "link_sent_at" AS "Batches__link_sent_at"
    FROM "public"."batches" AS "Batches"
),
cte_institutions AS (
    SELECT
        "id" AS "Institutions__id",
        "name" AS "Institutions__name",
        "assigned_to" AS "Institutions__assigned_to",
        "website" AS "Institutions__website",
        "phone" AS "Institutions__phone",
        "email" AS "Institutions__email",
        "description" AS "Institutions__description",
        "type" AS "Institutions__type",
        "status" AS "Institutions__status",
        "id_in_current_sis" AS "Institutions__id_in_current_sis",
        "address" AS "Institutions__address",
        "city" AS "Institutions__city",
        "state" AS "Institutions__state",
        "pin_code" AS "Institutions__pin_code",
        "medha_area" AS "Institutions__medha_area",
        "district" AS "Institutions__district",
        "created_by_frontend" AS "Institutions__created_by_frontend",
        "updated_by_frontend" AS "Institutions__updated_by_frontend",
        "created_by" AS "Institutions__created_by",
        "updated_by" AS "Institutions__updated_by",
        "created_at" AS "Institutions__created_at",
        "updated_at" AS "Institutions__updated_at"
    FROM "public"."institutions" AS "Institutions"
)

SELECT *
FROM cte_students
LEFT JOIN cte_program_enrollments ON cte_students."id" = cte_program_enrollments."Program Enrollments__student"
LEFT JOIN cte_batches ON cte_program_enrollments."Program Enrollments__batch" = cte_batches."Batches__id"
LEFT JOIN cte_institutions ON cte_program_enrollments."Program Enrollments__institution" = cte_institutions."Institutions__id"
LIMIT 1048575;



