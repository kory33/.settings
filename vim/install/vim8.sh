#!/bin/bash
vim_version=$(./util/vim_version.sh)
vim_major_version=$(echo $vim_version | grep -oP '\d*?(?=\.)')

if [ "$vim_major_version" != "8" ]; then
  cat << EOF
Installed Vim does not meet version requirement of "8".

If you are using apt, run the following commands:
  sudo add-apt-repository ppa:jonathonf/vim
  sudo apt update
  sudo apt install vim
EOF
fi

user_vimrc=$(vim --version | grep -oP '(?<=  user vimrc file: ").*(?=")' | envsubst)

echo "copying files..."
echo

cp -vT ../.vimrc $user_vimrc
mkdir -p ~/.dein.vim
cp -vR ../dein.vim/* ~/.dein.vim/
