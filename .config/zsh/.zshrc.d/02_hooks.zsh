#!/bin/zsh

if (( $+commands[mise] )); then
  eval "$(mise activate zsh)"
fi


if (( $+commands[direnv] )); then
  eval "$(direnv hook zsh)"
fi
