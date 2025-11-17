#!/bin/bash

SHARED_FOLDER="/home/Shared"

real_path=$(realpath $1)
base_name=$(basename $1)

# Check if source folder exists
if [ ! -d "$real_path" ]; then
    echo "Error: $real_path folder does not exist"
    exit 1
fi

# Check if shared folder exists
if [ ! -d "$SHARED_FOLDER" ]; then
    echo "Error: $SHARED_FOLDER folder does not exist"
    exit 1
fi

# Changing directory group and permissions
# echo "Changing '$folder' to shared group"
chown :shared "$real_path"
chmod 2770 "$real_path"


echo "Moving '$real_path' to '$SHARED_FOLDER'"
mv "$real_path" "$SHARED_FOLDER"

# Check if the move was successful
if [ $? -eq 0 ]; then
  echo "Folder moved successfully."
else
  echo "Error: Failed to move folder."
  exit 1
fi

echo "Creating link to '$real_path'"
ln -s "$SHARED_FOLDER/$base_name" "$real_path"
