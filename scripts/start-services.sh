#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
. "$DIR/base.sh"
. "$DIR/ansi"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	# ask sudo upfront
	sudo -v

	mkdir -p "$HOME/.config/systemd/user/"

	if [ -f "$HOME/.config/systemd/user/mbsync.service" ]; then
		systemctl --user enable --now mbsync.timer
	fi
    
    systemctl --user enable --now vdirsyncer.service
    systemctl --user enable --now goimapnotify@mailbox.service
    systemctl --user enable --now goimapnotify@uni.service

fi
