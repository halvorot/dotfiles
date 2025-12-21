#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "$0")" && pwd)"

for script in "$DIR"/*.sh; do
  [[ "$(basename "$script")" == "apply.sh" ]] && continue
  [[ "$(basename "$script")" == "lib.sh" ]] && continue
  bash "$script"
done

echo "[macos] All settings applied"
