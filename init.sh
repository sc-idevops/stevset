#!/bin/bash
#install pre-req.
echo "installing required packages"
bash deps.sh

#create symlinks using stow
echo "Stowing Configs"
stow tmux
stow vim
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
curl -sLf https://spacevim.org/install.sh | bash


#init spacemacs in the background
if [ ! -d ~/.emacs.d ]
then
	echo "installing spacemacs"
	./spacemacs.zsh
fi

echo -n "Would you like to configure your git name and email? (y/n) => "; read answer
if [[ $answer = "Y" ]] || [[ $answer = "y" ]]; then
    echo -n "What is your git user name => "; read name
    git config --global user.name "$name"
    echo -n "What is your git email => "; read email
    git config --global user.email "$email"
fi

echo "Initializing Submodules"
git submodule init && git submodule update

echo "*******************************"
echo "*    Restart your terminal    *"
echo "*******************************"

