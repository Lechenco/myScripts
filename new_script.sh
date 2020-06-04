#!/bin/bash

folder="/home/lechenco/bin/"

while [ "$1" != "" ]; do
    fullpath=$folder$1
    if test -f "$fullpath" ; then
        echo "This file already exist"
    else
        echo $fullpath
        echo "#!/bin/bash" > "$fullpath"
        chmod +x "$fullpath"
    fi 
    shift
done
