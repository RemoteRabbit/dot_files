#!/bin/bash

config_path=$HOME/dot_files/polybar/config.ini

killall -q polybar

MONITOR=DisplayPort-0 polybar --config=$config_path --reload left-bar &
MONITOR=DisplayPort-1 polybar --config=$config_path --reload center-bar &
MONITOR=DisplayPort-2 polybar --config=$config_path --reload right-bar &

# Loop to repeat on all monitors
# 	for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
# 		MONITOR=$m polybar --reload bar &
# 	done
# else
# 	polybar --reload bar &
# fi
