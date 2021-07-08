#!/bin/bash
#download sensible bash if it doesnt exist
if [ ! -f ~/.sensible.bash ]; then
  wget -O "$HOME/.sensible.bash" https://raw.githubusercontent.com/mrzool/bash-sensible/master/sensible.bash 
fi

#inject source line into bashrc
if ! grep -q ".sensible.bash" "$HOME/.bashrc"; then
   echo "source \"\$HOME/.sensible.bash\"" >> "$HOME/.bashrc"
fi
