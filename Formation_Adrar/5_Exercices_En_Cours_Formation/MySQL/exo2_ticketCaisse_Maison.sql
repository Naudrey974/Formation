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

-- ajouter 2 vendeurs
insert into vendeur(nom_vendeur,prenom_vendeur) value ('Olivier','Larbre');
insert into vendeur(nom_vendeur,prenom_vendeur) value ('Vincent','Bulle');

-- ajouter 5 tickets
insert into ticket(date_ticket,id_vendeur) value ('2023/01/25 14:30',1);
insert into ticket(date_ticket,id_vendeur) value ('2023/01/25 15:30',1);
insert into ticket(date_ticket,id_vendeur) value ('2023/01/26 10:00',2);
insert into ticket(date_ticket,id_vendeur) value ('2023/01/26 11:30',1);
insert into ticket(date_ticket,id_vendeur) value ('2023/01/26 11:38',1);

-- ajouter 2 produits et une quantité à chaque ticket de caisse (table ajouter)
insert into ajouter(id_produit,id_ticket,quantite) value (2,1,5);
insert into ajouter(id_produit,id_ticket,quantite) value (3,1,2);
insert into ajouter(id_produit,id_ticket,quantite) value (5,2,4);
insert into ajouter(id_produit,id_ticket,quantite) value (4,2,10);
insert into ajouter(id_produit,id_ticket,quantite) value (3,3,5);
insert into ajouter(id_produit,id_ticket,quantite) value (2,3,7);
insert into ajouter(id_produit,id_ticket,quantite) value (2,4,5);
insert into ajouter(id_produit,id_ticket,quantite) value (3,4,6);
insert into ajouter(id_produit,id_ticket,quantite) value (4,5,1);
insert into ajouter(id_produit,id_ticket,quantite) value (2,5,3);


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

-- afficher les nom et prénom avec des alias par ordre croissant
select nom_vendeur as nom, prenom_vendeur as prenom from vendeur order by nom asc, prenom asc;

-- afficher liste des tickets du mois de décembre
select date_ticket from ticket where month(date_ticket) = 12;

-- Afficher la liste des pdt dont le prix est sup à 2€ et inf à 10€
select nom_produit, description_produit, prix_produit from produit where prix_produit between 2 and 10; -- ou prix_produit > 2 and prix_produit <10;

-- Afficher la liste des produit avec nom, prix et cathégorie;
select nom_produit, prix_produit, nom_categorie from produit inner join categorie on produit.id_categorie= categorie.id_categorie;

-- Afficher la liste des pdt avec (nom_produit, description_produit, nom_categorie) de type alimentaire (nom_categorie)
select nom_produit, prix_produit, nom_categorie from produit inner join categorie on produit.id_categorie=categorie.id_categorie where nom_categorie= "alimentaire";

-- Afficher la liste des produit vendus sur le ticket (id_ticket =1) avec nom_produit, prix_produit, quantite
select nom_produit, prix_produit, quantite, ticket.id_ticket from ajouter inner join produit on ajouter.id_produit= produit.id_produit inner join ticket ticket on ajouter.id_ticket=ticket.id_ticket where ajouter.id_ticket=1;

-- Afficher la liste des produits qui n'ont jamais été ajouté sur un ticket
select nom_produit, description_produit, prix_produit from ajouter right join produit on ajouter.id_produit= produit.id_produit left join ticket on ajouter.id_ticket=ticket.id_ticket where ajouter.id_produit is null;

-- Afficher la liste des vvendeurs qui n'ont jamais été liés à un ticket
select nom_vendeur, prenom_vendeur, id_ticket from ticket right join vendeur on ticket.id_vendeur=vendeur.id_vendeur where ticket.id_ticket is null;

-- requete imbriquée
-- Afficher nb de produit par ticket de caisse
SELECT COUNT(ajouter.id_produit) AS nombre from ajouter 
INNER JOIN produit ON ajouter.id_produit = produit.id_produit 
INNER JOIN ticket ON ajouter.id_ticket = ticket.id_ticket
GROUP BY ajouter.id_ticket;

-- Afficher le prix total du ticket 1,
select ticket.id_ticket, sum(prix_produit*quantite) from ajouter 
inner join produit on ajouter.id_produit= produit.id_produit 
inner join ticket ticket on ajouter.id_ticket=ticket.id_ticket
where ticket.id_ticket=1;

-- Afficher le prix total de tous les tickets (en utilisant les fonction d'agrégation),
select ticket.id_ticket, sum(prix_produit*quantite) from ajouter 
inner join produit on ajouter.id_produit= produit.id_produit 
inner join ticket ticket on ajouter.id_ticket=ticket.id_ticket
group by ticket.id_ticket;

-- Afficher le chiffre d'affaire du vendeur (id_vendeur = 1);
select vendeur.id_vendeur, ajouter.id_ticket ,sum(prix_produit*quantite)from ajouter 
inner join produit on ajouter.id_produit= produit.id_produit 
inner join ticket ticket on ajouter.id_ticket=ticket.id_ticket 
right join vendeur on vendeur.id_vendeur=ticket.id_vendeur 
where vendeur.id_vendeur=1;




