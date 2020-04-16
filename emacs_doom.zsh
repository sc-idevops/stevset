#!/bin/zsh
#This will install Doom for Emacs
#sudo add-apt-repository ppa:kelleyk/emacs
#cleanup old spacemacs
if [ -e ~/.emacs.d/spacemacs.mk ]
    then
      mv ~/.emacs.d ~/spacemacs.d
fi

git clone https://github.com/hlissner/doom-emacs ~/.emacs.d

#Test for ripgrep
if [ -e /usr/bin/rg ]
then
    ~/.emacs.d/bin/doom install
else 
    echo "Ripgrep not detected, attempting to install!"
    sudo apt install ripgrep
    echo "if successful, install emacs doom via script ~/.emacs.d/bin/doom install"
fi

