# TASKS.md — status, open tasks and decisions

Shared record for everyone (people and agents) working on this repo. Keep it current:
tick tasks off, add new ones, and add a dated line to the change log at the end of
each session. How the site works is in [AGENTS.md](AGENTS.md).

## Current status (2026-11-18)

- Site is **live** at <https://vector-atlas.github.io/vector_atlas_training_hub/>
  (home page plus six topic pages, English and French), deployed by GitHub Actions
  to `gh-pages`.
- Topic order changed after launch (see change log); that change is local and not
  yet committed.

## Open tasks

### Launch
- [x] Commit and push to `main` (repo owner).
- [x] Set **Settings → Pages → Deploy from a branch → `gh-pages` / (root)**.
- [x] Site live.

### Review
- [ ] **Level badges** — first-pass levels set by an agent; confirm or change them in the topic files.

  | Topic | Resource (EN) | Resource (FR) | Level |
  |-------|---------------|---------------|-------|
  | MAP course | all four tutorials | same (🇬🇧) | beginner |
  | Learning R | A Gentle Introduction to Tidy Statistics in R | Premier contact avec R et RStudio (webin-R) | beginner |
  | Learning R | Getting Started with Data in R | Prise en main de R | beginner |
  | Learning R | RStudio Education | Rzine | all |
  | Learning R | R for Data Science | guide-R | intermediate |
  | Learning R | R Programming (Coursera) | Introduction à la programmation en R | intermediate |
  | Learning R | Advanced R | Advanced R (🇬🇧) | advanced |
  | Learning R | R Packages | Créer un package R par la pratique | advanced |
  | Data presentation | Data Visualization: A Practical Introduction | same (🇬🇧) | intermediate |
  | Data presentation | ggplot2: Elegant Graphics for Data Analysis | GGPlot2 Essentials | intermediate |
  | Spatial data | Spatial data with `terra` | Les données raster avec `terra` | intermediate |
  | Spatial data | Simple Features for R | Les données vectorielles avec `sf` | intermediate |
  | Spatial data | Spatial Data in QGIS (QGIS) | Données spatiales dans QGIS (QGIS) | beginner |
  | SDM | Species Distribution Modelling | same (🇬🇧) | intermediate |
  | SDM | SDM for Vectors Course | same (🇬🇧) | advanced |
  | SDM | Boosted Regression Trees | same (🇬🇧) | advanced |
  | Code management | Happy Git and GitHub for the useR | Utiliser Git avec RStudio (utilitR) | beginner |
  | Code management | Git is my lab book | Pro Git | intermediate |

- [ ] **French review** of agent-written or changed text (all marked `# NEW` or `<!-- … -->`):
  - `i18n/fr.yaml`: every line marked `# NEW` (navigation, level names, badge text, 404 page).
  - `i18n/fr.yaml`: changed from README_fr: "Ce site est maintenu…", "un problème sur le site…".
  - `description:` in every `content/topics/*.fr.md` (home-page card text).
  - Topic title "Apprendre R" and section title "Thèmes".
  - `content/_index.fr.md`: "Ce dépôt" → "Ce site".
  - `content/topics/map-intro-course.fr.md`: "abordés plus bas" → "abordés dans les autres thèmes de ce site".
- [ ] Footer says "This site is maintained by Gerry Ryan on behalf of the Vector Atlas"
      (kept from the original README). Keep, change, or drop?

### Content and maintenance
- [ ] Add further resources (repo owner to specify).
- [ ] EN QGIS links point to version 3.28 docs (`docs.qgis.org/3.28/en/…`); the FR page
      uses `latest`. Consider switching EN to `latest`.
- [ ] Consider an automated link checker in CI (e.g. lychee) to catch dead links.

## Decision log

| Date | Decision | Why |
|------|----------|-----|
| 2026-11-18 | Six topics: MAP intro course; Learning R; Data presentation; Working with spatial data; Modelling species' distributions; Code management | Agreed with repo owner; avoids one long list |
| 2026-11-18 | Topic order: Learning R, Data presentation, Working with spatial data, MAP intro course, Modelling species' distributions, Code management; no "Start here" badge | Repo owner, after launch |
| 2026-11-18 | Whole site bilingual; English at `/`, French at `/fr/`; toggle on every page links to the same page in the other language | Repo owner |
| 2026-11-18 | French content taken unchanged from the original `README_fr.md`; only new or changed text is translated, and marked for review | Repo owner |
| 2026-11-18 | Each MAP tutorial listed once (MAP page) and linked from the spatial page with `see-also` | Removes duplicate entries |
| 2026-11-18 | Clean and simple design; accents only in VA yellow `#ECBD40` and green `#0C8543`; custom templates in this repo (no external theme) | Repo owner; common blogdown themes lack good multilingual support or bring heavy toolchains |
| 2026-11-18 | Resources written in Markdown with a `resource` shortcode | Collaborators are R users comfortable with Markdown; gives consistent cards |
| 2026-11-18 | Level badges added (beginner / intermediate / advanced / all) | Repo owner: "add for now" |
| 2026-11-18 | Deploy with GitHub Actions to a `gh-pages` branch (r-lib/actions + JamesIves, as in idem-lab/traveltime) | Repo owner |
| 2026-11-18 | Repo is self-sufficient; old `vector_atlas_training_resources` repo not used | Repo owner |
| 2026-11-18 | Contact `vectoratlas@icipe.org`; issues go to this repo | Repo owner |
| 2026-11-18 | Hugo pinned at 0.170.1 (standard build; no SCSS, so "extended" not needed) | Reproducible builds |
| 2026-11-18 | CI runs `blogdown::build_site()` without knitting; any `.Rmd` is knitted locally and its `.md` committed | Standard blogdown practice; also `build_rmd = TRUE` errors when there are no `.Rmd` files (blogdown 1.24) |

## Change log

- **2026-11-18** (Claude Code agent) — Reordered topics (weights in both languages):
  Learning R 10, Data presentation 20, Working with spatial data 30, MAP intro course
  40, SDM 50, Code management 60. Removed `badge: start_here` from the MAP course.
  Clean build; previous/next links follow the new order.
- **2026-11-18** (Claude Code agent) — Initial site: config, templates, styles,
  shortcodes, EN/FR content for home + six topics, i18n strings, CI workflow,
  AGENTS.md, TASKS.md. Content migrated from the original README.md / README_fr.md
  with these edits:
  - email `vector.atlas@biology.ox.ac.uk` → `vectoratlas@icipe.org` (footer and all six
    French "English only" notes); issues link → this repo;
  - "repository"/"page" → "site" where the text described the site itself;
  - English typo fixes: "paackage", "Distriubtion", "articale", "the though",
    "recommend to setting", "plots do best communicate", "1--hour",
    "update materials make", "takes you though".
  Verified: clean build (no warnings); every external URL from both READMEs is
  present except the retired issues link and old hotlinked logo; no internal link
  misses the subpath; toggle resolves on all 16 pages; no horizontal scroll at 375px.
