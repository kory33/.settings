#!/bin/bash

sudo apt update

sudo apt install python3-pip npm git

# configure git
git config --global user.email "6561358+kory33@users.noreply.github.com"
git config --global user.name "kory33"
git config --global push.default simple

# install latest vim
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim

pip3 install neovim

# install nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

cat <<EOF
eval \$(ssh-agent -s)
ssh-add ~/.ssh/*
EOF >> ~/.profile

