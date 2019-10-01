#!/bin/bash
# """
# Setup apps to retain open sessions.
# 
# Warnings
# --------
#     It might overwrite backup files.
# """
DIRNAME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Import utility functions
source $DIRNAME/bash/.bashrc_functions

# Copy config files in your home
for i in .screenrc .tmux.conf; do
    backup_file $HOME/$i
    if [ -f $HOME/$i".bk" ]; then
        echo Check this backup file: $i".bk"
    fi
    cp $DIRNAME/$i ~/
done

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm