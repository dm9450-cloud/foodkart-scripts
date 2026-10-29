#!/bin/bash
# backup.sh <dir>
set -euo pipefail
SRC="${1:?usage: $0 <dir>}"
DEST="$HOME/backups"; KEEP=5
mkdir -p "$DEST"
NAME="$(basename "$SRC")_$(date +%F_%H%M%S).tar.gz"
tar -czf "$DEST/$NAME" -C "$(dirname "$SRC")" \
    "$(basename "$SRC")"
tar -tzf "$DEST/$NAME" >/dev/null \
  && echo "OK $NAME"                 # verify
ls -1t "$DEST"/*.tar.gz | tail -n +$((KEEP + 1)) \
  | xargs -r rm --                    # rotate
# after Day 10 (AWS CLI):
# aws s3 cp "$DEST/$NAME" s3://foodkart-backups/
# backups keep 5
