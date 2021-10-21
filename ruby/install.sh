#!/bin/sh

if test ! $(which rbenv)
then
  echo "  Installing Rbenv for you."
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

echo "Installing ruby 3"
if [[ ! -d "$HOME/.rbenv/versions/3.0.1" ]]; then
  rbenv install 3.0.1
fi

echo "Rehash ruby"
rbenv rehash

echo "Setting up the global ruby version"
rbenv global 3.0.1

echo "Updating ruby gems"
gem update --system

echo "Installing Bundler"
gem install bundler