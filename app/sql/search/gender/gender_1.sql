SELECT COUNT(*)
FROM  
	 (SELECT username,anime_id
	  FROM animelist_cleaned) animelist_clean LEFT OUTER JOIN
	 (SELECT username,gender
	  FROM users_cleaned
	  WHERE gender LIKE "male") user_clean
	 ON user_clean.username = animelist_clean.username
	 LEFT OUTER JOIN (SELECT anime_id,genre FROM AnimeList9 WHERE genre LIKE "%Cars%") Anime
	 ON animelist_clean.anime_id = Anime.anime_id
WHERE genre IS NOT NULL;

SELECT COUNT(*)
FROM  
	 (SELECT username,anime_id
	  FROM animelist_cleaned) animelist_clean LEFT OUTER JOIN
	 (SELECT username,gender
	  FROM users_cleaned
	  WHERE gender LIKE "female") user_clean
	 ON user_clean.username = animelist_clean.username
	 LEFT OUTER JOIN (SELECT anime_id,genre FROM AnimeList9 WHERE genre LIKE "%Cars%") Anime
	 ON animelist_clean.anime_id = Anime.anime_id;
WHERE genre IS NOT NULL;