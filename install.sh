#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

rm -rf $HOME/.vim 2> /dev/null
rm -f $HOME/.vimrc 2> /dev/null
rm -f $HOME/.tmux.conf 2> /dev/null
mkdir -p $HOME/.vim/bundle
ln -s $DIR/vimrc $HOME/.vimrc
ln -s $DIR/tmux $HOME/.tmux.conf
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

# YouCompleteMe
cd $HOME/.vim/bundle/YouCompleteMe
./install.py --clang-completer
