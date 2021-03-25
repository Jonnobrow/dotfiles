#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
. "$DIR/ansi"
. "$DIR/base.sh"

# Ask for SUDO
sudo -v

# Python Language Server
ansi --yellow "Installing Python Language Server"
pip install 'python-language-server[all]'

# Docker Language Server
ansi --yellow "Installing Docker Language Server"
sudo npm install -g dockerfile-language-server-nodejs

# Go Language Server
ansi --yellow "Installing Go Language Server"
GO111MODULE=on go get golang.org/x/tools/gopls@latest

# HTML Language Server
ansi --yellow "Installing HTML Language Server"
sudo npm install -g vscode-html-languageserver-bin

# JSON Language Server
ansi --yellow "Installing JSON Language Server"
sudo npm install -g vscode-json-languageserver

# Rust Language Sever
ansi --yellow "Installing Rust Language Server"
rustup update
rustup component add rls rust-analysis rust-src

# Terraform Language Server
ansi --yellow "Installing Terraform Language Server"
curl -o /tmp/terraform-ls/terraform-ls.zip \
	https://releases.hashicorp.com/terraform-ls/0.15.0/terraform-ls_0.15.0_linux_amd64.zip \
	--create-dirs
unzip /tmp/terraform-ls/terraform-ls.zip -d /tmp/terraform-ls
sudo install /tmp/terraform-ls/terraform-ls /usr/local/bin

# TeXLab Lang Server
ansi --yellow "Installing TexLab Language Server"
cargo install --git https://github.com/latex-lsp/texlab.git --locked

# TypeScript
ansi --yellow "Install Typescript Language Server"
sudo npm install -g typescript typescript-language-server

# YAML
ansi --yellow "Install YAML Language Server"
sudo npm install -g yaml-language-server

## EFM General Lang Server
ansi --yellow "Install General Language Server"
go get github.com/mattn/efm-langserver
