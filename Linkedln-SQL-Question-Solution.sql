-- Q-1) Given a table of candidates and their skills, you're tasked with 
-- finding the candidates best suited for an open Data Science job. 
-- You want to find candidates who are proficient in Python, Tableau, and PostgreSQL.

-- Write a query to list the candidates who possess all of 
-- the required skills for the job. Sort the output by candidate ID in ascending order.

--Solution Query

SELECT candidate_id FROM 
candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3
ORDER BY candidate_id ASC;


-- Q-2) Assume you are given the table below that shows job postings for 
-- all companies on the LinkedIn platform. Write a query to get the 
-- number of companies that have posted duplicate job listings.

--Solution Query--

WITH job_grp AS(

  SELECT company_id, title, description,
  COUNT(job_id) AS job_count
  FROM job_listings
  GROUP BY company_id, title, description
)
SELECT COUNT(DISTINCT company_id) AS co_w_duplicate_jobs
FROM job_grp
WHERE job_count > 1;