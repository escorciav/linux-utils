# Clone vundle in $HOME dir
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
# Move .vimcrc into $HOME dir
if [ -f ~/.vimrc ]; then
  # Make a backup of .vimrc
  cp ~/.vimrc ~/.vimrc.bk
fi
cp dotfiles/vim/.vimrc ~/
echo "Run vim and type :BundleInstall"
