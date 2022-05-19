#!/bin/sh

# remove old files
rm -rf $HOME/.vim
rm -f $HOME/.vimrc
rm -f $HOME/_vimrc
rm -f $HOME/_gvimrc
rm -f $HOME/.minttyrc

# copy new files
cp $HOME/dotfiles/_vimrc $HOME/.vimrc
cp $HOME/dotfiles/_vimrc $HOME/_vimrc
cp $HOME/dotfiles/_gvimrc $HOME/_gvimrc
cp $HOME/dotfiles/.minttyrc $HOME/.minttyrc

# bash configuration
cat <<'EOS' >> ~/.bash_profile
stty werase undef
bind '"\C-w": unix-filename-rubout'

function _compreply_ssh(){
  COMPREPLY=(`cat ~/.ssh/config | grep -i -e '^host' | cut -d " " -f 2 | grep -E "$2"`)
}
complete -F _compreply_ssh ssh scp sftp
EOS
