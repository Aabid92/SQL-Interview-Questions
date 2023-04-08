-- Assume you are given the tables below about Facebook pages
-- and page likes. Write a query to return the page IDs 
-- of all the Facebook pages that don't have any likes. 
-- The output should be in ascending order.

--Solutions---
SELECT P.page_id FROM pages as P
LEFT JOIN 
page_likes AS pl 
ON P.page_id = pl.page_id
WHERE liked_date is NULL
ORDER BY page_id ASC;


-- select distinct salary,emp_name from employee as e 
-- where 3 > (select count(distinct salary) from employee y 
-- where e.salary < y.salary) order by salary desc limit 3; 

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
	DATE_PART('year',post_date::date)=2021 
GROUP BY 
	user_id
having COUNT(post_id)>1
