SELECT Name,Score,Aired
FROM anime
WHERE Name LIKE "%evangelion%"
AND Aired LIKE "%19%";

SELECT Name,Score
FROM anime
WHERE Aired LIKE "%1997%"
AND Score >= 8.32;
-- = (SELECT Max(Score)
-- FROM anime
-- WHERE Aired LIKE "%1995%");