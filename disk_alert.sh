#!/bin/bash
# disk_alert.sh [limit%]  (default 80)
set -euo pipefail
LIMIT="${1:-80}"
ALERT=0
while read -r src use mnt; do
  use=$(echo "$use" | tr -d '%')
  if (( use >= LIMIT )); then
    echo "$(date '+%F %T') ALERT $mnt ${use}%" >&2
    ALERT=1
  fi
done < <(df --output=source,pcent,target \
           -x tmpfs -x devtmpfs | tail -n +2)
(( ALERT == 0 )) && echo "$(date '+%F %T') disks OK"
exit "$ALERT"
