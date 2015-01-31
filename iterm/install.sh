#!/bin/sh
#
# iTerm Solarized
#
# This installs the Solarized color schemes into iTerm.

open -a '/Applications/iTerm.app' "$ZSH/terminal/Solarized Light.itermcolors"
open -a '/Applications/iTerm.app' "$ZSH/terminal/Solarized Dark.itermcolors"

# Make colors work
/usr/libexec/PlistBuddy -c "Set :New\ Bookmarks:0:Use\ Bright\ Bold 1" ~/Library/Preferences/com.googlecode.iterm2.plist

exit 0
