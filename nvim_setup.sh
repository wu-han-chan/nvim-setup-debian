#!/bin/sh


# Install system dependencies
sudo apt-get install neovim curl git exuberant-ctags python3-pip npm -y

# Download init.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.config}"/nvim/init.vim --create-dirs \
	   https://raw.githubusercontent.com/wu-han-chan/nvim-setup-debian/main/init.vim'

# Download vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install vim-plug
nvim --headless +PlugInstall +qall


# Download and install yarn
curl -o- -L https://yarnpkg.com/install.sh | bash


# Download yarn env refresh script idk..
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.yarn}"/custom/yarnenv --create-dirs \
           https://raw.githubusercontent.com/wu-han-chan/nvim-setup-debian/main/yarnenv'


# Referesh terminal session to get yarn on path
source $HOME/.yarn/custom/yarnenv


# Install the pythong language server
python3 -m pip install jedi --user


# Go to the coc dir to build the plugin
cd $HOME/.local/share/nvim/plugged/coc.nvim


# Install coc.vim
yarn install

# Build coc.vim
yarn build


# Install coc-python module
nvim +'CocInstall -sync coc-python' +qall

# Run CocUpdateSync and quit
nvim +CocUpdateSync +qall


# cd to home
cd $HOME
