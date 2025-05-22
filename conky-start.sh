#!/bin/bash

# Sleep for 20 seconds
sleep 20

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Run conky with the config file in the same directory
conky -c "$SCRIPT_DIR/conky.conf"