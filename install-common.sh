#!/bin/bash

echo "Copying gitconfig"
cp profile.d/gitconfig ~/.gitconfig

echo "Installing common software"
sudo apt-get install -y net-tools htop netcat telnet tmux dnsutils whois tcpdump lftp httpie

#sudo apt-get install openjdk-8-jdk


echo "Configuring vim"
cat <<EOF >> ~/.vimrc
syntax on
colorscheme desert

set tabstop=2
set shiftwidth=2
set expandtab

"Move by display line, not real line (wrapping behavior)
map j gj
map k gk
map <up> gk
map <down> gj
EOF
