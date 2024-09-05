#!/bin/bash

type keepassxc-cli >/dev/null 2>&1 && exit

case "$(uname -s)" in
Darwin)
  brew install --cask keepassxc
  ;;
*)
  echo "unsupported OS"
  exit 1
  ;;
esac
