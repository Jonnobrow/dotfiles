# This script will be executed ON THE HOST when you connect to the host.
# Put here your functions, environment variables, aliases and whatever you need.
function alias_if_exists() { command -v $2 > /dev/null && alias $1=$2; }

CURR_DIR="$(cd "$(dirname "$0")" && pwd)"
plugin_name="xxh-plugin-zsh-qol"

export PATH=$CURR_DIR/bat:$CURR_DIR/fd:$CURR_DIR/ripgrep:$CURR_DIR/exa:$PATH

alias_if_exists "find" "fd"
alias_if_exists "grep" "rg"
alias_if_exists "cat" "bat"
alias_if_exists "ls" "exa"
alias_if_exists "tree" "exa -T --git-ignore"
