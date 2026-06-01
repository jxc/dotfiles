# mise: per-directory toolchain resolution (reads .tool-versions + .mise.toml).
# Replaces asdf (migrated 2026-05-31). Homebrew's path.zsh sources first
# (alphabetical glob order), so `mise` is already on PATH by the time this runs.
command -v mise >/dev/null && eval "$(mise activate zsh)"
