---
title: Modéliser la distribution des espèces
description: Les bonnes pratiques de modélisation de la distribution des espèces, des modèles pour les vecteurs de maladies et les arbres de régression boostés.   # NEW
weight: 50
---

{{< resource title="Species Distribution Modelling" url="https://rspatial.org/sdm/index.html" authors="Robert Hijmans et Jane Elith" level="intermediate" en_only="true" >}}
Un guide pas à pas, écrit par des figures de référence du domaine, pour acquérir de bonnes pratiques en modélisation de la distribution des espèces et apprendre à la mettre en œuvre concrètement dans R. Il accompagne toutes les étapes : des concepts de base à la collecte et à la préparation des données, puis à l'ajustement, à l'évaluation et à la prédiction des modèles.

La méthode de modélisation utilisée dans ce guide est un modèle linéaire généralisé (GLM) relativement simple ; le déroulé qu'il enseigne doit néanmoins être maîtrisé avant de passer à d'autres méthodes.
{{< /resource >}}

{{< resource title="Species Distribution Modelling for Vectors Course" url="https://github.com/idem-lab/vector_sdm_course" authors="Nick Golding et Gerry Ryan" level="advanced" en_only="true" >}}
*Oui — il s'agit cette fois bien de vecteurs de maladies, et non de données vectorielles.* Ce cours est conçu pour être enseigné en présentiel. Il vise à faire comprendre les notions clés relatives aux biais dans les données et leurs conséquences, en particulier pour la modélisation de la distribution des vecteurs. Il couvre plusieurs méthodes de modélisation, comme les GLM, MaxEnt et les modèles de processus ponctuels de Poisson multi-espèces.

Il est déjà possible de suivre les supports du cours à l'aide du [plan général du cours](https://github.com/idem-lab/vector_sdm_course/blob/master/course_structure.md), mais nous prévoyons de les mettre à jour afin qu'ils puissent plus facilement être suivis de façon autonome.
{{< /resource >}}

{{< resource title="Boosted Regression Trees" url="https://rspatial.org/raster/sdm/9_sdm_brt.html" authors="Jane Elith et John Leathwick" level="advanced" en_only="true" >}}
Les arbres de régression boostés (*Boosted Regression Trees*, BRT) sont une méthode puissante pour ajuster des relations non linéaires et des interactions, notamment pour modéliser la distribution des espèces. Ce guide explique comment ajuster des BRT avec le package `dismo` dans R. Il accompagne l'article très accessible [A Working Guide to Boosted Regression Trees](https://doi.org/10.1111/j.1365-2656.2008.01390.x) et s'articule bien avec le code du guide de Hijmans et Elith présenté ci-dessus. NB : le code de la dernière section, [Spatial Prediction](https://rspatial.org/raster/sdm/9_sdm_brt.html#spatial-prediction), repose sur le package `raster`, désormais obsolète. Il devrait fonctionner en grande partie tel quel en remplaçant `raster` par `terra` dans le code.
{{< /resource >}}
