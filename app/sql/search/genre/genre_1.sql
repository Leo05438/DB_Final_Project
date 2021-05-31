SELECT Japanese_name AS Action,Score
FROM anime
WHERE Genders like '%Action%' 
ORDER BY Score DESC 
LIMIT 10;

SELECT Japanese_name AS Adventure,Score
FROM anime
WHERE Genders like '%Adventure%' 
ORDER BY Score DESC 
LIMIT 10;

SELECT Japanese_name AS Cars,Score
FROM anime
WHERE Genders like '%Cars%'
ORDER BY Score DESC 
LIMIT 10;