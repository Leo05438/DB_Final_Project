load data local infile './9/AnimeList.csv'
into table AnimeList9
CHARACTER SET utf8mb4
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines;

load data local infile './9/UserAnimeList.csv'
into table UserAnimeList9
CHARACTER SET utf8mb4
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines;

load data local infile './9/UserList.csv'
into table UserList9
CHARACTER SET utf8mb4
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 lines;