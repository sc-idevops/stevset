#!/bin/zsh
#This will install Doom for Emacs
#which version of ubuntu are we on?
if [ `lsb_release -rs` -lt 19 ] #needs to be an int vs int
    echo "Forget it! You'll have to install an updated version of emacs"
    exit 1
fi 
#cleanup old spacemacs
if [ -e ~/.emacs.d/spacemacs.mk ]
    mv ~/.emacs.d ~/spacemacs.d
fi

git clone https://github.com/hlissner/doom-emacs ~/.emacs.d

#Test for ripgrep
if [ -e /usr/bin/rg ]
    ~/.emacs.d/bin/doom install
else 
    echo "Ripgrep not detected, attempting to install!"
    sudo apt install ripgrep
    echo "if successful, install emacs doom via script ~/.emacs.d/bin/doom install"
fi

