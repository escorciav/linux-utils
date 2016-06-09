#!/bin/bash
# """
# Setup git dotfiles.
# 
# Warnings
# --------
#     It might overwrite backup files.
# """
FILEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Import utility functions
source $FILEDIR/bash/.bashrc_functions

for file in $FILEDIR/git/.git*; do
  home_file=$HOME/$(basename $file)
  backup_file $home_file 
  if [ -f $HOME/$file".bk" ]; then
    echo "Check this backup file: " $home_file".bk"
  fi

  cp $file $HOME/
done
