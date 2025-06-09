/*
Question: What are the highest-paying skills for Data Analysts?

Objective:

Analyze the average salary associated with each skill across Data Analyst roles.

Consider only roles with specified (non-null) salary data, regardless of job location.

Why it matters: This highlights which skills most significantly boost salary potential,
 guiding professionals toward the most financially valuable skills to learn or strengthen.
*/

CREATE TABLE highest_paying_skills AS

SELECT 
    skill_job.skill_ids,
    skill_job.skill_name,
    ROUND(AVG(skill_job.salary), 0) AS avg_salary
FROM (
    SELECT 
        skills_job_dim.skill_id AS skill_ids,
        skills_dim.skills AS skill_name,
        job_postings_fact.job_id,
        job_postings_fact.salary_year_avg AS salary
    FROM 
        job_postings_fact
    INNER JOIN skills_job_dim
        ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim
        ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE   
        job_title_short = 'Data Analyst'
        AND job_postings_fact.salary_year_avg IS NOT NULL
) AS skill_job
GROUP BY
    skill_job.skill_ids,
    skill_job.skill_name
ORDER BY
    avg_salary DESC
LIMIT 200


/*
/*
🔍 Insight 1: High Demand for Big Data & ML Skills
Top-paying data analyst roles require expertise in big data technologies (e.g., PySpark, Couchbase),
machine learning tools (e.g., DataRobot, Jupyter), and Python libraries (e.g., Pandas, NumPy).
These skills reflect industry demand for advanced data processing and predictive modeling capabilities.
*/

/*
🔧 Insight 2: Software Development & Deployment Proficiency
Skills in development and deployment tools like GitLab, Kubernetes, and Airflow
indicate a strong crossover between data analysis and engineering.
These tools support automation and efficient pipeline management, increasing role value.
*/

/*
☁️ Insight 3: Cloud Computing Expertise
Proficiency in cloud and data engineering platforms such as Elasticsearch, Databricks, and GCP
is increasingly vital for modern analytics roles. Cloud experience significantly enhances
earning potential and access to scalable, production-grade data environments.
*/

*/