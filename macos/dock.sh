#!/usr/bin/env bash
source "$(dirname "$0")/lib.sh"

defaults_write com.apple.dock autohide bool false
defaults_write com.apple.dock tilesize int 60
defaults_write com.apple.dock magnification bool true
defaults_write com.apple.dock largesize int 75
defaults_write com.apple.dock show-recents bool false

restart Dock
