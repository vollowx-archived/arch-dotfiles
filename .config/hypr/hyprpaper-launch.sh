#!/bin/bash

CONFIG_FILES="$HOME/.config/hypr/hyprpaper.conf"

trap "killall hyprpaper" EXIT

while true; do
  hyprpaper &
  inotifywait -e create,modify $CONFIG_FILES
  killall hyprpaper
done
