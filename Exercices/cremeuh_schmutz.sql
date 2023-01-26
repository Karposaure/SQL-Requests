-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
-- script :        schema.sql
-- database:       cremeuh
-- contributors :  Paul Jolles (pjs)
--                 Gabor Maksay (gmy)
-- history :       when       | ver | who | what
--                 2023-01-12 | 1.1 | gmy | adapted queries due to sr diagram modifications
--                 2022-12-07 | 1.0 | pjs | creation
USE cremeuh

GO
-- ---------------------------------------------------------------------------
-- ------------------------------------------------------------------ requetes

-- 1. L'id, la date de mise en cave et le nom de la fromagerie des meules de
-- fromage encore en cave, triées par ordre descendant de la date de mise en cave.
SELECT
    cheese_wheel.id,
    cheese_wheel.input_cellar_date,
    cheese_wheel.cheese_factory_name_of
FROM
    cheese_wheel
WHERE
    cheese_wheel.release_cellar_date IS NULL
ORDER BY
    cheese_wheel.input_cellar_date DESC
;

-- 2. L'id des meules de fromage qui étaient en cave le 21 février 2020 à la
-- 'Fromagerie du lac' située dans le canton de Vaud, affichés par ordre ascendant des ids.
SELECT
    cheese_wheel.id
FROM
    cheese_wheel
WHERE
    (
        cheese_wheel.input_cellar_date <= '2020-02-21'
    )
    AND (
        cheese_wheel.release_cellar_date IS NULL
        OR cheese_wheel.release_cellar_date > '2020-02-21'
    )
    AND cheese_wheel.cheese_factory_name_of = 'Fromagerie du lac'
    AND cheese_wheel.cheese_factory_district = 'Vaud'
ORDER BY  --vu que d'office order by trie par ordre ascendant, pas nécessaire de spécifier asc
    cheese_wheel.id; 
-- 3. L'id et le nom des vaches actuellement présentes dans l'élevage 
-- 'Les vaches des alpes' situé dans le canton de Vaud, affichés par ordre 
-- alphabétique du nom des vaches.
SELECT
    cow.id,
    cow.name_of
FROM
    cow
    INNER JOIN herd ON cow.id = herd.cow_id
    INNER JOIN breeding ON herd.breeding_id = breeding.id
WHERE
    breeding.name_of = 'Les vaches des alpes'
    AND breeding.district = 'Vaud'
    AND cow.death_date IS NULL
ORDER BY
    cow.name_of
;
-- 4. Le nombre de meules de fromages provenant de la fromagerie 'Fromagerie Breguet' 
-- située dans le canton Vaud et ayant bénéficié de 16 mois d'affinage.
SELECT
    COUNT(*) AS 'meules_de_fromages'
FROM
    cheese_wheel
WHERE
    cheese_wheel.cheese_factory_name_of = 'Fromagerie Breguet'
    AND cheese_wheel.cheese_factory_district = 'Vaud'
    AND DATEDIFF (
        MONTH,
        cheese_wheel.input_cellar_date,
        cheese_wheel.release_cellar_date
    ) = 16
;
-- 5. La quantité - volume - de lait utilisée en 2021 par la fromagerie 
-- 'Fromagerie Breguet' située dans le canton de Vaud.
SELECT
    SUM(cheese_wheel_milking.volume) AS litres
FROM
    cheese_wheel_milking
    INNER JOIN cheese_wheel ON cheese_wheel_milking.cheese_wheel_id = cheese_wheel.id
WHERE
    cheese_wheel.cheese_factory_name_of = 'Fromagerie Breguet'
    AND cheese_wheel.cheese_factory_district = 'Vaud'
    AND YEAR (cheese_wheel.input_cellar_date) = 2021
;
-- 6. Toutes les informations sur les traites de lait qui n'ont
-- pas été utilisées pour confectionner des meules de fromage.
SELECT
    milking.id,
    milking.date_of,
    milking.breeding_id,
    milking.volume
FROM
    milking
    LEFT JOIN cheese_wheel_milking ON milking.id = cheese_wheel_milking.milking_id
WHERE
    cheese_wheel_milking.milking_id IS NULL;
-- 7. La mère de la vache dont l'id est égal à 1078.
SELECT
    cow.id,
    cow.name_of,
    cow.birth_date,
    cow.death_date,
    cow.mother_id,
    cow.breed_name_of
FROM
    cow
    INNER JOIN cow AS infant ON cow.id = infant.mother_id
WHERE
    infant.id = 1078
;