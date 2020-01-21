#!/bin/zsh
#This will install Doom for Emacs

if [ -e ~/.emacs.d/spacemacs.mk ]
#cleanup old spacemacs
    mv ~/.emacs.d ~/spacemacs.d
else
    git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
fi 
#Test for ripgrep
if [ -e /usr/bin/rg ]
    ~/.emacs.d/bin/doom install
else 
    echo "Ripgrep not detected, attempting to install!"
    sudo apt install ripgrep
fi

