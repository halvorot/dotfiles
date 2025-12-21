#!/usr/bin/env bash
source "$(dirname "$0")/lib.sh"

defaults_write com.apple.desktopservices DSDontWriteUSBStores bool true
defaults_write com.apple.desktopservices DSDontWriteNetworkStores bool true

restart Finder
