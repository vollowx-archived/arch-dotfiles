#!/bin/bash

# kills
pkill mako
pkill waybar
pkill hyprpaper

# loads
mako &
waybar &
hyprpaper &

# reloads
hyprctl reload

notify-send "󰑓 Hyprland" "Hyprland reloaded successful."
