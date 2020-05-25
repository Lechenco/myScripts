#!/bin/bash

PROMPT=$1
OPTIONS=$2
MESSAGE=$3

N_LINES="$( grep -o '[^|]\+' <<< $OPTIONS | grep -c '.')"
if [ $N_LINES -gt 6 ]; then { N_LINES=6; } fi

if [ "$MESSAGE" != "" ]
then {
    MENU=$( rofi -sep "|" -theme slate -lines $N_LINES -dmenu -i -p "$PROMPT" -mesg "$MESSAGE" <<< $OPTIONS )
} else {
    MENU=$( rofi -sep "|" -theme slate -lines $N_LINES -dmenu -i -p "$PROMPT" <<< $OPTIONS )
} 
fi

echo $MENU
