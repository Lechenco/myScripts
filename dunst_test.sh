#!/bin/bash

killall dunst &

dunst &

notify-send "Test one"
notify-send -u low "Test two low"
notify-send -u normal "Test three normal"
notify-send -u critical "Test four critical"
notify-send "Test five" "With body"
notify-send "Test six" "Long body anoinwe conweoic cjsdcowe c icwe "
notify-send "Test seven"
