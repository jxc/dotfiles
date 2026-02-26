# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

A topic-based dotfiles repository for macOS, inspired by Holman's dotfiles. Each tool/concern gets its own directory with conventionally-named files that are automatically discovered and loaded.

## Key Commands

- `./script/bootstrap` — Full initial setup (git config, homebrew, symlinks, installers)
- `./script/install` — Run all `install.sh` scripts found in topic directories
- `./bin/dot_update` — Pull latest, update submodules, re-run all installers, update antidote plugins

- `make lint` — Run shellcheck on all shell scripts (`.sh` files, `script/*`, `bin/*`)
- `make vm-setup` — One-time: install Tart, pull macOS Sequoia base image
- `make vm-test` — Automated: clone fresh VM, run bootstrap, verify results, cleanup
- `make vm-shell` — Interactive: clone fresh VM, print SSH command for manual exploration
- `make vm-cleanup` — Stop and delete all leftover `dotfiles-test-*` VMs

## Architecture

### File Convention System

The zsh loader (`zsh/zshrc.symlink`) auto-discovers files by naming convention across all topic directories:

1. **`path.zsh`** — Loaded first. Use for `$PATH` modifications.
2. **`*.zsh`** (except path/completion) — Loaded second. Config, aliases, etc.
3. **`completion.zsh`** — Loaded last. Shell completions.
4. **`install.sh`** — Per-topic installer, run by `script/install` and `dot_update`.
5. **`*.symlink`** — Symlinked to `$HOME/.filename` (stripping `.symlink` suffix) by `script/bootstrap`.

### Environment Variables

- `$DOTFILES` → `$HOME/.dotfiles` (repo location)
- `$PROJECTS` → `$HOME/Code`
- `$EDITOR` → `vim`

### Local Customization (not versioned)

- `~/.localrc` — Sourced at end of zshrc for secrets/machine-specific config
- `~/.env-vars` — Sourced early in zshrc for environment variables
- `git/gitconfig.symlink.example` — Template; actual gitconfig is generated during bootstrap

### Auto-Update

A cron job (set by `autoupdate/install.sh`) runs `dot_update` every 2 hours, which pulls changes and re-runs installers.

## Adding a New Topic

1. Create a directory named after the tool (e.g., `node/`)
2. Add `path.zsh` if PATH changes are needed
3. Add `config.zsh` or `aliases.zsh` for shell configuration
4. Add `install.sh` for one-time setup
5. Add `*.symlink` files for dotfiles that should land in `$HOME`

Existing files are backed up with `.backup` suffix during symlink creation.

## Workflow Rules

- **Use Make targets** when they exist (e.g., `make lint` not `shellcheck ...` directly)
- **Lint and test before committing** — run `make lint` and `make vm-test` before every commit
- **Update CLAUDE.md** whenever new commands are added or architecture materially changes
- **Update README.md** whenever changes affect documented features, commands, or structure
