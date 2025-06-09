/*
Objective: Identify the key skills required for the highest-paying data analyst roles
Step 1: Extract the top 10 highest-paying data analyst job listings from the initial query

Step 2: List the specific skills mentioned in each of those roles

Purpose: To highlight which skills are most commonly associated with top-tier salaries, helping job 
seekers prioritize the right competencies for career growth
*/

CREATE TABLE top_remote_jobs_skills AS

WITH top_jobs AS (
    SELECT
        job_id,
        company_dim.name AS company_name,
        job_title,
        salary_year_avg
    FROM
        job_postings_fact
    INNER JOIN company_dim
        ON company_dim.company_id = job_postings_fact.company_id
    WHERE
        job_title_short = 'Data Scientist' AND
        salary_year_avg IS NOT NULL AND
        job_location = 'Anywhere'
    ORDER BY 
        salary_year_avg DESC
    LIMIT 100
)

SELECT 
    top_jobs.*, 
    skills_job_dim.skill_id ,
    skills_dim.skills
FROM top_jobs
INNER JOIN skills_job_dim
    ON skills_job_dim.job_id = top_jobs.job_id
INNER JOIN skills_dim
    ON skills_dim.skill_id = skills_job_dim.skill_id
ORDER BY
    top_jobs.salary_year_avg DESC;

/*
Most Frequently Required Skills:
SQL and Python are the top two most in-demand skills, showing up in the majority of high-paying roles.

Tableau, R, and Snowflake are also highly sought after, suggesting strong demand for both programming and data visualization/database tools.

Key Takeaways:
Mastering SQL + Python is essential for securing top remote data analyst roles.

BI tools like Tableau, along with cloud-based data platforms like Snowflake and Azure, are increasingly important.

Candidates familiar with a broad ecosystem (e.g., pandas, Excel, Power BI, Jupyter, Git) have a competitive edge.
Companies like AT&T and Pinterest offer some of the highest salaries, but SmartAsset
 and Inclusively lead in number of high-paying postings, making them strong targets for job seekers.


Overall Summary:
Data Analyst roles paying over $200K/year tend to require advanced tech stack skills.

Cloud, data engineering, and visualization tools are central to top-tier jobs.

Companies investing in remote data roles are spread across industries — tech, telecom, fintech, and healthcare.



*/