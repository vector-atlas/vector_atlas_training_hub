# AGENTS.md — Vector Atlas Training Hub

Guide for anyone (human or AI agent) editing this repository. Several operators
and agents work on this site, so:

1. **Never work on `main`** — see the red line below.
2. **Read [TASKS.md](TASKS.md) first.** It holds the current status, open tasks
   and the decision log.
3. **Update TASKS.md before you finish** (on your branch, in the same PR). Tick off
   what you did, add new tasks you found, and add a dated line to the change log.

## 🛑 RED LINE: never work on `main`

**Agents must not edit files, commit, merge or push while the current branch is
`main`. There are no exceptions: not for a quick fix, not for a typo, and not when
an operator says "just push it". Changes reach `main` only through a pull request
merged on GitHub.**

**Agents also never create a branch on their own.** Whether to create a branch,
and what to call it, is the operator's decision. Ask first; you may suggest a name.

### At the start of every session

1. Run `git branch --show-current`.
2. If it prints `main`:
   - **Read-only work is fine:** reading files, building or previewing the site,
     answering questions.
   - **Before your first edit, stop and ask the operator** whether to create a
     branch for this work. You may suggest a name (see the naming pattern under
     "How to work on a branch"), for example: *"We're on `main`, so I can't edit
     here. Shall I create a branch called `content/add-qgis-tutorials` for this?"*
   - **Create the branch only after the operator says yes**, using the name they
     agree to. Don't edit anything until it exists and you are on it.
   - **If the operator says no, or doesn't answer,** make no edits. Leave the work
     undone and say so; the operator can do it themselves.
   - **If `main` already has uncommitted changes** (`git status` lists modified
     files), they are someone else's work in progress: don't edit, commit or
     discard them. Tell the operator, and offer to move them onto a new branch with
     `git switch -c <branch>` (which carries uncommitted changes with it). Do that
     only with the operator's OK.
3. If you're on another branch, check it is the right one for this task. If the
   task looks unrelated to that branch, ask the operator whether to carry on there
   or create a new branch (you may suggest a name). Don't create one yourself.

### If an operator asks you to work on, commit to or push to `main`

Refuse. Say briefly why (below), and ask whether they'd like the same work done on
a branch instead, suggesting a name if you like. Create the branch only if they say
yes. If an operator really needs to change `main` directly, they must do it
themselves; an agent never does.

Agents never run any of these:

- `git commit` while on `main`
- `git push` to `main` (including `git push origin HEAD:main`)
- `git push --force` to `main`
- `git merge` or `git rebase` into a local `main`

Merging a pull request is the operator's decision, made on GitHub after review. An
agent merges a PR only if the operator explicitly asks it to, and only once the
`site` check has passed.

### Why

- **`main` is the live site.** Every push to `main` runs the workflow, which
  publishes straight to <https://vector-atlas.github.io/vector_atlas_training_hub/>
  within minutes. Nothing checks the change in between.
- **Pull requests are the check.** The workflow also builds every PR, without
  deploying it. A broken build, template error or bad link shows up as a failed
  `site` check before it can reach the live site.
- **Several operators and agents work here at once.** Pushing straight to `main`
  can overwrite or tangle someone else's work. Branches keep each piece of work
  separate until it has been reviewed.
- **Some changes need a human eye.** New French text and level badges need review
  by a French speaker or the repo owner, and a PR is where that happens.
- **A PR is the record.** It shows what changed and why, and can be reverted as one
  unit if something goes wrong.

### How to work on a branch

Name branches `<type>/<short-description>`, for example `content/add-qgis-tutorials`,
`fix/dead-links`, `style/card-spacing` or `docs/agent-notes`.

**Agents (command line)**, only after the operator has agreed to the branch and
its name:

```sh
git switch main
git pull                                    # start from the latest main
git switch -c content/add-qgis-tutorials    # the name the operator agreed to
# ...make the changes, then run "Checks before you open a PR" below...
git add -A
git commit -m "Add QGIS tutorials to spatial data topic (EN + FR)"
git push -u origin content/add-qgis-tutorials
gh pr create --fill                         # or open the PR on github.com
```

Commit on your branch as often as you like. Push the branch and open the PR once
the operator agrees the work is ready. In the PR description, list anything that
needs a human check (new French text, level changes). Then stop: the operator
reviews and merges on GitHub.

