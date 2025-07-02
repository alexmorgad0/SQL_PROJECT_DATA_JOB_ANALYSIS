/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Scientist positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Scientists and 
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg),0) AS avg_salary -- ROUND rounds the values to the amount of decimal places of choice
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id 
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;

/* 

Insights from Top-Paying Data Scientist Skills:

- Niche & emerging tools like Asana, Airtable, Watson, and Elixir are linked to the highest salaries, signaling value in specialized tech.
- AI/ML & cloud skills (e.g., Hugging Face, DynamoDB, BigQuery) show that expertise in modern infrastructure and machine learning frameworks pays well.
- Uncommon languages & frameworks (e.g., Lua, Haskell, Neo4j, RShiny) appear frequently in top-paying roles — rarity seems to drive compensation.

[
  {
    "skills": "asana",
    "avg_salary": "215477"
  },
  {
    "skills": "airtable",
    "avg_salary": "201143"
  },
  {
    "skills": "redhat",
    "avg_salary": "189500"
  },
  {
    "skills": "watson",
    "avg_salary": "187417"
  },
  {
    "skills": "elixir",
    "avg_salary": "170824"
  },
  {
    "skills": "lua",
    "avg_salary": "170500"
  },
  {
    "skills": "slack",
    "avg_salary": "168219"
  },
  {
    "skills": "solidity",
    "avg_salary": "166980"
  },
  {
    "skills": "ruby on rails",
    "avg_salary": "166500"
  },
  {
    "skills": "rshiny",
    "avg_salary": "166436"
  },
  {
    "skills": "notion",
    "avg_salary": "165636"
  },
  {
    "skills": "objective-c",
    "avg_salary": "164500"
  },
  {
    "skills": "neo4j",
    "avg_salary": "163971"
  },
  {
    "skills": "dplyr",
    "avg_salary": "163111"
  },
  {
    "skills": "hugging face",
    "avg_salary": "160868"
  },
  {
    "skills": "dynamodb",
    "avg_salary": "160581"
  },
  {
    "skills": "haskell",
    "avg_salary": "157500"
  },
  {
    "skills": "unity",
    "avg_salary": "156881"
  },
  {
    "skills": "airflow",
    "avg_salary": "155878"
  },
  {
    "skills": "codecommit",
    "avg_salary": "154684"
  },
  {
    "skills": "unreal",
    "avg_salary": "153278"
  },
  {
    "skills": "theano",
    "avg_salary": "153133"
  },
  {
    "skills": "zoom",
    "avg_salary": "151677"
  },
  {
    "skills": "bigquery",
    "avg_salary": "149292"
  },
  {
    "skills": "atlassian",
    "avg_salary": "148715"
  }
]

*/