#!/bin/sh

eval "$(/opt/homebrew/bin/brew shellenv)"

brew install asdf || brew upgrade asdf

mkdir -p "${ASDF_DATA_DIR:-$HOME/.asdf}/completions"
asdf completion zsh > "${ASDF_DATA_DIR:-$HOME/.asdf}/completions/_asdf"
