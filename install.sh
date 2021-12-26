#!/bin/sh

# links to dotfiles
ln -s $HOME/dotfiles/.dircolors $HOME/.dircolors
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/vimfiles $HOME/.vim
ln -s $HOME/dotfiles/_vimrc $HOME/.vimrc

# download vim plugin
mkdir -p $HOME/.vim/pack/mypackage/start/
cd $HOME/.vim/pack/mypackage/start

cat <<EOS >> ~/.bashrc
stty werase undef
bind '"\C-w": unix-filename-rubout'
EOS

#git clone https://github.com/dhruvasagar/vim-table-mode.git
#git clone https://github.com/mattn/vim-goimports.git
#git clone https://github.com/rhysd/vim-clang-format.git
git clone https://github.com/fcpg/vim-osc52.git

cd -
