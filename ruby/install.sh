#!/bin/sh

if test ! $(which rbenv)
then
  echo "  Installing rbenv for you."
  brew update
  brew install rbenv
fi