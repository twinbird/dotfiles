#!/bin/sh

# links to dotfiles
ln -s $HOME/dotfiles/.vim $HOME/.vim
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.minttyrc $HOME/.minttyrc

# download vim plugin
mkdir -p .vim/pack/mypackage/start/
cd ~/.vim/pack/mypackage/start

git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/dhruvasagar/vim-table-mode.git

cd -
