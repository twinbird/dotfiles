#!/bin/sh

# remove old files
rm -rf $HOME/vimfiles
rm -f $HOME/_vimrc
rm -f $HOME/_gvimrc
rm -f $HOME/.minttyrc

# copy new files
cp -r $HOME/dotfiles/vimfiles $HOME/vimfiles
cp $HOME/dotfiles/_vimrc $HOME/_vimrc
cp $HOME/dotfiles/_gvimrc $HOME/_gvimrc
cp $HOME/dotfiles/.minttyrc $HOME/.minttyrc

# download vim plugin
mkdir -p $HOME/vimfiles/pack/mypackage/start/
cd $HOME/vimfiles/pack/mypackage/start

git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/dhruvasagar/vim-table-mode.git

cd -
