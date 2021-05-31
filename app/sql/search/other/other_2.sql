SELECT anime_name.Japanese_name,(anime_tot.high - anime_tot.low) diff,anime_name.Score 
FROM 
(SELECT MAL_ID anime_id,Japanese_name,Name,Score
FROM anime) anime_name LEFT OUTER JOIN
(SELECT (Score_10 + Score_9 + Score_8) high,(Score_7 + Score_6 + Score_5 + Score_4) mid,
(Score_3 + Score_2 + Score_1) low,(Score_10 + Score_9 + Score_8 + Score_7 + Score_6 + Score_5 + Score_4 + Score_3 + Score_2 + Score_1) total,
MAL_ID anime_id
FROM anime) anime_tot
ON anime_tot.anime_id = anime_name.anime_id
ORDER BY diff DESC
LIMIT 10;