SELECT (@cnt := @cnt + 1) year,title_japanese 1990to1999
FROM AnimeList9
CROSS JOIN (SELECT @cnt := 0) dummy
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