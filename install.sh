#!/bin/sh

# links to dotfiles
ln -s $HOME/dotfiles/.dircolors $HOME/.dircolors
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
#ln -s $HOME/dotfiles/.screenrc $HOME/.screenrc
ln -s $HOME/dotfiles/_vimrc $HOME/.vimrc

# bash configuration notes
# write to .profile

# stty werase undef
#bind '"\C-w": unix-filename-rubout'

# for WSL2(write to .bashrc)
#export SCREENDIR=$HOME/.screendir
#function open() {
#  cmd.exe /c start $(wslpath -w $1)
#}
