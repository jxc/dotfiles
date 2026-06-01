#!/bin/sh

eval "$(/opt/homebrew/bin/brew shellenv)"

brew install mise || brew upgrade mise
