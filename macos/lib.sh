#!/usr/bin/env bash
set -e

log() {
  printf "[macos] %s\n" "$1"
}

# defaults_write DOMAIN KEY TYPE VALUE
defaults_write() {
  local domain="$1"
  local key="$2"
  local type="$3"
  local value="$4"

  local current
  current=$(defaults read "$domain" "$key" 2>/dev/null || echo "__unset__")

  if [[ "$current" == "$value" ]]; then
    log "$domain:$key already set"
  else
    log "Setting $domain:$key → $value"
    defaults write "$domain" "$key" "-$type" "$value"
  fi
}

restart() {
  for app in "$@"; do
    killall "$app" >/dev/null 2>&1 || true
  done
}
