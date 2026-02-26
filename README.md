# dotfiles

My macOS dotfiles, built around topic directories. Forked from [holman/dotfiles](https://github.com/holman/dotfiles), borrows from [caarlos0/dotfiles](https://github.com/caarlos0/dotfiles).

## Install

```console
git clone git@github.com:tylerwolf/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./script/bootstrap
```

Bootstrap will:
1. Set up your git author name/email (interactive, first run only)
2. Symlink all `*.symlink` files into `$HOME` (existing files backed up with `.backup` suffix)
3. Install Homebrew and everything in the `Brewfile`
4. Run all topic `install.sh` scripts (antidote, asdf, fonts, git config, autoupdate cron)

### macOS defaults

Optionally apply preferred macOS system/Finder/Dock settings:

```console
./macos/set-defaults.sh
```

Requires a logout or restart to take full effect.

## How it works

Everything is organized into **topic directories** (e.g., `git/`, `ruby/`, `zsh/`). The zsh loader (`zsh/zshrc.symlink`) auto-discovers files by naming convention:

| Pattern | When loaded | Purpose |
|---------|------------|---------|
| `path.zsh` | First | `$PATH` modifications |
| `*.zsh` | Second | Config, aliases, functions |
| `completion.zsh` | Last | Shell completions |
| `install.sh` | On bootstrap/update | One-time setup for the topic |
| `*.symlink` | On bootstrap | Symlinked to `$HOME/.filename` |

**bin/** is added to `$PATH` — anything in there is available everywhere.

To add a new topic, create a directory and drop in files following the conventions above.

## Keeping up to date

A cron job (installed by `autoupdate/install.sh`) runs `bin/dot_update` every 2 hours, which pulls the latest changes, updates submodules, re-runs all installers, and refreshes antidote plugins.

## Testing

Changes can be tested in a sandboxed macOS VM using [Tart](https://tart.run):

```console
make vm-setup    # one-time: install Tart, pull macOS Sequoia base image
make vm-test     # automated: clone VM, run bootstrap, verify results, cleanup
make vm-shell    # interactive: clone VM, print SSH info for manual exploration
make vm-cleanup  # stop and delete all leftover dotfiles-test-* VMs
```

## Local customization

These files are not checked in and won't be overwritten:

- **`~/.localrc`** — sourced at end of zshrc (secrets, machine-specific config)
- **`~/.env-vars`** — sourced early in zshrc (environment variables)
- **`~/.gitconfig.local`** — included by gitconfig for machine-specific git settings

## Linting

```console
make lint
```

Runs [shellcheck](https://www.shellcheck.net/) on all shell scripts.

