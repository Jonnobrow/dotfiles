#!/usr/bin/env bash
set -euo pipefail

DIR=$(dirname "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)")
. "$DIR/scripts/base.sh"
. "$DIR/scripts/ansi"

if [[ "$OSTYPE" != "linux-gnu"* ]]; then
	ansi --yellow "Not a Linux platform. Skipping."
	exit 0
fi

sudo -v

ansi --green "Install mopidy configuration"
sudo cp -iv "$DIR/other/mopidy.conf" /etc/mopidy/mopidy.conf

ansi --green "Install reflector configuration"
sudo cp -iv "$DIR/other/reflector.conf" /etc/xdg/reflector/reflector.conf
