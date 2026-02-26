# modern ls using eza (falls back to gls, then plain ls)
if command -v eza &>/dev/null; then
  alias l='eza -lF'
  alias la='eza -laF'
  alias lr='eza -lR --sort=modified'
  alias lt='eza -l --sort=modified'
  alias ll='eza -l'
  alias ldot='eza -ld .*'
elif command -v gls &>/dev/null; then
  alias l='gls -lFh --color'
  alias la='gls -lAFh --color'
  alias lr='gls -tRFh --color'
  alias lt='gls -ltFh --color'
  alias ll='gls -l --color'
  alias ldot='gls -ld --color .*'
fi

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# because typing 'cd' is A LOT of work!!
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
