#!/usr/bin/env bash
set -euo pipefail

failed=$(borg list --format '{archive}{NL}' | grep '\.failed$' || true)

if [[ -z "$failed" ]]; then
  echo "No failed archives found."
  exit 0
fi

echo "Will run:"
echo "$failed" | while read -r archive; do
  echo "  borg delete \"::${archive}\""
done
echo

read -rp "Proceed? [y/N] " confirm
[[ "$confirm" =~ ^[Yy]$ ]] || exit 0

echo "$failed" | xargs -I {} borg delete "::{}"
echo "Done."
