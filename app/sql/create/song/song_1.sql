SELECT title_japanese,Score
FROM AnimeList9
WHERE opening_theme LIKE "%Aimer%"
OR ending_theme LIKE "%Aimer%"
ORDER BY Score DESC;