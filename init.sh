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
if [ ! "~/.ssh" ]
then
  mkdir ~/.ssh
  stow ssh
fi
chmod 0700 ~/.ssh
chmod -R 0600 ~/.ssh/*
cp "$HOME/stevset/mc" ~/.config/mc

#setup prezto
echo "Initializing Prezto"
zsh prezto.zsh

#set new shell
echo "Set new shell to zsh"
if [[ $SHELL != "/bin/zsh" ]] 
then
	chsh -s /bin/zsh
fi

#install spacevim
echo "Installing Space VIM!"
if [ ! -d ~/.space-vim ]
then
	mv "$HOME/.vim" "$HOME/.vim_bk"
	mv "$HOME/.vimrc" "$HOME/.vimrc_bk"
	curl -sLf https://spacevim.org/install.sh | bash
fi

#init spacemacs in the background
echo "Installing Spacemacs!"
if [ ! -d ~/.emacs.d ]
then
 ln -s "$HOME/stevset/emacs/.spacemacs" "$HOME/.spacemacs"
 git clone https://github.com/syl20bnr/spacemacs "$HOME/.emacs.d"

fi

echo -n "Would you like to configure your git name and email? (y/n) => "; read answer
if [[ $answer = "Y" ]] || [[ $answer = "y" ]]; then
    echo -n "What is your git user name => "; read name
    git config --global user.name "$name"
    echo -n "What is your git email => "; read email
    git config --global user.email "$email"
fi

echo "*******************************"
echo "*    Restart your terminal    *"
echo "*******************************"

