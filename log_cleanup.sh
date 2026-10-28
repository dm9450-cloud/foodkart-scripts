#!/bin/bash
# log_cleanup.sh <dir> [days]
set -euo pipefail
DIR="${1:?usage: $0 <dir> [days]}"
DAYS="${2:-7}"
[[ -d "$DIR" ]] || { echo "no dir $DIR" >&2; exit 1; }
echo "Compressing *.log older than 1 day"
find "$DIR" -name "*.log" -mtime +1 -print \
  -exec gzip {} \;
echo "Deleting *.gz older than $DAYS days"
find "$DIR" -name "*.gz" -mtime +"$DAYS" -print -delete
