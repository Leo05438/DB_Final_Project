SELECT user_male.male_mean,user_female.female_mean
FROM

(SELECT AVG(stats_mean_score) male_mean
FROM users_cleaned
WHERE gender LIKE "male") user_male,

(SELECT AVG(stats_mean_score) female_mean
FROM users_cleaned
WHERE gender LIKE "female") user_female;