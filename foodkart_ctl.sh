#!/bin/bash
set -euo pipefail
PORT=9000
DIR="$HOME/foodkart_app"
PIDFILE="/tmp/foodkart.pid"

log() { echo "$(date +%T) $*"; }

start() {
  mkdir -p "$DIR"; echo "FoodKart up" > "$DIR/index.html"
  python3 -m http.server "$PORT" -d "$DIR" \
    >/dev/null 2>&1 &
  echo $! > "$PIDFILE"; log "started pid $(cat $PIDFILE)"
}
stop() {
  [[ -f $PIDFILE ]] && kill "$(cat $PIDFILE)" \
    && rm -f "$PIDFILE"; log "stopped"
}
status() {
  if curl -s -m 2 "localhost:$PORT" >/dev/null; then
    log "UP on $PORT"; else log "DOWN"; return 1; fi
}
"${1:-status}"
