#!/bin/bash

# Uso: ./fan_percent.sh fan2

FAN=$1
MAX_RPM=3600  # Ajusta este valor según el máximo real de tu ventilador

if [ -z "$FAN" ]; then
    echo 0
    exit 0
fi

RAW=$(sensors | grep "$FAN:" | awk '{print $2}')

if [[ -z "$RAW" || "$RAW" == "N/A" ]]; then
    echo 0
    exit 0
fi

# Calcula el porcentaje
PERCENT=$((RAW * 100 / MAX_RPM))
echo $PERCENT
