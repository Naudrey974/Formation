USE gestioncompte;
CREATE TABLE article(
id_article INT PRIMARY KEY Auto_increment NOT NULL,
titre_article VARCHAR (50) NOT NULL,
date_article DATETIME NOT NULL,
contenu_article TEXT NOT NULL
)Engine=InnoDB;
CREATE TABLE commentaire(
id_commentaire INT PRIMARY KEY Auto_increment NOT NULL,
texte_commentaire TEXT NOT NULL,
date_commentaire DATETIME NOT NULL
)Engine=InnoDB;
CREATE TABLE utilisateur(
id_utilisateur INT PRIMARY KEY Auto_increment NOT NULL,
nom_utilisateur VARCHAR (50) NOT NULL,
prenom_utilisateur VARCHAR (50) NOT NULL
)Engine=InnoDB;
-- creer table d'association ajouter
CREATE TABLE ajouter(
id_article INT NOT NULL,
id_commentaire INT NOT NULL,
PRIMARY KEY (id_article, id_commentaire)
)Engine=InnoDB;
-- ajouter les contraintes
ALTER TABLE article
ADD COLUMN id_utilisateur INT;
ALTER TABLE article
ADD CONSTRAINT fk_ajouter_utilisateur
FOREIGN KEY (id_utilisateur)
REFERENCES utilisateur (id_utilisateur);

ALTER TABLE commentaire
ADD COLUMN id_utilisateur INT;
ALTER TABLE commentaire
ADD CONSTRAINT fk_rediger_utilisateur
FOREIGN KEY (id_utilisateur)
REFERENCES utilisateur (id_utilisateur);

ALTER TABLE ajouter
ADD CONSTRAINT fk_ajouter_article
FOREIGN KEY (id_article)
REFERENCES article (id_article);

ALTER TABLE ajouter
ADD CONSTRAINT fk_ajouter_commentaire
FOREIGN KEY (id_commentaire)
REFERENCES commentaire (id_commentaire);

-- créer un compte visiteur
CREATE USER 'visiteur'@'%' IDENTIFIED BY 'azerty';
GRANT SELECT, INSERT ON gestioncompte.utilisateur TO 'visiteur'@'%';
GRANT SELECT ON gestioncompte . commentaire TO 'visiteur'@'%';
GRANT SELECT ON gestioncompte . article TO 'visiteur'@'%';
GRANT SELECT ON gestioncompte . ajouter TO 'visiteur'@'%';
-- créer un compte utilisateur
CREATE USER 'utilisateur'@'%' IDENTIFIED BY 'azerty';
GRANT SELECT, INSERT, UPDATE ON gestioncompte.utilisateur TO 'utilisateur'@'%';
GRANT SELECT, INSERT, UPDATE ON gestioncompte.article TO 'utilisateur'@'%';
GRANT SELECT, INSERT, UPDATE ON gestioncompte.commentaire TO 'utilisateur'@'%';
GRANT SELECT, INSERT ON gestioncompte.ajouter TO 'utilisateur'@'%';
-- créer un compte admin
CREATE USER 'administrateur'@'%' IDENTIFIED BY 'azerty';
GRANT SELECT, INSERT, UPDATE, DELETE ON gestioncompte.utilisateur TO 'administrateur'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON gestioncompte.article TO 'administrateur'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON gestioncompte.commentaire TO 'administrateur'@'%';
GRANT SELECT, INSERT, DELETE ON gestioncompte.ajouter TO 'administrateur'@'%';
-- mise à jour des droits
FLUSH PRIVILEGES;

-- Bonus créer une view pour ne pas donner l'accès à la structure comptète d'une talbe à un utilisateur
CREATE VIEW wv_article AS (SELECT titre_article AS titre, date_article AS `date` FROM article);