#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
. "$DIR/base.sh"
. "$DIR/ansi"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	# ask sudo upfront
	sudo -v

	mkdir -p "$HOME/.config/systemd/user/"

    # Mail
	if [ -f "$HOME/.config/systemd/user/mbsync.service" ]; then
		systemctl --user enable --now mbsync.timer
	fi
    systemctl --user enable --now goimapnotify@mailbox.service
    systemctl --user enable --now goimapnotify@uni.service

    # Contacts and Calendar
    systemctl --user enable --now vdirsyncer.service

    # Start the SSH Agent
    systemctl --user enable --now ssh-agent.service

    # Start Gammastep (Screen Brightness)
    systemctl --user enable --now gammastep.service

    # Start relector (pacman mirrors)
    sudo systemctl enable --now reflector.service

    # Start mopidy
    sudo systemctl enable --now mopidy.service
fi
