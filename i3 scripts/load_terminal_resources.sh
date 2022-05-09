#!/bin/bash
# FOLDER=/usr/share/xfce4/terminal/colorschemes/
FOLDER=~/.config/xfce4/terminal/

PALLETE=$( get_resource.sh color | tr \\n ';' )
BACKGROUND=$( get_resource.sh 'background' )
FOREGROUND=$( get_resource.sh 'foreground' )

cat ${FOLDER}terminalrc.bak > ${FOLDER}terminalrc

echo "[Configuration]
ColorBackground=$BACKGROUND 
ColorForeground=$FOREGROUND
ColorPallete=$PALLETE" >> "${FOLDER}terminalrc"

sleep 1
touch ${FOLDER}terminalrc
