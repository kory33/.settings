#!/bin/bash

script_dir=$(dirname $0)

# install apt packages
if ! (command -v sudo) ; then
    apt update && apt install -y sudo

    if [ $? -nq 0 ] ; then
        echo "Cannot install packages. Install sudo command first or run this script as root."
        exit 1
    fi
fi

sudo apt update
sudo apt install -y software-properties-common

## for latest vim
sudo add-apt-repository ppa:jonathonf/vim

sudo apt update
sudo apt install -y git curl gettext vim python3-pip npm

# configure git
git config --global user.email "6561358+kory33@users.noreply.github.com"
git config --global user.name "kory33"
git config --global push.default simple

# install vim plugin dependencies
pip3 install neovim

# copy vim settings
./$script_dir/../vim/install/vim8.sh

# install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# install node and common tools
nvm install lts/carbon
sudo npm install -g yarn elm elm-test elm-oracle elm-format

# configure ssh keys
cat << EOF >> ~/.profile
eval \$(ssh-agent -s)
ssh-add ~/.ssh/*
EOF

