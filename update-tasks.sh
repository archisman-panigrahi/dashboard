#!/usr/bin/env bash
set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$REPO_DIR"

EDITOR="${EDITOR:-nano}"
"$EDITOR" tasks.json

# Validate JSON format before committing
if command -v jq >/dev/null 2>&1; then
  if ! jq empty tasks.json 2>/dev/null; then
    echo "Error: tasks.json has invalid JSON syntax. Changes not committed."
    exit 1
  fi
fi

git add tasks.json
git commit -m "Update tasks: $(date +'%Y-%m-%d %H:%M:%S')"
git push
echo "Tasks pushed. Tablet display will sync shortly."
