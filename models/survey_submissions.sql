WITH cte_survey AS (
    SELECT
  'Survey ID' AS "Survey_id", 
  'Survey Submission ID' AS "survey_submission_id", 
  'Link ID' AS "link_id", 
  'Session ID' AS "session_id", 
  'Section ID' AS "section_id", 
  'Question Type' AS "question_type", 
  'The Question' AS "the_question", 
  'Question id' AS "question_id", 
  'The Answer' AS "the_answer", 
  'Answer ID' AS "answer_id", 
  'Survey ID' AS "survey_id", 
  'created By' AS "created_by", 
  'updated' AS "updated_by", 
  'created_at' AS "created_at", 
  'updated_at' AS "updated_at", 
  'type' AS "Survey_type", 
  'title' AS "Survey_title", 
  'status' AS "Survey_status", 
  'program' AS "Survey_program", 
  'SIS' AS "Source",
  'Student' AS "Student"::BOOLEAN,
  'Batch' AS "Batch"::BOOLEAN,
  'Student' AS "Question_Response"
   )

SELECT *
FROM cte_survey
order by Survey_id