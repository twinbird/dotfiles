#!/bin/sh

# setup for ubuntu
sudo apt install tree git vim tmux ruby ruby-dev libsqlite3-dev libxml2 libxml2-dev libxslt-dev ruby-bundler zlib1g-dev build-essential libssl-dev libreadline-dev
sudo gem rails

# links to dotfiles
ln -s $HOME/dotfiles/.dircolors $HOME/.dircolors
ln -s $HOME/dotfiles/.hbp $HOME/.hbp
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/.vim $HOME/.vim
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc

# change ignore files
git update-index --skip-worktree .hbp
