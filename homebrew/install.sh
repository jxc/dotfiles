#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Check for Homebrew
if test $(which brew)
then
  brew update
  brew upgrade
else
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Tap taps
tapped_taps=$(brew tap -1)
for t in `cat ${DIR}/Tapfile | grep -v "#"`; do
    if ! [ ! -z $(echo "${tapped_taps}" | grep "^${t}\$") ]
    then
        brew tap ${t}
    fi
done

# Install Homebrew formulae
installed_formulae=$(brew list -1)
for f in `cat ${DIR}/Brewfile | grep -v "#"`; do
    if ! [ ! -z $(echo "${installed_formulae}" | grep "^${f}\$") ]
    then
        brew install ${f}
    fi
done

# Install casks
installed_casks=$(brew cask list -1)
for c in `cat ${DIR}/Caskfile | grep -v "#"`; do
    if ! [ ! -z $(echo "${installed_casks}" | grep "^${c}\$") ]
    then
        brew cask install ${c}
    fi
done

# Cleanup
brew cask cleanup

exit 0
