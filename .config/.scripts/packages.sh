#!/usr/bin/env zsh

# GPG Directory
if [ -d "$GNUPG_HOME" ]; then
  chown -R $(whoami) $GNUPG_HOME
  find $GNUPG_HOME -type f -exec chmod 600 {} \;
  find $GNUPG_HOME -type d -exec chmod 700 {} \;
fi

# MacOS Packages
if [[ "$OSTYPE" == darwin* ]]; then

  if command -v brew &>/dev/null; then
    brew bundle --global
  fi

elif [[ "$OSTYPE" == linux* ]]; then

  if command -v dnf &>/dev/null; then
    sudo dnf update && sudo dnf upgrade
    sudo dnf install \
       make automake gcc gcc-c++ kernel-devel \
       git neovim keepassxc zsh kitty nextcloud-client
  fi

fi

# Mise
if command -v mise &>/dev/null; then
  mise install
else
  curl https://mise.run | sh
  mise install
fi
