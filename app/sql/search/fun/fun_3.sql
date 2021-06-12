SELECT Name,Score,Aired
FROM anime
WHERE Name LIKE "%evangelion%"
AND Aired LIKE "%19%";

SELECT Japanese_Name,Aired,Score
FROM anime
WHERE (Aired LIKE "%199%"
OR Aired LIKE "%198%"
OR Aired LIKE "%197%"
OR Aired LIKE "%196%"
OR Aired LIKE "%195%"
OR Aired LIKE "%194%"
OR Aired LIKE "%193%"
OR Aired LIKE "%192%"
OR Aired LIKE "%191%")
AND Score >= 8.32
ORDER BY Score DESC;
-- = (SELECT Max(Score)
-- FROM anime
-- WHERE Aired LIKE "%1995%");