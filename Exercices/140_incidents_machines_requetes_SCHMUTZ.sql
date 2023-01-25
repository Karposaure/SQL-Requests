-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- Script :      IncidentsMachines_ScriptRequetes_SQLServer.sql
-- Database:     IncidentsMachines
-- Modifications :
-- 11.12.2020 / V01 / Creation / Gabor

-- ----------------------------------------------------------
-- ----------------------------------------------------------
USE IncidentsMachines;
GO

-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- Tables

-- Employe
SELECT *
FROM EMPL;

-- Incident effectif
SELECT *
FROM INEF;

-- Incident standard
SELECT *
FROM INST;

-- Machine
SELECT *
FROM MCHN;

-- Reparation effective
SELECT *
FROM RPEF;

-- Reparation standard
SELECT *
FROM RPST;

-- Technicien
SELECT *
FROM TCHN;

-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- Chap. Classes / Tables

-- ----------------------------------------------------------
-- 1.
-- Le nombre d'incidents qui ont ete declares pendant le mois
-- de decembre 2020.
-- A COMPLETER

-- ----------------------------------------------------------
-- 2.
-- Les incidents standards ou une pièce est cassee ou defectueuse.
-- A COMPLETER

-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- Chap. Associations / Cles etrangeres

-- ----------------------------------------------------------
-- 1. 
-- Les reparations qui ont necessite plus de temps que
-- la duree standard allouee a ces reparations,
-- avec le depassement de duree en pourcentage
-- Tips : La fonction CAST() pourrait etre utile pour
-- afficher correctement le % d'augmentation
-- A COMPLETER

-- ----------------------------------------------------------
-- 2.
-- Les reparations affectees a Maelle Bahon qui n'ont pas
-- encore ete resolues
-- A COMPLETER

-- ----------------------------------------------------------
-- 3.
-- Le nombre d'incidents de type 'Fraise cassee' qu'a eu
-- la fraiseuse universelle.
-- A COMPLETER

-- ----------------------------------------------------------
-- 4.
-- Les incidents qui auraient ete fermes de maniere erronee,
-- i.e. dont une ou plusieurs de ses reparations ne sont pas
-- encore resolues.
-- A COMPLETER

-- ----------------------------------------------------------
-- 5.
-- Le temps de reparation de l'incident 1 (Fuite d'huile).
-- A COMPLETER

-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- Chap. Validation / Formes normales

-- ----------------------------------------------------------
-- 1. 
-- Les machines ayant fait l'objet d'aucun incident.
-- A COMPLETER

-- ----------------------------------------------------------
-- 2. 
-- Les employes qui ne sont pas autorises a effectuer une reparation.
-- A COMPLETER

-- ----------------------------------------------------------
-- ----------------------------------------------------------
-- Chap. Heritage et cycles

-- ----------------------------------------------------------
-- 1.
-- Les incidents standards pouvant decouler d'un probleme electrique
-- A COMPLETER
