#!/bin/bash
#install pre-req.
echo "installing required packages"
./deps.sh

#create symlinks using stow
echo "Stowing Configs"
stow tmux
stow emacs
stow prezto
stow ssh
chmod -R 0600 ~/.ssh/*
ln -s /home/`whoami`/stevset/mc ~/.config/mc

#setup prezto
echo "Initializing Prezto"
zsh prezto.zsh

#set new shell
echo "set new shell to zsh"
if [[ $SHELL != "/bin/zsh" ]] 
then
	chsh -s /bin/zsh
fi

#install spacevim
echo "Installing Space VIM!"
mv "$HOME/.vim" "$HOME/.vim_bk"
mv "$HOME/.vimrc" "$HOME/.vimrc_bk"
zsh <(curl -fsSL https://raw.githubusercontent.com/liuchengxu/space-vim/master/install.sh)

Install fonts
if [[ -n "$SSH_CLIENT" ]]
then
	echo "no fonts to install over ssh"
else
	echo "Installing fonts for powerline"
	./fonts.zsh
fi

#init spacemacs in the background
#if [ ! -d ~/.emacs.d ]
#then
#	echo "installing spacemacs"
#	./spacemacs.zsh
#fi

echo "*******************************"
echo "*    Restart your terminal    *"
echo "*******************************"

