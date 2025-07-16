#!/bin/zsh

if (( $+commands[mise] )); then
  eval "$(mise activate zsh)"
fi


if (( $+commands[direnv] )); then
  eval "$(direnv hook zsh)"
fi


if (($+commands[fzf])); then
  # Only use fd if we have fd
  if (($+commands[fd])); then
    export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --ignore-file $XDG_CONFIG_HOME/fd/fd-ignore"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --ignore-file $XDG_CONFIG_HOME/fd/fd-ignore"
    export FZF_COMPLETION_OPTS='--border --info=inline'
    
    _fzf_compgen_path() {
      fd --hidden --follow --exclude ".git" . "$1"
    }
    
    _fzf_compgen_dir() {
      fd --type d --hidden --follow --exclude ".git" . "$1"
    }
  fi
  
  # Source the fzf completions
  source <(fzf --zsh)
fi
