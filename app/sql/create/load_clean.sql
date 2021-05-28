load data local infile './9/anime_cleaned.csv'
into table anime_cleaned
CHARACTER SET utf8mb4
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines;

load data local infile './9/animelists_cleaned.csv'
into table animelist_cleaned
CHARACTER SET utf8mb4
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines;

load data local infile './9/users_cleaned.csv'
into table users_cleaned
CHARACTER SET utf8mb4
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 lines;