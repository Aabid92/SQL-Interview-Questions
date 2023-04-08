
-- Assume you are given the tables below about Facebook pages
-- and page likes. Write a query to return the page IDs 
-- of all the Facebook pages that don't have any likes. 
-- The output should be in ascending order.

--Solutions---
SELECT P.page_id FROM pages as P
LEFT JOIN 
page_likes AS pl 							---Facebooks Question
ON P.page_id = pl.page_id
WHERE liked_date is NULL
ORDER BY page_id ASC;

------------------------------------------------------------------------------------------------------

-- Q) Given a table of Facebook posts, for each user who posted at least twice
-- in 2021, write a query to find the number of days between each user’s 
-- first post of the year and last post of the year in the year 2021. 
-- Output the user and number of the days between each user's first and last post.

SELECT 
	user_id, 
    MAX(post_date::date)- MIN(post_date::date) AS days_between
FROM
	posts
WHERE
	DATE_PART('year',post_date::date)=2021 					----Facebook Questions
GROUP BY 
	user_id
having COUNT(post_id)>1


---------------------------------------------------------------------------------------------------------


-- Q) You are given the tables below containing information on Robinhood trades
-- and users. Write a query to list the top three cities that have the most 
-- completed trade orders in descending order.
-- Output the city and number of orders.

--user_id is referencial integrity amount both tables.

SELECT city, COUNT(status) AS total_orders
FROM users AS U
INNER JOIN trades AS T
ON U.user_id = T.user_id
WHERE status = 'Completed'
GROUP BY status, city							---Robinhood Question.
ORDER BY total_orders DESC
LIMIT 3;

--------------------------------------------------------------------------------------------------------

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

-------------------------------------------------------------------------------------------------------

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

-----------------------------------------------------------------------------------------------------


-- Q-1) Assume that you are given the table below containing information
-- on viewership by device type (where the three types are 
-- laptop, tablet, and phone). Define “mobile” as the 
-- sum of tablet and phone viewership numbers. Write a query
-- to compare the viewership on laptops versus mobile devices.

--Solution Query--

SELECT 

  SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views,
  SUM(CASE WHEN device_type IN('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views   ----new-York times questions

FROM viewership; 


-------------------------------------------------------------------------------------------------------------------

-- Assume you are given the table below on Uber transactions made by users. 
-- Write a query to obtain the third transaction of every user.
-- Output the user id, spend and transaction date.


SELECT user_id, spend, transaction_date FROM
(
  SELECT *, RANK() 
  OVER(PARTITION BY user_id ORDER BY transaction_date ASC) AS RANK				---Uber Questions.
  FROM transactions
  ) AS x
WHERE x.RNK = 3;

--------------------------------------------------------------------------------------------------------------