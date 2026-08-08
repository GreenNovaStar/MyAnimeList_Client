#!/bin/sh

# Symlink the repo's pre-commit hook into .git/hooks/
HOOK_SRC="$(cd "$(dirname "$0")" && pwd)/pre-commit"
HOOK_DST="$(cd "$(dirname "$0")/.." && pwd)/.git/hooks/pre-commit"

cp "$HOOK_SRC" "$HOOK_DST"
chmod +x "$HOOK_DST"

echo "✔ Pre-commit hook installed."
