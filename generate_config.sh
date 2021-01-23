#!/bin/bash

# Prüfen, ob die benötigten env Variablen gesetzt sind
if [[ -z "$BASE_URL" ]]; then
    echo "Missing BASE_URL"
    exit 1
fi

# JSON Datei mit den env Variablen generieren und in das html Verzeichnis von NGINX schreiben,
# damit das Frontend diese abrufen kann.
jq -n \
--arg baseUrl "$BASE_URL" \
'{baseUrl: $baseUrl}'\
>/usr/share/nginx/html/config.json

exec /docker-entrypoint.sh "$@"