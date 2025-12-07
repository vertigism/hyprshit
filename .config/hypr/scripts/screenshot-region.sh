#!/bin/bash

hyprpicker -rz &
pid=$!
sleep 0.1
grim -g "$(slurp)" - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot_$(date +%F_%T).png
kill $pid
