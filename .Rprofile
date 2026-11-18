# Load the user's own profile first, if they have one
if (file.exists("~/.Rprofile")) {
  base::sys.source("~/.Rprofile", envir = environment())
}

options(
  # Pinned Hugo version; CI installs the same one (.github/workflows/site.yaml)
  blogdown.hugo.version = "0.170.1",
  # Render any .Rmd to .md so Hugo (and our shortcodes) process it
  blogdown.method = "markdown",
  blogdown.ext = ".md",
  blogdown.subdir = "topics",
  blogdown.serve_site.startup = FALSE,
  blogdown.knit.on_save = TRUE
)
