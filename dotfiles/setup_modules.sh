#!/bin/bash
# """
# Setup modules environment.
# 
# Warnings
# --------
#     It might overwrite backup files.
# """
DIRNAME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PERSONAL_MOD_DIR=$HOME/modulefiles

# Import utility functions (backup_file)
source $DIRNAME/bash/.bashrc_functions

if [ ! -d $PERSONAL_MOD_DIR ]; then
  mkdir $PERSONAL_MOD_DIR
fi

backup_file $HOME/.modulerc
if [ -f $HOME/.modulerc.bk ]; then
  echo "Check this backup file" $HOME"/.modulerc.bk"
fi
cp $DIRNAME/.modulerc $HOME/
