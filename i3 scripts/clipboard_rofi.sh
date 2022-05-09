#!/bin/bash

clear_history() {
    COUNT=$( copyq tab clipboard count )
    
    for (( i=$COUNT -1; i >= 0; i--))
    do
        copyq tab clipboard remove "$i"
        echo "$i"
    done
}

PROMPT="Select to the Clipboard:"

CLIPBOARD_HISTORY=$( copyq eval -- "tab('clipboard'); for(i=0; i<size(); ++i){ if (str(read(i))) print(str(read(i)) + '|');}" )
CLIPBOARD_HISTORY+="⌫ Clear"
CURRENT_CLIPBOARD="Actual: "$( copyq clipboard )

MENU=$( rofi_dmenu.sh "$PROMPT" "$CLIPBOARD_HISTORY" "$CURRENT_CLIPBOARD" )

if [ "$MENU" != "" ]; then {
case "$MENU" in 
    "⌫ Clear" )     clear_history ;;
    * )              copyq copy "$MENU" ;;
esac
}
fi
