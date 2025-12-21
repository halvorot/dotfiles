#!/usr/bin/env bash
source "$(dirname "$0")/lib.sh"

defaults_write com.apple.dock autohide bool false
defaults_write com.apple.dock tilesize int 67
defaults_write com.apple.dock show-recents bool false

restart Dock
