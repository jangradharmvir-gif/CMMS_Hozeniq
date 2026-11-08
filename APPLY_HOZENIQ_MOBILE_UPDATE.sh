#!/usr/bin/env bash
set -euo pipefail
ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
SRC="$ROOT/HOZENIQ_MOBILE_RESPONSIVE_index.html"
DST="$ROOT/app/src/main/assets/index.html"
[ -f "$SRC" ] || { echo "ERROR: HOZENIQ_MOBILE_RESPONSIVE_index.html not found in repository root."; exit 1; }
[ -d "$ROOT/app/src/main/assets" ] || { echo "ERROR: app/src/main/assets folder not found. Open the Android repository root in Codespaces."; exit 1; }
cp "$DST" "$DST.backup-$(date +%Y%m%d-%H%M%S)"
cp "$SRC" "$DST"
echo "Updated Android app HTML. Backup created beside index.html."
git add "$DST"
if git diff --cached --quiet; then echo "No changes to commit."; exit 0; fi
git commit -m "Add responsive mobile layout for HOZENIQ CMMS"
BRANCH="$(git branch --show-current)"
git push origin "$BRANCH"
echo "DONE: update pushed. Open GitHub Actions to monitor the new APK build."
