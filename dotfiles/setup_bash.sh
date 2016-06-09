#!/bin/bash
# """
# Setup bash environment.
# 
# Warnings
# --------
#     It might overwrite backup files.
# """
FILEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Import utility functions
source $FILEDIR/bash/.bashrc_functions

# Copy bash dotfiles in your home
for file in $FILEDIR/bash/.bash*; do
  home_file=$HOME/$(basename $file)
  backup_file $home_file 
  if [ -f $HOME/$file".bk" ]; then
    echo "Check this backup file: " $home_file".bk"
  fi

  cp $file $HOME/
done
