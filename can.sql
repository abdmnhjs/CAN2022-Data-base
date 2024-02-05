DROP SCHEMA IF EXISTS can CASCADE;


CREATE SCHEMA can;

------------------------------------------------------------
-- Table: Statistique Joueur
------------------------------------------------------------
CREATE TABLE can.Statistique_Joueur(                      -- Fini
    ID_statistiques	INT  ,
    Buts_marques   	INT  NOT NULL ,
    Passes_decisives   INT  NOT NULL ,
    Cartons_jaunes 	INT  NOT NULL ,
    Cartons_rouges 	INT  NOT NULL  ,
    ID_joueur       INT  NOT NULL,

    CONSTRAINT Statistique_Joueur_PK PRIMARY KEY (ID_statistiques),
    CONSTRAINT Statistique_Joueur_Joueurs_FK FOREIGN KEY (ID_joueur) REFERENCES can.Joueurs(ID_joueur)
);


------------------------------------------------------------
-- Table: Joueurs
------------------------------------------------------------
CREATE TABLE can.Joueurs(                                  -- Fini
    ID_joueur       	INT  ,
    Noms            	VARCHAR NOT NULL ,
    Prenoms         	VARCHAR NOT NULL ,
    Numero_dossard  	INT  NOT NULL ,
    Equipe          	VARCHAR NOT NULL ,
    Poste           	VARCHAR NOT NULL ,
    Nationnalite    	VARCHAR NOT NULL ,
    Date_de_naissance   DATE  NOT NULL ,
    ID_statistiques 	INT  NOT NULL  ,

    CONSTRAINT Joueurs_PK PRIMARY KEY (ID_joueur)
   ,CONSTRAINT Joueurs_Equipe_FK FOREIGN KEY (Equipe) REFERENCES can.Equipe(Nom_Equipe) 
);


------------------------------------------------------------
-- Table: Stade
------------------------------------------------------------
CREATE TABLE can.Stade(                                    -- Fini
    ID_stade   INT  ,
    Nom    	VARCHAR NOT NULL ,
    Ville  	VARCHAR NOT NULL ,
    Pays   	VARCHAR NOT NULL ,
    Capacite   VARCHAR NOT NULL  ,

    CONSTRAINT Stade_PK PRIMARY KEY (ID_stade)
);


------------------------------------------------------------
-- Table: Match
------------------------------------------------------------
CREATE TABLE can.Matchs(                                      -- Fini
    ID_match  	INT ,
    Date_match  DATE  NOT NULL ,
    Score     	VARCHAR  NOT NULL ,
    Equipe_A  	VARCHAR NOT NULL ,
    Equipe_B  	VARCHAR NOT NULL ,
    Phase     	VARCHAR NOT NULL ,
    ID_stade  	INT NOT NULL ,

    CONSTRAINT Match_PK PRIMARY KEY (ID_match)
   ,CONSTRAINT Match_EquipeA_FK FOREIGN KEY (Equipe_A) REFERENCES can.Equipe(Nom_Equipe)
   ,CONSTRAINT Match_EquipeB_FK FOREIGN KEY (Equipe_B) REFERENCES can.Equipe(Nom_Equipe)
   ,CONSTRAINT Match_Stade_FK FOREIGN KEY (ID_stade) REFERENCES can.Stade(ID_stade)
);


------------------------------------------------------------
-- Table: Spectateur
------------------------------------------------------------
CREATE TABLE can.Spectateur(                                 -- Fini
    ID_spectateur   INT  ,
    Nom    	VARCHAR  NOT NULL  ,
    Prenom    	VARCHAR  NOT NULL  ,
    Date_naissance   DATE  NOT NULL  ,
    Numero_telephone   INT  NOT NULL  ,
    ID_match  	INT  NOT NULL  ,

    CONSTRAINT Spectateur_PK PRIMARY KEY (ID_spectateur)
   ,CONSTRAINT Spectateur_Match_FK FOREIGN KEY (ID_match) REFERENCES can.Matchs(ID_match)
);

