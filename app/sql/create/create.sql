CREATE TABLE anime(
	MAL_ID INT,
	Name VARCHAR(1000),
	Score FLOAT,
	Genders VARCHAR(1000),
	English_name VARCHAR(1000),
	Japanese_name VARCHAR(100),
	Type VARCHAR(100),
	Episodes INT,
	Aired VARCHAR(100),
	Premiered VARCHAR(50),
	Producers VARCHAR(500),
	Licnesors VARCHAR(500),
	Studios VARCHAR(100),
	Source VARCHAR(100),
	Duration VARCHAR(100),
	Rating VARCHAR(100),
	Ranked INT,
	Popularity INT,
	Members INT,
	Favorites INT,
	Watching INT,
	Completed INT,
	On_Hold INT,
	Dropped INT,
	Plan_to_Watch INT,
	Score_10 INT,
	Score_9 INT,
	Score_8 INT,
	Score_7 INT,
	Score_6 INT,
	Score_5 INT,
	Score_4 INT,
	Score_3 INT,
	Score_2 INT,
	Score_1 INT,
	PRIMARY KEY(MAL_ID)
);

CREATE TABLE animelist(/**/
	user_id INT,
	anime_id INT,
	score FLOAT,
	watching_status INT,
	watched_episodes INT,
	PRIMARY KEY(user_id,anime_id)
);

CREATE TABLE watching_status(
	status INT,
	description VARCHAR(50),
	PRIMARY KEY(status)
);
