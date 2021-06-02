-- SELECT year,score,members,ranked
-- FROM
-- (
SELECT jc.YEAR,jc.score,jc.members,jc.ranked
FROM
(SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"1987" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%1987%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"1988" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%1988%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"1989" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%1989%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"1990" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%1990%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"1991" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%1991%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"1992" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%1992%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"1993" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%1993%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"1994" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%1994%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"1995" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%1995%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"1996" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%1996%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"1997" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%1997%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"1998" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%1998%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"1999" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%1999%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"2000" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2000%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"2001" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2001%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"2002" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2002%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"2003" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2003%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"2004" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2004%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"2005" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2005%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"2006" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2006%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"2007" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2007%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"2008" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2008%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"2009" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2009%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"2010" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2010%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"2011" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2011%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"2012" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2012%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"2013" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2013%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"2014" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2014%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"2015" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2015%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"2016" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2016%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"2017" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2017%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"2018" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2018%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"2019" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2019%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"2020" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2020%"
UNION ALL
SELECT ROUND(AVG(Score),4) score,ROUND(AVG(Members),4) members,ROUND(AVG(Ranked),4) ranked,"2021" YEAR
FROM anime
WHERE Studios LIKE "%Mappa%"
AND Aired LIKE "%2021%") jc;
-- )jc_staff
-- ORDER BY score DESC;