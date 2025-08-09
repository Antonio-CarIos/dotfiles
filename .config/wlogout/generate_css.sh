#!/bin/bash

WAL_COLORS_SH="$HOME/.cache/wal/colors.sh"

if [ -f "$WAL_COLORS_SH" ]; then
  source "$WAL_COLORS_SH"
else
  wallpaper="$HOME/.config/wallpaper/basquiat-art9.jpg"
  echo "Aviso: '$WAL_COLORS_SH' não encontrado. Usando wallpaper padrão: $wallpaper"
fi

WLOGOUT_TEMPLATE="$HOME/.config/wlogout/style-template.css"
WLOGOUT_FINAL_CSS="$HOME/.config/wlogout/style.css"

sed "s#__WALLPAPER_PYWAL__#$wallpaper#g" "$WLOGOUT_TEMPLATE" >"$WLOGOUT_FINAL_CSS"

echo "Wlogout CSS gerado com sucesso em: $WLOGOUT_FINAL_CSS"
echo "Wallpaper utilizado: $wallpaper"
