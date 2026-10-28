#!/bin/bash
SERVICE="nginx"
LOG="$HOME/scripts/heal.log"

if systemctl is-active --quiet "$SERVICE"; then
  echo "$(date) $SERVICE OK" >> "$LOG"
else
  echo "$(date) $SERVICE DOWN, restarting" >> "$LOG"
  sudo systemctl restart "$SERVICE"
  if systemctl is-active --quiet "$SERVICE"; then
    echo "$(date) restart worked" >> "$LOG"
  else
    echo "$(date) restart FAILED" >> "$LOG"
    exit 1
  fi
fi
