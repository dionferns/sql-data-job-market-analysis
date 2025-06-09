/*
Question: What are the highest-paying remote Data Analyst jobs?

- Identify the top 10 highest-paying Data Analyst roles that are available remotely.
- Focus only on postings with specified salaries (exclude rows with NULL salary values).
- Purpose: Highlight top-paying opportunities for Data Analysts, offering insights into employer demand and compensation trends.
*/
CREATE TABLE highest_paying_remote_jobs AS
SELECT
    job_id,
    company_dim.name AS company_name,
    job_title_short,
    job_location,
    salary_year_avg
FROM
    job_postings_fact
INNER JOIN company_dim
    ON company_dim.company_id = job_postings_fact.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_location = 'Anywhere'
ORDER BY 
    salary_year_avg DESC
LIMIT 100