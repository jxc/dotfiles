#!/bin/sh
eval "$(/opt/homebrew/bin/brew shellenv)"
brew install antidote || brew upgrade antidote
ANTIDOTE="$(brew --prefix)/opt/antidote/share/antidote/antidote"
"$ANTIDOTE" bundle <"$DOTFILES/antidote/zsh_plugins.txt" >~/.zsh_plugins.zsh
"$ANTIDOTE" update
