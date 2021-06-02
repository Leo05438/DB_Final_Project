-- SELECT year,Japanese_name,Score
-- FROM
-- (
SELECT jc.YEAR,jc.Japanese_name,jc.Score
FROM
(SELECT Japanese_name,Score, "1987" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%1987%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%1987%")
UNION ALL
SELECT Japanese_name,Score, "1988" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%1988%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%1988%")
UNION ALL
SELECT Japanese_name,Score,"1989" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%1989%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%1989%")
UNION ALL
SELECT Japanese_name,Score,"1990" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%1990%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%1990%")
UNION ALL
SELECT Japanese_name,Score,"1991" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%1991%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%1991%")
UNION ALL
SELECT Japanese_name,Score,"1992" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%1992%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%1992%")
UNION ALL
SELECT Japanese_name,Score,"1993" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%1993%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%1993%")
UNION ALL
SELECT Japanese_name,Score,"1994" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%1994%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%1994%")
UNION ALL
SELECT Japanese_name,Score,"1995" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%1995%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%1995%")
UNION ALL
SELECT Japanese_name,Score,"1996" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%1996%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%1996%")
UNION ALL
SELECT Japanese_name,Score,"1997" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%1997%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%1997%")
UNION ALL
SELECT Japanese_name,Score,"1998" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%1998%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%1998%")
UNION ALL
SELECT Japanese_name,Score,"1999" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%1999%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%1999%")
UNION ALL
SELECT Japanese_name,Score,"2000" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2000%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%2000%")
UNION ALL
SELECT Japanese_name,Score,"2001" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2001%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%2001%")
UNION ALL
SELECT Japanese_name,Score,"2002" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2002%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%2002%")
UNION ALL
SELECT Japanese_name,Score,"2003" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2003%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%2003%")
UNION ALL
SELECT Japanese_name,Score,"2004" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2004%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%2004%")
UNION ALL
SELECT Japanese_name,Score,"2005" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2005%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%2005%")
UNION ALL
SELECT Japanese_name,Score,"2006" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2006%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%2006%")
UNION ALL
SELECT Japanese_name,Score,"2007" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2007%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%2007%")
UNION ALL
SELECT Japanese_name,Score,"2008" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2008%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%2008%")
UNION ALL
SELECT Japanese_name,Score,"2009" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2009%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%2009%")
UNION ALL
SELECT Japanese_name,Score,"2010" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2010%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%2010%")
UNION ALL
SELECT Japanese_name,Score,"2011" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2011%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%2011%")
UNION ALL
SELECT Japanese_name,Score,"2012" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2012%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%2012%")
UNION ALL
SELECT Japanese_name,Score,"2013" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2013%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%2013%")
UNION ALL
SELECT Japanese_name,Score,"2014" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2014%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%2014%")
UNION ALL
SELECT Japanese_name,Score,"2015" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2015%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%2015%")
UNION ALL
SELECT Japanese_name,Score,"2016" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2016%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%2016%")
UNION ALL
SELECT Japanese_name,Score, "2017" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2017%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%2017%")
UNION ALL
SELECT Japanese_name,Score, "2018" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2018%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%2018%")
UNION ALL
SELECT Japanese_name,Score, "2019" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2019%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%2019%")
UNION ALL
SELECT Japanese_name,Score, "2020" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2020%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%2020%")
UNION ALL
SELECT Japanese_name,Score, "2021" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2021%"
AND Score = (SELECT MAX(Score)
    FROM anime
    WHERE Studios LIKE "%Mappa%"
    AND Aired Like "%2021%")) jc;
-- ) jc_staff
-- ORDER BY Score DESC;