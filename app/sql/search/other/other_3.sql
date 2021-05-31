SELECT ROUND(AVG(old_lovers.avg_score_for_new),4) avg
FROM
(SELECT old_lover.username,AVG(animelist_all.my_score) avg_score_for_new
FROM 

((SELECT MAL_ID anime_id,japanese_name
FROM anime
WHERE aired LIKE "%2017%"
OR aired LIKE "%2018%"
OR aired LIKE "%2019%"
OR aired LIKE "%202%") new_anime

LEFT OUTER JOIN

(SELECT username,anime_id,my_score
FROM animelist_cleaned
WHERE my_score > 0) animelist_all

ON new_anime.anime_id = animelist_all.anime_id

LEFT OUTER JOIN

(SELECT adult.username,adult.completed,COUNT(*) cnt
FROM ((SELECT username,anime_id,my_score
FROM animelist_cleaned
WHERE my_score >= 8) animelist_4
LEFT OUTER JOIN
(SELECT username,user_completed completed
FROM users_cleaned
WHERE TIMESTAMPDIFF(YEAR,birth_date,"2021-05-29 21:34:00") >= 18) adult
ON adult.username = animelist_4.username
LEFT OUTER JOIN
(SELECT Japanese_name title,MAL_ID anime_id
FROM anime
WHERE aired LIKE "%2010%"
OR aired LIKE "%2011%"
OR aired LIKE "%2012%"
OR aired LIKE "200%"
OR (aired LIKE "%19%"
	AND aired NOT LIKE "%2019%")) old_anime
ON old_anime.anime_id = animelist_4.anime_id)
GROUP BY adult.username
HAVING (cnt / adult.completed) >= 0.5) old_lover

ON animelist_all.username = old_lover.username)

GROUP BY old_lover.username) old_lovers;