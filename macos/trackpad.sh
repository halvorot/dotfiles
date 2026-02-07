#!/usr/bin/env bash
set -e
source "$(dirname "$0")/lib.sh"

# Trackpad: Enable tap to click
defaults_write com.apple.AppleMultitouchTrackpad Clicking bool true
defaults_write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking bool true
defaults_write -g com.apple.mouse.tapBehavior int 1

# Trackpad: Enable secondary click with two fingers
defaults_write com.apple.AppleMultitouchTrackpad TrackpadRightClick bool true
defaults_write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick bool true

# Trackpad: Disable three-finger drag (use your current setting)
defaults_write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag bool false

restart "System Preferences" "SystemUIServer"
