# my dotfiles

## credits
- Background by [u/-lemniscat on reddit](https://www.reddit.com/r/swaywm/comments/oqujk9/as_requested_here_is_some_background_for_sway/)

## details

### my editor

I use neovim with the following plugins:
- [Packer](https://github.com/wbthomason/packer.nvim) as package manager
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) for completion support
- [vimwiki](https://github.com/vimwiki/vimwiki) and 
  [vim-zettel](https://github.com/michal-h21/vim-zettel) for not taking
- [which-key](https://github.com/folke/which-key.nvim) for bindings
- [fzf](https://github.com/junegunn/fzf.vim) for search

### mail, contacts and calendar

For mail I use [aerc](https://git.sr.ht/~sircmpwn/aerc) in conjunction with:
    - [msmtp](https://marlam.de/msmtp/)
    - [isync](https://isync.sourceforge.io/)
    - [notmuch](https://notmuchmail.org/)
    - [afew](https://afew.readthedocs.io/en/latest/index.html)

For calendar, contacts and TODO I use:
    - [vdirsyncer](https://github.com/pimutils/vdirsyncer)
    - [khard](https://github.com/scheibler/khard/)
    - [khal](https://github.com/pimutils/khal)
    - [todoman](https://github.com/pimutils/todoman)

I also use [goimapnotify](https://gitlab.com/shackra/goimapnotify) to listen for
changes on remote server rather than polling for new mail. This, coupled with
running mbsync on login, is fine for my usage.

### my browser

I use [Firefox](https://mozilla.org/en-GB/firefox/new) with a few extensions. 

- HTTPS Everywhere
- UBlock Origin
- KeepassXC Browser
- [Tridactyl](https://tridactyl.xyz)

### my wm (Arch)

[Sway](https://swaywm.org) all the way, with:
- Waybar as my bar
- Swaylock as my lockscreen
- Swayidle for idle locking

### macos

I use macos for work so here is the stuff I use to make that more like Arch.

- [Kitty](sw.kovidgoyal.net/)

### Package Bundle Files

```shell
pacman -Qmeq > Aurfile
pacman -Qneq > Pacfile
```
