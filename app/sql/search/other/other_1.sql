SELECT titleh, ROUND(ABS(avg_hscore - avg_lscore),4) diff,avg_hscore,avg_lscore
FROM
((SELECT anime_h.title titleh,anime_h.anime_id,AVG(animelist_h.my_score) avg_hscore, COUNT(*) cnth
  FROM 
	((SELECT username,stats_mean_score
	  FROM UserList9
	  WHERE stats_mean_score >= 8) high_user
	  LEFT OUTER JOIN
	 (SELECT username,anime_id,my_score
	  FROM animelist_cleaned
	  WHERE my_score > 0) animelist_h
	  ON animelist_h.username = high_user.username
	  LEFT OUTER JOIN
	 (SELECT MAL_ID anime_id,Japanese_name title
	  FROM anime) anime_h
	  ON anime_h.anime_id = animelist_h.anime_id)
  GROUP BY anime_h.anime_id
  HAVING cnth >= 1000) high

  LEFT OUTER JOIN

 (SELECT anime_l.title titlel,anime_l.anime_id,AVG(animelist_l.my_score) avg_lscore, COUNT(*) cntl
  FROM 
	 ((SELECT username,stats_mean_score
	   FROM UserList9
	   WHERE stats_mean_score <= 3
	   AND stats_mean_score > 0) low_user
	   LEFT OUTER JOIN
	  (SELECT username,anime_id,my_score
	   FROM animelist_cleaned
	   WHERE my_score > 0) animelist_l
	   ON animelist_l.username = low_user.username
	   LEFT OUTER JOIN
	  (SELECT MAL_ID anime_id,Japanese_name title
	   FROM anime) anime_l
	   ON anime_l.anime_id = animelist_l.anime_id)
  GROUP BY anime_l.anime_id
  HAVING cntl >= 1000) low

  ON high.anime_id = low.anime_id)

WHERE ABS(avg_hscore - avg_lscore) >= 1.5
ORDER BY diff DESC
LIMIT 10;