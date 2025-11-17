#!/bin/bash

while [ "$1" != "" ]; do
    absolutepath=$(realpath $1)
    newpath="\$PATH:$absolutepath"

    echo "Adding $absolutepath to PATH.."

    source "$LSH_PATH/add_export.sh" PATH "$newpath"
    shift
done