SELECT count(*) action_cnt
FROM (SELECT Japanese_name,Score,Genders
FROM anime
ORDER BY Score DESC
LIMIT 100) top100
WHERE top100.Genders LIKE "%Action%";

SELECT count(*) adv_cnt
FROM (SELECT Japanese_name,Score,Genders
FROM anime
ORDER BY Score DESC
LIMIT 100) top100
WHERE top100.Genders LIKE "%Adventure%";

SELECT count(*) cars_cnt
FROM (SELECT Japanese_name,Score,Genders
FROM anime
ORDER BY Score DESC
LIMIT 100) top100
WHERE top100.Genders LIKE "%Cars%";

SELECT count(*) comedy_cnt
FROM (SELECT Japanese_name,Score,Genders
FROM anime
ORDER BY Score DESC
LIMIT 100) top100
WHERE top100.Genders LIKE "%Comedy%";

SELECT count(*) dementia_cnt
FROM (SELECT Japanese_name,Score,Genders
FROM anime
ORDER BY Score DESC
LIMIT 100) top100
WHERE top100.Genders LIKE "%Dementia%";

SELECT count(*) demon_cnt
FROM (SELECT Japanese_name,Score,Genders
FROM anime
ORDER BY Score DESC
LIMIT 100) top100
WHERE top100.Genders LIKE "%Demons%";

SELECT count(*) drama_cnt
FROM (SELECT Japanese_name,Score,Genders
FROM anime
ORDER BY Score DESC
LIMIT 100) top100
WHERE top100.Genders LIKE "%Drama%";