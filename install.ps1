# Replace vim files
Remove-Item $HOME/_vimrc -Force
Remove-Item $HOME/_gvimrc -Force
Remove-Item $HOME/vimfiles -Recurse -Force

Copy-Item $HOME/dotfiles/.vimrc $HOME/_vimrc
Copy-Item $HOME/dotfiles/_gvimrc $HOME/_gvimrc
Copy-Item $HOME/dotfiles/.vim $HOME/vimfiles -Recurse

# Enable tls1.2
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;

# Download vim plugin
# package location
$package_path="vimfiles/pack/mypackage/start"
mkdir $HOME"/"$package_path

# ctrlp
invoke-webrequest -uri https://github.com/kien/ctrlp.vim/archive/1.79.tar.gz -outfile $HOME"/"$package_path"/ctrlp.tar.gz"
tar xfz $HOME"/"$package_path"/ctrlp.tar.gz" -C $HOME"/"$package_path

# vim-table-mode
invoke-webrequest -uri https://github.com/dhruvasagar/vim-table-mode/archive/v4.6.7.tar.gz -outfile $HOME"/"$package_path"/vim-table-mode.tar.gz"
tar xfz $HOME"/"$package_path"/vim-table-mode.tar.gz" -C $HOME"/"$package_path

# nerdtree
invoke-webrequest -uri https://github.com/scrooloose/nerdtree/archive/5.0.0.tar.gz -outfile $HOME"/"$package_path"/nerdtree.tar.gz"
tar xfz $HOME"/"$package_path"/nerdtree.tar.gz" -C $HOME"/"$package_path

# remove tar files
remove-item $HOME"/"$package_path"/*.tar.gz"
