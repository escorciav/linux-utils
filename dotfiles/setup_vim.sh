#!/bin/bash
# """
# Setup vim environment.
# 
# Warnings
# --------
#     It might overwrite backup files.
# """
DIRNAME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Import utility functions
source $DIRNAME/bash/.bashrc_functions

# Copy .vimrc in your home
backup_file $HOME/.vimrc
if [ -f $HOME/".vimrc.bk" ]; then
  echo "Check this backup file: .vimrc.bk"
fi
cp $DIRNAME/.vimrc ~/

# Setup Vundle for vim extras
GITHUB_VUNDLE="https://github.com/gmarik/vundle.git"
git clone $GITHUB_VUNDLE ~/.vim/bundle/vundle
vim +PluginInstall +qall
