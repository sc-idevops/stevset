#!/bin/bash
#install pre-req.
echo "installing required packages"
./deps.zsh

#remove existing configs, if they exist
echo "Stowing Configs"
stow tmux
stow vim
stow zsh
stow emacs
stow bash

#set new shell
echo "set new shell to zsh"
if [[ $SHELL != "/bin/zsh" ]] 
then
	chsh -s /bin/zsh
fi

#init git
echo -n "Would you like to configure your git name and email? (y/n) => "; read answer
if [[ $answer = "Y" ]] || [[ $answer = "y" ]]; then
    echo -n "What is your git user name => "; read name
    git config --global user.name "$name"
    echo -n "What is your git email => "; read email
    git config --global user.email "$email"
fi

#Download Antibody
echo "downloading antibody"
curl -sL https://git.io/antibody | bash -s
#echo 'source <(antibody init)' >> ~/.zshrc
#Enable fasd to be loaded by changing it's file extension
mv ~/.cache/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-clvv-SLASH-fasd/fasd ~/.cache/antibody/https-COLON--SLASH--SLASH-github.com-SLASH-clvv-SLASH-fasd/fasd.zsh

#Install fonts
if [[ -n "$SSH_CLIENT" ]]
then
	break
else
	./fonts.zsh
fi

#init vim and plugins
./vim.zsh

#init spacemacs in the background
./spacemacs.zsh

echo "*******************************"
echo "*    Restart your terminal    *"
echo "*******************************"

