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
        "emplyment_benefits" AS "emplyment_benefits",
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
        "id" AS "id",
        "username" AS "username"
    FROM 
	airbytedb.users_permissions_user
),



Opportunities_CTE AS (
    SELECT
        "id" AS "id",
        "role_or_designation" AS "role_or_designation",
        "number_of_opportunities" AS "number_of_opportunities",
        "department_or_team" AS "department_or_team",
        "role_description" AS "role_description",
        "salary" AS "salary",
        "assigned_to" AS "assigned_to",
        "employer" AS "employer",
        "type" AS "type",
        "status" AS "status",
        "compensation_type" AS "compensation_type",
        "skills_required" AS "skills_required",
        "address" AS "address",
        "city" AS "city",
        "state" AS "state",
        "pin_code" AS "pin_code",
        "medha_area" AS "medha_area",
        "district" AS "district",
        "id_in_current_sis" AS "id_in_current_sis",
        "created_by_frontend" AS "created_by_frontend",
        "updated_by_frontend" AS "updated_by_frontend",
        "created_by" AS "created_by",
        "updated_by" AS "updated_by",
        "created_at" AS "created_at",
        "updated_at" AS "updated_at"
    FROM 
	airbytedb.opportunities
),




Employers_Components_CTE AS (
    SELECT
        "id" AS "id",
        "field" AS "field",
        "order" AS "order",
        "component_type" AS "component_type",
        "component_id" AS "component_id",
        "employer_id" AS "employer_id"
    FROM 
	airbytedb.employers_components
),


Components_Common_Contacts_CTE AS (
    SELECT
        "id" AS "id",
        "full_name" AS "full_name",
        "designation" AS "designation",
        "phone" AS "phone",
        "email" AS "email"
    FROM 
	airbytedb.components_common_contacts
)

SELECT *
FROM Components_Common_Contacts_CTE AS CCC
LEFT JOIN Employers_Components_CTE AS EC ON CCC.id = EC.component_id
LEFT JOIN Employers_CTE AS E ON EC.employer_id = E.Employers_id
LEFT JOIN Opportunities_CTE AS O ON E.Employers_id = O.employer
LEFT JOIN Usernames_CTE AS U ON O.assigned_to = U.id;