#!/bin/bash

folder=$(dirname "$0")
export LSH_CONFIG="/home/$USER/.config/lsh"
export LSH_ALIAS_PATH="$LSH_CONFIG/alias"
export LSH_EXPORT_PATH="$LSH_CONFIG/export"
export LSH_PATH=$folder

# touch alias and export files at .config/lsh
if [ ! -d "$LSH_CONFIG" ]; then
    mkdir $LSH_CONFIG
fi

touch "$LSH_ALIAS_PATH"
touch "$LSH_EXPORT_PATH"

# Ask for .bashrc file
read -p "Enter your shell config file at \$HOME (eg: .bashrc): " shellfile

shellconfig="$HOME/$shellfile"
echo "Your Input: $shellconfig"

# Add to .bashrc file source to alias and export files
echo "source $LSH_CONFIG/alias" >> $shellconfig
echo "source $LSH_CONFIG/export" >> $shellconfig

echo ""
echo "Adding default exports to export file:"
# add to export file LSH_PATH
source "$LSH_PATH/add_export.sh" LSH_PATH $LSH_PATH

# add to export file LSH_CONFIG
source "$LSH_PATH/add_export.sh" LSH_CONFIG $LSH_CONFIG

# # add to export file LSH_ALIAS_PATH
source "$LSH_PATH/add_export.sh" LSH_ALIAS_PATH $LSH_ALIAS_PATH

# # add to export file LSH_EXPORT_PATH
source "$LSH_PATH/add_export.sh" LSH_EXPORT_PATH $LSH_EXPORT_PATH

source "$LSH_PATH/add_path.sh" $LSH_PATH