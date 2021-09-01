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
        ansi --green "Enabling and starting mbsync"
		systemctl --user enable --now mbsync.timer
	fi
    ansi --green "Enabling and starting goimapnotify"
    systemctl --user enable --now goimapnotify@mailbox.service

    # Contacts and Calendar
    ansi --green "Enabling and starting vdirsyncer"
    systemctl --user enable --now vdirsyncer.service

    # Start the SSH Agent
    ansi --green "Enabling and starting ssh-agent"
    systemctl --user enable --now ssh-agent.service

    # Start relector (pacman mirrors)
    ansi --green "Enabling and starting reflector"
    sudo systemctl enable --now reflector.timer

    # Start mopidy
    ansi --green "Enabling and starting mopidy"
    sudo systemctl enable --now mopidy.service

    # Start getty
    ansi --green "Enabling and starting getty"
    sudo systemctl enable --now getty@tty1.service
fi
