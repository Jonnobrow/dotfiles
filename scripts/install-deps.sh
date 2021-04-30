#!/usr/bin/env bash
set -euo pipefail

DIR=$(dirname "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)")
. "$DIR/scripts/base.sh"
. "$DIR/scripts/ansi"

PACMAN_BUNDLE_FILE="$DIR/Pacfile"
PACMAN_BUNDLE=$(cat $PACMAN_BUNDLE_FILE | grep -v "#" | tr "\n" " ")


if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	# ask sudo upfront
	sudo -v
	sudo pacman -Syy
	ansi --green "Using $PACMAN_BUNDLE_FILE bundle file"
	sudo pacman -S --noconfirm --needed $PACMAN_BUNDLE
fi
