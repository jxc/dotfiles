#!/bin/sh
eval "$(/opt/homebrew/bin/brew shellenv)"
brew install antidote || brew upgrade antidote
antidote bundle <"$DOTFILES/antidote/zsh_plugins.txt" >~/.zsh_plugins.zsh
antidote update
