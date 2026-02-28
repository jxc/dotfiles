#!/bin/zsh

# fzf: fuzzy finder — type to filter, Enter to select, Esc to cancel
# Key bindings (after sourcing):
#   Ctrl+T  — fuzzy find a file; path is inserted at cursor
#   Ctrl+R  — fuzzy search shell history
#   Alt+C   — fuzzy find a directory; cd into the one you pick

if command -v fzf &>/dev/null; then
  # Set up fzf key bindings and fuzzy completion
  source <(fzf --zsh)

  # Use fd for faster file listing if available (replaces find)
  if command -v fd &>/dev/null; then
    # Files only, include hidden, follow symlinks, skip .git
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"   # same for Ctrl+T file picker
    # Directories only, for Alt+C "cd into directory"
    export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
  fi
fi
