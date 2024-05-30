-- création de la BDD
CREATE DATABASE ajnaTherapie;
USE ajnaTherapie;

-- creation des tables principales
create table utilisateur(
id_utilisateur INT PRIMARY KEY auto_increment NOT NULL,
nom_utilisateur VARCHAR(50) NOT NULL,
prenom_utilisateur VARCHAR (50) NOT NULL,
mail_utilisateur VARCHAR(50) unique NOT NULL,
password_utilisateur VARCHAR (100) NOT NULL,
tel_utilisateur VARCHAR (15),
type_utilisateur ENUM('utilisateur','administrateur') DEFAULT 'utilisateur' NOT NULL,
statut_utilisateur boolean DEFAULT 1 NOT NULL
)Engine = InnoDB; 
create table rdv(
id_rdv INT PRIMARY KEY auto_increment NOT NULL,
type_rdv ENUM('professionnel','particulier') NOT NULL,
date_rdv DATE NOT NULL,
heure_rdv TIME NOT NULL,
id_prestation INT,
id_utilisateur INT,
FOREIGN KEY (id_prestation) REFERENCES prestation(id_prestation),
FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur)
)Engine = InnoDB;
create table prestation(
id_prestation INT PRIMARY KEY auto_increment NOT NULL,
type_prestation ENUM('Thérapie','Yoga','Mediumnité') NOT NULL
)Engine = InnoDB;
create table message(
id_message INT PRIMARY KEY auto_increment NOT NULL,
nom_expediteur VARCHAR(50) NOT NULL,
prenom_expediteur VARCHAR(50) NOT NULL,
mail_expediteur VARCHAR(50) NOT NULL,
texte_message TEXT NOT NULL,
date_message TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
id_utilisateur INT,
FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur),
CONSTRAINT chk_nom_expediteur CHECK (nom_expediteur REGEXP '^[A-Za-zÀ-ÿ]+$'),
CONSTRAINT chk_prenom_expediteur CHECK (prenom_expediteur REGEXP '^[A-Za-zÀ-ÿ]+$'),
CONSTRAINT chk_mail_expediteur CHECK (mail_expediteur REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
CONSTRAINT chk_texte_message CHECK (texte_message REGEXP '^[A-Za-z0-9.,;:?!()\\''"\\s]+$')
)Engine = InnoDB; 
create table produit(
id_produit INT PRIMARY KEY auto_increment NOT NULL,
nom_produit VARCHAR(50) NOT NULL,
description_produit VARCHAR(250) NOT NULL,
prix_produit DECIMAL(10,2) NOT NULL,
stock_produit INT NOT NULL,
CONSTRAINT chk_nom_produit CHECK (nom_produit REGEXP '^[A-Za-z0-9.,;:?!()\\''"\\s]+$'),
CONSTRAINT chk_description_produit CHECK (description_produit REGEXP '^[A-Za-z0-9.,;:?!()\\''"\\s]+$')
)Engine = InnoDB;
create table livraison(
id_livraison INT PRIMARY KEY auto_increment NOT NULL,
type_livraison VARCHAR(50)
)Engine = InnoDB;
create table adresse_livraison(
id_adresse_livraison INT PRIMARY KEY auto_increment NOT NULL,
numero_rue_livraison INT NOT NULL,
nom_rue_livraison VARCHAR(100) NOT NULL,
nom_ville_livraison VARCHAR(50) NOT NULL,
code_postal_livraison INT NOT NULL,
nom_pays_livraison VARCHAR(50) NOT NULL,
CONSTRAINT chk_code_postal_livraison CHECK (code_postal_livraison REGEXP '^[0-9]{5}$'),
CONSTRAINT chk_nom_rue_livraison CHECK (nom_rue_livraison REGEXP '^[A-Za-z0-9.,;:?!()\\''"\\s]+$'),
CONSTRAINT chk_nom_ville_livraison CHECK (nom_ville_livraison REGEXP '^[A-Za-zÀ-ÿ]+$'),
CONSTRAINT chk_pays_livraison CHECK (nom_pays_livraison REGEXP '^[A-Za-zÀ-ÿ]+$')
)Engine = InnoDB; 
create table adresse_facturation(
id_adresse_facturation INT PRIMARY KEY auto_increment NOT NULL,
numero_rue_facturation INT NOT NULL,
nom_rue_facturation VARCHAR(100) NOT NULL,
nom_ville_facturation VARCHAR(50) NOT NULL,
code_postal_facturation INT NOT NULL,
nom_pays_facturation VARCHAR(50) NOT NULL,
CONSTRAINT chk_code_postal_facturation CHECK (code_postal_facturation REGEXP '^[0-9]{5}$'),
CONSTRAINT chk_nom_rue_facturation CHECK (nom_rue_facturation REGEXP '^[A-Za-z0-9.,;:?!()\\''"\\s]+$'),
CONSTRAINT chk_nom_ville_facturation CHECK (nom_ville_facturation REGEXP '^[A-Za-zÀ-ÿ]+$'),
CONSTRAINT chk_pays_facturation CHECK (nom_pays_facturation REGEXP '^[A-Za-zÀ-ÿ]+$')
)Engine = InnoDB; 
create table commande(
id_commande INT PRIMARY KEY auto_increment NOT NULL,
date_commande TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
id_adresse_livraison INT,
id_adresse_facturation INT,
id_utilisateur INT,
FOREIGN KEY (id_adresse_livraison) REFERENCES adresse_livraison(id_adresse_livraison),
FOREIGN KEY (id_adresse_facturation) REFERENCES adresse_facturation(id_adresse_facturation),
FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur)
)Engine = InnoDB;

