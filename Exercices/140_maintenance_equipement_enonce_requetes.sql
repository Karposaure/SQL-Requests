-- -----------------------------------------------------------------
-- -----------------------------------------------------------------
-- Script :       MaintenanceEquipement_ScriptRequetes_SQLServer.sql
-- Database:      MaintenanceEquipement
-- Modif :        
-- 14.10.2020 / V02 / Ajout requêtes chap. clés étrangères / Gabor
-- 14.11.2019 / V01 / Creation / Gabor 

-- -----------------------------------------------------------------
-- -----------------------------------------------------------------
USE MaintenanceEquipement;

-- -----------------------------------------------------------------
-- -----------------------------------------------------------------
-- Tables

-- CompetenceEmploye
SELECT *
FROM   CEMP;

-- CompetenceMaintenance
SELECT *
FROM   CMNT;

-- CompetenceRequise
SELECT *
FROM   CRQS;

-- Element
SELECT *
FROM   ELMT;

-- Employe
SELECT *
FROM   EMPL;

-- Intervention
SELECT *
FROM   INTR;

-- Planification
SELECT *
FROM   PLNF;

-- -----------------------------------------------------------------
-- -----------------------------------------------------------------
-- Chapitre Tables

-- 1.
-- Toutes les dernières planifications connues affichées par
-- date de planification.

WHERE PLNF.ProchainePlnf IS NULL
;

-- 2.
-- L'âge - en année - de chaque employé (l'année civile faisant foi).
-- L'utilisation des fonctions CONVERT(), GETDATE() et DATEDIFF() pourraient s'avérer utile.
-- A COMPLETER

-- 3.
-- L'âge - en année - de chaque employé (le jour d'anniversaire faisant foi)
-- source : https://blogs.msdn.microsoft.com/samlester/2012/11/30/tsql-solve-it-your-way-finding-a-persons-current-age-based-on-birth-date/
-- A COMPLETER

-- -----------------------------------------------------------------
-- -----------------------------------------------------------------
-- Chapitre Cles etrangeres

-- 1.
-- Nom des employés qui ont un niveau - égal lequel - en automation
-- avec la date d'obtention du niveau en question, affiché par
-- ordre alphabétique
-- A COMPLETER

-- 2.
-- Nom des employés qualifiés (= qui ont la compétence en maintenance)
-- au niveau 5 et plus en mécanique (= MEC).
-- A COMPLETER

-- 3.
-- Description (longue) des compétences de maintenance requises pour
-- l'élément 'pal-rob-1'.
-- A COMPLETER

-- 4.
-- Nom des employés responsables des interventions planifiées au mois d'août 2020,
-- avec la date de l'intervention affichée par ordre chronologique.
-- A COMPLETER

-- 5.
-- Nom des éléments - description courte -,  la date d'intervention
-- dont la planification a été effectuée le 26 sept. 2020.
-- A COMPLETER

-- 6. 
-- Compétence requise, niveau requis pour assurer
-- l'intervnetion du 25 février 2020 ; respectivement 
-- le niveau de compétence pour cette compétence requise 
-- de l'employé responsable de cette intervention.  
-- A COMPLETER

-- 7.
-- Nom des employés qui ont à la fois une compétence en automation et production,
-- avec le niveau respectif de chacune de ces compétences.
-- A COMPLETER

-- 8.
-- Nombre de rois que l'employée 'Annelise Killerby' a été responsable d'interventions.
-- A COMPLETER


-- -----------------------------------------------------------------
-- -----------------------------------------------------------------
-- Chapitre Formes normales

-- 1.
-- Les éléments ne faisant l'objet d'aucune planification de
-- maintenance.
-- A COMPLETER

-- 2.
-- Les planifications postérieures au 30 avril 2020 n'ayant  
-- fait l'objet encore d'aucune intervention.
-- A COMPLETER
-- 3.
-- Le nom des employés n'ayant pas encore été planifié comme
-- responsable d'une maintenance.
-- A COMPLETER

-- 4.
-- Les noms des employés qui ont au moins une autre compétence de
-- maintenance qu'électronique (= Electronic), qu'ils aient celle-ci
-- ou pas.
-- 
-- Alfie Tarbett, Dasi Wrigglesworth et Erika Gerram n'ont qu'une seule
-- compétence, soit 'Electronic', donc ne devraient pas apparaître
-- dans le résultat de la requête.
-- A COMPLETER

-- 5.
-- Les employés dotés de compétence en automation mais qui n'ont 
-- pas atteint le niveau de compétence 5 en la matière.
-- A COMPLETER
    
-- -----------------------------------------------------------------
-- -----------------------------------------------------------------
-- Chapitre Heritage et cycles

-- 1.
-- L'historique des planifications de l'élément 'asm-rob-2'.
-- A COMPLETER