/*création de la base de donnée*/

CREATE DATABASE olympiade;

/*appel de la base de donnée*/

use olympiade;



/* création de la table users*/
CREATE TABLE users(
	id_user int not null primary key auto_increment,
	login varchar(50),
	password varchar(50),
	mail varchar(100)
);


/* création de la table images*/
CREATE TABLE images(
	id_image int not null primary key auto_increment,
	image_url varchar(500)
);

/* création de la table d'association have*/
CREATE TABLE have(
	id_user int,
	id_image int,
	PRIMARY KEY(id_user, id_image),
    FOREIGN KEY(id_user) REFERENCES users(id_user),
    FOREIGN KEY(id_image) REFERENCES images(id_image)
);

/* création de la table friends*/
CREATE TABLE friends(
	id_friend int not null primary key auto_increment,
	login_friend varchar(50)
);

/* création de la table d'association added*/
CREATE TABLE added(
	id_user int,
	id_friend int,
	PRIMARY KEY(id_user, id_friend),
    FOREIGN KEY(id_user) REFERENCES users(id_user),
    FOREIGN KEY(id_friend) REFERENCES friends(id_friend)
);

/* création de la table games*/
CREATE TABLE games(
	id_game int not null primary key auto_increment,
	score varchar(50)
);

/* création de la table d'association play*/
CREATE TABLE play(
	id_user int,
	id_game int,
	PRIMARY KEY(id_user, id_game),
    FOREIGN KEY(id_user) REFERENCES users(id_user),
    FOREIGN KEY(id_game) REFERENCES games(id_game)
);

/* création de la table rules*/
CREATE TABLE rules(
	id_rule int not null primary key auto_increment,
	rules_content varchar(500)
);


/* création de la table voted_rules*/
CREATE TABLE voted_rules(
	id_voted_rule int not null primary key auto_increment,
	vote_result boolean
);

/* création de la table proposed_rules*/
CREATE TABLE proposed_rules(
	id_proposed_rule int not null primary key auto_increment,
	rule_proposed_content varchar(500)
);

/* création de la table d'association vote*/
CREATE TABLE vote(
	id_user int,
	id_voted_rule int,
	PRIMARY KEY(id_user, id_voted_rule),
    FOREIGN KEY(id_user) REFERENCES users(id_user),
    FOREIGN KEY(id_voted_rule) REFERENCES voted_rules(id_voted_rule)
);

/* création de la table d'association belong*/
CREATE TABLE belong(
	id_rule int,
	id_voted_rule int,
	PRIMARY KEY(id_rule, id_voted_rule),
    FOREIGN KEY(id_rule) REFERENCES rules(id_rule),
    FOREIGN KEY(id_voted_rule) REFERENCES voted_rules(id_voted_rule)
);


/* création de la table d'association propose*/
CREATE TABLE propose(
	id_user int,
	id_proposed_rule int,
	PRIMARY KEY(id_user, id_proposed_rule),
    FOREIGN KEY(id_user) REFERENCES users(id_user),
    FOREIGN KEY(id_proposed_rule) REFERENCES proposed_rules(id_proposed_rule)
);

/* création de la table d'association belong2*/
CREATE TABLE belong2(
	id_rule int,
	id_proposed_rule int,
	PRIMARY KEY(id_rule, id_proposed_rule),
    FOREIGN KEY(id_rule) REFERENCES rules(id_rule),
    FOREIGN KEY(id_proposed_rule) REFERENCES proposed_rules(id_proposed_rule)
);

/* création de la table d'association contain*/
CREATE TABLE contain(
	id_rule int,
	id_game int,
	PRIMARY KEY(id_rule, id_game),
    FOREIGN KEY(id_rule) REFERENCES rules(id_rule),
    FOREIGN KEY(id_game) REFERENCES games(id_game)
);


