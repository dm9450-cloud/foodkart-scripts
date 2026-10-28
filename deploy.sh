#!/bin/bash
# usage: ./deploy.sh <app> <version>
if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <app> <version>"
  exit 1
fi
APP=$1
VERSION=$2
echo "Deploying $APP version $VERSION..."
sleep 1
echo "Done ✅"
exit 0
