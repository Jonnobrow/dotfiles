alias gitdf='git --git-dir=$DOTFILES --work-tree=$HOME'

# Aliases
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'

# Use eza
if (( $+commands[eza] )); then
  alias ls='eza'
  alias ll='eza -lagh'
  alias tree='eza -T --git-ignore'
fi

alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -i'

# Use kitten SSH
if (( $+commands[kitten] )); then
  alias ssh='kitten ssh'
fi
