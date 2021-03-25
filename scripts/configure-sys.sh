#!/usr/bin/env bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
. "$DIR/base.sh"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
	source "$DIR/set-archlinux-defaults.sh"
fi
