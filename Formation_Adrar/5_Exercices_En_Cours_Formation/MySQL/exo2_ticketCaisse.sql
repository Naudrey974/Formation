create database ticket_caisse;
use ticket_caisse;
create table produit(
id_produit int primary key auto_increment not null,
nom_produit varchar(50) not null,
description_produit text not null,
prix_produit decimal(4,2),
id_categorie int not null
)engine=innoDB;

create table vendeur(
id_vendeur int primary key auto_increment not null,
nom_vendeur varchar(50) not null,
prenom_vendeur varchar(50) not null
)engine=InnoDB;

create table categorie(
id_categorie int primary key auto_increment not null,
nom_categorie varchar(50) not null
)engine=innoDB;

-- ex rajouter une categorie de produit
create table ticket(
id_ticket int primary key auto_increment not null,
date_ticket datetime not null,
id_vendeur int not null
)engine=innoDB;

create table ajouter(
id_produit int not null,
id_ticket int not null,
primary key(id_produit, id_ticket),
quantite int not null
)engine=innoDB;

alter table produit
add constraint fk_completer_categorie
foreign key (id_categorie)
references categorie(id_categorie);

alter table ticket
add constraint fk_vendre_vendeur
foreign key (id_vendeur)
references vendeur(id_vendeur);

alter table ajouter
add constraint fk_ajouter_produit
foreign key (id_produit)
references produit(id_produit);

alter table ajouter
add constraint fk_ajouter_ticket
foreign key (id_ticket)
references ticket(id_ticket);

-- ajouter des valeurs dans les tables crées

-- ajouter 3 categories
insert into categorie(nom_categorie) value ('boisson');
insert into categorie(nom_categorie) value ('fruit');
insert into categorie(nom_categorie) value ('legume');
-- ou pour plusieurs valeurs d'un coup : values ('boisson'),('fruit'),('legume');

-- désactiver la vérification foreign key
SET FOREIGN_KEY_CHECKS = 0;
-- vider la table produit
TRUNCATE categorie;
-- réactiver la sécurité foreign key
SET FOREIGN_KEY_CHECKS = 1;

-- ajouter 5 produits
insert into produit(nom_produit,description_produit,prix_produit,id_categorie) value ('soda','boisson sucré',1.20,1);
insert into produit(nom_produit,description_produit,prix_produit,id_categorie) value ('orange','filet oranges',2.5,2);
insert into produit(nom_produit,description_produit,prix_produit,id_categorie) value ('banane','par 5',2.30,2);
insert into produit(nom_produit,description_produit,prix_produit,id_categorie) value ('poireau','lot de 1kg',1.10,3);
insert into produit(nom_produit,description_produit,prix_produit,id_categorie) value ('tomate','filet de 2kg',3.50,3);

-- ajouter 3 vendeurs
insert into vendeur(nom_vendeur,prenom_vendeur) value ('Olivier','Larbre');
insert into vendeur(nom_vendeur,prenom_vendeur) value ('Vincent','Bulle');

-- ajouter 5 tickets
insert into ticket(date_ticket,id_vendeur) value ('2023/01/25 14:30',1);
insert into ticket(date_ticket,id_vendeur) value ('2023/01/25 15:30',1);
insert into ticket(date_ticket,id_vendeur) value ('2023/01/26 10:00',2);
insert into ticket(date_ticket,id_vendeur) value ('2023/01/26 11:30',1);
insert into ticket(date_ticket,id_vendeur) value ('2023/01/26 11:38',1);

-- ajouter 2 produits et une quantité à chaque ticket de caisse (table ajouter)
insert into ajouter(id_produit,id_ticket,quantite) value (1,1,5);
insert into ajouter(id_produit,id_ticket,quantite) value (3,1,2);
insert into ajouter(id_produit,id_ticket,quantite) value (5,2,4);
insert into ajouter(id_produit,id_ticket,quantite) value (4,2,10);
insert into ajouter(id_produit,id_ticket,quantite) value (3,3,5);
insert into ajouter(id_produit,id_ticket,quantite) value (1,3,7);
insert into ajouter(id_produit,id_ticket,quantite) value (1,4,5);
insert into ajouter(id_produit,id_ticket,quantite) value (3,4,6);
insert into ajouter(id_produit,id_ticket,quantite) value (4,5,1);
insert into ajouter(id_produit,id_ticket,quantite) value (1,5,3);


-- Requêtes de consultation
-- mettre à jour les prix des pdt augmentatés de 10%
update produit set prix_produit = prix_produit*1.1;

-- ajouter un nouveau vendeur
insert into vendeur(nom_vendeur,prenom_vendeur) value ('Thom','Mas');

-- Mettre en majuscule le nom et le prénom de tous les vendeurs
update vendeur set prenom_vendeur=upper(prenom_vendeur); 
update vendeur set nom_vendeur=upper(nom_vendeur); 

-- Remplacer la date (mois) des tickets du mois de décembre par janvier
update ticket set date_ticket= date_add(date_ticket, interval 1 month);

-- supprimer un vendeur
delete from vendeur where id_vendeur=3;

