#!/bin/bash

# kills
pkill mako
pkill waybar
pkill hyprpaper
pkill wl-sunset

# loads
mako &
waybar &
hyprpaper &
wlsunset -l 39.9 -L 116.3 &

# reloads
hyprctl reload

notify-send "󰑓 Hyprland" "Hyprland reloaded successful."
