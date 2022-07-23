DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plans(
    plan_id INT PRIMARY KEY AUTO_INCREMENT,
    plan_type VARCHAR(20) NOT NULL,
    plan_price DECIMAL(5,2) NOT NULL
) engine = InnoDB;

INSERT INTO SpotifyClone.plans (plan_type, plan_price) 
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

INSERT INTO SpotifyClone.users (username, user_age, created_in, plan_type) 
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
    artists_name VARCHAR(50) NOT NULL
) engine = InnoDB;

INSERT INTO SpotifyClone.artists (artists_name)
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
    artist_id INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artists_id),
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.albums(album_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.songs(song_name, artist_id, album_id) 
    VALUES 
        ('Envious', 1, 1),
        ('Exuberant', 1, 1),
        ('Hallowed Steam', 2, 2),
        ('Incandescent', 3, 3),
        ('Temporary Culture', 4, 4),
        ('Library of liberty', 4, 4),
        ('Chained Down', 5, 5),
        ('Cabinet of fools', 5, 5),
        ('No guarantees', 5, 5),
        ('Apparatus', 6, 6);






