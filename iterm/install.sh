#!/bin/bash

# Directory containing the theme files
THEME_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Function to import a theme into iTerm2
import_theme() {
    local theme_file="$1"
    open "$theme_file"
}

# Iterate over each .itermcolors file in the directory
for theme in "$THEME_DIR"/*.itermcolors; do
    if [[ -f "$theme" ]]; then
        echo "Importing theme: $(basename "$theme")"
        import_theme "$theme"
    else
        echo "No .itermcolors files found in $THEME_DIR."
    fi
done