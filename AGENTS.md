# AGENTS.md — Vector Atlas Training Hub

Guide for anyone (human or AI agent) editing this repository. Several operators
and agents work on this site, so:

1. **Read [TASKS.md](TASKS.md) first.** It holds the current status, open tasks
   and the decision log.
2. **Update TASKS.md before you finish.** Tick off what you did, add new tasks you
   found, and add a dated line to the change log.

## What this is

A bilingual (English / French) website of curated, free training resources for
collaborators of the [Vector Atlas](https://vectoratlas.icipe.org). It is built
with **blogdown + Hugo** and deployed by GitHub Actions.

- Live site: <https://vector-atlas.github.io/vector_atlas_training_hub/> (French at `/fr/`)
- Repo: <https://github.com/vector-atlas/vector_atlas_training_hub>
- Contact address used on the site: **vectoratlas@icipe.org**

This repo is **self-sufficient**. The content originally came from the
`vector_atlas_training_resources` repo, which is no longer used — do not link to it
or pull anything from it.

## Rules

- **Both languages, every time.** Each page exists as `name.md` (English) and
  `name.fr.md` (French). If you add, remove or reorder a page or a resource, do the
  same in the other language. A missing counterpart breaks the language toggle for
  that page (it falls back to the other language's home page).
- **French and English lists are deliberately different.** Where possible, the
  French pages replace an English resource with a French-language equivalent. Where
  no equivalent exists, the English resource is kept and flagged `en_only="true"`
  (shown as 🇬🇧). Don't "sync" the two lists.
- **Translation rule.** Existing French text is used as is. Only translate text
  that is new or that you have changed. Mark every agent-written or changed French
  string so a French speaker can review it:
  - in YAML (front matter, `i18n/fr.yaml`): a trailing `# NEW` comment
  - in Markdown body text: an HTML comment such as `<!-- NEW: ... -->`
  - and add it to the "French review" task in TASKS.md.
- **Look and feel.** Clean and simple. The only accent colours are the Vector Atlas
  yellow `#ECBD40` and green `#0C8543` (from the logo); everything else is neutral
  grey. Colours live as CSS variables at the top of `assets/css/main.css`.
- **Links.** Internal links and assets must go through Hugo (`.RelPermalink`,
  `relURL`, shortcodes). Never hard-code a leading `/`: the site lives under the
  `/vector_atlas_training_hub/` subpath and such links break on GitHub Pages.
- **Don't commit `public/` or `resources/`.** CI builds the site.
- **Don't commit or push without the repo owner's say-so.**

## Layout

```
hugo.yaml                 Site config: baseURL, languages (en default at /, fr at /fr/), params
.Rprofile                 blogdown options; pins the Hugo version (blogdown.hugo.version)
content/
  _index.md / _index.fr.md            Home page intro text
  topics/
    _index.md / _index.fr.md          "Topics" list page
    <topic>.md / <topic>.fr.md        One page per topic (weight = order on home page)
i18n/en.yaml, i18n/fr.yaml            Interface text (buttons, badges, footer, notices)
layouts/
  baseof.html  home.html  page.html  section.html  404.html
  _partials/   head, header, footer, lang-switch, topic-card, english-only-note
  _shortcodes/ resource, see-also, english-only
assets/css/main.css                   All styles
assets/images/vector-atlas-logo.png   Logo (also cropped for the favicon)
static/.nojekyll                      Stops GitHub Pages running Jekyll
.github/workflows/site.yaml           Build + deploy
.claude/launch.json                   Local preview server for Claude Code desktop
```

Current topics (in order): `map-intro-course`, `learning-r`, `data-presentation`,
`spatial-data`, `species-distribution-modelling`, `code-management`.

## Adding a resource

Resources are written in the topic page with the `resource` shortcode. A shortcode
is a Hugo template tag you put in a Markdown file; this one turns a few fields plus a
Markdown description into a styled card.

```markdown
{{< resource title="R for Data Science (2<sup>nd</sup> edition)" url="https://r4ds.hadley.nz" authors="Hadley Wickham" level="intermediate" >}}
Description in Markdown — [links](https://example.org), *italics* and `code` all work.

Several paragraphs are fine.
{{< /resource >}}
```

With no description, close it on the same line: `{{< resource title="..." url="..." level="beginner" />}}`

| Parameter | Required | Notes |
|-----------|----------|-------|
| `title`   | yes | Markdown allowed (e.g. backticks around package names) |
| `url`     | yes | |
| `authors` | no  | Author(s) or organisation |
| `level`   | no  | `beginner`, `intermediate`, `advanced` or `all` (anything else stops the build) |
| `id`      | no  | Anchor id; defaults to the title. Set it if another page links here with `see-also`, and use the same id in both languages |
| `en_only` | no  | French pages only: `"true"` adds the 🇬🇧 badge and the "Ressource disponible en anglais uniquement" note (with a pre-filled email link) |
| `note`    | no  | `"false"` keeps the 🇬🇧 badge but hides the note (e.g. when one note covers a whole course) |

Then add the matching entry to the other language's page. The resource count and
level range on the home-page cards are computed automatically.

Other shortcodes:

- `{{< see-also page="/topics/map-intro-course" anchor="map-qgis" title="Spatial Data in QGIS (MAP)" level="beginner" >}}`
  — a slim card linking to a resource listed on another topic page (list each
  resource once, link to it elsewhere). Add `en_only="true"` on French pages if relevant.
- `{{< english-only title="Name of resource" >}}` — the French "English only" note
  on its own (used once for the whole MAP course).

Use `## Heading` between resources to group them within a page.

## Adding a topic

1. Create `content/topics/<slug>.md` and `content/topics/<slug>.fr.md` with the same
   `<slug>`:
   ```yaml
   ---
   title: Topic title
   description: One sentence shown on the home-page card and under the page title.
   weight: 70          # order on the home page (existing topics use 10, 20, … 60)
   ---
   ```
   (Use `description`, not `summary`: Hugo ≥ 0.169 treats `summary` specially.)
2. Optional `badge: start_here` adds the yellow "Start here" flag to the card.
3. Add resources, then build and check both languages.

## Interface text

Buttons, badges, the footer and notices come from `i18n/en.yaml` and `i18n/fr.yaml`.
Every key must exist in both files. The footer's email and repo URL come from
`params` in `hugo.yaml`.

## Build and preview locally

In RStudio (open `vector_atlas_training_hub.Rproj`):

```r
blogdown::serve_site()   # live preview; open the URL it prints (…/vector_atlas_training_hub/)
blogdown::stop_server()
blogdown::build_site()   # one-off build into public/ — the same command CI runs
```

Hugo version is pinned in `.Rprofile` (`blogdown.hugo.version`, currently 0.170.1).
Install it once with `blogdown::install_hugo("0.170.1")`. On macOS that downloads a
`.pkg` and asks for an admin password; if you can't give one, unpack it instead:
download `hugo_0.170.1_darwin-universal.pkg` from the Hugo releases page, run
`pkgutil --expand-full <pkg> out`, and copy `out/Payload/hugo` to
`~/Library/Application Support/Hugo/0.170.1/hugo`.

When changing the Hugo version, update `.Rprofile` only — CI reads it from there.

### R Markdown pages

All pages are currently plain `.md`, so no R code runs. If you add an `.Rmd`,
blogdown (with `blogdown.method = "markdown"`) knits it to a `.md` alongside it when
you save while `serve_site()` is running. **Commit both the `.Rmd` and its rendered
`.md`** — CI does not knit R Markdown.

## Checks before you push

In R, from the project root (uses blogdown's pinned Hugo):

```r
blogdown::hugo_cmd(c("--gc", "--printI18nWarnings", "--logLevel", "warn"))  # must print no WARN or ERROR lines
```

- Both languages build, and every page's language toggle points to its counterpart
  (`grep -o 'class="lang-switch" href="[^"]*"' public/**/index.html`).
- No internal link misses the subpath: `grep -rhoE '(href|src)="/[^"]*"' public | grep -v vector_atlas_training_hub` prints nothing.

## Deployment

`.github/workflows/site.yaml` (r-lib/actions pattern, as in `idem-lab/traveltime`):
on every push and pull request it installs R, blogdown and the pinned Hugo, and runs
`blogdown::build_site()`. On pushes to `main` it then publishes `public/` to the
`gh-pages` branch with `JamesIves/github-pages-deploy-action`.

One-off repo setting (needs repo admin): **Settings → Pages → Build and deployment →
Source: Deploy from a branch → `gh-pages` / `(root)`**. The `gh-pages` branch exists
after the first successful run on `main`.

## Hugo version notes (0.170)

- Templates use the newer layout structure (`layouts/home.html`, `layouts/_partials/`,
  `layouts/_shortcodes/`).
- Language config uses `label` / `locale` (not `languageName` / `languageCode`).
- Don't use `.Site.Languages` (deprecated in 0.156); the language toggle walks
  `site.Home.AllTranslations` instead.
- `.Process` takes one spec string; chain calls for multiple steps.
