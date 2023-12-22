#!/bin/sh
eval "$(/opt/homebrew/bin/brew shellenv)"
brew install antidote || brew upgrade antidote
antidote bundle <"$DOTFILES/antidote/bundles.txt" >~/.zsh_plugins.sh
antidote update
