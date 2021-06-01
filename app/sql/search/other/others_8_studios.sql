WITH tmp AS (
SELECT Studios, Premiered, COUNT(MAL_ID) AS cnt
FROM anime
WHERE Studios = "Sunrise" AND Premiered != "Unknown"
GROUP BY Premiered
ORDER BY Premiered, cnt DESC
),
tmp1 AS (
WITH t AS (
SELECT Premiered, Score, A.Studios
FROM anime A
WHERE A.Studios IN (
SELECT Studios FROM tmp
)
)
SELECT t.Premiered, AVG(t.Score) AS avg_scr
FROM t
GROUP BY t.Premiered
)
SELECT cnt, AVG(avg_scr) avg_score
FROM tmp, tmp1
WHERE tmp1.Premiered = tmp.Premiered
GROUP BY cnt
