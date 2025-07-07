#!/usr/bin/env zsh

# MacOS Packages
if [[ "$OSTYPE" == darwin* ]]; then

  if command -v brew &>/dev/null; then
    brew bundle --global
  fi

fi

# Mise
if command -v mise &>/dev/null; then
  mise install 
fi
