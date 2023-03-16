-- Assume you are given the tables below about Facebook pages
-- and page likes. Write a query to return the page IDs 
-- of all the Facebook pages that don't have any likes. 
-- The output should be in ascending order.

--Solutions---
SELECT P.page_id FROM pages as P
LEFT JOIN 
page_likes AS pl 
ON P.page_id = pl.page_id
WHERE liked_date IS NULL
ORDER BY page_id ASC;