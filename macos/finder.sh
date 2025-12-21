#!/usr/bin/env bash
source "$(dirname "$0")/lib.sh"

defaults_write com.apple.finder ShowPathbar bool true
defaults_write com.apple.finder ShowStatusBar bool false
defaults_write com.apple.finder AppleShowAllFiles bool true

restart Finder
