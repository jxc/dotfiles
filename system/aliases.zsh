# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias l='gls -lFh --color'     #size,show type,human readable
  alias la='gls -lAFh --color'   #long list,show almost all,show type,human readable
  alias lr='gls -tRFh --color'   #sorted by date,recursive,show type,human readable
  alias lt='gls -ltFh --color'   #long list,sorted by date,show type,human readable
  alias ll='gls -l --color'      #long list
  alias ldot='ls -ld --color .*'
fi

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias -s pdf=acroread
alias -s ps=gv
alias -s dvi=xdvi
alias -s chm=xchm
alias -s djvu=djview

# because typing 'cd' is A LOT of work!!
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'