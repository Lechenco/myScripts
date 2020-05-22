#!/bin/bash

if [[ $(playerctl status) == "Playing" ]];
 then {
	playerctl pause
	notify-send -u low -t 1000 -i /usr/share/icons/Adwaita/16x16/legacy/media-playback-pause.png "Paused"
} else {
	playerctl play
	notify-send -u low -t 1000 -i /usr/share/icons/Adwaita/16x16/legacy/media-playback-start.png "Played"
} fi 
