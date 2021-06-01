SELECT title_japanese name,Score
FROM AnimeList9
WHERE opening_theme LIKE "%Aimer%"
OR ending_theme LIKE "%Aimer%"
ORDER BY Score DESC;
