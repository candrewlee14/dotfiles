#!/bin/zsh
apk update
apk add neovim tmux bat
source ~/.zshrc
p10k configure
lchsh -i $(whoami)
