#!/bin/sh
#
# Homebrew Setup Script
#
# This installs common dependencies needed using Homebrew.

# Locate Homebrew
BREW_PATH=$(which brew 2>/dev/null)

# If Homebrew is not found, install it
if [ -z "$BREW_PATH" ]; then
    echo "Homebrew not found. Installing Homebrew for you..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || {
        echo "Failed to install Homebrew. Please check your internet connection and try again."
        exit 1
    }
    BREW_PATH=$(which brew)
fi

# Initialize Homebrew
if [ -n "$BREW_PATH" ]; then
    echo "Initializing Homebrew environment..."
    eval "$($BREW_PATH shellenv)" || {
        echo "Failed to initialize Homebrew. Please check your installation."
        exit 1
    }

    echo "Updating Homebrew and installing dependencies..."
    brew update

    # Check for global Brewfile
    if [ -f "$HOME/.Brewfile" ]; then
        brew bundle --global
    else
        echo "No global Brewfile found at ~/.Brewfile. Skipping bundle."
    fi

    brew cleanup
else
    echo "Failed to locate Homebrew. Please check the installation."
    exit 1
fi

echo "Homebrew setup complete!"
exit 0