#!/bin/bash

BASH_SRC="/home/$USER/.bashrc"
ZSH_SRC="/home/$USER/.zshrc"

while [ "$1" != "" ]; do
    realpath=$(realpath $1)
    newpath="\$PATH:$realpath"

    echo "Adding $realpath to PATH.."

    if test -f "$BASH_SRC" ; then
        echo "export PATH=$newpath" >> $BASH_SRC
    fi 
    if test -f "$ZSH_SRC" ; then
        echo "export PATH=$newpath" >> $ZSH_SRC
    fi 
    shift
done