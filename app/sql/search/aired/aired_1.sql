SELECT title_japanese name,score
FROM AnimeList9
WHERE premiered LIKE "%199%"
ORDER BY score DESC
LIMIT 10;

SELECT title_japanese 2000to2009
FROM AnimeList9
WHERE premiered LIKE "%200%"
ORDER BY score DESC
LIMIT 10;

SELECT title_japanese 2010to2019
FROM AnimeList9
WHERE premiered LIKE "%201%"
ORDER BY score DESC
LIMIT 10;

SELECT title_japanese 2020toNow
FROM AnimeList9
WHERE premiered LIKE "%202%"
ORDER BY score DESC
LIMIT 10;
