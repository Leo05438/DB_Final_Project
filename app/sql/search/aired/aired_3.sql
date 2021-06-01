-- Spring
SELECT Japanese_name name,Score
FROM anime
WHERE Aired LIKE "%2012%"
AND (Aired LIKE "Jan%"
OR Aired LIKE "Feb%"
OR Aired LIKE "Mar%")
ORDER BY Score DESC
LIMIT 10;
-- Summer
SELECT Japanese_name,Score
FROM anime
WHERE Aired LIKE "%2012%"
AND (Aired LIKE "Apr%"
OR Aired LIKE "May%"
OR Aired LIKE "Jun%")
ORDER BY Score DESC
LIMIT 10;
-- Autumn
SELECT Japanese_name,Score
FROM anime
WHERE Aired LIKE "%2012%"
AND (Aired LIKE "Jul%"
OR Aired LIKE "Aug%"
OR Aired LIKE "Sep%")
ORDER BY Score DESC
LIMIT 10;
-- Winter
SELECT Japanese_name,Score
FROM anime
WHERE Aired LIKE "%2012%"
AND (Aired LIKE "Oct%"
OR Aired LIKE "Nov%"
OR Aired LIKE "Dec%")
ORDER BY Score DESC
LIMIT 10;
