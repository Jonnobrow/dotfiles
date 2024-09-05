#!/usr/bin/env

# Install xcode
if ! xcode-select -p 1>/dev/null; then
  xcode-select --install
fi

# Install brew
if ! type brew >/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Rosetta
softwareupdate --install-rosetta --agree-to-license

# Install Chezmoi
if ! type chezmoi >/dev/null; then
  brew install chezmoi
fi

# Bootstrap with Chezmoi
if ! [ -d ~/.local/share/chezmoi/ ]; then
  chezmoi init --apply https://github.com/Jonnobrow/dotfiles.git
  chezmoi git remote set-url origin git@github.com:Jonnobrow/dotfiles.git
else
  chezmoi git pull
  chezmoi apply
fi
