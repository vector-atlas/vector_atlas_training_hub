# Vector Atlas Training Hub

Source for <https://vector-atlas.github.io/vector_atlas_training_hub/>, a bilingual
(English / French) collection of free training resources for collaborators of the
[Vector Atlas](https://vectoratlas.icipe.org), on data management, visualisation,
spatial analysis and modelling of mosquito disease vectors.

Built with [blogdown](https://pkgs.rstudio.com/blogdown/) and Hugo; deployed to
GitHub Pages by GitHub Actions on every push to `main`.

## Working on the site

**Don't push to `main`.** `main` is the live site. Work on a branch and open a pull
request; it gets merged on GitHub once the `site` check passes.

```r
usethis::pr_init("content/my-change")  # new branch from an up-to-date main
blogdown::serve_site()                 # live preview in RStudio
# ...edit, commit in the Git pane...
usethis::pr_push()                     # push the branch and open a pull request
```

- How the site is organised, the branch and pull-request workflow, how to add a
  resource or topic, and the rules for the two languages: [AGENTS.md](AGENTS.md)
- Current status, open tasks and decisions: [TASKS.md](TASKS.md)

## Questions

Broken link or other problem? [Open an issue](https://github.com/vector-atlas/vector_atlas_training_hub/issues).
Anything else: vectoratlas@icipe.org
