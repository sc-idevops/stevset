#!/bin/bash
#install pre-req.
echo -n "Which Linux flavor will we be installing programs for? (u/o)"; read -r answer
if [[ $answer = "U" ]] || [[ $answer = "u" ]]; then
	bash udeps.sh
elif [[ $answer = "O" ]] || [[ $answer = "o" ]]; then
	bash odeps.sh
else 
	echo "Aborting!"	
	exit 1
fi

#setup prezto
echo "Select which shell to configure and use: zsh/fish/bash"; read -r answer
if [[ $answer = "zsh" ]] || [[ $answer = "z" ]]; then
  echo "Initializing ZSH"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
#This will install Zinit in ~/.zinit/bin. .zshrc will be updated with three lines of code that will be added to the bottom. The lines will be sourcing zinit.zsh and setting up completion for command zinit. After installing and reloading the shell compile Zinit with zinit self-update.
    zinit self-update
    zinit update
    chsh -s /bin/zsh
elif [[ $answer = "fish" ]] || [[ $answer = "f" ]]; then
  echo "Installing Oh-My-Fish"
  bash fish.sh
  chsh -s /bin/fish
else 
  echo "Guess we're sticking with default bash then..."
fi

#create symlinks using stow
mkdir ~/.ssh
echo "Stowing Configs"
stow tmux
stow vim
stow zsh
stow config
chmod 0700 ~/.ssh
chmod -R 0600 ~/.ssh/*
#cp "$HOME/stevset/mc" "$HOME/.config/mc"

#Configure git user
echo -n "Would you like to configure your git name and email? (y/n) => "; read -r answer
if [[ $answer = "Y" ]] || [[ $answer = "y" ]]; then
    echo -n "What is your git user name => "; read -r name
    git config --global user.name "$name"
    echo -n "What is your git email => "; read -r email
    git config --global user.email "$email"
fi

#install spacevim
if [ ! -e ~/.space-vim ]
then
	mv "$HOME/.vim" "$HOME/vim_bk"
	mv "$HOME/.vimrc" "$HOME/vimrc_bk"
    echo "Install SpaceVim now? y/n"; read -r answer
    if [[ $answer = "Y" ]] || [[ $answer = "y" ]]; then 
	    (curl -sLf https://spacevim.org/install.sh | bash)
    fi
fi

# #install Emacs Doom
# echo "Install Emacs Doom now? y/n"; read -r answer
# if [[ $answer = "Y" ]] || [[ $answer = "y" ]]; then
#   ./emacs_doom.sh
# fi
###Doom's requirements are outside the scope of Ubuntu 20.04LTS
echo "*******************************"
echo "*    Restart your terminal    *"
echo "*******************************"

