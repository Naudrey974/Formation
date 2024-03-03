
USE vue_ticket;
CREATE TABLE `ajouter` (
  `id_ticket` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `quantite` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `ajouter`
--

INSERT INTO `ajouter` (`id_ticket`, `id_produit`, `quantite`) VALUES
(1, 1, 5),
(1, 2, 4),
(2, 2, 8),
(2, 3, 1),
(3, 1, 4),
(3, 2, 5),
(4, 2, 2),
(4, 4, 8),
(5, 1, 2),
(5, 5, 7);

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id_categorie` int(11) NOT NULL,
  `nom_categorie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id_categorie`, `nom_categorie`) VALUES
(1, 'alimentaire'),
(2, 'liquide'),
(3, 'animalerie'),
(4, 'automobile'),
(5, 'tech');

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id_produit` int(11) NOT NULL,
  `nom_produit` varchar(50) NOT NULL,
  `description_produit` text NOT NULL,
  `prix_produit` float DEFAULT NULL,
  `id_categorie` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id_produit`, `nom_produit`, `description_produit`, `prix_produit`, `id_categorie`) VALUES
(1, 'pdt_Pomme1', 'pomme en sachet de 1 kilo', 2.89, 1),
(2, 'pdt_Pomme1', 'baguette de pain', 3.1, 1),
(3, 'pdt_Pomme1', 'lessive ariel', 15.99, 2),
(4, 'pdt_Pomme1', 'sachet de 3 kilo', 5.99, 1),
(5, 'pdt_Pomme1', 'pack de 5 sachets', 6.99, 3),
(7, 'exemple', 'exemple', 1.99, 1),
(8, 'pate', 'sachet 1 kilo de pate', 4.99, NULL),
(9, 'lait', 'bouteille de 1 litre', 0.89, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `ticket`
--

CREATE TABLE `ticket` (
  `id_ticket` int(11) NOT NULL,
  `date_ticket` datetime NOT NULL,
  `id_vendeur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `ticket`
--

INSERT INTO `ticket` (`id_ticket`, `date_ticket`, `id_vendeur`) VALUES
(1, '2023-11-22 10:20:25', 1),
(2, '2023-11-14 08:25:36', 1),
(3, '2023-11-25 11:36:52', 2),
(4, '2023-12-01 10:14:20', 3),
(5, '2023-12-05 14:47:33', 3),
(6, '2023-11-04 00:00:00', NULL),
(7, '2023-10-05 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `vendeur`
--

CREATE TABLE `vendeur` (
  `id_vendeur` int(11) NOT NULL,
  `nom_vendeur` varchar(50) NOT NULL,
  `prenom_vendeur` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `vendeur`
--

INSERT INTO `vendeur` (`id_vendeur`, `nom_vendeur`, `prenom_vendeur`) VALUES
(1, 'test1', 'test1'),
(2, 'test2', 'test2'),
(3, 'test3', 'test3'),
(4, 'join1', 'join1'),
(5, 'join2', 'join2');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `ajouter`
--
ALTER TABLE `ajouter`
  ADD PRIMARY KEY (`id_ticket`,`id_produit`),
  ADD KEY `fk_ajouter_produit` (`id_produit`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id_produit`),
  ADD KEY `fk_completer_categorie` (`id_categorie`);

--
-- Index pour la table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id_ticket`),
  ADD KEY `fk_vendre_vendeur` (`id_vendeur`);

--
-- Index pour la table `vendeur`
--
ALTER TABLE `vendeur`
  ADD PRIMARY KEY (`id_vendeur`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `id_ticket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `vendeur`
--
ALTER TABLE `vendeur`
  MODIFY `id_vendeur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ajouter`
--
ALTER TABLE `ajouter`
  ADD CONSTRAINT `fk_ajouter_produit` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`),
  ADD CONSTRAINT `fk_ajouter_ticket` FOREIGN KEY (`id_ticket`) REFERENCES `ticket` (`id_ticket`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `fk_completer_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`);

--
-- Contraintes pour la table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `fk_vendre_vendeur` FOREIGN KEY (`id_vendeur`) REFERENCES `vendeur` (`id_vendeur`);
  
  -- créer une vue qui affiche la liste des tickets avec date_ticket, prenom (vendeur), nom (vendeur),
  CREATE VIEW vw_ticket1 AS (SELECT date_ticket AS `date`, prenom_vendeur AS prenom, nom_vendeur AS nom FROM ticket 
  INNER JOIN vendeur
  ON ticket.id_vendeur = vendeur.id_vendeur
);

-- créer une vue qui affiche la liste des tickets avec date_ticket, prenom (vendeur), nom (vendeur), le nom des produits, prix produit, quantite,
CREATE VIEW vw_ticket2 AS (SELECT date_ticket AS `date`, prenom_vendeur AS prenom, nom_vendeur AS nom, nom_produit AS produit, prix_produit AS prix, quantite 
FROM ajouter
INNER JOIN produit
ON produit.id_produit = ajouter.id_produit
INNER JOIN ticket 
ON ticket.id_ticket = ajouter.id_ticket
INNER JOIN vendeur
ON vendeur.id_vendeur = ticket.id_vendeur);

-- créer une vue qui affiche la liste des produits, avec leur prix et le chiffre d'affaire global (prix x quantite x ticket de caisse)
CREATE VIEW vw_ticket3 AS (SELECT nom_produit AS produit, prix_produit AS prix_unitaire, 
SUM(ROUND(prix_produit*quantite,2)) AS total
FROM ajouter
INNER JOIN produit
ON produit.id_produit = ajouter.id_produit
INNER JOIN ticket 
ON ajouter.id_ticket = ticket.id_ticket
GROUP BY ajouter.id_ticket)

