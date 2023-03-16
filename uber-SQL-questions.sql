-- Assume you are given the table below on Uber transactions made by users. 
-- Write a query to obtain the third transaction of every user.
-- Output the user id, spend and transaction date.


SELECT user_id, spend, transaction_date FROM
(
  SELECT *, RANK() 
  OVER(PARTITION BY user_id ORDER BY transaction_date ASC) AS RNK
  FROM transactions
  ) AS x
WHERE x.RNK = 3;