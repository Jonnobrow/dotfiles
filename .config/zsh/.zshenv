#####################
# XDG Specification #
#####################
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
# ---
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="$XDG_DATA_HOME"/go
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
export MINIKUBE_HOME="$XDG_DATA_HOME"/minikube
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
export NVM_DIR="$XDG_DATA_HOME"/nvm
export PYENV_ROOT=$XDG_DATA_HOME/pyenv
export RBENV_ROOT=$XDG_DATA_HOME/rbenv
export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/ripgrep/config
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export DOTFILES="$XDG_CONFIG_HOME"/.dotfiles

##########
# Editor #
##########
if (( $+commands[nvim] )); then
  export EDITOR="nvim"
  export VISUAL="nvim"
  export GIT_EDITOR="nvim"
  export SUDO_EDITOR="nvim"
fi

########
# Path #
########
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$GEM_HOME/bin"
export PATH="$PATH:$CARGO_HOME/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/.rd/bin"

#############
# Man Pager #
#############
if (( $+commands[bat] )); then
  export MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

############
# Language #
############
export LANG=en_GB.UTF-8
export LANGUAGE=en_GB:en
export LC_TIME=$LANG

#######
# SSH #
#######
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

##############
# Encryption #
##############
export GPG_TTY=$(tty)
export EYAML_CONFIG=$XDG_CONFIG_HOME/eyaml/config.yaml
export SOPS_AGE_KEY_FILE=$XDG_CONFIG_HOME/sops/age/keys.txt
