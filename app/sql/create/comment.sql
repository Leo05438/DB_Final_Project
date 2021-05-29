CREATE TABLE comment(
	username varchar(100),
	anime_id int,
	anime_name varchar(100),
	episodes int,
	start_date date,
	finish_date date,
	score float,
	status int,
	rewatching int,
	rewatching_ep int,
  last_updated_9 int,
	last_updated_c datetime,
	tags varchar(1000),
  PRIMARY KEY(username,anime_id)
);
