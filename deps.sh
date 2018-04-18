#!/bin/bash
#These are the base dependencies for any install

echo "installing base dependencies"
sudo apt-get -my install git \
	stow \
	etckeeper \
	tmux \
	zsh \
        vim \
	powerline\
	htop \
	mc \
	curl \
#	byobu \

read -n1 -p $'Does this system need ssh access?\n' REPLY
	if [[ $REPLY == [Yy] ]]; then 
		sudo apt-get install openssh-server
	fi
read -n1 -p $'\nDoes this system have a GUI?\n' REPLY
	if [[ $REPLY == [Yy] ]]; then 
		sudo apt-get install emacs
	else 
		sudo apt-get install emacs-nox
	fi

#echo "enabling byobu"
#byobu-enable

