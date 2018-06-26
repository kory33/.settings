#!/bin/bash

script_dir=$(dirname $0)

# install apt packages
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
./$script_dir/../../../vim/install/vim8.sh

# install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# configure ssh keys
cat <<EOF
eval \$(ssh-agent -s)
ssh-add ~/.ssh/*
EOF >> ~/.profile

