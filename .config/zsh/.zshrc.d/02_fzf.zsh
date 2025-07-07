# Fuzzy Finding
if (($+commands[brew])); then
  if [[ ! "$PATH" == *$(brew --prefix)/opt/fzf/bin* ]]; then
    path+=($(brew --prefix)/opt/fzf/bin)
  fi
  FZF_SHELL_DIR="$(brew --prefix)"/opt/fzf/shell
else
  FZF_SHELL_DIR=/usr/share/fzf/shell
fi

# Source the relevant shell setup
if [[ -d "$FZF_SHELL_DIR" ]]; then
  for _rc in "$FZF_SHELL_DIR"/*.zsh; do
    if [[ $_rc:t != '~'* ]]; then
      source "$_rc"
    fi
  done
fi

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
