---
title: Travailler avec des données spatiales
description: Travailler avec des données spatiales raster et vectorielles dans R (avec terra et sf) et dans QGIS.   # NEW
weight: 40
---

## Données spatiales dans R

{{< see-also page="/topics/map-intro-course" anchor="map-spatial-r" title="Données spatiales dans R (MAP)" level="beginner" en_only="true" >}}

{{< resource title="Les données raster avec `terra`" url="https://rgeocarto.github.io/09_package_terra.html" authors="Timothée Giraud et Hugues Pecout (CNRS)" level="intermediate" >}}
Le package `terra` est l'outil moderne le plus puissant pour travailler avec des données raster dans R (il remplace le package `raster`, désormais obsolète), et peut aussi être utilisé avec des données vectorielles\*. Cette partie du manuel présente pas à pas le travail avec des données spatiales à l'aide de `terra` : import et export, affichage, découpage de la zone d'étude, algèbre spatiale et conversions. Pour une introduction plus large aux données spatiales dans R, ce chapitre s'inscrit dans le manuel complet [*Géomatique et cartographie avec R*](https://rgeocarto.github.io/), qui couvre aussi les données vectorielles, la cartographie thématique et l'acquisition de données, et sera utile aux débutants en science des données spatiales. Un projet RStudio contenant toutes les données des exercices est téléchargeable depuis la page d'accueil.

*Lorsque nous écrivons vectoriel(le)s\* avec un astérisque, il s'agit des données vectorielles au sens [d'une forme de données spatiales : points, lignes, polygones](https://docs.qgis.org/latest/fr/docs/gentle_gis_introduction/vector_data.html), et non des vecteurs au sens de vecteurs de maladies, comme les moustiques.*
{{< /resource >}}

{{< resource title="Les données vectorielles avec `sf`" url="https://rgeocarto.github.io/01_package_sf.html" authors="Timothée Giraud et Hugues Pecout (CNRS)" level="intermediate" >}}
Le package `sf` (*Simple Features*) est un autre outil moderne et puissant pour travailler avec des données vectorielles\* dans R. Ce chapitre explique ce que sont les *simple features* et les principes de fonctionnement du package, puis [renvoie vers une série de chapitres de plus en plus détaillés](https://rgeocarto.github.io/) sur l'utilisation de `sf` : import et export, systèmes de coordonnées, sélections et jointures attributaires et spatiales, opérations sur les géométries et mesures. Pour les détails techniques des fonctions, le [manuel de référence du package](https://r-spatial.github.io/sf/reference/index.html) (en anglais) reste la référence.
{{< /resource >}}

## Données spatiales dans QGIS

{{< see-also page="/topics/map-intro-course" anchor="map-qgis" title="Données spatiales dans QGIS (MAP)" level="beginner" en_only="true" >}}

{{< resource title="Données spatiales dans QGIS (QGIS)" url="https://docs.qgis.org/latest/fr/docs/user_manual/introduction/getting_started.html" level="beginner" >}}
QGIS est un système d'information géographique (SIG) gratuit, libre et bien maintenu, qui permet de manipuler et d'analyser des données spatiales vectorielles\* et raster. Ce chapitre *Premiers pas* guide l'utilisateur dans l'installation et le premier chargement de données. Il constitue le chapitre 5 du [manuel de l'utilisateur de QGIS](https://docs.qgis.org/latest/fr/docs/user_manual/index.html), entièrement traduit en français. Pour s'initier aux notions de base des SIG, la documentation propose aussi [*Une rapide introduction aux SIG*](https://docs.qgis.org/latest/fr/docs/gentle_gis_introduction/index.html).

Nous recommandons généralement d'analyser les données spatiales dans R, car les analyses sont alors facilement reproductibles et modifiables ; cela suppose toutefois d'avoir développé les compétences nécessaires pour utiliser R efficacement, ce qui n'est pas toujours réaliste pour tous. QGIS est un excellent outil pour cartographier et explorer rapidement des données spatiales, et répondra à de nombreux besoins.
{{< /resource >}}
