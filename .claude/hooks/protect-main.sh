#!/usr/bin/env bash
# Claude Code PreToolUse hook: enforces the "never work on main" red line.
# See AGENTS.md -> "RED LINE: never work on `main`" and "Enforcement hook".
#
# Denies (Claude Code cannot do these at all):
#   - Edit / Write / NotebookEdit on files in this repo while it is on `main`
#   - git commit / merge / rebase / cherry-pick / revert / am while on `main`
#   - discarding uncommitted work on `main` (reset --hard, restore, clean,
#     checkout -- / . / -f, stash drop / clear)
#   - any git push while on `main`, and any push that names `main` (or --all /
#     --mirror) from any branch
# Asks the operator (Claude Code shows a permission prompt):
#   - creating, copying or renaming a branch (git switch -c, git checkout -b,
#     git branch <name>, git worktree add -b, usethis::pr_init / pr_fetch)
#   - merging a pull request (gh pr merge)
#
# Not caught: commands that write files without git (sed -i, > file, R or
# Python scripts). The notes in AGENTS.md and the GitHub ruleset on `main`
# cover those.
#
# Needs bash, git and jq. If jq is missing the hook does nothing (fails open).

PROTECTED="main"

command -v jq >/dev/null 2>&1 || exit 0

input=$(cat)
tool=$(printf '%s' "$input" | jq -r '.tool_name // empty')
cwd=$(printf '%s' "$input" | jq -r '.cwd // empty')
[ -n "$cwd" ] || cwd=$(pwd)
project="${CLAUDE_PROJECT_DIR:-$cwd}"

proj_common=$(git -C "$project" rev-parse --path-format=absolute --git-common-dir 2>/dev/null) || exit 0

decide() { # $1 = deny | ask, $2 = reason
  jq -n --arg d "$1" --arg r "$2" '{
    hookSpecificOutput: {
      hookEventName: "PreToolUse",
      permissionDecision: $d,
      permissionDecisionReason: $r
    }
  }'
  exit 0
}

