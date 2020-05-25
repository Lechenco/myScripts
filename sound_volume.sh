#!/bin/bash

SINK_NUMBER=$( pactl list short sinks | grep RUNNING | cut -f1 )
INCREASE_STEP="+5%"
DECREASE_STEP="-5%"
ICON_PATH="/usr/share/icons/elementary-xfce-dark/panel/16/audio-volume-medium.png"

STEP=
TOGGLE=
while [ "$1" != "" ]; do
	case "$1" in 
		-i | --increase )		STEP=$INCREASE_STEP;;

		-d | --decrease )		STEP=$DECREASE_STEP;;

		-t | --toggle )         TOGGLE=1;;

	esac
	shift
done

if [ "$STEP" != "" ]; then {
    pactl set-sink-volume $SINK_NUMBER "$STEP" | \
    notify-send -t 500 -i "$ICON_PATH" "Volume $(get_volume.sh)"

} fi

if [ "$TOGGLE" != "" ]; then {
    pactl set-sink-mute $SINK_NUMBER toggle # mute sound
} fi
