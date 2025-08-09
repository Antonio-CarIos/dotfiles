#!/bin/bash

#WALLPAPER="$1"

#wal -i "$WALLPAPER"

CAMINHO="$HOME/.cache/wal/colors-waybar.css"
DESTINO="$HOME/.config/waybar/"

cp "$CAMINHO" "$DESTINO"