-- création des tables d'association
create table posseder(
id_utilisateur INT,
id_adresse_livraison INT,
PRIMARY KEY(id_utilisateur, id_adresse_livraison),
FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur),
FOREIGN KEY (id_adresse_livraison) REFERENCES adresse_livraison(id_adresse_livraison)
)Engine = InnoDB;
create table avoir(
id_utilisateur INT,
id_adresse_facturation INT,
PRIMARY KEY(id_utilisateur, id_adresse_facturation),
FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur),
FOREIGN KEY (id_adresse_facturation) REFERENCES adresse_facturation(id_adresse_facturation)
)Engine = InnoDB;
create table expedier(
id_commande INT,
id_livraison INT,
PRIMARY KEY(id_commande, id_livraison),
FOREIGN KEY (id_commande) REFERENCES commande(id_commande),
FOREIGN KEY (id_livraison) REFERENCES livraison(id_livraison)
)Engine = InnoDB;
create table contenir(
id_commande INT,
id_produit INT,
PRIMARY KEY(id_commande, id_produit),
FOREIGN KEY (id_commande) REFERENCES commande(id_commande),
FOREIGN KEY (id_produit) REFERENCES produit(id_produit)
)Engine = InnoDB;

-- ajout d'une contrainte en dehors de des instructions de création de table
ALTER TABLE utilisateur
ADD CONSTRAINT chk_tel_utilisateur 
CHECK (tel_utilisateur REGEXP '^[0-9/;,\.-]{10,15}$'),
ADD CONSTRAINT chk_mail_utilisateur
CHECK (mail_utilisateur REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'),
ADD CONSTRAINT chk_nom_utilisateur 
CHECK (nom_utilisateur REGEXP '^[A-Za-zÀ-ÿ]+$'),
ADD CONSTRAINT chk_prenom_utilisateur 
CHECK (prenom_utilisateur REGEXP '^[A-Za-zÀ-ÿ]+$');

-- Pour récupération des données dans l'application, insertion des éléments dans la table
insert into prestation (type_prestation) value ("Mediumnité");
insert into prestation (type_prestation) value ("Thérapie");
insert into prestation (type_prestation) value ("Yoga");




