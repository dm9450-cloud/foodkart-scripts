#!/bin/bash
FAILED=0
while read -r url; do
  code=$(curl -s -o /dev/null -m 5 \
         -w "%{http_code}" "$url")
  if [[ $code -ge 200 && $code -lt 400 ]]; then
    echo "✅ $code $url"
  else
    echo "❌ $code $url"
    FAILED=$((FAILED + 1))
  fi
done < urls.txt
echo "Failed: $FAILED"
[[ $FAILED -eq 0 ]] || exit 1
