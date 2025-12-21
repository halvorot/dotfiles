#!/usr/bin/env bash
set -e

stow asdf
stow claude
stow git
stow homebrew
stow starship
stow zsh

./macos/apply.sh
