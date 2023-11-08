WITH Employers_CTE AS (
    SELECT
        "id" AS "id",
        "assigned_to" AS "assigned_to",
        "name" AS "name",
        "industry" AS "industry",
        "phone" AS "phone",
        "email" AS "email",
        "address" AS "address",
        "district" AS "district",
        "city" AS "city",
        "state" AS "state",
        "website" AS "website",
        "employment_contract" AS "employment_contract",
        "paid_leaves" AS "paid_leaves",
        "emplyment_benefits" AS "employment_benefits",
        "offer_letter" AS "offer_letter",
        "status" AS "status",
        "type" AS "type",
        "pin_code" AS "pin_code",
        "medha_area" AS "medha_area",
        "medha_partner" AS "medha_partner",
        "id_in_current_sis" AS "id_in_current_sis",
        "created_by_frontend" AS "created_by_frontend",
        "updated_by_frontend" AS "updated_by_frontend",
        "created_by" AS "created_by",
        "updated_by" AS "updated_by",
        "created_at" AS "created_at",
        "updated_at" AS "updated_at",
        "employee_benefits" AS "employee_benefits"
    FROM 
	airbytedb.employers
),



Usernames_CTE AS (
    SELECT
        "id" AS "user_id",
        "username" AS "user_username"
    FROM 
	airbytedb.users_permissions_user
),



Opportunities_CTE AS (
    SELECT
        "id" AS "opportunity_id",
        "role_or_designation" AS "opportunity_role_or_designation",
        "number_of_opportunities" AS "opportunity_number_of_opportunities",
        "department_or_team" AS "opportunity_department_or_team",
        "role_description" AS "opportunity_role_description",
        "salary" AS "opportunity_salary",
        "assigned_to" AS "opportunity_assigned_to",
        "employer" AS "opportunity_employer",
        "type" AS "opportunity_type",
        "status" AS "opportunity_status",
        "compensation_type" AS "opportunity_compensation_type",
        "skills_required" AS "opportunity_skills_required",
        "address" AS "opportunity_address",
        "city" AS "opportunity_city",
        "state" AS "opportunity_state",
        "pin_code" AS "opportunity_pin_code",
        "medha_area" AS "opportunity_medha_area",
        "district" AS "opportunity_district",
        "id_in_current_sis" AS "opportunity_id_in_current_sis",
        "created_by_frontend" AS "opportunity_created_by_frontend",
        "updated_by_frontend" AS "opportunity_updated_by_frontend",
        "created_by" AS "opportunity_created_by",
        "updated_by" AS "opportunity_updated_by",
        "created_at" AS "opportunity_created_at",
        "updated_at" AS "opportunity_updated_at"
    FROM 
	airbytedb.opportunities
),




Employers_Components_CTE AS (
    SELECT
        "id" AS "employer_components_id",
        "field" AS "employer_components_field",
        "order" AS "employer_components_order",
        "component_type" AS "employer_components_component_type",
        "component_id" AS "employer_components_component_id",
        "employer_id" AS "employer_components_employer_id"
    FROM 
	airbytedb.employers_components
),


Components_Common_Contacts_CTE AS (
    SELECT
        "id" AS "components_common_contacts_id",
        "full_name" AS "ccomponents_common_contacts_full_name",
        "designation" AS "ccomponents_common_contacts_designation",
        "phone" AS "components_common_contacts_phone",
        "email" AS "components_common_contacts_email"
    FROM 
	airbytedb.components_common_contacts
)

SELECT *
FROM Employers_CTE AS E
LEFT JOIN Employers_Components_CTE AS EC ON E.id = EC.employer_components_employer_id
LEFT JOIN Components_Common_Contacts_CTE AS CCC ON EC.employer_components_component_id = CCC.components_common_contacts_id
LEFT JOIN Opportunities_CTE AS O ON E.id = O.opportunity_employer
LEFT JOIN Usernames_CTE AS U ON O.opportunity_assigned_to = U.user_id
order by E.id