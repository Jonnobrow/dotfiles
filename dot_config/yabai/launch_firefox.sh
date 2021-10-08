#!/usr/bin/env bash

# Detect MacOS
[[ "${OSTYPE:-$(uname -s)}" =~ (D|d)arwin ]] && {
    open -a "/Applications/Firefox.app"
}
