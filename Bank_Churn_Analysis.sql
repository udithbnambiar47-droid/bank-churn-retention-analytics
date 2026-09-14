CREATE DATABASE project_presentation;

SELECT *
FROM Bank_Churn ;

--The churn rate among high-value customers (those with a bank balance above $100,000) who are completely inactive members?

SELECT CustomerId, Balance 
FROM Bank_Churn
WHERE Balance > 100000 AND IsActiveMember = 0  
AND Exited = 1

--What is the overall customer churn rate of the bank expressed as a percentage?--

SELECT 
    COUNT(CASE WHEN Exited = 1 THEN 1 END) AS Churned_Customers,
    COUNT(*) AS Total_Customers,
    ROUND(COUNT(CASE WHEN Exited = 1 THEN 1 END) * 100.0 / COUNT(*), 2) AS Churn_Rate_Percentage
FROM Bank_Churn;

--How many customers have a balance over $100,000, hold 3 or more products, are completely inactive, and what is their churn rate?--

SELECT 
    Exited,
    COUNT(*) AS Customer_Count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS Percentage
FROM Bank_Churn
WHERE Balance > 100000 
  AND NumOfProducts >= 3 
  AND IsActiveMember = 0
GROUP BY Exited;

--Which combination of geographic country and gender experiences the highest total volume of churned customers?--

SELECT 
    Geography,
    Gender,
    COUNT(*) AS Churned_Count
FROM Bank_Churn
WHERE Exited = 1
GROUP BY Geography, Gender
ORDER BY Churned_Count DESC;

--what is the average credit score, average balance, and total churn count for customers segmented by their number of bank products?--

SELECT 
    NumOfProducts,
    COUNT(*) AS Total_Customers,
    COUNT(CASE WHEN Exited = 1 THEN 1 END) AS Churned_Customers,
    ROUND(AVG(CreditScore), 1) AS Avg_Credit_Score,
    ROUND(AVG(Balance), 2) AS Avg_Balance
FROM Bank_Churn
GROUP BY NumOfProducts
ORDER BY NumOfProducts;

--Write a query to find the top 10 highest-earning active customers who have a high balance and haven't churned yet, so the bank can send them a loyalty offer.--

SELECT TOP 10 
    CustomerId, 
    Surname, 
    Geography, 
    Balance, 
    EstimatedSalary
FROM Bank_Churn
WHERE Exited = 0 
  AND IsActiveMember = 1
  AND Balance > 100000
ORDER BY EstimatedSalary DESC;




