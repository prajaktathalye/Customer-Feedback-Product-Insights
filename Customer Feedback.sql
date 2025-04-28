SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM customers;
SELECT ROUND(AVG(satisfaction_score), 2) AS average_satisfaction
FROM survey_responses;

SELECT loyalty_tier, COUNT(customer_id) AS customer_count
FROM customers
GROUP BY loyalty_tier
ORDER BY customer_count DESC;

SELECT c.loyalty_tier, ROUND(AVG(s.satisfaction_score), 2) AS avg_satisfaction
FROM customers c
JOIN survey_responses s ON c.customer_id = s.customer_id
GROUP BY c.loyalty_tier
ORDER BY avg_satisfaction DESC;

SELECT p.product_name, p.category, 
       ROUND(AVG(s.recommend_score), 2) AS avg_recommend_score
FROM survey_responses s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name, p.category
ORDER BY avg_recommend_score DESC
LIMIT 5;


SELECT 
  CASE
    WHEN age < 25 THEN 'Under 25'
    WHEN age BETWEEN 25 AND 34 THEN '25-34'
    WHEN age BETWEEN 35 AND 44 THEN '35-44'
    WHEN age BETWEEN 45 AND 54 THEN '45-54'
    ELSE '55+'
  END AS age_group,
  COUNT(*) AS customer_count
FROM customers
GROUP BY age_group
ORDER BY customer_count DESC;

SELECT satisfaction_score, COUNT(*) AS customer_count
FROM survey_responses
GROUP BY satisfaction_score
ORDER BY satisfaction_score;


SELECT p.product_name, COUNT(*) AS review_count
FROM customer_reviews cr
JOIN products p ON cr.product_id = p.product_id
GROUP BY p.product_name
ORDER BY review_count DESC
LIMIT 5;


SELECT p.category, ROUND(AVG(s.recommend_score), 2) AS avg_recommend_score
FROM survey_responses s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY avg_recommend_score DESC;


SELECT c.customer_id, c.name, s.satisfaction_score
FROM customers c
JOIN survey_responses s ON c.customer_id = s.customer_id
ORDER BY s.satisfaction_score ASC
LIMIT 5;


SELECT p.product_name, ROUND(AVG(s.satisfaction_score), 2) AS avg_satisfaction
FROM survey_responses s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY avg_satisfaction DESC;

SELECT DATE_FORMAT(review_date, '%Y-%m') AS month, COUNT(*) AS review_count
FROM customer_reviews
GROUP BY month
ORDER BY month;


SELECT c.loyalty_tier, ROUND(AVG(s.recommend_score), 2) AS avg_recommend
FROM customers c
JOIN survey_responses s ON c.customer_id = s.customer_id
GROUP BY c.loyalty_tier
ORDER BY avg_recommend DESC;



SELECT p.category, COUNT(*) AS total_reviews
FROM customer_reviews cr
JOIN products p ON cr.product_id = p.product_id
GROUP BY p.category
ORDER BY total_reviews DESC;
