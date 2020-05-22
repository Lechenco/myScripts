#!/bin/bash

PROMPT=$1
OPTIONS=$2

N_LINES="$( grep -o '[^|]\+' <<< $OPTIONS | grep -c '.')"
if [ $N_LINES -gt 6 ]; then { N_LINES=6; } fi

MENU="$( rofi -sep "|" -theme slate -lines $N_LINES -dmenu -i -p $PROMPT <<< $OPTIONS )"

echo $MENU
