#!/usr/bin/env bash
set -e

confirm() {
  read -r -p "$1 [y/N] " response
  [[ "$response" =~ ^[Yy]$ ]]
}

# Remove .DS_Store files (will conflict with stow)
find . -name .DS_Store -delete

stow asdf
stow claude
stow git
stow homebrew
stow starship
stow zsh

./macos/apply.sh

# Homebrew
if command -v brew >/dev/null 2>&1; then
  if confirm "Install Homebrew apps from Brewfile?"; then
    brew bundle install --file homebrew/Brewfile
  else
    echo "[brew] Skipped"
  fi
else
  echo "[brew] Homebrew not installed"
fi