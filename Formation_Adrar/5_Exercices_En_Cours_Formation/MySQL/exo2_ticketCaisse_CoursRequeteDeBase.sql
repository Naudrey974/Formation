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
insert into categorie(nom_categorie) value ('alimentaire');
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
insert into produit(nom_produit,description_produit,prix_produit,id_categorie) value ('saumon','filet',3.50,3);

-- ajouter 3 vendeurs
insert into vendeur(nom_vendeur,prenom_vendeur) value ('Olivier','Larbre');
insert into vendeur(nom_vendeur,prenom_vendeur) value ('Vincent','Bulle');

-- ajouter 5 tickets
insert into ticket(date_ticket,id_vendeur) value ('2023/12/25 14:30',1);
insert into ticket(date_ticket,id_vendeur) value ('2023/12/25 15:30',1);
insert into ticket(date_ticket,id_vendeur) value ('2023/12/26 10:00',2);
insert into ticket(date_ticket,id_vendeur) value ('2023/12/26 11:30',1);
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
update ticket set date_ticket= date_add(date_ticket, interval 1 month) where month(date_ticket)=12;

-- supprimer un vendeur
delete from vendeur where id_vendeur=3;

-- Requêtes de consultation

-- Afficher toutes les catégories avec (nom)
select nom_categorie from categorie;

-- Afficher tous les vendeurs avec (nom, prénom) triés par nom et prénom ordre croissant
select nom_vendeur as nom, prenom_vendeur as prenom  from vendeur order by nom_vendeur asc, prenom_vendeur asc;

-- Afficher la liste des tickets avec (date_ticket) du mois de décembre
select date_ticket from ticket where month(date_ticket)=12;

-- Afficher la liste des ticket produits dont le prix est inférieur à 2€ et inférieur à 10€ avec (nom_produit, description_produit, prix_produit)
select nom_produit, description_produit, prix_produit from produit where prix_produit between 2 and 10;

-- Afficher la liste des produits avec (nom_produit, prix_produit, nom_categorie),
select nom_produit, prix_produit,nom_categorie from produit inner join categorie on produit.id_categorie=categorie.id_categorie;

-- Afficher la liste des produits avec (nom_produit, description_produit, prix_produit, nom_categorie) de type alimentaire (nom_categorie)
select nom_produit, description_produit, prix_produit, nom_categorie from produit inner join categorie on produit.id_categorie=categorie.id_categorie where nom_categorie='fruit';

-- Afficher la liste des tickets avec (date_ticket, nom_vendeur, prenom_vendeur)
select date_ticket, nom_vendeur, prenom_vendeur from vendeur inner join ticket on ticket.id_vendeur=vendeur.id_vendeur;

-- Afficher la liste des produits vendus sur le ticket (id_ticket = 1)  avec (nom_produit, prix_produit, quantite)
select nom_produit,prix_produit,quantite from ajouter inner join produit on ajouter.id_produit=produit.id_produit inner join ticket on ajouter.id_ticket=ticket.id_ticket where ajouter.id_ticket=1;

-- Afficher la liste des produits qui ne sont pas ajouté sur un ticket avec le (nom_produit, description_produit, prix_produit),
select nom_produit, description_produit, prix_produit from ajouter right join produit on ajouter.id_produit=produit.id_produit where ajouter.id_produit is null;

-- Afficher la liste des vendeurs qui ne sont pas sont pas lié à un ticket (nom_vendeur, prenom_vendeur).
select nom_vendeur, prenom_vendeur from ticket right join vendeur on ticket.id_vendeur=vendeur.id_vendeur where ticket.id_vendeur is null;

-- Afficher les colonnes de la table produit comprenant la cathégorie du produit trié par 'legume'
SELECT count(id_produit),nom_produit, description_produit, prix_produit,nom_categorie FROM  produit
INNER JOIN categorie
ON produit.id_categorie = categorie.id_categorie
WHERE nom_categorie ='legume'
ORDER BY prix_produit ASC;

-- Méthode d'agregation (à partir d'une table d'association)
-- Requête qui affiche les montants TTC des tickets et les sous totaux (produit * quantite)
SELECT ticket.id_ticket, date_ticket,
group_concat(
concat(round(prix_produit*quantite,2)
,' ')
) AS sous_total, 
sum(round((prix_produit*quantite),2)) AS total_TTC FROM ajouter
INNER JOIN produit
ON ajouter.id_produit = produit.id_produit
INNER JOIN ticket
ON ajouter.id_ticket = ticket.id_ticket
GROUP BY ajouter.id_ticket;

-- Requête qui affiche les tickets avec les informations vendeur, ticket, montant TTC
SELECT ajouter.id_ticket AS id_ticket, nom_vendeur, prenom_vendeur, date_ticket,
 round(sum(quantite*prix_produit),2) AS total_TTC
FROM ajouter
INNER JOIN produit
ON ajouter.id_produit = produit.id_produit
INNER JOIN ticket
ON ajouter.id_ticket = ticket.id_ticket
INNER JOIN vendeur
ON ticket.id_vendeur = vendeur.id_vendeur
GROUP BY ticket.id_ticket;

-- Affiche la liste des produits qui n'ont pas de catégorie
SELECT nom_produit, description_produit, prix_produit, nom_categorie
FROM produit
LEFT JOIN categorie
ON produit.id_categorie = categorie.id_categorie
WHERE nom_categorie IS NULL;

-- Affiche la liste des catégories qui ne sont rattachées à aucun produit
SELECT nom_produit, description_produit, prix_produit, nom_categorie
FROM produit
RIGHT JOIN categorie
ON produit.id_categorie = categorie.id_categorie
WHERE produit.id_categorie IS NULL;



