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
trying the set up a development environment in Windows. 

Therefore I am returning to vim, and more specifically [neovim](https://neovim.io).

Some highlights from my setup:
- [Packer](https://github.com/wbthomason/packer.nvim) as package manager
- Git stuff from [vim-fugitive](https://github.com/tpope/vim-fugitive)
- A filetree from [nerdtree](https://github.com/preservim/nerdtree)
- Session Management with [ProSession](https://github.com/dhruvasagar/vim-prosession)
- [Spaceduck Theme](https://github.com/pineapplegiant/spaceduck)
- All config in Lua (requires Neovim 0.5)
	- See [a Guide](https://github.com/nanotee/nvim-lua-guide) and
		[my inspiration](https://github.com/mthnglac/dotfiles)
- Native LSP support from Neovim

### mail, contacts and calendar

For mail I use [aerc](https://git.sr.ht/~sircmpwn/aerc) in conjunction with:
    - [msmtp](https://marlam.de/msmtp/)
    - [isync](https://isync.sourceforge.io/)
    - [notmuch](https://notmuchmail.org/)
    - [afew](https://afew.readthedocs.io/en/latest/index.html)

This is far from the ideal setup at the moment because of the infancy of Aerc, however it is
constantly improving and much simpler tool to configure than Mutt/Neomutt.

For calendar and contacts I use [vdirsyncer](https://github.com/pimutils/vdirsyncer),
[khard](https://github.com/scheibler/khard/) and
[khal](https://github.com/pimutils/khal).

I also use [goimapnotify](https://gitlab.com/shackra/goimapnotify) to listen for changes
on remote server rather than polling for new mail.
This, coupled with running mbsync on login, is fine for my usage.

### my browser

I use [Firefox](https://mozilla.org/en-GB/firefox/new) with a few extensions. 

- [FlyingFox](https://flyingfox.netlify.app/): Minimal and Configurable Theme
- HTTPS Everywhere
- UBlock Origin
- KeepassXC Browser
- [Tridactyl](https://tridactyl.xyz)

### my wm

[Sway](https://swaywm.org) all the way.

I've used several window managers over the past few years but have always returned
to i3 or Sway. Sway uses Wayland ([See why Wayland is Better](https://en.wikipedia.org/wiki/Wayland_(display_server_protocol)#Differences_between_Wayland_and_X)).

Atop Sway I used the following:

- Waybar as my bar
- Swaylock as my lockscreen
- Swayidle for idle locking

### gammastep

- Requires `geoclue2` and the related configuration for gammastep (/etc/geoclue/geoclue.conf):

```
[gammastep]
allowed=true
system=false
users=
```

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
