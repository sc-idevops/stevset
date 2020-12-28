#!/bin/bash
#installs and sets up oh-my-fish
sudo apt install git fish

#Set up configuration
ln -s "$HOME/stevset/fish/omf" "$HOME/.config/"

#download script
curl -L https://get.oh-my.fish | fish

#setup theme
omf install bobthefish 

