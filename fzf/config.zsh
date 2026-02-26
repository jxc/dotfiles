#!/bin/zsh

if command -v fzf &>/dev/null; then
  # Set up fzf key bindings and fuzzy completion
  source <(fzf --zsh)

  # Use fd for faster file listing if available
  if command -v fd &>/dev/null; then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
  fi
fi