------------------------------------------------------------
-- Table: Equipe
------------------------------------------------------------  
CREATE TABLE can.Equipe(                                      -- Fini     
    Nom_Equipe   VARCHAR   ,  
    Pays    	VARCHAR  NOT NULL  ,
    Entraineur    VARCHAR  NOT NULL  ,
    Groupe  VARCHAR NOT NULL,

    CONSTRAINT Equipe_PK PRIMARY KEY (Nom_Equipe)
);
------------------------------------------------------------

-- Fini
INSERT INTO can.Statistique_Joueur (ID_statistiques, Buts_marques, Passes_decisives, Cartons_jaunes, Cartons_rouges) VALUES        
       (0, 8, 0, 0, 0),  -- Aboubakar
       (1, 5, 0, 0, 0),  -- Toko
       (2, 3, 0, 0, 0),  -- Mhango
       (3, 3, 0, 0, 0),  -- Koné
       (4, 3, 2, 0, 0),  -- Mané
       (5, 3, 0, 0, 0),  -- Boufal
       (6, 0, 3, 0, 0),  -- Colins
       (7, 0, 3, 0, 0),  -- Issa
       (8, 0, 3, 0, 0),  -- Martin
       (9, 0, 2, 0, 0),  -- Traoré
       (10, 0, 2, 0, 0), -- Moumi
       (11, 0, 2, 0, 0),   -- Musa
       (12, 0, 2, 0, 0),   -- Selim  
       (13, 0, 2, 0, 0),   -- Patey
       (14, 0, 0, 3, 0),   -- Mohammed
       (15, 0, 0, 2, 0),   -- Aaron
       (16, 0, 0, 2, 0),   -- Adama 
       (17, 0, 0, 2, 0),   -- Cheikhou
       (18, 0, 0, 0, 1),   -- Alex
       (19, 0, 0, 0, 1),   -- André
       (20, 0, 0, 0, 1),   -- Dango
       (21, 0, 0, 0, 1),   -- Farouk
       (22, 2, 3, 0, 0),   -- Mahrez
       (23, 0, 0, 1, 0),   -- Mendy
       (24, 1, 5, 2, 0),   -- Hakimi
       (25, 3, 3, 0, 0),   -- Ziyech
       (26, 0, 1, 3, 0),   -- Attal
       (27, 0, 0, 0, 1),   -- Onana
       (28, 2, 0, 1, 0),   -- Osimen
       (29, 4, 2, 2, 0),   -- Salah
       (30, 1, 0, 0, 1),   -- Aubameyang
       (31, 2, 2, 0, 0),   -- Zaha
       (32, 0, 1, 0, 1)   -- Khazri
;

