# 依照集數多寡分類 input = 集數 output = 排名前十

-- WITH tmp AS (
-- SELECT anime_id, title, score, episodes, ROW_NUMBER() OVER (PARTITION BY episodes ORDER BY score DESC) row_num
-- FROM anime_cleaned
-- )
-- SELECT anime_id, title, score, episodes
-- FROM tmp
-- WHERE row_num <= 10 AND episodes = 5
-- ORDER BY episodes;


WITH tmp AS (
SELECT MAL_ID, NAME, Score, Episodes, ROW_NUMBER() OVER (PARTITION BY episodes ORDER BY score DESC) row_num
FROM anime
)
SELECT NAME, Score
FROM tmp
WHERE row_num <= 100 AND Episodes = 5
ORDER BY Score DESC;
