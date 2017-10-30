#!/bin/sh

if test ! $(which chruby)
then
  echo "  Installing Chruby for you."
  brew update
  brew install chruby
fi