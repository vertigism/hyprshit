#!/bin/bash

grim - | wl-copy && wl-paste > ~/Pictures/Screenshots/Screenshot_$(date +%F_%T).png
