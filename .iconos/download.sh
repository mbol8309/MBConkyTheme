#!/bin/bash

# Carpeta donde guardar los iconos
DESTINO="$HOME/.conky/MBConkyTheme/weather/icons"
mkdir -p "$DESTINO"

# Lista de códigos de iconos
iconos=(
  01d 01n
  02d 02n
  03d 03n
  04d 04n
  09d 09n
  10d 10n
  11d 11n
  13d 13n
  50d 50n
)

# Descargar cada icono en resolución 4x
for icon in "${iconos[@]}"; do
  url="https://openweathermap.org/img/wn/${icon}@4x.png"
  destino="$DESTINO/${icon}.png"
  echo "Descargando $icon → $destino"
  wget -q "$url" -O "$destino"
done

echo "✅ Descarga completada. Iconos guardados en: $DESTINO"
