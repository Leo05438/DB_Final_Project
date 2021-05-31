SELECT Japanese_name,Score
FROM anime
WHERE Source LIKE "Original"
AND Score - 1.5 > (SELECT AVG(Score)
			 FROM anime
			 WHERE Source LIKE "Light novel"
	   	 	 OR Source LIKE "Manga")
ORDER BY Score DESC
LIMIT 20;