#!/bin/bash

# Installs common software
sudo apt-get install -y net-tools htop netcat telnet tmux dnsutils whois tcpdump lftp httpie

# Java
sudo apt-get install openjdk-8-jdk

# .vimrc config
cat <<EOF >> ~/.vimrc
syntax on
colorscheme peachpuff
EOF

