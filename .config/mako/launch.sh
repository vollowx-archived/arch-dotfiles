#!/bin/bash

CONFIG_FILES="$HOME/.config/mako/config"

trap "killall mako" EXIT

while true; do
	mako &
	inotifywait -e create,modify $CONFIG_FILES
	killall mako
done
