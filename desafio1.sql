DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plans(
    plan_id INT PRIMARY KEY AUTO_INCREMENT,
    plan_type VARCHAR(20) NOT NULL,
    plan_price DECIMAL(5,2) NOT NULL
) engine = InnoDB;

INSERT INTO SpotifyClone.plans(plan_type, plan_price) 
    VALUES 
        ('gratuito', 0),
        ('familiar', 7.99),
        ('universitário', 5.99),
        ('pessoal', 6.99);

CREATE TABLE SpotifyClone.users(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username CHAR(10) NOT NULL,
    user_age INT NOT NULL,
    created_in DATE NOT NULL,
    plan_type INT NOT NULL,
    FOREIGN KEY (plan_type) REFERENCES SpotifyClone.plans(plan_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.users(username, user_age, created_in, plan_type) 
    VALUES 
        ('Thati', 23, '2019-10-20', 1),
        ('Cintia', 35, '2017-12-30', 2),
        ('Bill', 20, '2019-06-05', 3),
        ('Roger', 45, '2020-05-13', 4),
        ('Norman', 58, '2017-02-17', 4),
        ('Patrick', 33, '2017-01-06', 2),
        ('Vivian', 26, '2018-01-05', 3),
        ('Carol', 19, '2018-02-14', 3),
        ('Angelina', 42, '2018-04-29', 2),
        ('Paul', 46, '2017-01-17', 2);

CREATE TABLE SpotifyClone.artists(
    artists_id INT PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(50) NOT NULL
) engine = InnoDB;

INSERT INTO SpotifyClone.artists (artist_name)
    VALUES
        ('Walter Phoenix'),
        ('Peter Strong'),
        ('Lance Day'),
        ('Freedie Shannon'),
        ('Tyler Isle'),
        ('Fog');

CREATE TABLE SpotifyClone.albums(
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_name VARCHAR(50) NOT NULL,
    album_release_date YEAR NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artists_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.albums (album_name, album_release_date, artist_id) 
    VALUES 
        ('Envious', '1990', 1),
        ('Exuberant', '1993', 1),
        ('Hallowed Steam', '1995', 2),
        ('Incandescent', '1998', 3),
        ('Temporary Culture', '2001', 4),
        ('Library of liberty', '2003', 4),
        ('Chained Down', '2007', 5),
        ('Cabinet of fools', '2012', 5),
        ('No guarantees', '2015', 5),
        ('Apparatus', '2015', 6);

CREATE TABLE SpotifyClone.songs(
    songs_id INT PRIMARY KEY AUTO_INCREMENT,
    song_name VARCHAR(50) NOT NULL,
    songs_duration DECIMAL(8,0) NOT NULL,
    artist_id INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artists_id),
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.albums(album_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.songs(song_name, songs_duration, artist_id, album_id) 
    VALUES 
        ("Soul For Us", 200, 1, 1),
        ("Reflections Of Magic", 163,  1, 1),
        ("Dance With Her Own", 116, 1, 1),
        ("Troubles Of My Inner Fire", 203, 1, 2),
        ("Time Fireworks", 152, 1, 2),
        ("Magic Circus", 105, 2, 3),
        ("Honey, So Do I", 207,  2, 3),
        ("Sweetie, Let's Go Wild", 139, 2, 3),
        ("She Knows", 244, 2, 3),
        ("Fantasy For Me", 100, 3, 4),
        ("Celebration Of More", 146,  3, 4),
        ("Rock His Everything", 223, 3, 4),
        ("Home Forever", 231, 3, 4),
        ("Diamond Power" , 241, 3, 4),
        ("Let's Be Silly", 132,  3, 4),
        ("Thang Of Thunder", 240, 4, 5),
        ("Words Of Her Life", 185,  4, 5),
        ("Without My Streets", 176, 4, 5),
        ("Need Of The Evening", 190, 4, 6),
        ("History Of My Roses", 222, 4, 6),
        ("Without My Love", 111, 4, 6),
        ("Walking And Game", 123, 4, 6),
        ("Young And Father", 197, 4, 6),
        ("Finding My Traditions", 179, 5, 7),
        ("Walking And Man", 229, 5, 7),
        ("Hard And Time", 135, 5, 7),
        ("Honey, I'm A Lone Wolf", 150, 5, 7),
        ("I Know I Know", 166, 5, 8),
        ("She Thinks I Won't Stay Tonight", 154, 5, 8),
        ("He Heard You're Bad For Me", 210, 5, 8),
        ("He Hopes We Can't Stay", 117, 5, 8),
        ("He's Walking Away", 159, 5, 9),
        ("He's Trouble", 138, 5, 9),
        ("I Heard I Want To Bo Alone", 120, 5, 9),
        ("I Ride Alone", 151, 5, 9),
        ("Honey", 79, 6, 10),
        ("You Cheated On Me", 95, 6, 10),
        ("Wouldn't It Be Nice", 213, 6, 10),
        ("Baby", 136, 6, 10),
        ("You Make Me Feel So..", 83, 6, 10);

CREATE TABLE SpotifyClone.history(
    songs_id INT NOT NULL,
    user_id INT NOT NULL,
    reproduction_date DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id),
    FOREIGN KEY (songs_id) REFERENCES SpotifyClone.songs(songs_id),
    CONSTRAINT PRIMARY KEY (user_id, songs_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.history(songs_id, user_id, reproduction_date)
    VALUES
        (36, 1, "2020-02-28 10:45:55"),
        (25, 1, "2020-05-02 05:30:35"),
        (23, 1, "2020-03-06 11:22:33"),
        (14, 1, "2020-08-05 08:05:17"),
        (15, 1, "2020-09-14 16:32:22"),
        (34, 2, "2020-01-02 07:40:33"),
        (24, 2, "2020-05-16 06:16:22"),
        (21, 2, "2020-10-09 12:27:48"),
        (39, 2, "2020-09-21 13:14:46"),
        (6, 3, "2020-11-13 16:55:13"),
        (3, 3, "2020-12-05 18:38:30"),
        (26, 3, "2020-07-30 10:00:00"), 
        (2, 4, "2021-08-15 17:10:10"),
        (35, 4, "2021-07-10 15:20:30"),
        (27, 4, "2021-01-09 01:44:33"),
        (7, 5, "2020-07-03 19:33:28"), 
        (12, 5, "2017-02-24 21:14:22"),
        (14, 5, "2020-08-06 15:23:43"),
        (1, 5, "2020-11-10 13:52:27"),
        (38, 6, "2019-02-07 20:33:48"), 
        (30, 6, "2017-01-24 00:31:17"),
        (31, 6, "2017-10-12 12:35:20"),
        (22, 6, "2018-05-29 14:56:41"),
        (5, 7, "2018-05-09 22:30:49"), 
        (4, 7, "2020-07-27 12:52:58"),
        (11, 7, "2018-01-16 18:40:43"),
        (39, 8, "2018-03-21 16:56:40"),
        (40, 8, "2020-10-18 13:38:05"), 
        (32, 8, "2019-05-25 08:14:03"),
        (33, 8, "2021-08-15 21:37:09"),
        (16, 9, "2021-05-24 17:23:45"),
        (17, 9, "2018-12-07 22:48:52"), 
        (8, 9, "2021-03-14 06:14:26"),
        (9, 9, "2020-04-01 03:36:00"),
        (20, 10, "2017-02-06 08:21:34"),
        (21, 10, "2017-12-04 05:33:43"), 
        (12, 10, "2017-07-27 05:24:49"),
        (13, 10, "2017-12-25 01:03:57");


CREATE TABLE SpotifyClone.following(
    user_id INT NOT NULL,
    artists_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id),
    FOREIGN KEY (artists_id) REFERENCES SpotifyClone.artists(artists_id),
    CONSTRAINT PRIMARY KEY (artists_id, user_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.following(user_id, artists_id)
    VALUES
        (1, 1),
        (1, 4),
        (1, 3),
        (2, 1),
        (2, 3),
        (3, 2),
        (3, 3),
        (4, 4),
        (5, 5),
        (5, 6),
        (6, 6),
        (6, 3),
        (6, 1),
        (7, 2),
        (7, 5),
        (8, 1),
        (8, 5),
        (9, 6),
        (9, 4),
        (9, 3),
        (10, 2),
        (10, 6);  


