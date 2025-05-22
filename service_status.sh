#!/bin/bash

SERVICE="$1"

if [ -z "$SERVICE" ]; then
    echo "?"
    exit 1
fi

STATUS=$(systemctl is-active "$SERVICE" 2>/dev/null)

if [ "$STATUS" = "active" ]; then
    echo "Running"
else
    echo "Stopped"
fi
