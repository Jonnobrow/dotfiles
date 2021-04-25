#!/usr/bin/env bash
set -euo pipefail

DIR=$(dirname "$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)")
. "$DIR/scripts/base.sh"
. "$DIR/scripts/ansi"

if [[ "$OSTYPE" != "linux-gnu"* ]]; then
	ansi --yellow "Not a Linux platform. Skipping."
	exit 0
fi

mkdir -pv $HOME/.mozilla/firefox/yg6zz5br.default
curl -s -L -o flyingfox.tar.gz https://github.com/akshat46/FlyingFox/releases/download/v0.1.2/flyingfox.tar.gz
tar -xf flyingfox.tar.gz --directory $HOME/.mozilla/firefox/yg6zz5br.default/
rm flyingfox.tar.gz




