create database test_requete;
use test_requete;

create table utilisateur (
id int primary key auto_increment not null,
nom varchar(50) not null,
prenom varchar(50) not null,
email varchar(50) not null,
password_utilisateur varchar(100) not null
);