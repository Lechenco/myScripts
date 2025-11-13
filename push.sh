#!/bin/bash

if [ "$1" != "" ]; then
    cd $1
fi

# Add .

git add .

git status

#Commit 
datetime="$(date +"%d/%m/%Y %T")"
message="chore: changes until $datetime"

echo "Add commit with message: $message"

git commit -m "$message"

# #Push to origin

git push origin
