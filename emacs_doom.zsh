#!/bin/zsh
#This will install Doom for Emacs
#sudo add-apt-repository ppa:kelleyk/emacs
#cleanup old spacemacs
if [ -e ~/.emacs.d/spacemacs.mk ]
    then
      mv ~/.emacs.d ~/spacemacs.d
fi

git clone https://github.com/hlissner/doom-emacs ~/.emacs.d

#Install Dependencies
sudo apt install ripgrep markdown shellcheck fd-find

~/.emacs.d/bin/doom install
