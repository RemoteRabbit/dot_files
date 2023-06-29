#!/bin/bash

killall -q polybar

MONITOR=DisplayPort-0 polybar --reload left-bar &
MONITOR=DisplayPort-1 polybar --reload center-bar &
MONITOR=DisplayPort-2 polybar --reload right-bar &

# Loop to repeat on all monitors
# 	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
# 		MONITOR=$m polybar --reload bar &
# 	done
# else
# 	polybar --reload bar &
# fi
