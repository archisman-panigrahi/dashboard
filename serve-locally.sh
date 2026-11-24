#!/usr/bin/env bash
set -e

cd "$(dirname "${BASH_SOURCE[0]}")"

PORT="${1:-8000}"

echo "Serving dashboard at http://localhost:${PORT}"
echo "Press Ctrl+C to stop."

if command -v python3 >/dev/null 2>&1; then
  exec python3 -m http.server "$PORT"
elif command -v python >/dev/null 2>&1; then
  exec python -m SimpleHTTPServer "$PORT"
else
  echo "Error: Python is required to run the local server." >&2
  exit 1
fi
