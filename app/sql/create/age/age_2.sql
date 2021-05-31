
WITH tmp AS (
SELECT now() AS today, username, stats_mean_score, year( from_days( datediff( now(), birth_date ))) AS age
FROM users_cleaned 
)
SELECT ROUND(AVG(stats_mean_score), 3) AS avg_score 
FROM tmp
WHERE age >= 18 AND age <= 28;

