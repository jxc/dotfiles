# modern ls using eza (falls back to gls, then plain ls)
if command -v eza &>/dev/null; then
  alias l='eza -lF'                    # long list with type indicators (/, *, etc.)
  alias la='eza -laF'                  # long list, all files (including hidden)
  alias lr='eza -lR --sort=modified'   # long list, recursive, newest first
  alias lt='eza -l --sort=modified'    # long list, sorted by modification time
  alias ll='eza -l'                    # long list (no indicators)
  alias ldot='eza -ld .*'              # long list of dotfiles only
elif command -v gls &>/dev/null; then
  alias l='gls -lFh --color'           # long list with indicators, human sizes
  alias la='gls -lAFh --color'         # long list, all files, human sizes
  alias lr='gls -tRFh --color'         # long list, recursive, by time
  alias lt='gls -ltFh --color'         # long list, by modification time
  alias ll='gls -l --color'            # long list
  alias ldot='gls -ld --color .*'      # long list of dotfiles only
fi

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# because typing 'cd' is A LOT of work!!
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
