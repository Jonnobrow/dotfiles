#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
. "$DIR/ansi"
. "$DIR/base.sh"

mkdir -pv $HOME/cloud

# Mail, Contacts and Calendar
mkdir -pv $HOME/.local/share/mail/{mailbox,uni}
mkdir -pv $HOME/.local/share/contacts
mkdir -pv $HOME/.local/share/calendar

# Setup Dir Structure for files
mkdir -pv $HOME/dirs/{dl,doc,m,v,p}
