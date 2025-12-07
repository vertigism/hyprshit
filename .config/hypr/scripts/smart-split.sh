#!/bin/bash

read w h <<< $(hyprctl activewindow -j | jq -r '"\(.size[0]) \(.size[1])"')
[ "$w" -ge "$h" ] && dir=h || dir=v
hyprctl dispatch hy3:makegroup $dir
