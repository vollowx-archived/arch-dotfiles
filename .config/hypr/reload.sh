#!/bin/bash

# kills
pkill mako
pkill waybar
pkill hyprpaper
pkill wl-sunset

# reloads
hyprctl reload
fc-cache

# loads
mako &
waybar &
hyprpaper &
wlsunset -l 39.9 -L 116.3 &

notify-send "󰑓 Hyprland" "Hyprland reloaded successful."
