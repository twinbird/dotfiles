#!/bin/sh

# links to dotfiles
ln -s $HOME/dotfiles/.dircolors $HOME/.dircolors
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/_vimrc $HOME/.vimrc

# bash configuration notes
# write to .profile

# stty werase undef
#bind '"\C-w": unix-filename-rubout'

# for WSL2(write to .bashrc)
#function open() {
#  if [ $# != 1 ]; then
#    explorer.exe .
#  else
#    if [ -e $1 ]; then
#      cmd.exe /c start $(wslpath -w $1) 2> /dev/null
#    else
#      echo "open: $1 : No such file or directory"
#    fi
#  fi
#}
