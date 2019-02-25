#!/bin/bash
#install pre-req.
echo "installing required packages"
./deps.sh

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

#Remove old stuff
rm -rf ~/.zshrc ~/.zsh ~/.zprofile

#Make Environment Links, per github readme
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/stevset/prezto/.zprezto/runcoms/^README.md(.N); do
	  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
  done

#Fix History if it exists
if [ -f ~/.zsh_history ]
  cat ~/.zsh_history > ~/.zhistory
fi

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

Install fonts
if [[ -n "$SSH_CLIENT" ]]
then
	echo "no fonts to install over ssh"
else
	echo "Installing fonts for powerline"
	./fonts.zsh
fi

#init spacemacs in the background
if [ ! -d ~/.emacs.d ]
then
	echo "installing spacemacs"
	./spacemacs.zsh
fi

echo "*******************************"
echo "*    Restart your terminal    *"
echo "*******************************"