-- Fini
INSERT INTO can.Joueurs (ID_joueur, Noms, Prenoms, Numero_dossard, Equipe, Poste, Nationnalite, Date_de_naissance, Pays, ID_statistiques) VALUES         
       (0, 'Mané', 'Sadio', 10, 'Sénégal', 'Ailier', 'Sénégalaise', '10/04/1992', 'Sénégal', 4),                   
       (1, 'Mahrez', 'Riyad', 7, 'Algérie', 'Ailier', 'Française', '21/02/1991', 'Algérie', 22),  
       (2, 'Mendy', 'Edouard', 16, 'Sénégal', 'Goal', 'Française', '01/03/1992', 'Sénégal', 23),
       (4, 'Hakimi', 'Achraf', 2, 'Maroc', 'Latéral', 'Espagnole', '04/11/1998', 'Maroc', 24),
       (5, 'Ziyech', 'Hakim', 7, 'Maroc', 'Ailier', 'Hollandaise', '19/03/1993', 'Maroc', 25),
       (6, 'Attal', 'Youcef', 20, 'Algérie', 'Latéral', 'Algériene', '17/05/1996', 'Algérie', 26),
       (7, 'Onana', 'Andre', 23, 'Cameroun', 'Goal', 'Camerounaise', '02/04/1996', 'Cameroun', 27),
       (8, 'Osimen', 'Victor', 9, 'Nigéria', 'Attaquant', 'Nigériane', '29/12/1998', 'Nigéria', 28),
       (9, 'Salah', 'Mohammed', 10, 'Egypte', 'Attaquant', 'Egyptienne', '15/06/1992', 'Egypte', 29),
       (10, 'Aubameyang', 'Pierre-Emerick', 9, 'Gabon', 'Attaquant', 'Française', '18/06/1989', 'Gabon', 30),
       (11, 'Zaha', 'Wilfried', 9, 'Cote d Ivoire', 'Attaquant', 'Ivoirienne', '10/11/1992', 'Cote d Ivoire', 31),
       (12, 'Khazri', 'Wahbi', 10, 'Tunisie', 'Attaquant', 'Française', '08/02/1991', 'Tunisie', 32),
       (13, 'Traoré', 'Bertrand', 19, 'Burkina-Faso', 'Attaquant', 'Burkinabé', '06/09/1995', 'Burkina-Faso', 9),
       (14, 'Aboubakar', 'Vincent', 13, 'Cameroun', 'Attaquant', 'Camerounaise', '22/01/1992', 'Cameroun', 0),
       (15, 'Toko-Ekambi', 'Karl', 11, 'Cameroun', 'Ailier', 'Camerounaise', '14/12/1992', 'Cameroun', 1),
       (16, 'Mhango', 'Gabadinho', 7, 'Malawi', 'Attaquant', 'Malawienne', '27/09/1992', 'Malawi', 2),
       (17, 'Koné', 'Ibrahima', 5, 'Mali', 'Défenseur', 'Malienne', '05/05/1999', 'Mali', 3),
       (18, 'Mané', 'Sadio', 10, 'Sénégal', 'Ailier', 'Sénégalaise', '10/04/1992', 'Sénégal', 4),
       (19, 'Boufal', 'Sofiane', 19, 'Maroc', 'Milieu', 'Française', '17/09/1993', 'Maroc', 5),
       (20, 'Fai', 'Collins', 17, 'Cameroun', 'Défenseur', 'Camerounaise', '22/07/1992', 'Cameroun', 6),
       (21, 'Kaboré', 'Issa', 8, 'Burkina-Faso', 'Milieu', 'Burkinabé', '03/08/1996', 'Burkina-Faso', 7),
       (22, 'Hongla', 'Martin', 14, 'Cameroun', 'Milieu', 'Camerounaise', '15/03/1994', 'Cameroun', 8),
       (23, 'Ngamaleu', 'Moumi', 17, 'Cameroun', 'Ailier', 'Camerounaise', '03/11/1994', 'Cameroun', 9),
       (24, 'Barrow', 'Musa', 24, 'Gambia', 'Attaquant', 'Gambienne', '14/11/1998', 'Gambia', 10),
       (25, 'Amallah', 'Selim', 16, 'Maroc', 'Milieu', 'Belge', '17/01/1997', 'Maroc', 11),
       (26, 'Partey', 'Thomas', 5, 'Ghana', 'Milieu', 'Ghanéenne', '13/06/1993', 'Ghana', 12),
       (27, 'Abdelmonem', 'Mohamed', 21, 'Égypte', 'Défenseur', 'Égyptienne', '11/04/1994', 'Égypte', 13),   
       (28, 'Boupendza', 'Aaron', 7, 'Gabon', 'Attaquant', 'Gabonaise', '07/08/1996', 'Gabon', 14),          
       (29, 'Guira', 'Adama', 17, 'Burkina-Faso', 'Milieu', 'Burkinabé', '24/11/1988', 'Burkina-Faso', 15),  
       (30, 'Kouyaté', 'Cheikhou', 8, 'Sénégal', 'Milieu', 'Sénégalaise', '21/12/1989', 'Sénégal', 16),      
       (31, 'Iwobi', 'Alex', 17, 'Nigéria', 'Milieu', 'Nigériane', '03/05/1996', 'Nigéria', 17),
       (32, 'Ayew', 'André', 10, 'Ghana', 'Attaquant', 'Ghanéenne', '17/12/1989', 'Ghana', 18),
       (33, 'Ouattara', 'Dango', 22, 'Cote d Ivoire', 'Milieu', 'Ivoirienne', '15/05/1998', 'Cote d Ivoire', 19),
       (34, 'Ben Mustapha', 'Farouk', 16, 'Tunisie', 'Goal', 'Tunisienne', '01/07/1989', 'Tunisie', 20)