# Make a path absolute: $1 = path, $2 = base directory.
absolute() {
  case "$1" in
    /*) printf '%s' "$1" ;;
    "~") printf '%s' "$HOME" ;;
    "~/"*) printf '%s/%s' "$HOME" "${1#"~/"}" ;;
    *) printf '%s/%s' "$2" "$1" ;;
  esac
}

# Branch of the checkout containing path $1, but only if that checkout belongs
# to this repo (the main checkout or one of its worktrees); empty otherwise.
branch_of() {
  local d="$1"
  while [ -n "$d" ] && [ "$d" != "/" ] && [ ! -d "$d" ]; do d=$(dirname "$d"); done
  local common
  common=$(git -C "$d" rev-parse --path-format=absolute --git-common-dir 2>/dev/null) || return 0
  [ "$common" = "$proj_common" ] || return 0
  git -C "$d" branch --show-current 2>/dev/null
}

ON_MAIN="RED LINE (AGENTS.md): this checkout is on \`$PROTECTED\`, which is the live site. Agents must not edit, commit, merge or push on \`$PROTECTED\`. Stop and ask the operator whether to create a branch for this work (you may suggest a name, e.g. content/<short-description>). Do not create one without their yes."

case "$tool" in
  Edit|MultiEdit|Write|NotebookEdit)
    file=$(printf '%s' "$input" | jq -r '.tool_input.file_path // .tool_input.notebook_path // empty')
    [ -n "$file" ] || exit 0
    file=$(absolute "$file" "$cwd")
    if [ "$(branch_of "$(dirname "$file")")" = "$PROTECTED" ]; then
      decide deny "$ON_MAIN"
    fi
    exit 0
    ;;

  Bash)
    cmd=$(printf '%s' "$input" | jq -r '.tool_input.command // empty')
    case "$cmd" in *git*|*gh*|*pr_*) ;; *) exit 0 ;; esac

    # Which checkout the command acts on: `git -C <dir>`, else a leading
    # `cd <dir>`, else the session's working directory.
    q="'"
    dir=$(printf '%s' "$cmd" | sed -nE "s/.*git[[:space:]]+-C[[:space:]]+(\"([^\"]+)\"|$q([^$q]+)$q|([^[:space:]]+)).*/\\2\\3\\4/p" | head -n1)
    [ -n "$dir" ] || dir=$(printf '%s' "$cmd" | sed -nE "1s/^[[:space:]]*cd[[:space:]]+(\"([^\"]+)\"|$q([^$q]+)$q|([^[:space:];&|]+)).*/\\2\\3\\4/p")
    if [ -n "$dir" ]; then dir=$(absolute "$dir" "$cwd"); else dir="$cwd"; fi
    branch=$(branch_of "$dir")

    # `git` (with any global options) followed by a subcommand; E ends a word
    # (a hyphen does not, so `merge-base` is not `merge`).
    G="(^|[;&|(\`\"$q/[:space:]])git([[:space:]]+(-[Cc][[:space:]]+[^[:space:]]+|--[^[:space:]]+))*[[:space:]]+"
    E='([^[:alnum:]_-]|$)'
    has() { printf '%s' "$cmd" | grep -Eq "$1"; }

    if has "${G}push$E"; then
      if [ "$branch" = "$PROTECTED" ]; then
        decide deny "RED LINE (AGENTS.md): this checkout is on \`$PROTECTED\` and agents never push from \`$PROTECTED\`. Changes reach \`$PROTECTED\` only through a pull request merged on GitHub. If there is work to push, it belongs on a feature branch: ask the operator."
      fi
      if has "${G}push[^;&|]*([[:space:]:+]|refs/heads/)$PROTECTED([[:space:];&|]|$)" \
        || has "${G}push[^;&|]*[[:space:]]--(all|mirror)$E"; then
        decide deny "RED LINE (AGENTS.md): agents never push to \`$PROTECTED\`. Changes reach \`$PROTECTED\` only through a pull request merged on GitHub. Push your feature branch (git push -u origin <branch>) and open a pull request instead."
      fi
    fi

    if [ "$branch" = "$PROTECTED" ]; then
      if has "${G}(commit|merge|rebase|cherry-pick|revert|am)$E"; then
        decide deny "$ON_MAIN"
      fi
      if has "${G}(reset[^;&|]*[[:space:]]--hard|restore$E|clean$E|checkout[^;&|]*[[:space:]](--|\\.|-f|--force)([[:space:];&|]|$)|stash[[:space:]]+(drop|clear))"; then
        decide deny "RED LINE (AGENTS.md): uncommitted changes on \`$PROTECTED\` are someone else's work in progress. Don't discard them. Tell the operator, and offer to move them onto a new branch (git switch -c <branch>) only with their OK."
      fi
    fi

    # Creating (or copying / renaming) a branch always needs the operator's yes.
    if has "${G}switch[^;&|]*[[:space:]](-c|-C|--create|--force-create)$E" \
      || has "${G}checkout[^;&|]*[[:space:]](-b|-B|--orphan)$E" \
      || has "${G}branch([[:space:]]+(-f|--force|-t|--track(=[^[:space:]]*)?|--no-track|-c|-C|--copy|-m|-M|--move))*[[:space:]]+[^-[:space:];&|]" \
      || has "${G}worktree[[:space:]]+add[^;&|]*[[:space:]]-[bB]$E" \
      || has 'pr_(init|fetch)[[:space:]]*\('; then
      decide ask "AGENTS.md: agents never create a branch on their own. Operator: approve only if you have agreed to this branch and its name."
    fi

    # Merging a pull request is the operator's decision.
    if has "(^|[;&|(\`\"$q[:space:]])gh[[:space:]]+pr[[:space:]]+merge$E"; then
      decide ask "AGENTS.md: merging a pull request is the operator's decision, after review and a passing site check. Approve only if you asked for this merge."
    fi
    exit 0
    ;;
esac

exit 0
