{{
config(
    materialized='table'
    )
    }}


-- Define a CTE named survey_data
WITH program_data2 AS (
    SELECT
        id, 
        name, 
        status, 
        start_date, 
        end_date
    FROM
        public.programs
)

-- Select data from the CTE
SELECT
        id, 
        name, 
        status,
         start_date, 
        end_date
FROM
    program_data2