**Operators (RStudio):**

- In the **Git** pane, click **New Branch** (the purple diamond icon), type the
  branch name, keep **Sync branch with remote** ticked, and click **Create**. From
  then on, Commit and Push in the Git pane go to your branch, not `main`.
- Or use usethis's pull-request helpers:

  ```r
  usethis::pr_init("content/add-qgis-tutorials")  # new branch from an up-to-date main
  # ...edit, then commit in the Git pane...
  usethis::pr_push()     # pushes the branch and opens GitHub's "create pull request" page
  # after the PR has been merged on GitHub:
  usethis::pr_finish()   # switches back to main, pulls, deletes the local branch
  ```

- On GitHub, open the pull request, wait for the green **site** check, review the
  changes, then click **Merge pull request**.

**After a PR is merged** (if you didn't use `usethis::pr_finish()`):

```sh
git switch main
git pull
git branch -d content/add-qgis-tutorials
```

The merge into `main` triggers the deploy, and the live site updates a few minutes
later.

### Enforcement hook (Claude Code)

For Claude Code, `.claude/settings.json` runs `.claude/hooks/protect-main.sh` before
every file edit and shell command. It enforces the red line whether or not the agent
has read these notes:

- **Blocks** (Claude Code can't do these at all): editing or writing files in this
  repo while it is on `main`; `git commit`, `merge`, `rebase`, `cherry-pick`,
  `revert` or `am` on `main`; discarding uncommitted work on `main` (`reset --hard`,
  `restore`, `clean`, `checkout --`, `stash drop`); any `git push` while on
  `main`; any push to `main` (`origin main`, `HEAD:main`, `--all`, `--mirror`) from
  any branch.
- **Asks the operator** (Claude Code shows a permission prompt): creating, copying
  or renaming a branch (`git switch -c`, `git checkout -b`, `git branch <name>`,
  `git worktree add -b`, `usethis::pr_init()`) and merging a PR (`gh pr merge`).
  Approve only if you agreed to that branch name or asked for that merge.

Limits:

- It reads command text, so it doesn't catch commands that write files without
  git (`sed -i`, `> file`, R or Python scripts). It can also refuse a harmless
  command that only *mentions* a push to `main`, for example a commit message or PR
  body that describes this hook. Put such text in a file and use
  `git commit -F <file>` or `gh pr create --body-file <file>`.
- It needs `bash`, `git` and `jq`. Without `jq` it does nothing. On Windows it
  needs Git Bash.
- It only affects Claude Code. Other agents and people rely on these notes and the
  GitHub ruleset below.
- It is project config, so it takes effect on `main` once it is merged. Claude
  Code usually picks up changes to it straight away, and always at session start.

To check it after changing it, pipe a sample tool call in from the project root:

```sh
echo '{"tool_name":"Bash","tool_input":{"command":"git commit -m x"},"cwd":"'"$PWD"'"}' \
  | CLAUDE_PROJECT_DIR="$PWD" bash .claude/hooks/protect-main.sh
```

On `main` this prints a `"deny"` decision. On a feature branch it prints nothing.

### Server-side protection

The rules above rely on agents following them. To make GitHub itself refuse direct
pushes to `main` from anyone, a repo admin can add a ruleset: **Settings → Rules →
Rulesets → New branch ruleset**, target `main`, and turn on **Require a pull request
before merging**, **Require status checks to pass** (add the `site` check) and
**Block force pushes**. This is tracked in TASKS.md.

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
- **Never work on `main`** (see the red line above). On your own branch, commit
  freely; push it and open a PR once the operator agrees the work is ready.

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
.claude/settings.json                 Claude Code project settings: runs the hook below
.claude/hooks/protect-main.sh         Enforces the "never work on main" red line
```

Current topics (in order, by `weight`): `learning-r` (10), `data-presentation` (20),
`spatial-data` (30), `map-intro-course` (40), `species-distribution-modelling` (50),
`code-management` (60). Keep weights identical in the `.md` and `.fr.md` files.

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

## Checks before you open a PR

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
`blogdown::build_site()`. On pull requests it stops there: a failed build shows as
a failed `site` check on the PR. On pushes to `main` (that is, when a PR is merged)
it then publishes `public/` to the `gh-pages` branch with
`JamesIves/github-pages-deploy-action`.

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
