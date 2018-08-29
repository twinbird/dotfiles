#!/bin/sh

# links to dotfiles
ln -s $HOME/dotfiles/.dircolors $HOME/.dircolors
ln -s $HOME/dotfiles/.hbp $HOME/.hbp
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/.vim $HOME/.vim
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc

# download vim plugin
mkdir -p .vim/pack/mypackage/start/
curl -sL https://github.com/kien/ctrlp.vim/archive/1.79.tar.gz | tar xz -C .vim/pack/mypackage/start/
curl -sL https://github.com/dhruvasagar/vim-table-mode/archive/v4.6.7.tar.gz | tar xz -C .vim/pack/mypackage/start/
git clone https://github.com/mattn/webapi-vim.git .vim/pack/mypackage/start/webapi-vim.git 

# change ignore files
git update-index --skip-worktree .hbp
