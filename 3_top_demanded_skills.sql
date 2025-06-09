/*
Question: What are the most in-demand skills for data analysts?
Approach:
Join job postings with the skills table using an inner join (similar to Query 2)
Goal: Identify the top 5 most frequently requested skills in all data analyst job postings
Why It Matters: Highlights the skills with the highest demand in the job market, helping job
 seekers focus on developing the most valuable and career-relevant competencies.
*/
CREATE TABLE most_demanded_skills AS

SELECT
    -- job_postings_fact.job_title AS job_name,
    -- job_postings_fact.job_id,
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count

FROM
    job_postings_fact
INNER JOIN skills_job_dim
    ON skills_job_dim.job_id = job_postings_fact.job_id
INNER join skills_dim
    ON skills_dim.skill_id = skills_job_dim.skill_id
WHERE
    job_title_short = 'Data Scientist'
GROUP BY
    skills_dim.skill_id,
    skills_dim.skills 
ORDER BY    
    demand_count DESC
LIMIT 5

