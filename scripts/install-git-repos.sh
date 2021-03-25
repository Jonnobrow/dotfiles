#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
. "$DIR/base.sh"


# VIM PLUG
VIM_PLUG_PATH="$HOME/.local/share/nvim/site/autoload"
if [ ! -d "$VIM_PLUG_PATH" ]; then
	curl -fLo $VIM_PLUG_PATH/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	if ! [ -x "$(command -v nvim)" ]; then
		nvim +PlugInstall +qall --headless
	fi
fi

# ZSH Plugins
ZSH_PLUGIN_DIR="$HOME/.local/share/zsh"
if [! -d "$ZSH_PLUGIN_DIR" ]; then
	git clone https://github.com/zsh-users/zsh-autosuggestions.git \
		$ZSH_PLUGIN_DIR/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
		$ZSH_PLUGIN_DIR/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-history-substring-search.git \
		$ZSH_PLUGIN_DIR/zsh-history-substring-search
fi
