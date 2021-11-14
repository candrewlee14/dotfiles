#!/bin/zsh
apk update
apk add neovim
apk add tmux
apk add bat
apk add libuser
source ~/.zshrc
mkdir /etc/login
touch /etc/login.defs
mkdir /etc/default
touch /etc/default/useradd
p10k configure
lchsh -i $(whoami)
