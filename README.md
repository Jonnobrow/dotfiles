# Dotfiles

## Usage

```bash
DOTFILES=$HOME/.config/.dotfiles
git clone --bare git@github.com:Jonnobrow/dotfiles.git $DOTFILES
alias gitdf='git --git-dir=$DOTFILES --work-tree=$HOME'
gitdf config --local status.showUntrackedFiles no
gitdf checkout
gitdf submodule update --init --recursive
```
