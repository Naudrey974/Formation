CREATE DATABASE ajnaTherapie;
USE ajnaTherapie;
create table utilisateur(
id_utilisateur INT PRIMARY KEY auto_increment NOT NULL,
nom_utilisateur VARCHAR(50) NOT NULL,
prenom_utilisateur VARCHAR (50) NOT NULL,
mail_utilisateur VARCHAR(50) unique NOT NULL,
password_utilisateur VARCHAR (100),
tel_utilisateur INT,
statut_utilisateur boolean
)Engine = InnoDB; 
create table rdv(
id_rdv INT PRIMARY KEY auto_increment NOT NULL,
type_rdv VARCHAR (50) NOT NULL,
date_rdv datetime NOT NULL
)Engine = InnoDB;
create table prestation(
id_prestation INT PRIMARY KEY auto_increment NOT NULL,
type_prestation VARCHAR (50) NOT NULL
)Engine = InnoDB;
create table administrateur(
id_administrateur INT PRIMARY KEY auto_increment NOT NULL,
mail_administrateur varchar(50) UNIQUE NOT NULL,
password_administrateur VARCHAR(100) NOT NULL
)Engine = InnoDB;
create table typeUtilisateur(
id_typeUtilisateur INT PRIMARY KEY auto_increment NOT NULL,
denomination_typeUtilisateur varchar(50) NOT NULL
)Engine = InnoDB;

alter table rdv
add column id_prestation INT;
alter table rdv
add constraint fk_contenir_prestation
foreign key (id_prestation)
references prestation (id_prestation);
alter table rdv 
add column id_utilisateur INT;
alter table rdv
add constraint fk_prendre_utilisateur
foreign key (id_utilisateur)
references utilisateur (id_utilisateur);
alter table utilisateur
add constraint verif_tel_utilisateur
check (tel_utilisateur like '__________');
alter table utilisateur
add column id_typeUtilisateur INT;
alter table utilisateur
add constraint fk_etre_typeUtilisateur
foreign key (id_typeUtilisateur)
references typeUtilisateur (id_typeUtilisateur);
insert into typeUtilisateur (denomination_typeUtilisateur) value ("particulier");
insert into typeUtilisateur (denomination_typeUtilisateur) value ("professionnel");
insert into prestation (type_prestation) value ("Mediumnité");
insert into prestation (type_prestation) value ("Thérapie");
insert into prestation (type_prestation) value ("Yoga");
insert into administrateur (mail_administrateur) value ("test@administrateur.fr");
insert into administrateur (password_administrateur) value ("azerty");
create table contact(
id_contact INT PRIMARY KEY auto_increment NOT NULL,
nom_contact VARCHAR(50) NOT NULL,
prenom_contact VARCHAR (50) NOT NULL,
mail_contact VARCHAR(50) unique NOT NULL,
message_contact text
)Engine = InnoDB; 




