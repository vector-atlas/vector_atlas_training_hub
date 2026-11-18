---
title: Gestion du code
description: Garder la trace de votre code grâce au contrôle de version, avec Git et GitHub, depuis RStudio ou en ligne de commande.   # NEW
weight: 60
---

Vous avez écrit du code ; il s'agit maintenant de le gérer de façon à ne pas vous laisser déborder.

Vous enregistrez votre fichier `script.R`. Puis vous faites quelques modifications, mais vous souhaitez garder l'ancienne version au cas où : vous voilà avec `script2.R`. Vous faites d'autres modifications, essayez d'autres choses, et vous finissez avec 27 scripts, jusqu'à `copie_script9_alternatif_avec_autres_graphiques2.R`.

À la place, vous pouvez gérer ce processus en conservant un historique commenté des modifications et en *contrôlant* la *version* que vous utilisez. C'est ce qu'on appelle le contrôle de version (ou gestion de versions).

La méthode actuelle la plus courante consiste à utiliser le logiciel [Git](https://git-scm.com) pour suivre les modifications et pouvoir revenir en arrière si nécessaire.

Git est généralement associé à un service en ligne comme [GitHub](https://github.com), [GitLab](https://about.gitlab.com) ou [Bitbucket](https://bitbucket.org), qui permet de sauvegarder le code à distance pour plus de sécurité et facilite la collaboration sur les projets.

## Contrôle de version avec Git dans RStudio

{{< resource title="Utiliser Git avec RStudio (utilitR)" url="https://book.utilitr.org/03_Fiches_thematiques/Fiche_git_utilisation.html" authors="Projet utilitR (Insee)" level="beginner" >}}
Un excellent point de départ pour le contrôle de version lorsqu'on utilise R dans RStudio avec GitHub ou GitLab : cette fiche vous permettra d'être opérationnel rapidement. Elle couvre la création d'un projet RStudio relié à un dépôt distant, le suivi des modifications (*commit*), les échanges avec le dépôt distant (*pull*, *push*) et l'utilisation des branches, principalement via l'interface graphique de RStudio. Commencez par la fiche compagnon [Configurer Git sur son poste](https://book.utilitr.org/03_Fiches_thematiques/Fiche_configurer_git.html). La plupart des principes et des procédures s'appliquent quelle que soit la plateforme en ligne utilisée (GitHub, GitLab ou Bitbucket).
{{< /resource >}}

## Contrôle de version avec Git — toutes plateformes

{{< resource title="Pro Git" url="https://git-scm.com/book/fr/v2" authors="Scott Chacon et Ben Straub" level="intermediate" >}}
Un guide général et complet de l'utilisation de Git, intégralement traduit en français et disponible gratuitement. Il présente les différentes étapes de la gestion du code avec Git, principalement en ligne de commande, à l'aide des commandes `git` elles-mêmes. Nous vous conseillons de commencer par les chapitres 1 (*Démarrage rapide*) et 2 (*Les bases de Git*), puis le chapitre 6 consacré à GitHub.
{{< /resource >}}
