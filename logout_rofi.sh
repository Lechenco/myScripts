#!/bin/bash

PROMPT="System"
OPTIONS="  Lock|  Logout|↺  Reboot|⏻  Shutdown"

MENU=$( rofi_dmenu.sh "$PROMPT" "$OPTIONS" )

case "$MENU" in
  *Lock) i3lock ;;
  *Logout) openbox --exit;;
  *Reboot) systemctl reboot ;;
  *Shutdown) systemctl -i poweroff
esac
