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
    plan_level INT NOT NULL,
    FOREIGN KEY (plan_level) REFERENCES SpotifyClone.plans(plan_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.users (username, user_age, created_in, plan_level) 
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
