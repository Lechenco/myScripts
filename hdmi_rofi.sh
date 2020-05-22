#!/bin/bash

PROMPT="Video Output"
OPTIONS="Extend to the right|Extend to the left|Mirror Screen|Only notebook"

MENU=$( rofi_dmenu.sh "$PROMPT" "$OPTIONS" )

case "$MENU" in
    "Extend to the right" )     OUTPUT="-r";;
    "Extend to the left" )      OUTPUT="-l";;
    "Mirror Screen" )           OUTPUT="-m";;
    "Only notebook" )           OUTPUT="-o";;
esac

if [ "$OUTPUT" != "" ]; then { hdmi.sh "$OUTPUT"; } fi


