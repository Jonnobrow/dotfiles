#!/bin/sh
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaCode.tar.xz \
&& cd ~/.local/share/fonts \
&& tar -xf CascadiaCode.tar.xz \
&& rm CascadiaCode.tar.xz \
&& fc-cache -fv
