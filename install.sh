#!/bin/sh

# links to dotfiles
ln -s $HOME/dotfiles/.dircolors $HOME/.dircolors
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/_vimrc $HOME/.vimrc

# bash configuration
cat <<'EOS' >> ~/.bash_profile
stty werase undef
bind '"\C-w": unix-filename-rubout'

function _compreply_ssh(){
  COMPREPLY=(`cat ~/.ssh/config | grep -i -e '^host' | cut -d " " -f 2 | grep -E "$2"`)
}
complete -F _compreply_ssh ssh scp sftp
EOS

