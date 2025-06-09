
# Remote Data Scientist Job Market Analysis (SQL Project)

This project analyzes remote **Data Scientist** job listings to identify the most lucrative roles and the most sought-after skills. Using SQL and real-world job posting data, we explore how skill demand aligns with compensation, helping aspiring data professionals and recruiters understand key job market trends.

---

## Project Objectives

- **Find top 100 highest-paying remote Data Scientist roles**
- **Analyze skills linked to high-paying jobs**
- **Identify the most in-demand and highest-paying skills**
- **Determine optimal skills offering the best salary-to-demand balance**

---

## Key Insights

### Highest Paying Jobs
- **Top companies hiring remotely**: Harnham, Reddit, Lawrence Harvey, Averity, Braintrust
- **Average salary** among top 100 jobs: **~$242,000**, with a max of **$550,000**
- All roles are remote (`job_location = 'Anywhere'`), emphasizing growing flexibility in top-tier data roles.

### Most Common Skills in Top Jobs
- Dominated by essential data tools and libraries:
  - `python` (70%)
  - `sql` (54%)
  - `aws`, `r`, `tableau`, `spark`, `tensorflow`, `pytorch`

### Most Demanded Skills (Overall)
- `python` (114k postings), `sql` (79k), `r` (59k) top the charts across all Data Scientist job postings.
- Strong presence of both programming and BI tools (e.g., Tableau).

### Highest Paying Skills
- Surprisingly, niche or enterprise tools like:
  - `asana` ($215k avg)
  - `airtable` ($201k)
  - `redhat`, `watson`, `elixir`
- These tools appear in fewer jobs but correlate with higher salaries.

### Most Valuable Skills (Best Salary + Demand Trade-off)
- Optimal skills with **both high pay and large job volume**:
  - `python` (~$144k, 763 jobs)
  - `sql` (~$143k, 591 jobs)
  - `aws`, `tableau`, `spark`, `tensorflow`, `pytorch`
- These strike the best balance for career growth and salary potential in remote roles.

---

## Data Sources & Tables

| File Name                        | Description                                                |
|----------------------------------|------------------------------------------------------------|
| `1_top_paying_remote_jobs.csv`   | Top 100 remote Data Scientist jobs by salary              |
| `2_top_job_skills.csv`           | Skills required for those top-paying jobs                 |
| `3_top_demanded_da_skills.csv`   | Skills ranked by overall demand in postings               |
| `4_highest_paying_skills.csv`    | Skills with the highest average salaries                  |
| `5_most_valuable_da_skills.csv`  | Best trade-off between demand (job count) and salary      |

---

## 🛠️ Technologies Used

- SQL (PostgreSQL-style queries)
- CSV analysis with Python (Pandas)
- Data wrangling and summarization