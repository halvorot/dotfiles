#!/usr/bin/env bash
set -e

# Remove .DS_Store files (will conflict with stow)
find . -name .DS_Store -delete

stow asdf
stow claude
stow git
stow homebrew
stow starship
stow zsh

./macos/apply.sh
