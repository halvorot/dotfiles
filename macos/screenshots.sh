#!/usr/bin/env bash
set -e
source "$(dirname "$0")/lib.sh"

# Screenshots: Save to Downloads folder
defaults_write com.apple.screencapture location string "$HOME/Downloads"

# Screenshots: Disable shadow in screenshots (if you prefer clean screenshots)
# defaults_write com.apple.screencapture disable-shadow bool true

# Screenshots: Use PNG format (default, but explicitly set)
# defaults_write com.apple.screencapture type string "png"

restart "SystemUIServer"
