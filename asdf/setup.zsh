#!/bin/sh

eval "$(/opt/homebrew/bin/brew shellenv)"

ASDF_SH="$(brew --prefix asdf 2>/dev/null)/libexec/asdf.sh"
# shellcheck disable=SC1090
[ -f "$ASDF_SH" ] && . "$ASDF_SH"
