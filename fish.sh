#!/bin/bash
#installs and sets up oh-my-fish
sudo apt install git fish
curl -L https://get.oh-my.fish | fish
ln -s "$HOME/stevset/fish/omf" "$HOME/.config/"
omf install bobthefish 

