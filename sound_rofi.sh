#!/bin/bash

PROMPT="Audio Card"

CARDS="$( pacmd list-cards | \
sed -n '/profiles/,/active profile/{/profiles:/b;/active profile/b;p}' | \
sed -e 's/^[ \t]*//;s/(priority.*)$//' |
tr \\n '|' )"

CARD_DESCRIPTION="$( tr '|' \\n <<< $CARDS | \
cut -d ' ' -f 1 --complement | \
tr \\n '|' )"

MENU=$( rofi_dmenu.sh "$PROMPT" "$CARD_DESCRIPTION" )

SELECTED_CARD=$( tr '|' \\n <<< $CARDS | grep ": $MENU $" | cut -d " " -f 1)
SELECTED_CARD=${SELECTED_CARD%?}

if [ "$SELECTED_CARD" != "" ]; then { 
    pacmd set-card-profile 0 $SELECTED_CARD
    notify-send "Sound card successfull loaded" "$MENU"
} fi

