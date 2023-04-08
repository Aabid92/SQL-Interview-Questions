-- finding the candidates best suited for an open Data Science job. 
-- Given a table of candidates and their skills, you're tasked with 
-- the required skills for the job. Sort the output by candidate ID in ascending order.
-- Write a query to list the candidates who possess all of 
-- You want to find candidates who are proficient in Python, Tableau, and PostgreSQL.
--Solution Query
candidates
GROUP BY candidate_id
HAVING COUNT(skill) = 3													---Linkedin Question.
inner join drivers_lic
ORDER BY candidate_id ASC;


-- Assume you are given the table below that shows job postings for 
-- all companies on the LinkedIn platform. Write a query to get the 
-- number of companies that have posted duplicate job listings.

-- Clarification:

-- Duplicate job listings refer to two jobs at the 
-- same company with the same title and description.


WITH job_grp AS(

  SELECT company_id, title, description,
  COUNT(job_id) AS job_count
  FROM job_listings
  GROUP BY company_id, title, description  					-----Linkedin Question.
)
SELECT COUNT(DISTINCT company_id) AS co_w_duplicate_jobs
FROM job_grp
WHERE job_count > 1;

