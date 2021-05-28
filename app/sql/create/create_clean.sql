# Database name = finalProject

CREATE TABLE anime_cleaned(
	anime_id INT,
	title varchar(1000),
	title_english varchar(1000),
	title_japanese varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci,
	title_synonyms varchar(1000),
	image_url varchar(1000),
	type varchar(30),
	source varchar(50),
	episodes int,
	status varchar(50),
	airing varchar(30),
	aired_string varchar(100),
	aired varchar(100),
	duration varchar(30),
	rating varchar(50),
	score float,
	score_by int, 
	`rank` int,
	popularity int,
	members int,
	favorites int,
	background TEXT,
	premiered varchar(50),
	broadcast varchar(100),
	related TEXT,
	producer varchar(500),
	licensor varchar(100),
	studio varchar(100),
	genre varchar(1000),
	opening_theme TEXT CHARACTER SET utf8 COLLATE utf8_general_ci,
	ending_theme TEXT CHARACTER SET utf8 COLLATE utf8_general_ci,
	duration_min FLOAT,
	aired_from_year FLOAT,
	primary key(anime_id)
);

CREATE TABLE animelist_cleaned(
	username varchar(100),
	anime_id INT,
	my_watch_episodes int,
	my_start_date date,
	my_finish_date date,
	my_score float,
	my_status int,
	my_rewatching int,
	my_rewatching_ep int,
	my_last_updated datetime,
	my_tags varchar(1000)
);

id BIGINT AUTO_INCREMENT,
primary key(id)

CREATE TABLE users_cleaned(
	username varchar(100),
	user_id INT,
	user_watching int,
	user_completed int,
	user_onhold int,
	user_dropped int,
	user_plantowatch int,
	user_days_spent_watching float,
	gender varchar(10),
	location varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci,
	birth_date varchar(100),
	access_rank varchar(10),
	join_date date,
	last_online varchar(100),
	stats_mean_score float,
	stats_rewatched int,
	stats_episodes int,
	primary key(username)
);