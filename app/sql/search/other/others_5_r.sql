-- r
WITH Av AS (
SELECT AVG(Score) AS avg_1, AVG(Completed/Members) AS avg_2, 
STDDEV_SAMP(Score) * STDDEV_SAMP(Completed/Members) AS std1, COUNT(*) AS N
FROM anime
)
SELECT ROUND(SUM((Score - avg_1)*(Completed/Members - avg_2)/((N - 1) * std1)), 5) AS r
FROM Av, anime;


-- WITH Av AS (
-- SELECT ROUND(AVG(Score),3) AS avg_scr, ROUND(AVG(Completed/Members),3) AS avg_cpl, ROUND(AVG(Dropped/Members),3) AS avg_drp,
-- ROUND(STDDEV_SAMP(Score) * STDDEV_SAMP(Completed/Members),3) AS std1, ROUND(STDDEV_SAMP(Score),3) * ROUND(STDDEV_SAMP(Dropped/Members),3) AS std2, COUNT(*) AS N
-- FROM anime
-- )
-- SELECT SUM((Score - avg_scr)*(Completed/Members - avg_cpl)/((N - 1) * std1)) AS r1, SUM((Score - avg_scr)*(Dropped/Members - avg_drp)/((N - 1) * std2)) AS r2
-- FROM Av, anime


-- WITH tmp AS (
-- SELECT @ascr := ROUND(AVG(Score),3), @acpl := ROUND(AVG(Completed/Members),3), @adrp := ROUND(AVG(Dropped),3),
-- @stdsc := ROUND(STDDEV_SAMP(Score),3) * ROUND(STDDEV_SAMP(Completed/Members),3), @stdsd := ROUND(STDDEV_SAMP(Score),3) * ROUND(STDDEV_SAMP(Dropped),3),
-- @n := COUNT(*)
-- FROM anime
-- )
-- SELECT SUM((Score - @ascr)*((Completed/Members) - @acpl)/((@n - 1)*@stdsc)) AS r
-- FROM anime, tmp