;


-- Fini
INSERT INTO can.Stade (ID_stade, Nom, Ville, Pays, Capacite) VALUES           
       (0, 'Stade De Japoma', 'Douala', 'Cameroun', 40000),
       (1, 'Stade Omnisport Paul Biya', 'Olembé', 'Cameroun', 60000),
       (2, 'Stade Omnisports Ahmadou Ahidjo de Yaoundé', 'Yaoundé', 'Cameroun', 40000),
       (3, 'Stade Fotso Victor', 'Bandjoun', 'Cameroun', 10000),
       (4, 'Limbe Omnisport Stadium - NGUEME', 'Limbé', 'Cameroun', 20000),
       (5, 'Stade Omnisports de Bafoussam', 'Bafoussam', 'Cameroun', 20000),
       (6, 'Stade Omnisport Roumdé Adjia', 'Garoua', 'Cameroun', 30000),
       (7, 'Stade de la Réunification', 'Douala', 'Cameroun', 39000)
;


-- Fini 
INSERT INTO can.Matchs (ID_match, Date_match, Score, Equipe_A, Equipe_B, Phase, ID_Stade) VALUES  
       (0, '11/01/2022', '1-0', 'Nigéria', 'Egypte', 'Phase de groupes', 1),
       (1, '18/01/2022', '2-2', 'Gabon', 'Maroc', 'Phase de groupes', 7),
       (2, '09/01/2022', '2-1', 'Cameroun', 'Burkina-Faso', 'Phase de groupes', 2),
       (3, '09/01/2022', '0-1', 'Ethiopie', 'Cap-Vert', 'Phase de groupes', 3),
       (4, '10/01/2022', '1-0', 'Sénégal', 'Zimbabwe', 'Phase de groupes', 1),
       (5, '10/01/2022', '1-0', 'Guinée', 'Malawi', 'Phase de groupes', 2),
       (6, '10/01/2022', '1-0', 'Maroc', 'Ghana', 'Phase de groupes', 4),
       (7, '10/01/2022', '0-1', 'Comores', 'Gabon', 'Phase de groupes', 5),
       (8, '11/01/2022', '0-0', 'Algérie', 'Sierra Leone', 'Phase de groupes', 0),
       (9, '11/01/2022', '0-0', 'Soudan', 'Guinée-Bissau', 'Phase de groupes', 1),
       (10, '12/01/2022', '0-1', 'Tunisie', 'Mali', 'Phase de groupes', 2),
       (11, '12/01/2022', '0-1', 'Mauritanie', 'Gambia', 'Phase de groupes', 3),
       (12, '12/01/2022', '1-0', 'Guinée Equatoriale', 'Cote d Ivoire', 'Phase de groupes', 7),
       (13, '13/01/2022', '4-1', 'Cameroun', 'Ethiopie', 'Phase de groupes', 6),
       (14, '13/01/2022', '0-1', 'Cap-Vert', 'Burkina-Faso', 'Phase de groupes', 5),
       (15, '14/01/2022', '0-0', 'Sénégal', 'Guinée', 'Phase de Groupes', 7),
       (16, '14/01/2022', '2-1', 'Malawi', 'Zimbabwe', 'Phase de groupes', 4),
       (17, '14/01/2022', '2-0', 'Maroc', 'Comores', 'Phase de groupes', 3),
       (18, '14/01/2022', '1-1', 'Gabon', 'Ghana', 'Phase de groupes', 1),
       (19, '15/01/2022', '3-1', 'Nigeria', 'Soudan', 'Phase de groupes', 0),
       (20, '15/01/2022', '0-1', 'Guinée-Bisseau', 'Egypte', 'Phase de groupes', 1),
       (21, '16/01/2022', '1-1', 'Gambia', 'Mali', 'Phase de groupes', 1),
       (22, '16/01/2022', '4-0', 'Tunisie', 'Mauritanie', 'Phase de groupes', 2),
       (23, '16/01/2022', '2-2', 'Cote d Ivoire', 'Sierra Leone', 'Phase de groupes', 3),
       (24, '16/01/2022', '0-1', 'Algérie', 'Guinée Equatoriale', 'Phase de groupes', 4),
       (25, '17/01/2022', '1-0', 'Burkina-Faso', 'Ethiope', 'Phase de groupes', 5),
       (26, '17/01/2022', '1-1', 'Cap-Vert', 'Cameroun', 'Phase de groupes', 6),
       (27, '18/01/2022', '0-0', 'Malawi', 'Sénégal', 'Phase de groupes', 7),
       (28, '18/01/2022', '2-1', 'Zimbabwe', 'Guinée', 'Phase de groupes', 0),
       (29, '18/01/2022', '2-2', 'Gabon', 'Maroc', 'Phase de groupes', 1),
       (30, '18/01/2022', '2-3', 'Ghana', 'Comores', 'Phase de groupes', 2),
       (31, '19/01/2022', '0-2', 'Guinée-Bisseau', 'Nigeria', 'Phase de groupes', 3),
       (32, '19/01/2022', '1-0', 'Egypte', 'Soudan', 'Phase de groupes', 5),
       (33, '20/01/2022', '0-1', 'Sierra Leone', 'Guinée Equatoriale', 'Phase de groupes', 1),
       (34, '20/01/2022', '3-1', 'Cote d Ivoire', 'Algérie', 'Phase de groupes', 2),
       (35, '20/01/2022', '1-0', 'Gambia', 'Tunisie', 'Phase de groupes', 3),
       (36, '20/01/2022', '2-0', 'Mali', 'Mauritanie', 'Phase de groupes', 4),
       (37, '23/01/2022', '1-1', 'Burkina-Faso', 'Gabon', '8e de finale', 1),
       (38, '23/01/2022', '1-0', 'Nigeria', 'Tunisie', '8e de finale', 0),
       (39, '24/01/2022', '0-1', 'Guinée', 'Gambia', '8e de finale', 7),
       (40, '24/01/2022', '2-1', 'Cameroun', 'Comores', '8e de finale', 2),
       (41, '25/01/2022', '2-0', 'Sénégal', 'Cap-Vert', '8e de finale', 3),
       (42, '25/01/2022', '2-1', 'Maroc', 'Malawi', '8e de finale', 5),
       (43, '26/01/2022', '0-0', 'Cote d Ivoire', 'Egypte', '8e de finale', 4),
       (44, '26/01/2022', '0-0', 'Mali', 'Guinée Equatoriale', '8e de finale', 5),
       (45, '29/01/2022', '0-2', 'Gambia', 'Cameroun', 'Quart de finale', 3),
       (46, '29/01/2022', '1-0', 'Burkina-Faso', 'Tunisie', 'Quart de finale', 6),
       (47, '30/01/2022', '2-1', 'Egypte', 'Maroc', 'Quart de finale', 1),
       (48, '30/01/2022', '3-1', 'Sénégal', 'Guinée Equatoriale', 2),
       (49, '02/02/2022', '1-3', 'Burkina-Faso', 'Sénégal', 'Demi-Finale', 4),
       (50, '03/02/2022', '0-0', 'Cameroun', 'Egypte', 'Demi-Finale', 5),
       (51, '05/02/2022', '3-3', 'Burkina-Faso', 'Cameroun', 'Match pour la 3e place', 3),  
       (52, '06/02/2022', '0-0', 'Sénégal', 'Egypte', 'Finale', 0)
