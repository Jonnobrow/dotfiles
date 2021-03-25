#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
. "$DIR/ansi"
. "$DIR/base.sh"

if ! [ -x "$(command -v chezmoi)" ]; then
	if [[ "$OSTYPE" == "linux-gnu"* ]]; then
		isavailable chezmoi || sudo -v || sudo pacman -S chezmoi --noconfirm
  else
    echo "I don't know what to do on this platform ($OSTYPE)"
    exit 1
	fi
else
	echo "Chezmoi exists, skipping."
fi
