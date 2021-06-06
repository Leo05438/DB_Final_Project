
WITH tmp4 AS (
WITH tmp3 AS (
WITH tmp2 AS (
WITH tmp1 AS (
WITH tmp AS (
WITH t AS (
SELECT anime_id
FROM comment
WHERE username = "a"
ORDER BY score DESC
LIMIT 10
)
SELECT Genders
FROM anime
WHERE MAL_id IN (
SELECT anime_id FROM t
)
)
SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(tmp.Genders,',', b.help_topic_id + 1),',',-1) AS TYPE
FROM tmp
JOIN
mysql.help_topic b
ON b.help_topic_id < (LENGTH(tmp.Genders) - LENGTH(REPLACE(tmp.Genders,',','')) + 1)
)
SELECT TYPE, COUNT(TYPE) AS CNT
FROM tmp1
GROUP BY TYPE
ORDER BY CNT DESC
LIMIT 7
)
SELECT MAL_ID, Score, Genders, tmp2.TYPE, tmp2.CNT AS CNT
FROM anime, tmp2
WHERE Genders LIKE CONCAT("%",tmp2.TYPE,"%") AND Score > 3
)
SELECT MAL_ID, Score * SUM(CNT) AS S
FROM tmp3
GROUP BY MAL_ID
ORDER BY S DESC
LIMIT 100
)
SELECT anime.Japanese_name, anime.Genders, anime.Score
FROM anime, tmp4
WHERE anime.MAL_ID = tmp4.MAL_ID



-- WITH tmp3 AS (
-- WITH tmp2 AS (
-- WITH tmp1 AS (
-- WITH tmp AS (
-- SELECT genre
-- FROM anime_cleaned
-- WHERE anime_id IN (
-- SELECT anime_id
-- FROM animelist_cleaned
-- WHERE username = "_Clow"
-- AND my_score > 7
-- )
-- )
-- SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(tmp.genre,',', b.help_topic_id + 1),',',-1) AS TYPE
-- FROM tmp
-- JOIN
-- mysql.help_topic b
-- ON b.help_topic_id < (LENGTH(tmp.genre) - LENGTH(REPLACE(tmp.genre,',','')) + 1)
-- )
-- SELECT TYPE, COUNT(TYPE) AS CNT
-- FROM tmp1
-- GROUP BY TYPE
-- ORDER BY CNT DESC
-- LIMIT 7
-- )
-- SELECT MAL_ID, Score, Genders, tmp2.TYPE, tmp2.CNT AS CNT
-- FROM anime, tmp2
-- WHERE Genders LIKE CONCAT("%",tmp2.TYPE,"%") AND Score > 3
-- )
-- SELECT MAL_ID, Score * SUM(CNT) AS S
-- FROM tmp3
-- GROUP BY MAL_ID
-- ORDER BY S DESC
-- LIMIT 100
