# macOS appearance toggles
# iTerm2 follows system appearance when "Use separate colors for light and dark mode" is enabled
alias dark='osascript -e "tell app \"System Events\" to tell appearance preferences to set dark mode to true"'
alias light='osascript -e "tell app \"System Events\" to tell appearance preferences to set dark mode to false"'
alias toggle-dark='osascript -e "tell app \"System Events\" to tell appearance preferences to set dark mode to not dark mode"'
