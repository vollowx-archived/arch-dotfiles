#!/bin/bash
HYPRGAMEMODE=$(hyprctl getoption animations:enabled | sed -n '2p' | awk '{print $2}')
if [ $HYPRGAMEMODE = 1 ]; then
	hyprctl --batch "\
    keyword animations:enabled 0;\
    keyword decoration:drop_shadow 0;\
    keyword decoration:blur 0"
	exit
fi
hyprctl reload
