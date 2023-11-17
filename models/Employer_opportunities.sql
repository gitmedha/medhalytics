WITH Components_Common_Contacts_CTE AS (
    SELECT
        "id" AS "components_common_contacts_id",
        "full_name" AS "ccomponents_common_contacts_full_name",
        "designation" AS "ccomponents_common_contacts_designation",
        "phone" AS "components_common_contacts_phone",
        "email" AS "components_common_contacts_email"
    FROM 
	airbytedb.components_common_contacts
),

-- CTE for Employer assigned to user
Usernames1_CTE AS (
    SELECT
        "id" AS "user_id1",
        "username" AS "employer_assigned_to_user"
    FROM 
	airbytedb.users_permissions_user
),

-- CTE for Employer created by frontend user
Usernames2_CTE AS (
    SELECT
        "id" AS "user_id2",
        "username" AS "created_by_frontend_user"
    FROM 
	airbytedb.users_permissions_user
),

-- CTE for Employer updated by frontend user
Usernames3_CTE AS (
    SELECT
        "id" AS "user_id3",
        "username" AS "updated_by_frontend_user"
    FROM 
	airbytedb.users_permissions_user
),

-- CTE for Employer createdby user
Usernames4_CTE AS (
    SELECT
        "id" AS "user_id4",
        "username" AS "employer_created_by_user"
    FROM 
	airbytedb.users_permissions_user
),


-- CTE for Employer updatedby user
Usernames5_CTE AS (
    SELECT
        "id" AS "user_id5",
        "username" AS "employer_updated_by_user"
    FROM 
	airbytedb.users_permissions_user
),


-- CTE for opportunity assigned to user

Usernames6_CTE AS (
    SELECT
        "id" AS "user_id6",
        "username" AS "opportunity_assigned_to_user"
    FROM 
	airbytedb.users_permissions_user    
),


-- CTE for  opportunity created by front end user
Usernames7_CTE AS (
    SELECT
        "id" AS "user_id7",
        "username" AS "opportunity_created_by_frontend_user"
    FROM 
	airbytedb.users_permissions_user    
),

-- CTE for  opportunity updated by front end user

Usernames8_CTE AS (
    SELECT
        "id" AS "user_id8",
        "username" AS "oopportunity_updated_by_frontend_user"
    FROM 
	airbytedb.users_permissions_user    
),


-- CTE for  opportunity created by user
Usernames9_CTE AS (
    SELECT
        "id" AS "user_id9",
        "username" AS "opportunity_created_by_user"
    FROM 
	airbytedb.users_permissions_user    
),

-- CTE for  opportunity updated by  user

Usernames10_CTE AS (
    SELECT
        "id" AS "user_id10",
        "username" AS "opportunity_updated_by_user"
    FROM 
	airbytedb.users_permissions_user    
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



Employers_CTE AS (
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
)

SELECT
    E."id",
    U1."employer_assigned_to_user",
    U2."created_by_frontend_user",
    U3."updated_by_frontend_user",
    U4."employer_created_by_user",
    U5."employer_updated_by_user",
    U6."opportunity_assigned_to_user",
    U7."opportunity_created_by_frontend_user",
    U8."oopportunity_updated_by_frontend_user",
    U9."opportunity_created_by_user",
    U10."opportunity_updated_by_user",
    CCC."ccomponents_common_contacts_full_name",
    CCC."ccomponents_common_contacts_designation",
    CCC."components_common_contacts_phone",
    CCC."components_common_contacts_email",
    E."assigned_to",
    E."name",
    E."industry",
    E."phone" AS "employer_phone",
    E."email" AS "employer_email",
    E."address" AS "employer_address",
    E."district" AS "employer_district",
    E."city" AS "employer_city",
    E."state" AS "employer_state",
    E."website" AS "employer_website",
    E."employment_contract" AS "employer_employment_contract",
    E."paid_leaves" AS "employer_paid_leaves",
    E."employment_benefits" AS "employer_employment_benefits",
    E."offer_letter" AS "employer_offer_letter",
    E."status" AS "employer_status",
    E."type" AS "employer_type",
    E."pin_code" AS "employer_pin_code",
    E."medha_area" AS "employer_medha_area",
    E."medha_partner" AS "employer_medha_partner",
    E."created_by_frontend" AS "employer_created_by_frontend",
    E."updated_by_frontend" AS "employer_updated_by_frontend",
    E."created_by" AS "employer_created_by",
    E."updated_by" AS "employer_updated_by",
    E."created_at" AS "employer_created_at",
    E."updated_at" AS "employer_updated_at",
    E."employee_benefits" AS "employer_employee_benefits",
    O."opportunity_role_or_designation",
    O."opportunity_number_of_opportunities",
    O."opportunity_department_or_team",
    O."opportunity_role_description",
    O."opportunity_salary",
    U6."opportunity_assigned_to_user" AS "opportunity_assigned_to",
    O."opportunity_employer",
    O."opportunity_type",
    O."opportunity_status",
    O."opportunity_compensation_type",
    O."opportunity_skills_required",
    O."opportunity_address",
    O."opportunity_city",
    O."opportunity_state",
    O."opportunity_pin_code",
    O."opportunity_medha_area",
    O."opportunity_district",
    O."opportunity_created_by_frontend",
    O."opportunity_updated_by_frontend",
    O."opportunity_created_by",
    O."opportunity_updated_by",
    O."opportunity_created_at",
    O."opportunity_updated_at"
FROM
    Components_Common_Contacts_CTE AS CCC
LEFT JOIN Employers_CTE AS E ON Employers_Components_CTE."employer_components_employer_id" = E."id"
LEFT JOIN Employers_Components_CTE AS EC ON CCC."components_common_contacts_id" = EC."employer_components_component_id"
LEFT JOIN Opportunities_CTE AS O ON E."id" = O."opportunity_employer"
LEFT JOIN Usernames1_CTE AS U1 ON E."assigned_to" = U1."user_id1"
LEFT JOIN Usernames2_CTE AS U2 ON E."created_by_frontend" = U2."user_id2"
LEFT JOIN Usernames3_CTE AS U3 ON E."updated_by_frontend" = U3."user_id3"
LEFT JOIN Usernames4_CTE AS U4 ON E."created_by" = U4."user_id4"
LEFT JOIN Usernames5_CTE AS U5 ON E."updated_by" = U5."user_id5"
LEFT JOIN Usernames6_CTE AS U6 ON O."opportunity_assigned_to" = U6."user_id6"
LEFT JOIN Usernames7_CTE AS U7 ON O."opportunity_created_by_frontend" = U7."user_id7"
LEFT JOIN Usernames8_CTE AS U8 ON O."opportunity_updated_by_frontend" = U8."user_id8"
LEFT JOIN Usernames9_CTE AS U9 ON O."opportunity_created_by" = U9."user_id9"
LEFT JOIN Usernames10_CTE AS U10 ON O."opportunity_updated_by" = U10."user_id10"
ORDER BY E."id"
