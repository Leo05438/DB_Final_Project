
SELECT Studios, ROUND(AVG(Score), 3) AS avg_score
FROM anime
GROUP BY Studios
ORDER BY avg_score DESC
LIMIT 100;