WITH cte_survey AS (
    SELECT
  'Survey ID' AS "survey_id", 
  'Section Name' AS "section_name", 
  'Section ID' AS "section_id", 
  'Link ID' AS "link_id", 
  'Session ID' AS "session_id", 
  'Question Type' AS "question_type", 
  'The Question' AS "the_question", 
  'Question id' AS "question_id", 
  'The Answer' AS "the_answer", 
  'Answer ID' AS "answer_id", 
  'Program ID' AS "program_id",
  'Program Name' AS "program_name",
  'created By' AS "created_by", 
  'updated' AS "updated_by", 
  'created_at' AS "created_at", 
  'updated_at' AS "updated_at", 
  'Pre or Post' AS "Survey_type", 
  'title' AS "Survey_title", 
  'status' AS "Survey_status", 
  'Alchemer' AS "Source",
  'True' AS "Student",
  'False' AS "Batch",
  'Student' AS "Question_Response"
   )

SELECT *
FROM cte_survey
order by survey_id