WITH tmp AS (
SELECT AVG(Dropped/Members) + 0.85 * STD(Dropped/Members) AS n1, AVG(Score) + 0.85 * STD(Score) AS n2
FROM anime
)
SELECT Name, Dropped/Members, Score
FROM anime, tmp
WHERE Dropped/Members > tmp.n1 AND Score > tmp.n2
ORDER BY Score DESC, Dropped/Members DESC
LIMIT 10;


WITH tmp AS (
SELECT AVG(Completed/Members) + 0.85 * STD(Completed/Members) AS n1, AVG(Score) + 0.85 * STD(Score) AS n2
FROM anime
)
SELECT Name, Completed/Members, Score
FROM anime, tmp
WHERE Completed/Members > tmp.n1 AND Score < tmp.n2
ORDER BY Score DESC, Completed/Members DESC
LIMIT 10;


-- SELECT Name, Score, Favorites/Members
-- FROM anime
-- WHERE Favorites/Members > 0.029 AND Score < 7.2
-- ORDER BY Score DESC, Favorites/Members DESC
-- LIMIT 10;

-- SELECT AVG(Favorites/Members) + 0.85 * STD(Favorites/Members), AVG(Score) + 0.85 * STD(Score)
-- FROM anime