DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $DIR/.bashrc_functions

# Setup .vimrc and vundle
GITHUB_VUNDLE="https://github.com/gmarik/vundle.git"
backup_file ~/.vimrc
cp $DIR/.vimrc ~/
git clone $GITHUB_VUNDLE ~/.vim/bundle/vundle
echo "Run vim and type :BundleInstall"
