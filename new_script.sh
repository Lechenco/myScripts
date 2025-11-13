#!/bin/bash

folder=$(dirname "$0")

while [ "$1" != "" ]; do
    fullpath="$folder/$1"
    if test -f "$fullpath" ; then
        echo "This file already exist"
    else
        echo "Adding script file $fullpath"
        echo "#!/bin/bash" > "$fullpath"
        chmod +x "$fullpath"
    fi 
    shift
done
