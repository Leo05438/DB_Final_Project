SELECT (@cnt := @cnt + 1) year,yy.cnt
FROM
(SELECT COUNT(*) cnt
FROM anime
WHERE Source LIKE "%Light%"
AND Aired LIKE "%2001%"

UNION

SELECT COUNT(*) cnt
FROM anime
WHERE Source LIKE "%Light%"
AND Aired LIKE "%2002%"

UNION

SELECT COUNT(*) cnt
FROM anime
WHERE Source LIKE "%Light%"
AND Aired LIKE "%2003%"

UNION

SELECT COUNT(*) cnt
FROM anime
WHERE Source LIKE "%Light%"
AND Aired LIKE "%2004%"

UNION

SELECT COUNT(*) cnt
FROM anime
WHERE Source LIKE "%Light%"
AND Aired LIKE "%2005%"

UNION

SELECT COUNT(*) cnt
FROM anime
WHERE Source LIKE "%Light%"
AND Aired LIKE "%2006%"

UNION

SELECT COUNT(*) cnt
FROM anime
WHERE Source LIKE "%Light%"
AND Aired LIKE "%2007%"

UNION

SELECT COUNT(*) cnt
FROM anime
WHERE Source LIKE "%Light%"
AND Aired LIKE "%2008%"

UNION

SELECT COUNT(*) cnt
FROM anime
WHERE Source LIKE "%Light%"
AND Aired LIKE "%2009%"

UNION

SELECT COUNT(*) cnt
FROM anime
WHERE Source LIKE "%Light%"
AND Aired LIKE "%2010%"

UNION

SELECT COUNT(*) cnt
FROM anime
WHERE Source LIKE "%Light%"
AND Aired LIKE "%2011%") as yy
CROSS JOIN (SELECT @cnt := 2000) dummy;