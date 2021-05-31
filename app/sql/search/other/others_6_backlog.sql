WITH tmp AS (
SELECT AVG(user_completed) + 1.25 * STD(user_completed) AS cp, AVG(user_dropped) + 1.25 * STD(user_dropped) AS dp, AVG(stats_mean_score) + 1.25 * STD(stats_mean_score) AS scr_c, AVG(stats_mean_score) - 1.25 * STD(stats_mean_score) AS scr_d
FROM users_cleaned
),
tmp_a AS (
SELECT MAL_ID, Score, Members FROM anime WHERE Name = "One Piece"
),
tmp_c AS (
SELECT username FROM users_cleaned WHERE username IN (
SELECT username FROM users_cleaned, tmp WHERE user_completed > tmp.cp AND stats_mean_score > tmp.scr_c
)
),
tmp_d AS (
SELECT username, user_dropped, stats_mean_score FROM users_cleaned WHERE username IN (
SELECT username FROM users_cleaned, tmp WHERE user_dropped > tmp.dp AND stats_mean_score < tmp.scr_d
)
),
tmp_backlog AS (
SELECT SUM(t.cnt) AS cnt, SUM(t.tt) AS tt
FROM (
SELECT COUNT(anime_id) AS cnt, SUM(my_score) AS tt FROM animelist_cleaned, tmp_a WHERE anime_id = tmp_a.MAL_ID AND my_score != 0 AND username IN (
SELECT username FROM tmp_c
)
UNION ALL
SELECT COUNT(anime_id) AS cnt, SUM(my_score) AS tt FROM animelist_cleaned, tmp_a WHERE anime_id = tmp_a.MAL_ID AND my_score != 0 AND username IN (
SELECT username FROM tmp_d
)
) AS t
)
SELECT Score, ROUND((Score*Members - cnt*tt)/(Members-tt), 3) AS backlog_score FROM tmp_a, tmp_backlog;
