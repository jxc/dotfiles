#!/bin/sh
#
# Homebrew Setup Script
#
# This installs common dependencies needed using Homebrew.

eval "$(/opt/homebrew/bin/brew shellenv)"

# Check for Homebrew
if test "$(which brew)"
then
  brew update
  brew bundle --global
  brew cleanup
else
  echo "  Installing Homebrew for you."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi