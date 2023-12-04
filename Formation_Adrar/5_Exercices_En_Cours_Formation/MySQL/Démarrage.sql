create database exempleCyber;
use exempleCyber;
create table utilisateur(
id_utilisateur int primary key auto_increment not null,
nom_utilisateur varchar(50) not null,
prenom_utilisateur varchar(50) not null
)engine=InnoDB;
create table roles(
id_roles int primary key auto_increment not null,
nom_roles varchar(50) not null
)engine=InnoDB;
-- modifier une table
alter table utilisateur
add column id_roles int;
-- ajouter la foreign key
alter table utilisateur
add constraint fk_posseder_roles
foreign key (id_roles)
references roles(id_roles);
-- ajouter 2 tables et une table d'association
create table article(
id_article int primary key auto_increment not null,
titre_article varchar(50) not null
)engine=InnoDB;
create table categorie(
id_categorie int primary key auto_increment not null,
nom_categorie varchar(50) not null
)engine=InnoDB;
create table ajouter(
id_article int,
id_categorie int,
primary key(id_categorie, id_article)
)engine=InnoDB;
alter table ajouter
add constraint fk_ajouter_article
foreign key (id_article)
references article(id_article);
alter table ajouter
add constraint fk_ajouter_categorie
foreign key (id_categorie)
references categorie(id_categorie);