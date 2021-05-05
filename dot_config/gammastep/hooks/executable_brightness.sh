#!/bin/sh
# Set brightness via brightnessctl when gammastep status changes

# Set brightness values for each status.
# Range from 1 to 100 is valid
brightness_day="85%"
brightness_transition="60%"
brightness_night="30%"

set_brightness() {
    brightnessctl set $1 &
}

if [ "$1" = period-changed ]; then
	case $3 in
		night)
			set_brightness $brightness_night 
			;;
		transition)
			set_brightness $brightness_transition
			;;
		daytime)
			set_brightness $brightness_day
			;;
	esac
fi
