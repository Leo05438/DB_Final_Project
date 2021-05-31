
WITH user AS (
WITH tmp AS (
SELECT now() AS today, username, birth_date, year( from_days( datediff( now(), birth_date ))) AS age
FROM users_cleaned 
)
SELECT now() AS today, username, birth_date, year( from_days( datediff( now(), birth_date ))) AS age
FROM tmp
WHERE age = 18
)
SELECT anime.Name, ROUND(AVG(score), 3) AS avg_score
FROM (animelist_cleaned
LEFT OUTER JOIN user
ON animelist_cleaned.username = user.username) 
LEFT OUTER JOIN anime
ON anime.MAL_ID = animelist_cleaned.anime_id
WHERE anime.Genders LIKE "%Comedy%"
GROUP BY anime.Name
ORDER BY avg_score DESC
LIMIT 100;

