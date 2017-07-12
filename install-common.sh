#!/bin/bash

os=$(uname)

echo "Copying gitconfig"
cp profile.d/gitconfig ~/.gitconfig

echo "Copying bash profile"
cp ~/.bash_profile ~/.bash_profile.original > /dev/null
cp profile.d/userprofile.sh ~/.bash_profile

if [ "$os" == "Linux" ]; then 
  echo "Linux detected"
  echo "Installing common software"
  sudo apt-get install -y net-tools htop netcat telnet tmux dnsutils whois tcpdump lftp httpie
fi

#sudo apt-get install openjdk-8-jdk

if [ "$os" == "Darwin" ]; then
	echo "macOS detected"
	echo "Installing bash_profile_osx"
fi

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

echo "Configuring gvim"
cat <<EOF >> ~/.gvimrc
set guifont=Menlo\ Regular:h14
EOF
