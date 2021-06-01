SELECT high_score.title_japanese,high_score.anime_score,high_score.user_age
FROM
(SELECT animelist.title_japanese,AVG(animelist_clean.my_score) anime_score,AVG(users.age) user_age
FROM
(SELECT anime_id,username,my_score
FROM animelist_cleaned
WHERE my_score > 0) animelist_clean LEFT OUTER JOIN
(SELECT anime_id,title_japanese,score
FROM AnimeList9) animelist
ON animelist_clean.anime_id = animelist.anime_id
LEFT OUTER JOIN
(SELECT username,TIMESTAMPDIFF(YEAR,birth_date,NOW()) age
FROM users_cleaned) users
ON users.username = animelist_clean.username
WHERE animelist.score <= 8
GROUP BY animelist_clean.anime_id) high_score
ORDER BY high_score.anime_score DESC
LIMIT 10;

SELECT high_score.title_japanese,high_score.anime_score
FROM
(SELECT animelist.title_japanese,AVG(animelist_clean.my_score) anime_score
FROM
(SELECT anime_id,username,my_score
FROM animelist_cleaned
WHERE my_score > 0) animelist_clean LEFT OUTER JOIN
(SELECT anime_id,title_japanese,score
FROM AnimeList9) animelist
ON animelist_clean.anime_id = animelist.anime_id
LEFT OUTER JOIN
(SELECT username,birth_date
FROM users_cleaned) users
ON users.username = animelist_clean.username
WHERE TIMESTAMPDIFF(YEAR,users.birth_date,NOW()) > 20
AND animelist.score > 8
GROUP BY animelist_clean.anime_id) high_score
ORDER BY high_score.anime_score DESC
LIMIT 50;
