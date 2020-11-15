#!/bin/bash
#installs and sets up oh-my-fish
sudo apt install git fish
curl -L https://get.oh-my.fish | fish
#omf theme install bobthefish 
ln -s "$HOME/stevset/fish/omf" "$HOME/.config/omf"
omf install