;

-- Fini
INSERT INTO can.Spectateur (ID_spectateur, Nom, Prenom, Date_naissance, Numero_telephone, ID_match) VALUES  
       (0, 'Sall', 'Oumar', '01/04/2004', 0612345678, 0),
       (1, 'Pham', 'Alexandre', '11/06/2005', 012345678, 3),
       (2, 'Semghouni', 'Anas', '27/03/2005', 073123456, 24),
       (3, 'Winner', 'Moulady', '04/05/2006', 071234567, 45),
       (4, 'Chaaraoui', 'AbdelAziz', '12/02/2005', 091234567, 35),
       (5, 'De Tommaso', 'Eric', '13/01/2003', 061234567, 18),
       (6, 'Rahman', 'Hamidur', '20/06/2005', 021234567, 37),
       (7, 'Ponnou', 'Yovanne', '14/04/2005', 091234567, 12),
       (8, 'Mertah', 'Ghassen', '23/05/2005', 021324861, 38),
       (9, 'Kaku', 'Jonathan', '15/07/2005', 066829102, 7),
       (10, 'Bouqsi', 'Karim', '28/05/2004', 069229105, 8),
       (11, 'Mohammed', 'Saad', '24/09/2003', 068692231, 32)
;

-- Fini
INSERT INTO can.Equipe (Nom_Equipe, Pays, Entraineur, Groupe) VALUES 
       ('Les Lions Indomptables', 'Cameroun', 'Rigobert Song', 'A'),
       ('les Etalons', 'Burkina-Faso', 'Hubert Velud', 'A'),
       ('les Requins bleus', 'Cap-Vert', 'Bubista', 'A'),
       ('les Walya', 'Ethiopie', 'Wubetu Abate', 'A'),
       ('les Lions de la Teranga', 'Sénégal', 'Aliou Cissé', 'B'),
       ('le Syli', 'Guinée', 'Kaba Diawara', 'B'),
       ('Les Flammes', 'Malawi', 'Patrick Mabedi', 'B'),
       ('the Warriors', 'Zimbabwe', 'Baltemar Brito', 'B'),
       ('Lions de l Atlas', 'Maroc', 'Walid Regragui', 'C'),
       ('Les Panthères', 'Gabon', 'Thierry Mouyouma', 'C'),
       ('Cœlacanthes', 'Comores', 'Stefano Cusin', 'C'),
       ('Black Stars', 'Ghana', 'Chris Hughton', 'C'),
       ('Les Super Eagles', 'Nigéria', 'José Peseiro', 'D'),
       ('les Pharaons', 'Egypte', 'Rui Vitória', 'D'),
       ('Les Faucons de Jediane', 'Soudan', '	James Kwesi Appiah', 'D'),
       ('Djurtus', 'Guinée-Bisseau', 'Baciro Candé', 'D'),
       ('Éléphants', 'Cote d Ivoire', 'Jean-Louis Gasset', 'E'),
       ('Nzalang Nacional', 'Guinée Equatoriale', 'Juan Micha', 'E'),
       ('les Étoiles du Leone', 'Sierra Leone', 'John Keister', 'E'),
       ('Les Fennecs', 'Algérie', 'Djamel Belmadi', 'E'),
       ('Les Aigles', 'Mali', 'Éric Chelle', 'F'),
       ('Scorpion', 'Gambia', 'Tom Saintfiet', 'F'),  
       ('Les Aigles de Carthage', 'Tunisie', 'Jalel Kadri', 'F'),
       ('les Mourabitounes', 'Mauritanie', 'Amir Abdou', 'F')
;




