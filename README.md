# my dotfiles
This is probably the 10th iteration of my dotfiles.

I like to start again from a clean base every now and then and learn from
my mistakes.

This time round I am:
- Ditching Emacs (VIM is superior?)
- Using Chezmoi again (Ansible was bloat, fun, but bloat)
- Not doing anything with fancy colours (no pywal :/)
- Respecting the XDG directory spec
- Automating more stuff with Make (see inspiration: [benmezger/dotfiles](https://github.com/benmezger/dotfiles))

## installing

```shell
DOTFILES_DIR=~/.local/share/chezmoi
git clone https://github.com/Jonnobrow/dotfiles.git $DOTFILES_DIR
cd $DOTFILES_DIR
make all
```

## details

### my editor

This is one of the biggest changes for me. 
I previously used Emacs for ~18 months, firstly [Spacemacs](https://spacemacs.org/)
and then [Doom](https://github.com/hlissner/doom-emacs).
I loved some of the features, like [org-mode](https://orgmode.org/), but I have
slowly move away from the rest of Emacs and had major issues, even with WSL2, when
trying the set up a dev environment in Windows. 

Therefore I am returing to vim, and more specifically [neovim](https://neovim.io).

Some highlights from my setup:
- [Plug](https://github.com/junegunn/vim-plug) as my plugin manager
- Git stuff from [vim-fugitive](https://github.com/tpope/vim-fugitive)
- A filetree from [nerdtree](https://github.com/preservim/nerdtree)
- All config in Lua (requires Neovim 0.5)
	- See [a Guide](https://github.com/nanotee/nvim-lua-guide) and
		[my inspiration](https://github.com/mthnglac/dotfiles)
- Native LSP support from Neovim

### my browser
*Coming Soon*

### my wm
*Coming Soon*

### misc

#### Node Package Install

https://stackoverflow.com/a/41199625

```shell
npm list --global --parseable --depth=0 | sed '1d' | awk '{gsub(/\/.*\//,"",$1); print}' > Npmfile
```

#### Package Bundle Files

```shell
pacman -Qmeq > Aurfile
pacman -Qneq > Pacfile
```
