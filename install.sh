#!/bin/sh

# links to dotfiles
ln -s $HOME/dotfiles/.dircolors $HOME/.dircolors
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/_vimrc $HOME/.vimrc

# bash configuration notes
# write to .profile

#stty werase undef
#bind '"\C-w": unix-filename-rubout'
