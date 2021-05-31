
-- SELECT "季番" AS TYPE, ROUND(AVG(score), 3) AS avg_score
-- FROM anime_cleaned
-- WHERE episodes >= 10 AND episodes <= 14
-- UNION
-- SELECT "半年番" AS TYPE, ROUND(AVG(score), 3) AS avg_score
-- FROM anime_cleaned
-- WHERE episodes >= 20 AND episodes <= 28
-- UNION
-- SELECT "年番" AS TYPE, ROUND(AVG(score), 3) AS avg_score 
-- FROM anime_cleaned
-- WHERE episodes >= 50 AND episodes <= 64;


SELECT "季番" AS TYPE, ROUND(AVG(Score), 3) AS avg_score
FROM anime
WHERE Episodes >= 10 AND Episodes <= 14
UNION
SELECT "半年番" AS TYPE, ROUND(AVG(Score), 3) AS avg_score
FROM anime
WHERE Episodes >= 20 AND Episodes <= 28
UNION
SELECT "年番" AS TYPE, ROUND(AVG(Score), 3) AS avg_score 
FROM anime
WHERE Episodes >= 50 AND Episodes <= 64;