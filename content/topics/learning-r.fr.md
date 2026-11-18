---
title: Apprendre R   # NEW
description: Des premiers pas avec R et RStudio jusqu'à la programmation, R avancé et la création de vos propres packages.   # NEW
weight: 20
---

Nous recommandons R pour l'analyse des données. Il est gratuit, très répandu, dispose de nombreuses ressources d'apprentissage et d'assistance, et peut être très puissant. R est un outil fondé sur un langage de programmation : obtenir des résultats et l'utiliser avec aisance demande donc un certain investissement initial en temps d'apprentissage. Pour les personnes qui manipulent ou analysent régulièrement des données et produisent des graphiques, nous pensons que cet investissement en vaut la peine. Dans le cadre du Vector Atlas, nous produisons également des ressources en R qui peuvent facilement être réutilisées et adaptées aux besoins spécifiques de nos collaborateurs et collaboratrices.

## Ressources d'introduction à R

{{< resource title="Premier contact avec R et RStudio (vidéo webin-R)" url="https://larmarange.github.io/webin-R/posts/2020-11-26-premier-contact-avec-r-rstudio/" authors="Joseph Larmarange" level="beginner" >}}
Un excellent point de départ pour découvrir R. Cette vidéo en français, première séance de la série *webin-R*, présente avec partage d'écran pourquoi et comment réaliser des analyses de données dans R, et comment l'ensemble s'articule (R, RStudio, packages). Il ne s'agit *pas* d'une introduction aux statistiques, mais d'une introduction à la manière de faire certaines choses dans R. Les séances suivantes ([Les bases du langage R](https://larmarange.github.io/webin-R/posts/2020-12-03-les-bases-du-language-r/), puis la manipulation des données avec `dplyr` et les graphiques avec `ggplot2`) prolongent naturellement cette première vidéo. La liste complète des séances est disponible [sur le site webin-R](https://larmarange.github.io/webin-R/seances.html), et les vidéos sur la [chaîne YouTube webin-R](https://www.youtube.com/c/webinR).

*Nous recommandons vivement de régler la qualité de la vidéo au maximum afin de bien distinguer le code à l'écran. Pour cela, cliquez sur la roue dentée des paramètres en bas à droite du lecteur et sélectionnez la qualité 1080p.*
{{< /resource >}}

{{< resource title="Prise en main de R" url="https://juba.github.io/tidyverse/02-prise_en_main.html" authors="Julien Barnier" level="beginner" >}}
Une introduction écrite, pas à pas, pour commencer à utiliser R. Elle accompagne l'installation de R et de RStudio et présente les premières notions. Cette page constitue le premier chapitre pratique d'un [ebook plus complet, également gratuit](https://juba.github.io/tidyverse/) (*Introduction à R et au tidyverse*), qui accompagne ensuite les étapes suivantes de l'apprentissage de R : importer et manipuler des données, produire des graphiques et réaliser des analyses statistiques simples. Il est téléchargeable aux formats PDF et EPUB.
{{< /resource >}}

{{< resource title="Rzine — ressources R en français" url="https://rzine.fr/ressources" level="all" >}}
Un catalogue de ressources pédagogiques sur R, maintenu par le projet Rzine (CNRS) — manuels, tutoriels, vidéos et articles, de niveau débutant à avancé, dont une grande partie en français. Rzine publie également une revue d'articles de méthodes reproductibles en R.
{{< /resource >}}

## Pour aller plus loin avec R

{{< resource title="guide-R" url="https://larmarange.github.io/guide-R/" authors="Joseph Larmarange" level="intermediate" >}}
Cet ebook gratuit est un guide complet pour développer des compétences modernes d'analyse de données dans R. Il couvre un large éventail de méthodes pour traiter les données : les importer et les exporter, les transformer, les manipuler et les visualiser. Contrairement à la référence anglophone dont il s'inspire en partie (*R for Data Science*), il aborde aussi la modélisation statistique (régressions, modèles de comptage, etc.). Il utilise largement le `tidyverse`, un ensemble très répandu de packages R partageant un style de programmation cohérent, différent de R « de base », mais généralement considéré comme plus accessible. Il est accompagné du package [guideR](https://larmarange.github.io/guideR/) sur le CRAN et des vidéos [webin-R](https://larmarange.github.io/webin-R/).
{{< /resource >}}

{{< resource title="Introduction à la programmation en R" url="https://cran.r-project.org/doc/contrib/Goulet_introduction_programmation_R.pdf" authors="Vincent Goulet" level="intermediate" >}}
Un manuel de référence en français, gratuit et sous licence libre, issu d'un cours de l'Université Laval. Il offre une base solide sur les fondamentaux du langage R « de base » (structures de données, fonctions, boucles, programmation), avec de nombreux exemples et exercices corrigés. Son étude complète demande un investissement en temps important, et il ne couvre pas certains aspects modernes de la programmation en R comme le `tidyverse`. La dernière édition date de 2016, mais les fondamentaux du langage qu'il présente restent d'actualité.
{{< /resource >}}

{{< resource title="Advanced R" url="https://adv-r.hadley.nz" authors="Hadley Wickham" level="advanced" en_only="true" >}}
Ce livre s'adresse aux utilisateurs et utilisatrices de R prêts à atteindre et dépasser un niveau intermédiaire, grâce à une compréhension approfondie du fonctionnement du langage R, de la programmation fonctionnelle avancée, et au-delà.
{{< /resource >}}

{{< resource title="Créer un package R par la pratique" url="https://linogaliana.gitlab.io/collaboratif/package.html" authors="Lino Galiana et contributeurs (Insee)" level="advanced" >}}
Un guide pas à pas pour développer sereinement un package : initialisation avec `usethis`, métadonnées (`DESCRIPTION`), documentation avec `roxygen2`, tests avec `testthat`, contrôles de conformité et versionnage. Développer votre propre package pour gérer les outils que vous utilisez régulièrement est plus simple que vous ne le pensez ! Ce chapitre fait partie de la formation *Travail collaboratif avec R* de l'Insee ; certains exemples font référence à l'environnement de l'Insee (GitLab interne), mais la démarche est transposable à GitHub.
{{< /resource >}}
