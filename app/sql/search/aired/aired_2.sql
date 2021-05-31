SELECT AVG(score) 1990to2009
FROM AnimeList9
WHERE premiered LIKE "%200%" OR "%199"
ORDER BY score DESC;

SELECT AVG(score) 2010to2019
FROM AnimeList9
WHERE premiered LIKE "%201%"
ORDER BY score DESC;