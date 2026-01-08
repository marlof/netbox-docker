#!/bin/bash

NEEDED_COMMANDS="curl jq docker skopeo"

MISSING_COMMANDS=()

for c in $NEEDED_COMMANDS; do
  if ! command -v "$c" &>/dev/null; then
    MISSING_COMMANDS+=("$c")
  fi
done

if [ ${#MISSING_COMMANDS[@]} -gt 0 ]; then
  echo "⚠️  The following required commands are missing:"
  for m in "${MISSING_COMMANDS[@]}"; do
    echo "   - $m"
  done
  echo "❌ Cannot proceed with build."
  exit 1
fi

echo "✅ All required commands are installed."