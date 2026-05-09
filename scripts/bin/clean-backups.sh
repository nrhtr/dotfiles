#!/usr/bin/env bash
set -euo pipefail

failed=$(borg list --format '{archive}{NL}' | grep '\.failed$' || true)

if [[ -z "$failed" ]]; then
  echo "No failed archives found."
  exit 0
fi

echo "Failed archives:"
echo "$failed"
echo

read -rp "Delete all of the above? [y/N] " confirm
[[ "$confirm" =~ ^[Yy]$ ]] || exit 0

echo "$failed" | xargs -I {} borg delete "::{}"
echo "Done."
