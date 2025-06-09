/*
Question: What are the most valuable skills to learn for Data Analysts?

Objective:
- Identify skills that are both in high demand and associated with high average salaries.
- Focus specifically on remote roles with non-null salary data.

Why it matters:
- Highlights skills that offer strong job security (demand) and financial upside (salary),
  providing strategic guidance for career growth in the data analytics field.
*/

-- skill name, job_id, saalry

CREATE TABLE optimal_skills AS
SELECT 
    skills_job_dim.skill_id,
    skills_dim.skills,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS average_salary,
    COUNT(job_postings_fact.job_id) AS num_jobs
FROM
    job_postings_fact
INNER JOIN skills_job_dim
    ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim
    ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.salary_year_avg IS NOT NULL AND
    job_postings_fact.job_title_short = 'Data Scientist' AND
    job_postings_fact.job_work_from_home = TRUE
GROUP BY
    skills_job_dim.skill_id,
    skills_dim.skills
HAVING
    COUNT(job_postings_fact.job_id) > 10
ORDER BY
    num_jobs DESC,
    average_salary DESC

