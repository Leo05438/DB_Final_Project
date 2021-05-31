SELECT AVG(animelist_specific.my_score) avg_score_10 ,AVG(users.age) age
FROM 
((SELECT username,TIMESTAMPDIFF(YEAR,birth_date,NOW()) age
FROM users_cleaned
WHERE TIMESTAMPDIFF(YEAR,birth_date,NOW()) <= 20) users

LEFT OUTER JOIN

(SELECT username,anime_id,my_score
FROM animelist_cleaned
WHERE my_score > 0) animelist_specific
ON users.username = animelist_specific.username

LEFT OUTER JOIN

(SELECT MAL_ID anime_id,Name
FROM anime
WHERE Name LIKE "Air") one_anime
ON one_anime.anime_id = animelist_specific.anime_id)

UNION

SELECT AVG(animelist_specific.my_score) avg_score_20,AVG(users.age) age
FROM 
((SELECT username,TIMESTAMPDIFF(YEAR,birth_date,NOW()) age
FROM users_cleaned
WHERE TIMESTAMPDIFF(YEAR,birth_date,NOW()) > 20
AND TIMESTAMPDIFF(YEAR,birth_date,NOW()) <= 30) users

LEFT OUTER JOIN

(SELECT username,anime_id,my_score
FROM animelist_cleaned
WHERE my_score > 0) animelist_specific
ON users.username = animelist_specific.username

LEFT OUTER JOIN

(SELECT MAL_ID anime_id,Name
FROM anime
WHERE Name LIKE "Air") one_anime
ON one_anime.anime_id = animelist_specific.anime_id)

UNION

SELECT AVG(animelist_specific.my_score) avg_score_30,AVG(users.age) age
FROM 
((SELECT username,TIMESTAMPDIFF(YEAR,birth_date,NOW()) age
FROM users_cleaned
WHERE TIMESTAMPDIFF(YEAR,birth_date,NOW()) > 30
AND TIMESTAMPDIFF(YEAR,birth_date,NOW()) <= 40) users

LEFT OUTER JOIN

(SELECT username,anime_id,my_score
FROM animelist_cleaned
WHERE my_score > 0) animelist_specific
ON users.username = animelist_specific.username

LEFT OUTER JOIN

(SELECT MAL_ID anime_id,Name
FROM anime
WHERE Name LIKE "Air") one_anime
ON one_anime.anime_id = animelist_specific.anime_id)

UNION

SELECT AVG(animelist_specific.my_score) avg_score_40,AVG(users.age) age
FROM 
((SELECT username,TIMESTAMPDIFF(YEAR,birth_date,NOW()) age
FROM users_cleaned
WHERE TIMESTAMPDIFF(YEAR,birth_date,NOW()) > 40
AND TIMESTAMPDIFF(YEAR,birth_date,NOW()) <= 50) users

LEFT OUTER JOIN

(SELECT username,anime_id,my_score
FROM animelist_cleaned
WHERE my_score > 0) animelist_specific
ON users.username = animelist_specific.username

LEFT OUTER JOIN

(SELECT MAL_ID anime_id,Name
FROM anime
WHERE Name LIKE "Air") one_anime
ON one_anime.anime_id = animelist_specific.anime_id)

UNION

SELECT AVG(animelist_specific.my_score) avg_score_50, AVG(users.age) age
FROM 
((SELECT username,TIMESTAMPDIFF(YEAR,birth_date,NOW()) age
FROM users_cleaned
WHERE TIMESTAMPDIFF(YEAR,birth_date,NOW()) >= 50) users

LEFT OUTER JOIN

(SELECT username,anime_id,my_score
FROM animelist_cleaned
WHERE my_score > 0) animelist_specific
ON users.username = animelist_specific.username

LEFT OUTER JOIN

(SELECT MAL_ID anime_id,Name
FROM anime
WHERE Name LIKE "Air") one_anime
ON one_anime.anime_id = animelist_specific.anime_id);