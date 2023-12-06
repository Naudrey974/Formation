create database blog;
use blog;
create table utilisateur(
id_utilisateur int primary key auto_increment not null,
nom_utilisateur varchar(50) not null,
prenom_utilisateur varchar(50) not null,
email_utilisateur varchar(50) unique not null,
password_utilisateur varchar(50) not null,
active_utilisateur tinyint(1) default 1,
id_roles int not null
)engine=InnoDB;

-- ajouter une colonne avec contrainte
alter table utilisateur 
add column code_postal_utilisateur varchar(50);

-- ajouter une contrainte nombre de caractère imposé
alter table utilisateur
add constraint verif_code_postal
check(code_postal_utilisateur like'_____');

create table roles(
id_roles int primary key auto_increment not null,
nom_roles varchar(50) not null
)engine=innoDB;

create table commentaire(
id_commentaire int primary key auto_increment not null,
texte_commentaire varchar(255) not null,
date_creation_commentaire datetime not null,
active_commentaire tinyint(1) default 1,
id_article int not null,
id_utilisateur int not null
)engine=InnoDB;

create table article(
id_article int primary key auto_increment not null,
titre_article varchar(50) not null,
contenu_article text not null,
date_creation_article date not null,
active_article tinyint(1)default 1,
id_utilisateur int not null
)engine=InnoDB;

create table categorie(
id_categorie int primary key auto_increment not null,
nom_categorie varchar(50) not null
)engine=innoDB;

create table completer(
id_article int,
id_categorie int,
primary key(id_article,id_categorie)
)engine=InnoDB;


alter table utilisateur
add constraint fk_posseder_roles
foreign key (id_roles)
references roles(id_roles);

alter table commentaire
add constraint fk_ecrire_utilisateur
foreign key (id_utilisateur)
references utilisateur(id_utilisateur);

alter table commentaire
add constraint fk_ajouter_article
foreign key (id_article)
references article(id_article);

alter table article
add constraint fk_rediger_utilisateur
foreign key (id_utilisateur)
references utilisateur(id_utilisateur);

alter table completer
add constraint fk_completer_article
foreign key (id_article)
references article(id_article);

alter table completer
add constraint fk_completer_categorie
foreign key (id_categorie)
references categorie(id_categorie);