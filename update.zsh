#!/bin/zsh
#delete current zsh config
ln -s ~/stevset/prezto/.zprezto ~/.zprezto
./udeps.sh
./prezto.zsh

#Tmux Theme
git clone https://github.com/wfxr/tmux-power.git "$HOME/stevset/tmux/t-theme"
