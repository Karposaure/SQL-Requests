-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
-- script :        queries.sql
-- database:       lego_classification
-- contributors :  Gabor Maksay (gmy)
-- history :       when       | ver | who | what
--                 2022-07-14 | 1.1 | gmy | adapted to dai and new queries
--                 2019-07-23 | 1.0 | gmy | creation

------------------------------------------------------------------------------
-- ------------------------------------------------------------------ tables

SELECT *
FROM   category;

SELECT *
FROM   color;

SELECT *
FROM   composition;

SELECT *
FROM   game;

SELECT *
FROM   part;

SELECT *
FROM   theme; 

------------------------------------------------------------------------------
------------------------------------------------------------ classes | tables
;
-- 1. Nom de tous les thèmes.
SELECT theme.name_of FROM theme
;

-- 2. Couleurs non-transparentes. 
SELECT color.num,color.name_of,color.rgb,color.transparent
FROM color
WHERE color.transparent = 'f'
;

-- 3. Couleurs non-transparentes affichés par ordre alphabétique de leur nom.
SELECT color.num,color.name_of,color.rgb,color.transparent
FROM color
WHERE color.transparent = 'f'
ORDER BY COLOR.name_of 
;

-- 4. Jeux avant 1970 contenant le mot 'Set'.
SELECT GAME.reference, game.name_of, game.edition_of
FROM game
WHERE game.edition_of <= 1970 AND game.name_of LIKE '%Set%'
ORDER BY game.edition_of ASC 
;

-- 5. Jeux de l'année 2000 dont le numéro ne comporte que 5 positions.
SELECT game.reference,game.name_of,game.edition_of
FROM game
WHERE game.edition_of = 2000 AND game.reference LIKE '_____'
ORDER BY game.name_of ASC
;

-- 6. Nombre de pièces au total que comporte le jeu dont l'id = 14.
SELECT SUM(composition.quantity)
FROM composition
WHERE composition.game_id = '14'
;


-- 7. Nombre de pièces différentes que comporte le jeu dont l'id = 14.
SELECT COUNT(DISTINCT composition.part_id)
FROM composition
WHERE composition.game_id = '14'
;

-- 8. Id des pièces dont la quantité dans un jeu est supérieure à la moyenne.
SELECT composition.part_id
FROM composition
WHERE composition.quantity >
(SELECT AVG(composition.quantity)
FROM composition
)
;


-- ---------------------------------------------------------------------------
-- ------------------------------------------------- relations | foreign keys

-- 1. Chaque pièce avec son nom de couleur.
SELECT part.reference as 'part reference',part.name_of as 'name of part',color.name_of as 'color name'
FROM part
INNER JOIN color
ON part.color_id=color.id
;


-- 2. Nom des couleurs utilisées dans des pièces.
SELECT DISTINCT color.name_of as 'color name'
FROM color
INNER JOIN part
ON color.id=part.color_id
;

-- 3. Nom des thèmes de jeux sortis entre 2018 et 2019 y compris.
SELECT DISTINCT theme.name_of
FROM theme
INNER JOIN game
ON theme.theme_id = game.theme_id
WHERE game.edition_of BETWEEN 2018 AND 2019

-- 4. Nom des couleurs différentes des pièces appartenant à la catégorie 'Baseplates'.
SELECT DISTINCT color.name_of, category.name_of
FROM color
INNER JOIN part
ON color.id = part.color_id
INNER JOIN category
ON part.category_id = category.id
WHERE category.name_of = 'Baseplates'
;

-- 5. Liste des pièces vendues dans le jeu 'Basic Building Set in Cardboard',
-- référence '010-1'.
SELECT part.reference,part.name_of,color.name_of
FROM part
LEFT JOIN color ON part.color_id = color.id
INNER JOIN composition
ON part.id = composition.part_id
INNER JOIN game
ON composition.game_id = game.id
WHERE game.reference = '010-1'
ORDER BY part.reference
;

-- 6. Thèmes utilisant des pièces de couleur blanche.
SELECT DISTINCT theme.name_of
FROM theme
INNER JOIN game ON theme.id = game.theme_id
INNER JOIN composition ON game.id = composition.game_id
INNER JOIN part ON composition.part_id = part.id
INNER JOIN color ON part.color_id = color.id
WHERE color.rgb = 'FFFFFF'
;

-- 7. Catégories des pièces utilisées dans les jeux sortis le plus récemment.
SELECT DISTINCT category.name_of
FROM category
INNER JOIN part ON category.id = part.category_id
INNER JOIN composition ON part.id = composition.part_id
INNER JOIN game ON composition.game_id = game.id
WHERE game.edition_of = YEAR(CURRENT_TIMESTAMP) OR game.edition_of IN
(SELECT MAX(game.edition_of)
FROM game
)
;

-- 8. Nombre de pièces appartenant à la catégorie 'Baseplates'.
SELECT COUNT(*)
FROM part
INNER JOIN category ON part.category_id = category.id
WHERE category.name_of = 'Baseplates'
;

-- 9. Nombre des couleurs différentes des pièces appartenant à la catégorie 'Baseplates'.
SELECT COUNT(DISTINCT color.id)
FROM color
INNER JOIN part ON color.id = part.color_id
INNER JOIN category ON part.category_id = category.id
WHERE category.name_of = 'Baseplates'
;

-- 10. Nombre de pièces blanches utilisées dans des jeux.
SELECT SUM(composition.quantity)
FROM part
INNER JOIN composition ON part.id = composition.part_id
INNER JOIN game ON composition.game_id = game.id
WHERE part.color_id IN
(SELECT part.color_id
FROM part
INNER JOIN  color ON part.color_id = color.id
WHERE color.name_of LIKE 'white' AND composition.game_id IS NOT NULL)
;
