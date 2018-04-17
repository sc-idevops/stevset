#!/bin/bash
#install pre-req.
echo "installing required packages"
./deps.sh

#setup prezto
zsh prezto.zsh

#create symlinks using stow
echo "Stowing Configs"
stow tmux
stow vim
stow emacs
stow bash
stow prezto

#set new shell
echo "set new shell to zsh"
if [[ $SHELL != "/bin/zsh" ]] 
then
	chsh -s /bin/zsh
fi

#Install fonts
if [[ -n "$SSH_CLIENT" ]]
then
	break
else
	./fonts.zsh
fi

#init spacemacs in the background
./spacemacs.zsh

echo "*******************************"
echo "*    Restart your terminal    *"
echo "*******************************"

