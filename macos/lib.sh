#!/usr/bin/env bash
set -e

log() {
  printf "[macos] %s\n" "$1"
}

# defaults_write DOMAIN KEY TYPE VALUE
normalize() {
  case "$1" in
    true|TRUE|1) echo "1" ;;
    false|FALSE|0) echo "0" ;;
    *) echo "$1" ;;
  esac
}

defaults_write() {
  local domain="$1"
  local key="$2"
  local type="$3"
  local value="$4"

  local current raw_current
  raw_current=$(defaults read "$domain" "$key" 2>/dev/null || echo "__unset__")

  current="$(normalize "$raw_current")"
  desired="$(normalize "$value")"

  if [[ "$current" == "$desired" ]]; then
    log "$domain:$key already set to desired value ($desired), skipping"
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
