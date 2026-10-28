#!/bin/bash
APP="foodkart"            # no spaces around =
PORT=8080
LOG_DIR="/var/log/$APP"
TODAY=$(date +%F)
echo "App: $APP on port $PORT"
echo "Logs: $LOG_DIR"
echo "Single: '$APP' vs double: \"$APP\""
echo 'Single quotes: $APP is not expanded'
read -p "Your team name: " TEAM
echo "Welcome, $TEAM! Date: $TODAY"
