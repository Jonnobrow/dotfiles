#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
. "$DIR/base.sh"

PACK_PATH="$HOME/.local/share/nvim/site/pack/packer/start"
if [ ! -d "$PACK_PATH" ]; then
    mkdir -pv $PACK_PATH
fi
git clone https://github.com/wbthomason/packer.nvim $PACK_PATH/packer.nvim

# ZSH Plugins
ZSH_PLUGIN_DIR="$HOME/.local/share/zsh"
if [ ! -d "$ZSH_PLUGIN_DIR" ]; then
	git clone https://github.com/zsh-users/zsh-autosuggestions.git \
		$ZSH_PLUGIN_DIR/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
		$ZSH_PLUGIN_DIR/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-history-substring-search.git \
		$ZSH_PLUGIN_DIR/zsh-history-substring-search
fi
