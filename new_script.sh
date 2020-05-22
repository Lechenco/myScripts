#!/bin/bash

while [ "$1" != "" ]; do 
    echo "#!/bin/bash" > ~/Scripts/$1
    chmod +x ~/Scripts/$1
    shift
done
